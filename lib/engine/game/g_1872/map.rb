# frozen_string_literal: true

module Engine
  module Game
    module G1872
      module Map
        TILES = {
          '3' => 3,
          '4' => 3,
          '5' => 3,
          '6' => 3,
          '7' => 'unlimited',
          '8' => 'unlimited',
          '9' => 'unlimited',
          '14' => 3,
          '15' => 3,
          '23' => 3,
          '24' => 3,
          '25' => 2,
          '26' => 1,
          '27' => 1,
          '28' => 1,
          '29' => 1,
          '30' => 1,
          '31' => 1,
          '39' => 1,
          '40' => 1,
          '41' => 1,
          '42' => 1,
          '43' => 1,
          '44' => 1,
          '45' => 1,
          '46' => 1,
          '47' => 1,
          '57' => 3,
          '58' => 3,
          '70' => 1,
          '87' => 1,
          '88' => 1,
          '201' => 2,
          '202' => 2,
          '204' => 2,
          '207' => 2,
          '208' => 2,
          '611' => 3,
          '619' => 3,
          '621' => 2,
          '622' => 2,
          '915' => 1,
          'X1' =>
          {
            'count' => 3,
            'color' => 'brown',
            'code' =>
              'city=revenue:50,slots:2;path=a:0,b:_0;path=a:1,b:_0;path=a:2,b:_0;path=a:3,b:_0;' \
              'path=a:4,b:_0;label=Y',
          },
          'X2' =>
          {
            'count' => 1,
            'color' => 'gray',
            'code' =>
            'city=revenue:60,slots:3;path=a:0,b:_0;path=a:1,b:_0;path=a:2,b:_0;path=a:3,b:_0;path=a:4,b:_0;label=Y',
          },
          'X10' =>
          {
            'count' => 1,
            'color' => 'green',
            'code' =>
              'city=revenue:40;city=revenue:40;path=a:0,b:_0;path=a:_0,b:1;path=a:3,b:_1;path=a:_1,b:4;label=O',
          },
          'X11' =>
          {
            'count' => 1,
            'color' => 'green',
            'code' =>
              'city=revenue:40;city=revenue:40;path=a:0,b:_0;path=a:_0,b:3;path=a:2,b:_1;path=a:_1,b:5;label=O',
          },
          'X13' =>
          {
            'count' => 2,
            'color' => 'brown',
            'code' =>
              'city=revenue:60,slots:3;path=a:0,b:_0;path=a:1,b:_0;path=a:2,b:_0;path=a:5,b:_0;path=a:4,b:_0;label=O',
          },
          'X14' =>
          {
            'count' => 1,
            'color' => 'gray',
            'code' =>
              'city=revenue:70,slots:3;path=a:0,b:_0;path=a:1,b:_0;path=a:2,b:_0;path=a:3,b:_0;' \
              'path=a:4,b:_0;path=a:5,b:_0;label=O',
          },
          'X20' =>
          {
            'count' => 1,
            'color' => 'green',
            'code' =>
              'city=revenue:40;city=revenue:40;path=a:0,b:_0;path=a:_0,b:2;path=a:3,b:_1;path=a:_1,b:5;label=T',
          },
          'X21' =>
          {
            'count' => 1,
            'color' => 'green',
            'code' =>
              'city=revenue:40;city=revenue:40;path=a:0,b:_0;path=a:_0,b:1;path=a:3,b:_1;path=a:_1,b:4;label=T',
          },
          'X22' =>
          {
            'count' => 1,
            'color' => 'green',
            'code' =>
              'city=revenue:40;city=revenue:40;path=a:3,b:_0;path=a:_0,b:5;path=a:0,b:_1;path=a:_1,b:4;label=T',
          },
          'X23' =>
          {
            'count' => 2,
            'color' => 'brown',
            'code' =>
              'city=revenue:60,slots:3;path=a:0,b:_0;path=a:1,b:_0;path=a:2,b:_0;path=a:5,b:_0;path=a:4,b:_0;label=T',
          },
          'X24' =>
          {
            'count' => 1,
            'color' => 'gray',
            'code' =>
              'city=revenue:80,slots:3;path=a:0,b:_0;path=a:1,b:_0;path=a:2,b:_0;path=a:3,b:_0;' \
              'path=a:4,b:_0;path=a:5,b:_0;label=T',
          },
        }.freeze

        LOCATION_NAMES = {
          'A43' => 'Sasebo',
          'A45' => 'Nagasaki',
          # 'B42' => 'Itoshima',
          # 'B44' => 'Saga',
          # 'B50' => 'Satsumasendai',
          # 'B52' => 'Ibusuki',
          'C41' => 'Fukuoka',
          'C43' => 'Kurume',
          'C45' => 'Kumamoto',
          'C47' => 'Yatsushiro',
          # 'C49' => 'Hitoyoshi',
          'C51' => 'Kagoshima',
          'D38' => 'Shimonoseki',
          'D40' => 'Kokura',
          # 'D44' => 'Aso',
          'D50' => 'Miyakonojo',
          # 'D52' => 'Kanoya',
          # 'E37' => 'Hagi',
          # 'E39' => 'Yamaguchi',
          'E43' => 'Beppu',
          # 'E45' => 'Nobeoka',
          'E47' => 'Hyuga',
          'E49' => 'Miyazaki',
          # 'E51' => 'Nichinan',
          'F36' => 'Masuda',
          # 'F38' => 'Iwakuna',
          # 'F40' => 'Yanai',
          'F44' => 'Oita',
          # 'G33' => 'Oda',
          # 'G35' => 'Hamada',
          'G37' => 'Hiroshima',
          'H32' => 'Izumo',
          'H34' => 'Miyoshi',
          # 'H36' => 'Higashihiroshima',
          'H38' => 'Kure',
          'H40' => 'Matsuyama',
          'H42' => 'Uwajima',
          'H44' => 'Sukumo',
          'I31' => 'Matsue',
          # 'I35' => 'Shobara',
          'I39' => 'Imabari',
          'I43' => 'Kochi',
          # 'J32' => 'Yango',
          'J36' => 'Kurashiki',
          'J40' => 'Niihama',
          # 'J42' => 'Nankoku',
          'K35' => 'Okayama',
          'K37' => 'Takamatsu',
          # 'K43' => 'Muroto',
          'L30' => 'Tottori',
          'L38' => 'Tokushima',
          # 'L40' => 'Komatsushima',
          'M31' => 'Toyooka',
          'M35' => 'Himeji',
          'N32' => 'Maizuru',
          'N36' => 'Kobe',
          'O35' => 'Kyoto',
          'O37' => 'Osaka',
          'O39' => 'Wakayama',
          'P28' => 'Fukui',
          'P30' => 'Tsuruga',
          'P36' => 'Nara',
          # 'Q27' => 'Hakusan',
          # 'Q33' => 'Yokkaichi',
          'Q35' => 'Tsu',
          # 'Q37' => 'Ise',
          # 'R22' => 'Wajima',
          'R24' => 'Nanao',
          'R26' => 'Kanazawa',
          'R30' => 'Gifu',
          'R32' => 'Nagoya',
          'S25' => 'Toyama',
          'S27' => 'Takayama',
          # 'S29' => 'Gero',
          'S33' => 'Koromo',
          'S35' => 'Okazaki',
          # 'T24' => 'Itoigawa',
          'T32' => 'Nakatsugawa',
          'T36' => 'Hamamatsu',
          'U23' => 'Joetsu',
          'U25' => 'Nagano',
          'U27' => 'Matsumoto',
          # 'U35' => 'Yazu',
          # 'V22' => 'Kashiwazaki',
          # 'V26' => 'Ueda',
          'V30' => 'Kofu',
          # 'V32' => 'Fuji-san',
          'V34' => 'Shizuoka',
          'W19' => 'Niigata',
          'W21' => 'Nagaoka',
          # 'W23' => 'Tokamachi',
          'W27' => 'Takasaki',
          'W33' => 'Numazu',
          # 'W35' => 'Shimoda',
          'X18' => 'Murakami',
          'X28' => 'Isesaki',
          'X30' => 'Hachioji',
          'X32' => 'Yokohama',
          # 'Y9' => 'Oga',
          # 'Y13' => 'Sakata',
          'Y15' => 'Tsuruoka',
          # 'Y21' => 'Aizuwakamatzu',
          'Y25' => 'Nikko',
          'Y27' => 'Tochigi',
          'Y29' => 'Urawa',
          'Y31' => 'Tokyo',
          'Z8' => 'Noshiro',
          'Z10' => 'Akita',
          # 'Z12' => 'Yurihonjo',
          # 'Z14' => 'Shinjo',
          'Z18' => 'Yonezawa',
          # 'Z24' => 'Nasu',
          'Z26' => 'Utsunomiya',
          'Z28' => 'Tsukuba',
          'Z30' => 'Kashiwa',
          'Z32' => 'Chiba',
          'Z34' => 'Tateyama',
          # 'AA3' => 'Tsugaru',
          'AA5' => 'Hirosaki',
          'AA7' => 'Odate',
          # 'AA11' => 'Daisen',
          'AA13' => 'Yokote',
          'AA17' => 'Yamagata',
          'AA19' => 'Fukushima',
          'AA21' => 'Koriyama',
          'AA23' => 'Sukagawa',
          'AA27' => 'Mito',
          'AB4' => 'Aomori',
          # 'AB8' => 'Hachimantai',
          'AB10' => 'Morioka',
          # 'AB12' => '???',
          # 'AB16' => 'Osaki',
          'AB18' => 'Sendai',
          # 'AB20' => 'Soma',
          'AB24' => 'Iwaki',
          # 'AB30' => 'Choshi',
          'AC1' => 'Mutsu',
          # 'AC5' => 'Misawa',
          'AC13' => 'Oshu',
          # 'AC15' => 'Tome',
          'AC17' => 'Ishinomaki',
          'AD6' => 'Hachinohe',
          # 'AD8' => 'Kuji',
          'AD10' => 'Miyako',
          # 'AD12' => 'Kamaishi',
          'AD14' => 'Kasennuma',


          # 'F16' => 'Setama',
          # 'G17' => 'Yakumo',
          # 'G19' => 'Esashi',
          # 'G21' => 'Matsumae',
          'H14' => 'Iwanai',
          # 'H16' => 'Date',
          'H20' => 'Hakodate',
          'I13' => 'Otaru',
          'I17' => 'Muroran',
          # 'J10' => 'Mashike',
          'J12' => 'Sapporo',
          'J14' => 'Chitose',
          'J16' => 'Tomakomai',
          'K1' => 'Wakkanai',
          # 'K3' => 'Toyotomi',
          # 'K5' => 'Shosambetsu',
          # 'K7' => 'Tomamae',
          'K9' => 'Rumoi',
          'K11' => 'Takikawa',
          # 'K13' => 'Iwamizawa',
          # 'L2' => 'Sarufutsu',
          # 'L4' => 'Nakatombetsu',
          # 'L8' => 'Shibetsu',
          'L10' => 'Asahikawa',
          # 'L12' => 'Furano',
          # 'L14' => 'Shimukappu',
          # 'L16' => 'Hidaka',
          # 'M3' => 'Esashi',
          'M7' => 'Nayoro',
          # 'M9' => 'Kamikawa',
          # 'M11' => 'Biei',
          # 'M17' => 'Urakawa',
          # 'N6' => 'Omu',
          # 'N8' => 'Takinoe',
          'N14' => 'Obihiro',
          # 'N18' => 'Erimo',
          'O7' => 'Mombetsu',
          # 'O9' => 'Engaru',
          # 'O13' => 'Hombetsu',
          # 'O15' => 'Makubetsu',
          # 'O17' => 'Hiroo',
          'P10' => 'Kitami',
          'Q9' => 'Abishiri',
          'Q13' => 'Kushiro',
          # 'R10' => 'Shari',
          # 'R12' => 'Shibecha',
          # 'R14' => 'Akkeshi',
          # 'S9' => 'Rausu',
          # 'S11' => 'Nakashibetsu',
          # 'S13' => 'Hamanaka',
          'T12' => 'Nemuro',
        }.freeze

        LAYOUT = :flat

        HEXES = {
          white: {
            # %w[
            #   A43 A45
            #   B42 B44 B50 B52
            #   C41 C43 C45 C47 C49 C51
            #   D38 D40 D42 D44 D46 D48 D50 D52
            #   E37 E39 E43 E45 E47 E49 E51
            #   F36 F38 F44
            #   G33 G35 G37
            #   H32 H34 H36 H38 H40 H42 H44
            #   I31 I33 I35 I37 I39 I41 I43
            #   J32 J34 J36 J40 J42
            #   K31 K33 K35 K37 K39 K41 K43
            #   L30 L32 L34 L38 L40
            #   M31 M33 M35 M37
            #   N32 N34 N36
            #   O31 O33 O35 O37 O39 O41
            #   P28 P30 P34 P36 P38 P40
            #   Q27 Q29 Q31 Q33 Q35 Q37
            #   R22 R24 R26 R28 R30 R32
            #   S25 S27 S29 S31 S33 S35
            #   T24 T26 T28 T30 T32 T34 T36
            #   U23 U25 U27 U29 U31 U33 U35
            #   V22 V24 V26 V28 V30 V32 V34
            #   W19 W21 W23 W25 W27 W29 W31 W33 W35
            #   X18 X20 X22 X24 X26 X28 X30 X32
            #   Y9 Y13 Y15 Y17 Y19 Y21 Y23 Y25 Y27 Y29 Y31
            #   Z6 Z8 Z10 Z12 Z14 Z16 Z18 Z20 Z22 Z24 Z26 Z28 Z30 Z32 Z34
            #   AA3 AA5 AA7 AA9 AA11 AA13 AA15 AA17 AA19 AA21 AA23 AA25 AA27 AA29 AA31 AA33
            #   AB4 AB6 AB8 AB10 AB12 AB14 AB16 AB18 AB20 AB22 AB24 AB30
            #   AC1 AC3 AC5 AC7 AC9 AC11 AC13 AC15 AC17
            #   AD6 AD8 AD10 AD12 AD14

            #   G15 G17 G19 G21
            #   H12 H14 H16 H20
            #   I13 I15 I17
            #   J10 J12 J14 J16
            #   K1 K3 K5 K7 K9 K11 K13 K15
            #   L2 L4 L6 L8 L10 L12 L14 L16
            #   M3 M5 M7 M9 M11 M13 M15 M17
            #   N6 N8 N10 N12 N14 N16 N18
            #   O7 O9 O11 O13 O15 O17
            #   P8 P10 P12 P14
            #   Q9 Q11 Q13
            #   R10 R12 R14
            #   S9 S11 S13
            #   T12
            # ] => '',
            %w[
              B44 D52 E39 E51 F38 G17 G19 G21 G33 G35 H16 H20 I37 J32 K3 K5 K7 K13 K15 K31 K39 K43 L2 L16 L34 M3 M5 M9 M11 M37 N6 O13 O15 O17 O31 P8 P14 P34 Q27 Q33 Q37
              R12 R14 S11 S13 S31 T24 U35 V22 W35 Y9 Y13 Y17 Z12 Z24 AA3 AA25 AA29 AA31 AA33 AB12 AB16 AB20 AB22 AB30 AC3 AC5 AC9 AC15 AD8 AD12
            ] => '',
            %w[
              G15 I15 L4 L6 L8 M17 N18 N10 O11
              B42 B50 B52 C49 D42 E45 E37 H36 O33 Q31 T30 U29 V26 W29 X26 Z6 Z22 AA11 AB8 AB14 AC7 AC11
            ] => 'upgrade=cost:40,terrain:mountain',
            %w[
              H12 J10 L12 L14 M13 N8 N12 O9 P12 Q11 R10 S9
              D44 D46 D48 I41 J42 K41 I33 I35 J34 K33 L32 L40 M33 N34 O41 P38 P40 Q29 S29 T34 U31 V24 V28 W23 W25 W31 X20 X22 X24 Y19 Y21 Y23 Z14 Z16 Z20 AA9 AA15 AB6
            ] => 'upgrade=cost:80,terrain:mountain',
            %w[
              M15 N16
              R28 T26 T28 U33 V32
            ] => 'upgrade=cost:120,terrain:mountain',
            %w[J40 H34 T32 Y25 Z18 AA7 AA13 AA17] => 'town=revenue:0;upgrade=cost:40,terrain:mountain',
            %w[S27] => 'town=revenue:0;upgrade=cost:80,terrain:mountain',
            %w[
              A43 C43 C47 D38 D50 E43 E47 F44 H14 H32 H42 H44 I31 J14 J16 J36 L30 K1 K9 K11 M7 M31 N14 N32 O7 O39 P10 P28 P30 P36 Q9 Q35 R24 R30
              S35 T12 U23 U27 V30 W21 W33 X18 X28 X30 Y15 Y27 Y29 Z8 Z28 Z30 Z32 Z34 AA5 AA19 AA23 AA27 AC1 AC13 AC17 AD6 AD10 AD14
            ] => 'town=revenue:0',
            %w[F36] => 'town=revenue:0;border=edge:0,cost:40,type:mountain',
            %w[I39] => 'town=revenue:0;border=edge:3,cost:80,type:water',
            %w[L38] => 'city=revenue:0;border=edge:4,cost:60,type:water',
            %w[C45 C51 E49 H40 I13 I43 K35 L10 M35 N36 Q13 R26 S25 S33 T36 V34 W19 W27 Y29 Z10 Z26 Z32 AA21 AB4 AB10 AB24] => 'city=revenue:0',
            %w[D40] => 'city=revenue:0;border=edge:3,cost:60,type:water;border=edge:4,type:impassible',
            %w[G37] => 'city=revenue:0;label=Z;border=edge:2,cost:40,type:mountain;border=edge:3,cost:40,type:mountain',
            %w[I43 U25] => 'city=revenue:0;border=edge:2,cost:80,type:mountain',
            %w[K37] => 'city=revenue:0;border=edge:0,cost:40,type:mountain;border=edge:2,type:impassible;border=edge:3,cost:80,type:water;border=edge:5,cost:40,type:mountain',
            %w[M35] => 'city=revenue:0;border=edge:0,type:impassible',
            %w[N36] => 'city=revenue:0;border=edge:1,cost:60,type:water',
            %w[H38] => 'city=revenue:0;label=Ku',
            %w[C41 J12 O35 R32 AB18] => 'city=revenue:0;label=Z',
          },
          gray: {
            %w[A45] => 'city=revenue:yellow_20|green_30|brown_40,slots:2;path=a:0,b:_0;path=a:3,b:_0;path=a:4,b:_0',
            %w[H20] => 'city=revenue:yellow_20|brown_30,slots:2;path=a:0,b:_0;path=a:1,b:_0;path=a:2,b:_0',
            %w[H38] => 'city=revenue:yellow_20|green_30|brown_40,slots:2;path=a:1,b:_0;path=a:2,b:_0;path=a:3,b:_0;path=a:4,b:_0;border=edge:0,type:impassible;border=edge:5,type:impassible',
            %w[I17] => 'city=revenue:yellow_30|brown_20;path=a:0,b:_0;path=a:2,b:_0;path=a:3,b:_0;path=a:4,b:_0',
          },
          yellow: {
            %w[O37] => 'city=revenue:30;city=revenue:30;path=a:2,b:_0;path=a:4,b:_1;label=O',
            %w[X32] => 'city=revenue:30;path=a:4,b:_0;label=Y',
            %w[Y31] => 'city=revenue:30;city=revenue:30,slots:2;city=revenue:30;path=a:0,b:_2;path=a:1,b:_0;path=a:2,b:_1;path=a:3,b:_1;path=a:5,b:_2;label=T',
          },
          red: {
          },
          blue: {
            %w[G23] => 'path=a:3,b:5;border=edge:3,cost:80,type:water;border=edge:5',
            %w[H24 I25] => 'path=a:2,b:5;border=edge:2;border=edge:5',
            %w[J26] => 'path=a:2,b:4;border=edge:2;border=edge:4',
            %w[K25 L24 M23 N22 O21 P20 Q19 R18 S17 T16 U15 V14 X4 Y3 Z2] => 'path=a:1,b:4;border=edge:1;border=edge:4',
            %w[W5] => 'path=a:0,b:4;border=edge:0;border=edge:4',
            %w[W7 W9 W11] => 'path=a:0,b:3;border=edge:0;border=edge:3',
            %w[W13] => 'path=a:1,b:3;border=edge:1;border=edge:3',
            %w[AA1] => 'path=a:0,b:1;border=edge:0,cost:80,type:water;border=edge:1',

            %w[A47] => 'offboard=revenue:yellow_40|green_60|brown_40;path=a:3,b:_0;border=edge:4',
            %w[B46] => 'offboard=revenue:yellow_20|green_30|brown_40;path=a:4,b:_0;border=edge:1',
            %w[C39 ] => 'offboard=revenue:yellow_20|green_30|brown_40;path=a:0,b:_0;path=a:5,b:_0',
            %w[C53 I45 R34] => 'offboard=revenue:yellow_20|green_30|brown_40;path=a:3,b:_0',
            %w[E41] => 'offboard=revenue:0;path=a:2,b:_0',
            %w[F50 L36 AC19] => 'offboard=revenue:yellow_20|green_30|brown_40;path=a:2,b:_0',
            %w[G39] => 'offboard=revenue:yellow_30|green_40|brown_60|gray_80;path=a:3,b:_0;path=a:4,b:_0;border=edge:0',
            %w[G41] => 'offboard=revenue:yellow_20|green_30|brown_40;path=a:4,b:_0;border=edge:3',
            %w[H18] => 'border=edge:5',
            %w[H22] => 'offboard=revenue:yellow_40|green_60;path=a:3,b:_0;border=edge:4',
            %w[H30 Q25] => 'offboard=revenue:yellow_20|green_30|brown_40;path=a:5,b:_0',
            %w[I11 S23 AD4] => 'offboard=revenue:yellow_20|green_30|brown_40;path=a:0,b:_0;',
            %w[I19] => 'offboard=revenue:yellow_40|brown_20;path=a:3,b:_0;border=edge:0;border=edge:2;border=edge:4',
            %w[I21] => 'border=edge:1;border=edge:3',
            %w[J2 Y11] => 'offboard=revenue:yellow_20|green_30|brown_40;path=a:4,b:_0',
            %w[J18] => 'offboard=revenue:yellow_20|green_30|brown_40;path=a:3,b:_0;border=edge:1',
            %w[J38 S37] => 'offboard=revenue:0;path=a:4,b:_0',
            %w[M39] => 'offboard=revenue:yellow_20|green_30|brown_40;path=a:2,b:_0;border=edge:4',
            %w[N38] => 'offboard=revenue:yellow_30|green_40|brown_60|gray_80;path=a:3,b:_0;path=a:4,b:_0;border=edge:1',
            %w[P32] => '',
            %w[V18] => 'offboard=revenue:yellow_20|green_30|brown_40;path=a:5,b:_0;border=edge:0',
            %w[V20] => 'offboard=revenue:0;path=a:4,b:_0;border=edge:3',
            %w[Y33] => 'offboard=revenue:yellow_40|green_60|brown_80|gray_100;path=a:2,b:_0;path=a:3,b:_0',
            %w[AB2] => 'offboard=revenue:yellow_40|green_60;path=a:0,b:_0;',
            %w[AB26] => 'offboard=revenue:0;path=a:3,b:_0',
          },
        }.freeze
      end
    end
  end
end
