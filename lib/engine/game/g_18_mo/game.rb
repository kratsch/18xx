# frozen_string_literal: true

require_relative '../g_1846/game'
require_relative 'meta'
require_relative 'entities'
require_relative 'map'

module Engine
  module Game
    module G18MO
      class Game < G1846::Game
        include_meta(G18MO::Meta)
        include G18MO::Entities
        include G18MO::Map

        STARTING_CASH = { 2 => 600, 3 => 425, 4 => 400, 5 => 385 }.freeze
        TILE_COST = 0

        ORANGE_GROUP = [
        'Pool Share',
        'Steamboat Company',
        'Extra Green Tile',
        'Revenue Change',
        ].freeze

        BLUE_GROUP = [
        'Tunnel Blasting Company',
        'Ranch Tile',
        'Train Discount',
        'Mountain Construction Company',
        ].freeze

        GREEN_GROUP = %w[ATSF MKT CBQ RI MP SSW SLSF].freeze

        REMOVED_CORP_SECOND_TOKEN = {
          'ATSF' => 'B8',
          'SSW' => 'J8',
          'MKT' => 'E9',
          'RI' => 'C7',
          'MP' => 'C13',
          'CBQ' => 'C7',
          'SLSF' => 'E9',
        }.freeze

        STEAMBOAT_HEXES = %w[].freeze

        def steamboat
          @steamboat ||= company_by_id('SC')
        end

        def block_for_steamboat?
          false
        end

        LSL_HEXES = %w[].freeze
        LSL_ICON = 'sbl'
        LSL_ID = 'SBL'

        LITTLE_MIAMI_HEXES = [].freeze

        MEAT_HEXES = %w[].freeze
        STEAMBOAT_HEXES = %w[].freeze
        BOOMTOWN_HEXES = [].freeze

        MEAT_REVENUE_DESC = 'Citrus'

        def operating_round(round_num)
          @round_num = round_num
          G1846::Round::Operating.new(self, [
            G1846::Step::Bankrupt,
            G1846::Step::Assign,
            Engine::Step::SpecialToken,
            G1846::Step::SpecialTrack,
            G1846::Step::BuyCompany,
            G1846::Step::IssueShares,
            G1846::Step::TrackAndToken,
            Engine::Step::Route,
            G1846::Step::Dividend,
            Engine::Step::DiscardTrain,
            Engine::Step::SpecialBuyTrain,
            G1846::Step::BuyTrain,
            [G1846::Step::BuyCompany, { blocks: true }],
          ], round_num: round_num)
        end

        def stock_round
          Engine::Round::Stock.new(self, [
            Engine::Step::DiscardTrain,
            G1846::Step::Assign,
            Engine::Step::Exchange,
            G1846::Step::BuySellParShares,
          ])
        end

        PHASES = [
                {
                  name: '2',
                  train_limit: 4,
                  tiles: [:yellow],
                  operating_rounds: 2,
                  status: ['can_buy_companies'],
                },
                {
                  name: '3',
                  train_limit: 4,
                  on: '3G',
                  tiles: %i[yellow green],
                  operating_rounds: 2,
                  status: ['can_buy_companies'],
                },
                {
                  name: '4',
                  train_limit: 4,
                  on: '4E',
                  tiles: %i[yellow green],
                  operating_rounds: 2,
                  status: ['can_buy_companies'],
                },
                {
                  name: '5',
                  on: '5',
                  train_limit: 3,
                  tiles: %i[yellow green brown],
                  operating_rounds: 2,
                },
                {
                  name: '6',
                  on: '6E',
                  train_limit: 3,
                  tiles: %i[yellow green brown],
                  operating_rounds: 2,
                },
                {
                  name: '7',
                  on: '7',
                  train_limit: 2,
                  tiles: %i[yellow green brown gray],
                  operating_rounds: 2,
                },
              ].freeze

        TRAINS = [
          {
            name: '2Y',
            distance: 2,
            price: 100,
            obsolete_on: '4E',
            rusts_on: '7',
            variants: [
              {
                name: '3Y',
                distance: 3,
                price: 150,
              },
              ],
          },
          {
            name: '3G',
            distance: 3,
            price: 180,
            obsolete_on: '6E',
            variants: [
              {
                name: '4G',
                distance: 4,
                price: 240,
              },
            ],
          },
          {
            name: '4E',
            distance: [{ 'nodes' => %w[city offboard town], 'pay' => 4, 'visit' => 99 }],
            price: 300,
            obsolete_on: '6E',
          },
          {
            name: '5',
            distance: 5,
            price: 450,
            variants: [
              {
                name: '6',
                distance: 6,
                price: 540,
              },
            ],
            events: [{ 'type' => 'close_companies' }],
          },
          {
            name: '6E',
            distance: [{ 'nodes' => %w[city offboard town], 'pay' => 6, 'visit' => 99 }],
            price: 600,
          },
          {
            name: '7',
            distance: 7,
            price: 700,
            variants: [
              {
                name: '8',
                distance: 8,
                price: 800,
              },
            ],
            events: [
              { 'type' => 'remove_markers' },
              { 'type' => 'remove_reservations' },
            ],
          },
        ].freeze

        def operating_order
          @minors.select(&:floated?) + @corporations.select(&:floated?).sort
        end

        def check_other(route)
          visited_hexes = {}
          route.visited_stops.each do |stop|
            hex = stop.hex
            raise GameError, 'Route cannot run to multiple cities in a hex' if visited_hexes[hex]

            visited_hexes[hex] = true
          end
        end

        # Two lays with one being an upgrade, second tile costs 20
        TILE_LAYS = [
          { lay: true, upgrade: true },
          { lay: true, upgrade: :not_if_upgraded, cost: 20 },
        ].freeze

        def num_trains(train)
          num_players = @players.size

          case train[:name]
          when '2Y'
            two_player? ? 7 : num_players + 4
          when '3G'
            two_player? ? 5 : num_players
          when '4E', '6E'
            1
          when '5'
            two_player? ? 3 : num_players - 1
          when '7'
            two_player? ? 4 : 9
          end
        end

        def num_removals(group)
          return 0 if @players.size == 5
          return 1 if @players.size == 4

          case group
          when ORANGE_GROUP, BLUE_GROUP
            6 - @players.size
          when GREEN_GROUP
            5 - @players.size
          end
        end

        def corporation_removal_groups
          [GREEN_GROUP]
        end
      end
    end
  end
end
