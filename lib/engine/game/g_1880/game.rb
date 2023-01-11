# frozen_string_literal: true

require_relative 'meta'
require_relative 'map'
require_relative 'entities'

require_relative '../base'

module Engine
  module Game
    module G1880
      class Game < Game::Base
        include_meta(G1880::Meta)
        include Map
        include Entities

        TRACK_RESTRICTION = :permissive
        SELL_BUY_ORDER = :sell_buy
        SELL_MOVEMENT = :down_per_10
        EBUY_PRES_SWAP = false
        CURRENCY_FORMAT_STR = '¥%s'
        SOLD_SHARES_DESTINATION = :corporation

        BANK_CASH = 37_860

        CERT_LIMIT = { 3 => 20, 4 => 16, 5 => 14, 6 => 12, 7 => 11 }.freeze

        STARTING_CASH = { 3 => 600, 4 => 480, 5 => 400, 6 => 340, 7 => 300 }.freeze

        CORPORATION_CLASS = G1880::Corporation

        HOME_TOKEN_TIMING = :operating_round

        STOCKMARKET_COLORS = Base::STOCKMARKET_COLORS.merge(
          pays_bonus: :yellow,
          pays_bonus_1: :orange,
          pays_bonus_2: :peach,
          pays_bonus_3: :olive,
          pays_bonus_4: :green,
        ).freeze

        MARKET_TEXT = Base::MARKET_TEXT.merge(
          pays_bonus: '+5 bonus per share',
          pays_bonus_1: '+10 bonus per share',
          pays_bonus_2: '+15 bonus per share',
          pays_bonus_3: '+20 bonus per share',
          pays_bonus_4: '+40 bonus per share',
        ).freeze

        MARKET = [
          ['', '', '100', '105', '110', '115B', '120B', '125B', '130W', '140W', '150X', '160X', '180Y', '200Z'],
          ['', '85', '95', '100p', '105', '110B', '115B', '120B', '125W', '135W', '145X', '156X', '170Y', '190Y'],
          %w[70 80 90 95 100 105B 110B 115B 120W 130W 140X 150X 165Y 180Y],
          %w[65 75 85 90p 95 100B 105B 110B 115W 125W 135X 145X],
          %w[60 70 80 85 90 95B 100B 105B 110W 120W],
          %w[55 65 75 80p 85 90B 95B 100B],
          %w[50 60 70 75 80 85B 90B],
          %w[45 55 65 70p 75 80B],
          %w[40 50 60 65 70],
        ].freeze

        PHASES = [{ name: 'A1', train_limit: 4, tiles: [:yellow], operating_rounds: 1 },
                  {
                    name: 'A2',
                    on: '2+2',
                    train_limit: 4,
                    tiles: %i[yellow],
                    operating_rounds: 2,
                  },
                  {
                    name: 'B1',
                    on: '3',
                    train_limit: 4,
                    tiles: %i[yellow green],
                    operating_rounds: 2,
                  },
                  {
                    name: 'B2',
                    on: '3+3',
                    train_limit: 3,
                    tiles: %i[yellow green],
                    operating_rounds: 2,
                  },
                  {
                    name: 'B3',
                    on: '4',
                    train_limit: 3,
                    tiles: %i[yellow green],
                    operating_rounds: 2,
                  },
                  {
                    name: 'C1',
                    on: '4+4',
                    train_limit: 3,
                    tiles: %i[yellow green brown],
                    operating_rounds: 2,
                  },
                  {
                    name: 'C2',
                    on: '6',
                    train_limit: 3,
                    tiles: %i[yellow green brown],
                    operating_rounds: 2,
                  },
                  {
                    name: 'C3',
                    on: '6E',
                    train_limit: 2,
                    tiles: %i[yellow green brown],
                    operating_rounds: 2,
                  },
                  {
                    name: 'D1',
                    on: '8',
                    train_limit: 2,
                    tiles: %i[yellow green brown gray],
                    operating_rounds: 2,
                  },
                  {
                    name: 'D2',
                    on: '8E',
                    train_limit: 2,
                    tiles: %i[yellow green brown gray],
                    operating_rounds: 2,
                  },
                  {
                    name: 'D3',
                    on: '10',
                    train_limit: 2,
                    tiles: %i[yellow green brown gray],
                    operating_rounds: 2,
                  }].freeze

        TRAINS = [{ name: '2', distance: 2, price: 100, rusts_on: '4', num: 10 },
                  {
                    name: '2+2',
                    distance: [{ 'nodes' => %w[city offboard town], 'pay' => 2, 'visit' => 2 },
                               { 'nodes' => ['town'], 'pay' => 2, 'visit' => 2 }],
                    price: 180,
                    rusts_on: '4+4',
                    num: 5,
                  },
                  {
                    name: '3',
                    distance: 3,
                    price: 180,
                    rusts_on: '6',
                    num: 5,
                    events: [{ 'type' => 'float_30' }, { 'type' => 'permit_b' }],
                  },
                  {
                    name: '3+3',
                    distance: [{ 'nodes' => %w[city offboard town], 'pay' => 3, 'visit' => 3 },
                               { 'nodes' => ['town'], 'pay' => 3, 'visit' => 3 }],
                    price: 300,
                    rusts_on: '6E',
                    num: 5,
                  },
                  {
                    name: '4',
                    distance: 4,
                    price: 300,
                    rusts_on: '8',
                    num: 5,
                    events: [{ 'type' => 'float_40' }],
                  },
                  {
                    name: '4+4',
                    distance: [{ 'nodes' => %w[city offboard town], 'pay' => 4, 'visit' => 4 },
                               { 'nodes' => ['town'], 'pay' => 4, 'visit' => 4 }],
                    price: 450,
                    rusts_on: '8E',
                    num: 5,
                    events: [{ 'type' => 'float_40' }, { 'type' => 'permit_c' }],
                  },
                  {
                    name: '6',
                    distance: 6,
                    price: 600,
                    num: 5,
                    events: [{ 'type' => 'float_60' }],
                  },
                  {
                    name: '6E',
                    distance: [{ 'nodes' => %w[city offboard town], 'pay' => 6, 'visit' => 99 }],
                    price: 600,
                    num: 5,
                  },
                  { name: '8', distance: 8, price: 800, num: 2, events: [{ 'type' => 'permit_d' }] },
                  {
                    name: '8E',
                    distance: [{ 'nodes' => %w[city offboard town], 'pay' => 8, 'visit' => 99 }],
                    price: 900,
                    num: 2,
                  },
                  { name: '10', distance: 10, price: 1000, num: 10 }].freeze

        EVENTS_TEXT = Base::EVENTS_TEXT.merge(
          'float_30' => ['30% to Float', "Corporation's President must own 30% or corporation sold out to float"],
          'float_40' => ['40% to Float', "Corporation's President must own 40% or corporation sold out to float"],
          'float_60' => ['60% to Float', "Corporation's President must own 60% or corporation sold out to float"],
          'permit_b' => ['B Permit', 'Only corporations with a B building permit can build track'],
          'permit_c' => ['C Permit', 'Only corporations with a C building permit can build track'],
          'permit_d' => ['D Permit', 'Only corporations with a D building permit can build track'],
        ).freeze

        def event_float_30!
          @log << "-- Event: #{EVENTS_TEXT['float_30'][1]} --"
          update_float_percent(30)
        end

        def event_float_40!
          @log << "-- Event: #{EVENTS_TEXT['float_40'][1]} --"
          update_float_percent(40)
        end

        def event_float_60!
          @log << "-- Event: #{EVENTS_TEXT['float_60'][1]} --"
          update_float_percent(60)
        end

        def update_float_percent(percent)
          @corporations.each do |c|
            next if c.type == :minor || c.floated?

            c.float_percent = percent
          end
        end

        def event_permit_b!
          @log << "-- Event: #{EVENTS_TEXT['permit_b'][1]} --"
          @active_building_permit = 'B'
        end

        def event_permit_c!
          @log << "-- Event: #{EVENTS_TEXT['permit_c'][1]} --"
          @active_building_permit = 'C'
        end

        def event_permit_d!
          @log << "-- Event: #{EVENTS_TEXT['permit_d'][1]} --"
          @active_building_permit = 'D'
        end

        def setup
          @foreign_investors_can_build = true
          setup_building_permits
          setup_unsaleable_shares
        end

        def setup_building_permits
          @active_building_permit = 'A'
          @building_permit_choices_by_president_percent = {
            20 => %w[ABC BCD],
            30 => %w[AB BC CD],
            40 => %w[A B C D],
          }
        end

        def setup_unsaleable_shares
          # reserve last 5 shares of each corp
          @corporations.each do |c|
            c.shares.last(5).each { |s| s.buyable = false }
          end
        end

        def new_auction_round
          Engine::Round::Auction.new(self, [
            G1880::Step::SelectionAuction,
          ])
        end

        def new_draft_round
          Engine::Round::Draft.new(self, [G1880::Step::SimpleDraft], reverse_order: false)
        end

        def next_round!
          @round =
            case @round
            when Engine::Round::Stock
              @operating_rounds = @phase.operating_rounds
              reorder_players
              new_operating_round
            when Engine::Round::Operating
              if @round.round_num
                or_round_finished
                new_operating_round(@round.round_num + 1)
              end
            when Engine::Round::Draft
              new_stock_round
            when init_round.class
              init_round_finished
              reorder_players(:least_cash, log_player_order: true)
              new_draft_round
            end
        end

        def stock_round
          G1880::Round::Stock.new(self, [
            Engine::Step::DiscardTrain,
            Engine::Step::Exchange,
            G1880::Step::BuySellParShares,
          ])
        end

        def operating_round(round_num)
          Engine::Round::Operating.new(self, [
            Engine::Step::Exchange,
            Engine::Step::Track,
            Engine::Step::Token,
            G1880::Step::Route,
            G1880::Step::Dividend,
            Engine::Step::DiscardTrain,
            Engine::Step::BuyTrain,
          ], round_num: round_num)
        end

        def init_share_pool
          G1880::SharePool.new(self)
        end

        def init_minors
          game_minors.map { |minor| G1880::Minor.new(**minor) }
        end

        def p1
          company_by_id('P1')
        end

        def status_array(corporation)
          return [] unless corporation.floated?

          ["Building Permits: #{corporation.building_permits}"]
        end

        def corporation_show_individual_reserved_shares?(_corporation)
          false
        end

        def float_corporation(corporation)
          @log << "#{corporation.name} floats"

          @bank.spend(corporation.par_price.price * 5, corporation)
          @log << "#{corporation.name} receives #{format_currency(corporation.cash)}"
        end

        def tile_lays(entity)
          return [] unless can_build_track?(entity)

          super
        end

        def building_permit_choices(corporation)
          @building_permit_choices_by_president_percent[corporation.presidents_percent]
        end

        def can_build_track?(corporation)
          return @foreign_investors_can_build if corporation.minor?

          corporation.building_permits&.include?(@active_building_permit)
        end

        def player_card_minors(player)
          @minors.select { |m| m.owner == player }
        end

        def route_trains(entity)
          entity.minor? ? [@depot.min_depot_train] : super
        end

        def train_owner(train)
          train.owner == @depot ? lessee : train.owner
        end

        def lessee
          current_entity
        end
      end
    end
  end
end