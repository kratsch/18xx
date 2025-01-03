# frozen_string_literal: true

module Engine
  module Game
    module G18JPT
      module Map
        # rubocop:disable Layout/LineLength
        TILES = {
          '1' => 1,
          '4' => 4,
          '6' => 4,
          '8' => 10,
          '9' => 12,
          '14' => 4,
          '15' => 4,
          '16' => 1,
          '17' => 1,
          '18' => 1,
          '19' => 2,
          '20' => 1,
          '23' => 4,
          '24' => 4,
          '25' => 2,
          '26' => 1,
          '27' => 1,
          '28' => 1,
          '29' => 1,
          '39' => 1,
          '40' => 1,
          '41' => 1,
          '42' => 1,
          '43' => 1,
          '44' => 1,
          '45' => 2,
          '46' => 2,
          '47' => 2,
          '55' => 1,
          '56' => 1,
          '57' => 4,
          '58' => 5,
          '69' => 1,
          '70' => 1,
          '611' => 8,
          'J1' => {
            'count' => 3,
            'color' => 'green',
            'code' => 'city=revenue:40,loc:1.5,slots:2;city=revenue:40,loc:4.5;path=a:0,b:_0;path=a:3,b:_0;path=a:4,b:_1;upgrade=cost:80;label=T',
          },
          'J2' => {
            'count' => 1,
            'color' => 'green',
            'code' => 'city=revenue:40,loc:1.5;city=revenue:40,loc:4,slots:2;path=a:2,b:_0;path=a:3,b:_1;path=a:5,b:_1;upgrade=cost:80;label=T',
          },
          'J3' => {
            'count' => 1,
            'color' => 'green',
            'code' => 'city=revenue:40,loc:1.5;city=revenue:40,loc:4.5,slots:2;path=a:0,b:_1;path=a:2,b:_0;path=a:3,b:_1;upgrade=cost:80;label=T',
          },
          'J4' => {
            'count' => 1,
            'color' => 'green',
            'code' => 'city=revenue:40,loc:1,slots:2;city=revenue:40,loc:3.5;path=a:0,b:_0;path=a:2,b:_0;path=a:3,b:_1;upgrade=cost:80;label=T',
          },
          'J5' => {
            'count' => 1,
            'color' => 'green',
            'code' => 'city=revenue:40,loc:1.5,slots:2;city=revenue:40,loc:4;path=a:0,b:_1;path=a:4,b:_1;path=a:5,b:_0;upgrade=cost:80;label=T',
          },
          'J6' => {
            'count' => 1,
            'color' => 'green',
            'code' => 'city=revenue:40;city=revenue:40,slots:2,loc:3.5;path=a:0,b:_0;path=a:1,b:_0;path=a:5,b:_1;upgrade=cost:80;label=T',
          },
          'J7' => {
            'count' => 1,
            'color' => 'brown',
            'code' => 'city=revenue:60,slots:3;path=a:0,b:_0;path=a:1,b:_0;path=a:3,b:_0;path=a:4,b:_0;label=Y',
          },
          'J8' => {
            'count' => 3,
            'color' => 'brown',
            'code' => 'city=revenue:60,slots:3;path=a:0,b:_0;path=a:3,b:_0;path=a:4,b:_0;label=T',
          },
          'J9' => {
            'count' => 2,
            'color' => 'brown',
            'code' => 'city=revenue:60,slots:3;path=a:0,b:_0;path=a:2,b:_0;path=a:3,b:_0;label=T',
          },
          'J10' => {
            'count' => 1,
            'color' => 'brown',
            'code' => 'city=revenue:60,slots:3;path=a:2,b:_0;path=a:3,b:_0;path=a:4,b:_0;label=T',
          },
          'J11' => {
            'count' => 1,
            'color' => 'gray',
            'code' => 'city=revenue:80,slots:3;path=a:0,b:_0;path=a:1,b:_0;path=a:3,b:_0;path=a:4,b:_0;label=T',
          },
          'J12' => {
            'count' => 1,
            'color' => 'gray',
            'code' => 'city=revenue:80,slots:3;path=a:0,b:_0;path=a:1,b:_0;path=a:2,b:_0;path=a:3,b:_0;label=T',
          },
          'J13' => {
            'count' => 1,
            'color' => 'gray',
            'code' => 'city=revenue:80,slots:3;path=a:0,b:_0;path=a:2,b:_0;path=a:3,b:_0;path=a:4,b:_0;label=T',
          },
          'J14' => {
            'count' => 2,
            'color' => 'gray',
            'code' => 'city=revenue:50,slots:3;path=a:0,b:_0;path=a:1,b:_0;path=a:2,b:_0;path=a:4,b:_0;path=a:5,b:_0;label=KU',
          },
          'J15' => {
            'count' => 1,
            'color' => 'brown',
            'code' => 'city=revenue:50,slots:2;path=a:2,b:_0;path=a:3,b:_0;path=a:4,b:_0;label=M',
          },
        }.freeze
        # rubocop:enable Layout/LineLength

        LOCATION_NAMES = {
          'A77' => 'Kawagoe',
          'A81' => 'Tokorozawa',
          'A85' => 'Kokubunji',
          'A87' => 'Hachioji',
          'A89' => 'Tama',
          'A91' => 'Odawara',
          'A93' => 'Nagatsuta',
          'A95' => 'Yamato',
          'A97' => 'Izumino',
          'B82' => 'Akitsu & Higashimurayama',
          'B84' => 'Kodaira',
          'B88' => 'Chofu',
          'B96' => 'Futamatagawa',
          'B98' => 'Kamakura',
          'C79' => 'Shiki',
          'C83' => 'Tanashi',
          'C85' => 'Kichijoji',
          'C89' => 'Noborito',
          'C91' => 'Mizonoguchi',
          'D76' => 'Omiya',
          'D80' => 'Wako',
          'D84' => 'Saginomiya',
          'D90' => 'Futakotamagawa',
          'D94' => 'Kikuna',
          'D96' => 'Yokohama',
          'D98' => 'Yokosuka',
          'E77' => 'Urawa',
          'E79' => 'Toda & Warabi',
          'E83' => 'Nerima',
          'E87' => 'Shimokitazawa',
          'E91' => 'Den-en chofu',
          'F80' => 'Kawaguchi',
          'F82' => 'Itabashi',
          'F84' => 'Ikebukuro',
          'F86' => 'Shinjuku',
          'F88' => 'Shibuya',
          'F92' => 'Kamata',
          'F94' => 'Kawasaki',
          'G81' => 'Toneri',
          'G85' => 'Ueno',
          'G87' => 'Otemachi & Akihabara',
          'G89' => 'Meguro & Shinagawa',
          'G95' => 'Daishi',
          'H76' => 'Koshigaya',
          'H80' => 'Soka',
          'H84' => 'Asakusa & Oshiage',
          'H88' => 'Odaiba',
          'H92' => 'Haneda airport',
          'I77' => 'Yoshikawa',
          'I79' => 'Misato',
          'I83' => 'Takasago',
          'J78' => 'Nagareyama',
          'J88' => 'Maihama',
          'K81' => 'Matsudo',
          'K85' => 'Funabashi',
          'L76' => 'Tsukuba',
          'L78' => 'Mito',
          'L80' => 'Shiroi',
          'L84' => 'Narita',
          'L86' => 'Chiba',
        }.freeze

        # rubocop:disable Layout/LineLength
        HEXES = {
          red: {
            ['A77'] => 'city=revenue:yellow_30|brown_50|gray_60;path=a:5,b:_0,terminal:1',
            ['A85'] => 'offboard=revenue:yellow_30|brown_40|gray_60;path=a:3,b:_0;path=a:4,b:_0;path=a:5,b:_0',
            ['A87'] => 'offboard=revenue:yellow_30|brown_40|gray_60;path=a:5,b:_0',
            ['A89'] => 'offboard=revenue:yellow_20|brown_40|gray_50;path=a:4,b:_0;path=a:5,b:_0',
            ['A91'] => 'offboard=revenue:yellow_30|brown_50|gray_60;path=a:4,b:_0',
            ['A95'] => 'offboard=revenue:yellow_20|brown_30|gray_50;path=a:3,b:_0;path=a:5,b:_0',
            ['A97'] => 'offboard=revenue:yellow_10|brown_20|gray_30;path=a:4,b:_0',
            ['B98'] => 'offboard=revenue:yellow_30|brown_50|gray_60;path=a:4,b:_0',
            ['D76'] => 'offboard=revenue:yellow_50|brown_60|gray_80;path=a:0,b:_0;path=a:1,b:_0;path=a:5,b:_0',
            ['D98'] => 'offboard=revenue:yellow_20|brown_40|gray_30;path=a:3,b:_0',
            ['H88'] => 'offboard=revenue:yellow_0|gray_60;path=a:1,b:_0;path=a:2,b:_0;path=a:3,b:_0;path=a:4,b:_0',
            ['H92'] => 'offboard=revenue:yellow_0|brown_30|gray_60;path=a:1,b:_0',
            ['L76'] => 'offboard=revenue:yellow_20|brown_30|gray_60;path=a:1,b:_0',
            ['L78'] => 'offboard=revenue:yellow_40|brown_50|gray_60;path=a:1,b:_0',
            ['L80'] => 'offboard=revenue:yellow_20|brown_30|gray_50;path=a:1,b:_0',
            ['L84'] => 'offboard=revenue:yellow_30|brown_40|gray_60;path=a:1,b:_0',
            ['L86'] => 'offboard=revenue:yellow_40|brown_60|gray_80;path=a:1,b:_0;path=a:2,b:_0',
          },
          yellow: {
            ['B84'] => 'city=revenue:20;upgrade=cost:120,terrain:mountain;path=a:3,b:_0;path=a:4,b:_0',
            ['B88'] => 'city=revenue:20;path=a:2,b:_0;path=a:4,b:_0',
            ['E83'] => 'city=revenue:20;path=a:2,b:_0;path=a:5,b:_0',
            ['E87'] => 'city=revenue:20;path=a:1,b:_0;path=a:4,b:_0',
            ['F84'] => 'city=revenue:30,loc:1.5;city=revenue:30,loc:4;path=a:2,b:_0;path=a:3,b:_1;upgrade=cost:80;label=T',
            ['F86'] => 'city=revenue:30,slots:2,loc:0;city=revenue:30,loc:2.5;path=a:1,b:_0;path=a:2,b:_1;upgrade=cost:80;label=T',
            ['F88'] => 'city=revenue:30,loc:0;city=revenue:30,loc:3;path=a:1,b:_0;path=a:2,b:_1;upgrade=cost:80;label=T',
            ['G85'] => 'city=revenue:30,loc:1;city=revenue:30;path=a:3,b:_1;upgrade=cost:80;label=T',
            ['G87'] => 'city=revenue:30,loc:1.5;city=revenue:30;path=a:3,b:_0;path=a:4,b:_1;upgrade=cost:80;label=T',
            ['G89'] => 'city=revenue:30,loc:1.5;city=revenue:30,loc:5.5;path=a:0,b:_1;path=a:1,b:_0;upgrade=cost:80;label=T',
            ['H84'] => 'city=revenue:30,loc:1.5;city=revenue:30,loc:4;path=a:3,b:_0;path=a:4,b:_1;upgrade=cost:80,terrain:river;label=T',
          },
          green: {
            ['J88'] => 'city=revenue:20;upgrade=cost:80;label=M',
            ['D96'] => 'city=revenue:50,loc:1.5;city=revenue:50,slots:2,loc:5;path=a:0,b:_1;path=a:1,b:_0;path=a:3,b:_1;path=a:4,b:_1;label=Y',
            ['E91'] => 'city=revenue:30,slots:2;path=a:1,b:_0;path=a:3,b:_0;path=a:4,b:_0;path=a:5,b:_0',
            ['F92'] => 'city=revenue:30,loc:2.5;city=revenue:30,loc:5;path=a:0,b:_1;path=a:2,b:_0;path=a:3,b:_0;path=a:4,b:_1;path=a:5,b:_1;upgrade=cost:80,terrain:river',
          },
          gray: {
            ['A81'] => 'city=revenue:30;path=a:0,b:_0;path=a:4,b:_0;path=a:5,b:_0',
            ['A83'] => 'path=a:0,b:4;path=a:3,b:5;path=a:4,b:5',
            ['A93'] => 'city=revenue:20;path=a:0,b:_0;path=a:4,b:_0;path=a:5,b:_0',
            ['C85'] => 'city=revenue:40;path=a:5,b:_0',
            ['F76'] => 'path=a:0,b:1;path=a:1,b:5;path=a:5,b:0',
            ['G95'] => 'city=revenue:20;path=a:2,b:_0',
            ['H76'] => 'city=revenue:20;path=a:0,b:_0;path=a:1,b:_0;path=a:5,b:_0',
          },
          white: {
            %w[B94 C95] => 'upgrade=cost:120,terrain:mountain',
            %w[C77 D78 E81] => 'upgrade=cost:40,terrain:river',
            %w[E93 G83 G93 I85 I87 K77] => 'upgrade=cost:80,terrain:river',
            %w[B96 C79 C89 F80 H80 I83 J78 K81 K85] => 'city=revenue:20',
            %w[E77 F94] => 'city=revenue:20;future_label=label:KU,color:gray',
            %w[D80 F82] => 'city=revenue:20;upgrade=cost:40,terrain:river',
            %w[C83 C91 D84 D90 D94 G81 I77 I79] => 'town=revenue:10',
            %w[B82 E79] => 'town=revenue:10,loc:1;town=revenue:10,loc:4',
            %w[B78 B80 B86 B90 B92 C81 C87 C93 C97 D82 D86 D88 D92 E85 E89 E95 F78 F90 G77 G79 G91 H78 H82 H86 I81 J80 J82 J84 J86 K79 K83 K87] => 'blank',
          },
        }.freeze
        # rubocop:enable Layout/LineLength

        LAYOUT = :flat
      end
    end
  end
end
