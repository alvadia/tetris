module linear_congruential_generator (clk, rst, enable, out);
    parameter seed = 8;
    parameter width_state = 0;
    parameter width_output = 4;
    parameter variant = 0;

    generate
       // thanks to L'Ecuyer (1999), "Tables of linear congruential generators of different sizes and good lattice structure", Math.Comp. 68, pp. 249-260
       case(width_state)

         8 : case (variant)
                      0: LCG #(.seed(seed), .width_state(16), .width_output(width_output), .multiplier(55), .module_const(251)) lcg8_0 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                default: LCG #(.seed(seed), .width_state(16), .width_output(width_output), .multiplier(33), module_const(251)) lcg8 (.clk(clk), .rst(rst), .enable(enable), .out(out));
              endcase


         9 : case (variant)
                      0: LCG #(.seed(seed), .width_state(18), .width_output(width_output), .multiplier(110), .module_const(509)) lcg9_0 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                      1: LCG #(.seed(seed), .width_state(20), .width_output(width_output), .multiplier(273), .module_const(509)) lcg9_1 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                      2: LCG #(.seed(seed), .width_state(20), .width_output(width_output), .multiplier(349), .module_const(509)) lcg9_2 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                default: LCG #(.seed(seed), .width_state(16), .width_output(width_output), .multiplier(25), module_const(509)) lcg9 (.clk(clk), .rst(rst), .enable(enable), .out(out));
              endcase


         10 : case (variant)
                      0: LCG #(.seed(seed), .width_state(21), .width_output(width_output), .multiplier(331), .module_const(1021)) lcg10_0 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                default: LCG #(.seed(seed), .width_state(19), .width_output(width_output), .multiplier(65), module_const(1021)) lcg10 (.clk(clk), .rst(rst), .enable(enable), .out(out));
              endcase


         11 : case (variant)
                      0: LCG #(.seed(seed), .width_state(22), .width_output(width_output), .multiplier(328), .module_const(2039)) lcg11_0 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                      1: LCG #(.seed(seed), .width_state(22), .width_output(width_output), .multiplier(393), .module_const(2039)) lcg11_1 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                default: LCG #(.seed(seed), .width_state(23), .width_output(width_output), .multiplier(995), module_const(2039)) lcg11 (.clk(clk), .rst(rst), .enable(enable), .out(out));
              endcase


         12 : case (variant)
                      0: LCG #(.seed(seed), .width_state(22), .width_output(width_output), .multiplier(235), .module_const(4093)) lcg12_0 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                      1: LCG #(.seed(seed), .width_state(22), .width_output(width_output), .multiplier(219), .module_const(4093)) lcg12_1 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                      2: LCG #(.seed(seed), .width_state(26), .width_output(width_output), .multiplier(3551), .module_const(4093)) lcg12_2 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                default: LCG #(.seed(seed), .width_state(22), .width_output(width_output), .multiplier(209), module_const(4093)) lcg12 (.clk(clk), .rst(rst), .enable(enable), .out(out));
              endcase


         13 : case (variant)
                      0: LCG #(.seed(seed), .width_state(26), .width_output(width_output), .multiplier(1716), .module_const(8191)) lcg13_0 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                      1: LCG #(.seed(seed), .width_state(27), .width_output(width_output), .multiplier(2685), .module_const(8191)) lcg13_1 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                default: LCG #(.seed(seed), .width_state(25), .width_output(width_output), .multiplier(884), module_const(8191)) lcg13 (.clk(clk), .rst(rst), .enable(enable), .out(out));
              endcase


         14 : case (variant)
                      0: LCG #(.seed(seed), .width_state(28), .width_output(width_output), .multiplier(3007), .module_const(16381)) lcg14_0 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                      1: LCG #(.seed(seed), .width_state(26), .width_output(width_output), .multiplier(665), .module_const(16381)) lcg14_1 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                      2: LCG #(.seed(seed), .width_state(30), .width_output(width_output), .multiplier(12957), .module_const(16381)) lcg14_2 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                default: LCG #(.seed(seed), .width_state(26), .width_output(width_output), .multiplier(572), module_const(16381)) lcg14 (.clk(clk), .rst(rst), .enable(enable), .out(out));
              endcase


         15 : case (variant)
                      0: LCG #(.seed(seed), .width_state(28), .width_output(width_output), .multiplier(1944), .module_const(32749)) lcg15_0 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                      1: LCG #(.seed(seed), .width_state(31), .width_output(width_output), .multiplier(9515), .module_const(32749)) lcg15_1 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                      2: LCG #(.seed(seed), .width_state(32), .width_output(width_output), .multiplier(22661), .module_const(32749)) lcg15_2 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                default: LCG #(.seed(seed), .width_state(25), .width_output(width_output), .multiplier(219), module_const(32749)) lcg15 (.clk(clk), .rst(rst), .enable(enable), .out(out));
              endcase


         16 : case (variant)
                      0: LCG #(.seed(seed), .width_state(34), .width_output(width_output), .multiplier(33285), .module_const(65521)) lcg16_0 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                      1: LCG #(.seed(seed), .width_state(30), .width_output(width_output), .multiplier(2469), .module_const(65521)) lcg16_1 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                default: LCG #(.seed(seed), .width_state(33), .width_output(width_output), .multiplier(17364), module_const(65521)) lcg16 (.clk(clk), .rst(rst), .enable(enable), .out(out));
              endcase


         17 : case (variant)
                      0: LCG #(.seed(seed), .width_state(34), .width_output(width_output), .multiplier(29223), .module_const(131071)) lcg17_0 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                      1: LCG #(.seed(seed), .width_state(34), .width_output(width_output), .multiplier(29803), .module_const(131071)) lcg17_1 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                default: LCG #(.seed(seed), .width_state(35), .width_output(width_output), .multiplier(43165), module_const(131071)) lcg17 (.clk(clk), .rst(rst), .enable(enable), .out(out));
              endcase


         18 : case (variant)
                      0: LCG #(.seed(seed), .width_state(35), .width_output(width_output), .multiplier(21876), .module_const(262139)) lcg18_0 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                default: LCG #(.seed(seed), .width_state(37), .width_output(width_output), .multiplier(92717), module_const(262139)) lcg18 (.clk(clk), .rst(rst), .enable(enable), .out(out));
              endcase


         19 : case (variant)
                      0: LCG #(.seed(seed), .width_state(37), .width_output(width_output), .multiplier(37698), .module_const(524287)) lcg19_0 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                      1: LCG #(.seed(seed), .width_state(39), .width_output(width_output), .multiplier(155411), .module_const(524287)) lcg19_1 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                default: LCG #(.seed(seed), .width_state(40), .width_output(width_output), .multiplier(283741), module_const(524287)) lcg19 (.clk(clk), .rst(rst), .enable(enable), .out(out));
              endcase


         20 : case (variant)
                      0: LCG #(.seed(seed), .width_state(42), .width_output(width_output), .multiplier(604211), .module_const(1048573)) lcg20_0 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                      1: LCG #(.seed(seed), .width_state(39), .width_output(width_output), .multiplier(100768), .module_const(1048573)) lcg20_1 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                      2: LCG #(.seed(seed), .width_state(42), .width_output(width_output), .multiplier(947805), .module_const(1048573)) lcg20_2 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                      3: LCG #(.seed(seed), .width_state(37), .width_output(width_output), .multiplier(22202), .module_const(1048573)) lcg20_3 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                      4: LCG #(.seed(seed), .width_state(42), .width_output(width_output), .multiplier(1026371), .module_const(1048573)) lcg20_4 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                default: LCG #(.seed(seed), .width_state(41), .width_output(width_output), .multiplier(380985), module_const(1048573)) lcg20 (.clk(clk), .rst(rst), .enable(enable), .out(out));
              endcase


         21 : case (variant)
                      0: LCG #(.seed(seed), .width_state(43), .width_output(width_output), .multiplier(1043187), .module_const(2097143)) lcg21_0 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                      1: LCG #(.seed(seed), .width_state(44), .width_output(width_output), .multiplier(1939807), .module_const(2097143)) lcg21_1 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                default: LCG #(.seed(seed), .width_state(42), .width_output(width_output), .multiplier(360889), module_const(2097143)) lcg21 (.clk(clk), .rst(rst), .enable(enable), .out(out));
              endcase


         22 : case (variant)
                      0: LCG #(.seed(seed), .width_state(46), .width_output(width_output), .multiplier(2788150), .module_const(4194301)) lcg22_0 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                      1: LCG #(.seed(seed), .width_state(45), .width_output(width_output), .multiplier(1731287), .module_const(4194301)) lcg22_1 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                      2: LCG #(.seed(seed), .width_state(46), .width_output(width_output), .multiplier(2463014), .module_const(4194301)) lcg22_2 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                default: LCG #(.seed(seed), .width_state(44), .width_output(width_output), .multiplier(914334), module_const(4194301)) lcg22 (.clk(clk), .rst(rst), .enable(enable), .out(out));
              endcase


         23 : case (variant)
                      0: LCG #(.seed(seed), .width_state(47), .width_output(width_output), .multiplier(3219358), .module_const(8388593)) lcg23_0 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                      1: LCG #(.seed(seed), .width_state(46), .width_output(width_output), .multiplier(1706325), .module_const(8388593)) lcg23_1 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                      2: LCG #(.seed(seed), .width_state(48), .width_output(width_output), .multiplier(6682268), .module_const(8388593)) lcg23_2 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                      3: LCG #(.seed(seed), .width_state(44), .width_output(width_output), .multiplier(422527), .module_const(8388593)) lcg23_3 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                      4: LCG #(.seed(seed), .width_state(48), .width_output(width_output), .multiplier(7966066), .module_const(8388593)) lcg23_4 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                default: LCG #(.seed(seed), .width_state(45), .width_output(width_output), .multiplier(653276), module_const(8388593)) lcg23 (.clk(clk), .rst(rst), .enable(enable), .out(out));
              endcase


         24 : case (variant)
                      0: LCG #(.seed(seed), .width_state(49), .width_output(width_output), .multiplier(7050296), .module_const(16777213)) lcg24_0 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                      1: LCG #(.seed(seed), .width_state(49), .width_output(width_output), .multiplier(4408741), .module_const(16777213)) lcg24_1 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                      2: LCG #(.seed(seed), .width_state(50), .width_output(width_output), .multiplier(12368472), .module_const(16777213)) lcg24_2 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                      3: LCG #(.seed(seed), .width_state(46), .width_output(width_output), .multiplier(931724), .module_const(16777213)) lcg24_3 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                      4: LCG #(.seed(seed), .width_state(50), .width_output(width_output), .multiplier(15845489), .module_const(16777213)) lcg24_4 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                default: LCG #(.seed(seed), .width_state(49), .width_output(width_output), .multiplier(6423135), module_const(16777213)) lcg24 (.clk(clk), .rst(rst), .enable(enable), .out(out));
              endcase


         25 : case (variant)
                      0: LCG #(.seed(seed), .width_state(51), .width_output(width_output), .multiplier(12836191), .module_const(33554393)) lcg25_0 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                      1: LCG #(.seed(seed), .width_state(52), .width_output(width_output), .multiplier(28133808), .module_const(33554393)) lcg25_1 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                      2: LCG #(.seed(seed), .width_state(52), .width_output(width_output), .multiplier(25612572), .module_const(33554393)) lcg25_2 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                      3: LCG #(.seed(seed), .width_state(52), .width_output(width_output), .multiplier(31693768), .module_const(33554393)) lcg25_3 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                default: LCG #(.seed(seed), .width_state(52), .width_output(width_output), .multiplier(25907312), module_const(33554393)) lcg25 (.clk(clk), .rst(rst), .enable(enable), .out(out));
              endcase


         26 : case (variant)
                      0: LCG #(.seed(seed), .width_state(53), .width_output(width_output), .multiplier(19552116), .module_const(67108859)) lcg26_0 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                      1: LCG #(.seed(seed), .width_state(54), .width_output(width_output), .multiplier(66117721), .module_const(67108859)) lcg26_1 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                default: LCG #(.seed(seed), .width_state(53), .width_output(width_output), .multiplier(26590841), module_const(67108859)) lcg26 (.clk(clk), .rst(rst), .enable(enable), .out(out));
              endcase


         27 : case (variant)
                      0: LCG #(.seed(seed), .width_state(55), .width_output(width_output), .multiplier(63826429), .module_const(134217689)) lcg27_0 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                      1: LCG #(.seed(seed), .width_state(51), .width_output(width_output), .multiplier(3162696), .module_const(134217689)) lcg27_1 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                default: LCG #(.seed(seed), .width_state(55), .width_output(width_output), .multiplier(45576512), module_const(134217689)) lcg27 (.clk(clk), .rst(rst), .enable(enable), .out(out));
              endcase


         28 : case (variant)
                      0: LCG #(.seed(seed), .width_state(58), .width_output(width_output), .multiplier(140853223), .module_const(268435399)) lcg28_0 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                      1: LCG #(.seed(seed), .width_state(55), .width_output(width_output), .multiplier(29908911), .module_const(268435399)) lcg28_1 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                      2: LCG #(.seed(seed), .width_state(57), .width_output(width_output), .multiplier(104122896), .module_const(268435399)) lcg28_2 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                default: LCG #(.seed(seed), .width_state(58), .width_output(width_output), .multiplier(246049789), module_const(268435399)) lcg28 (.clk(clk), .rst(rst), .enable(enable), .out(out));
              endcase


         29 : case (variant)
                      0: LCG #(.seed(seed), .width_state(60), .width_output(width_output), .multiplier(530877178), .module_const(536870909)) lcg29_0 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                default: LCG #(.seed(seed), .width_state(60), .width_output(width_output), .multiplier(520332806), module_const(536870909)) lcg29 (.clk(clk), .rst(rst), .enable(enable), .out(out));
              endcase


         30 : case (variant)
                      0: LCG #(.seed(seed), .width_state(61), .width_output(width_output), .multiplier(295397169), .module_const(1073741789)) lcg30_0 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                      1: LCG #(.seed(seed), .width_state(62), .width_output(width_output), .multiplier(921746065), .module_const(1073741789)) lcg30_1 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                default: LCG #(.seed(seed), .width_state(62), .width_output(width_output), .multiplier(771645345), module_const(1073741789)) lcg30 (.clk(clk), .rst(rst), .enable(enable), .out(out));
              endcase


         31 : case (variant)
                      0: LCG #(.seed(seed), .width_state(63), .width_output(width_output), .multiplier(784588716), .module_const(2147483647)) lcg31_0 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                default: LCG #(.seed(seed), .width_state(64), .width_output(width_output), .multiplier(1583458089), module_const(2147483647)) lcg31 (.clk(clk), .rst(rst), .enable(enable), .out(out));
              endcase


         32 : case (variant)
                      0: LCG #(.seed(seed), .width_state(65), .width_output(width_output), .multiplier(1223106847), .module_const(4294967291)) lcg32_0 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                      1: LCG #(.seed(seed), .width_state(63), .width_output(width_output), .multiplier(279470273), .module_const(4294967291)) lcg32_1 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                default: LCG #(.seed(seed), .width_state(65), .width_output(width_output), .multiplier(1588635695), module_const(4294967291)) lcg32 (.clk(clk), .rst(rst), .enable(enable), .out(out));
              endcase


         33 : case (variant)
                      0: LCG #(.seed(seed), .width_state(67), .width_output(width_output), .multiplier(2278442619), .module_const(8589934583)) lcg33_0 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                      1: LCG #(.seed(seed), .width_state(68), .width_output(width_output), .multiplier(7312638624), .module_const(8589934583)) lcg33_1 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                default: LCG #(.seed(seed), .width_state(68), .width_output(width_output), .multiplier(7425194315), module_const(8589934583)) lcg33 (.clk(clk), .rst(rst), .enable(enable), .out(out));
              endcase


         34 : case (variant)
                      0: LCG #(.seed(seed), .width_state(65), .width_output(width_output), .multiplier(473186378), .module_const(17179869143)) lcg34_0 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                default: LCG #(.seed(seed), .width_state(69), .width_output(width_output), .multiplier(5295517759), module_const(17179869143)) lcg34 (.clk(clk), .rst(rst), .enable(enable), .out(out));
              endcase


         35 : case (variant)
                      0: LCG #(.seed(seed), .width_state(72), .width_output(width_output), .multiplier(22277574834), .module_const(34359738337)) lcg35_0 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                      1: LCG #(.seed(seed), .width_state(70), .width_output(width_output), .multiplier(8094871968), .module_const(34359738337)) lcg35_1 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                default: LCG #(.seed(seed), .width_state(69), .width_output(width_output), .multiplier(3124199165), module_const(34359738337)) lcg35 (.clk(clk), .rst(rst), .enable(enable), .out(out));
              endcase


         36 : case (variant)
                      0: LCG #(.seed(seed), .width_state(74), .width_output(width_output), .multiplier(45453986995), .module_const(68719476731)) lcg36_0 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                default: LCG #(.seed(seed), .width_state(74), .width_output(width_output), .multiplier(49865143810), module_const(68719476731)) lcg36 (.clk(clk), .rst(rst), .enable(enable), .out(out));
              endcase


         37 : case (variant)
                      0: LCG #(.seed(seed), .width_state(71), .width_output(width_output), .multiplier(2996735870), .module_const(137438953447)) lcg37_0 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                      1: LCG #(.seed(seed), .width_state(76), .width_output(width_output), .multiplier(85876534675), .module_const(137438953447)) lcg37_1 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                default: LCG #(.seed(seed), .width_state(76), .width_output(width_output), .multiplier(76886758244), module_const(137438953447)) lcg37 (.clk(clk), .rst(rst), .enable(enable), .out(out));
              endcase


         38 : case (variant)
                      0: LCG #(.seed(seed), .width_state(77), .width_output(width_output), .multiplier(101262352583), .module_const(274877906899)) lcg38_0 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                      1: LCG #(.seed(seed), .width_state(75), .width_output(width_output), .multiplier(24271817484), .module_const(274877906899)) lcg38_1 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                default: LCG #(.seed(seed), .width_state(75), .width_output(width_output), .multiplier(17838542566), module_const(274877906899)) lcg38 (.clk(clk), .rst(rst), .enable(enable), .out(out));
              endcase


         39 : case (variant)
                      0: LCG #(.seed(seed), .width_state(80), .width_output(width_output), .multiplier(486583348513), .module_const(549755813881)) lcg39_0 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                      1: LCG #(.seed(seed), .width_state(80), .width_output(width_output), .multiplier(541240737696), .module_const(549755813881)) lcg39_1 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                default: LCG #(.seed(seed), .width_state(77), .width_output(width_output), .multiplier(61992693052), module_const(549755813881)) lcg39 (.clk(clk), .rst(rst), .enable(enable), .out(out));
              endcase


         40 : case (variant)
                      0: LCG #(.seed(seed), .width_state(79), .width_output(width_output), .multiplier(88718554611), .module_const(1099511627689)) lcg40_0 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                      1: LCG #(.seed(seed), .width_state(82), .width_output(width_output), .multiplier(937333352873), .module_const(1099511627689)) lcg40_1 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                default: LCG #(.seed(seed), .width_state(82), .width_output(width_output), .multiplier(1038914804222), module_const(1099511627689)) lcg40 (.clk(clk), .rst(rst), .enable(enable), .out(out));
              endcase


         41 : case (variant)
                      0: LCG #(.seed(seed), .width_state(82), .width_output(width_output), .multiplier(416480024109), .module_const(2199023255531)) lcg41_0 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                      1: LCG #(.seed(seed), .width_state(84), .width_output(width_output), .multiplier(1319743354064), .module_const(2199023255531)) lcg41_1 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                default: LCG #(.seed(seed), .width_state(81), .width_output(width_output), .multiplier(140245111714), module_const(2199023255531)) lcg41 (.clk(clk), .rst(rst), .enable(enable), .out(out));
              endcase


         42 : case (variant)
                      0: LCG #(.seed(seed), .width_state(86), .width_output(width_output), .multiplier(2928603677866), .module_const(4398046511093)) lcg42_0 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                      1: LCG #(.seed(seed), .width_state(81), .width_output(width_output), .multiplier(92644101553), .module_const(4398046511093)) lcg42_1 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                default: LCG #(.seed(seed), .width_state(86), .width_output(width_output), .multiplier(2214813540776), module_const(4398046511093)) lcg42 (.clk(clk), .rst(rst), .enable(enable), .out(out));
              endcase


         43 : case (variant)
                      0: LCG #(.seed(seed), .width_state(87), .width_output(width_output), .multiplier(4204926164974), .module_const(8796093022151)) lcg43_0 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                      1: LCG #(.seed(seed), .width_state(87), .width_output(width_output), .multiplier(3663455557440), .module_const(8796093022151)) lcg43_1 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                default: LCG #(.seed(seed), .width_state(88), .width_output(width_output), .multiplier(4928052325348), module_const(8796093022151)) lcg43 (.clk(clk), .rst(rst), .enable(enable), .out(out));
              endcase


         44 : case (variant)
                      0: LCG #(.seed(seed), .width_state(90), .width_output(width_output), .multiplier(11394954323348), .module_const(17592186044399)) lcg44_0 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                      1: LCG #(.seed(seed), .width_state(86), .width_output(width_output), .multiplier(949305806524), .module_const(17592186044399)) lcg44_1 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                default: LCG #(.seed(seed), .width_state(89), .width_output(width_output), .multiplier(6307617245999), module_const(17592186044399)) lcg44 (.clk(clk), .rst(rst), .enable(enable), .out(out));
              endcase


         45 : case (variant)
                      0: LCG #(.seed(seed), .width_state(92), .width_output(width_output), .multiplier(18586042069168), .module_const(35184372088777)) lcg45_0 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                      1: LCG #(.seed(seed), .width_state(92), .width_output(width_output), .multiplier(20827157855185), .module_const(35184372088777)) lcg45_1 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                default: LCG #(.seed(seed), .width_state(92), .width_output(width_output), .multiplier(25933916233908), module_const(35184372088777)) lcg45 (.clk(clk), .rst(rst), .enable(enable), .out(out));
              endcase


         46 : case (variant)
                      0: LCG #(.seed(seed), .width_state(92), .width_output(width_output), .multiplier(15721062042478), .module_const(70368744177643)) lcg46_0 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                      1: LCG #(.seed(seed), .width_state(93), .width_output(width_output), .multiplier(31895852118078), .module_const(70368744177643)) lcg46_1 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                default: LCG #(.seed(seed), .width_state(94), .width_output(width_output), .multiplier(63975993200055), module_const(70368744177643)) lcg46 (.clk(clk), .rst(rst), .enable(enable), .out(out));
              endcase


         47 : case (variant)
                      0: LCG #(.seed(seed), .width_state(95), .width_output(width_output), .multiplier(47912952719020), .module_const(140737488355213)) lcg47_0 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                      1: LCG #(.seed(seed), .width_state(96), .width_output(width_output), .multiplier(106090059835221), .module_const(140737488355213)) lcg47_1 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                default: LCG #(.seed(seed), .width_state(96), .width_output(width_output), .multiplier(72624924005429), module_const(140737488355213)) lcg47 (.clk(clk), .rst(rst), .enable(enable), .out(out));
              endcase


         48 : case (variant)
                      0: LCG #(.seed(seed), .width_state(96), .width_output(width_output), .multiplier(51699608632694), .module_const(281474976710597)) lcg48_0 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                      1: LCG #(.seed(seed), .width_state(96), .width_output(width_output), .multiplier(59279420901007), .module_const(281474976710597)) lcg48_1 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                default: LCG #(.seed(seed), .width_state(96), .width_output(width_output), .multiplier(49235258628958), module_const(281474976710597)) lcg48 (.clk(clk), .rst(rst), .enable(enable), .out(out));
              endcase


         49 : case (variant)
                      0: LCG #(.seed(seed), .width_state(100), .width_output(width_output), .multiplier(480567615612976), .module_const(562949953421231)) lcg49_0 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                      1: LCG #(.seed(seed), .width_state(100), .width_output(width_output), .multiplier(305898857643681), .module_const(562949953421231)) lcg49_1 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                default: LCG #(.seed(seed), .width_state(99), .width_output(width_output), .multiplier(265609885904224), module_const(562949953421231)) lcg49 (.clk(clk), .rst(rst), .enable(enable), .out(out));
              endcase


         50 : case (variant)
                      0: LCG #(.seed(seed), .width_state(100), .width_output(width_output), .multiplier(157252724901243), .module_const(1125899906842597)) lcg50_0 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                      1: LCG #(.seed(seed), .width_state(102), .width_output(width_output), .multiplier(791038363307311), .module_const(1125899906842597)) lcg50_1 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                default: LCG #(.seed(seed), .width_state(102), .width_output(width_output), .multiplier(1087141320185010), module_const(1125899906842597)) lcg50 (.clk(clk), .rst(rst), .enable(enable), .out(out));
              endcase


         51 : case (variant)
                      0: LCG #(.seed(seed), .width_state(101), .width_output(width_output), .multiplier(277678575478219), .module_const(2251799813685119)) lcg51_0 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                      1: LCG #(.seed(seed), .width_state(102), .width_output(width_output), .multiplier(486848186921772), .module_const(2251799813685119)) lcg51_1 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                default: LCG #(.seed(seed), .width_state(102), .width_output(width_output), .multiplier(349044191547257), module_const(2251799813685119)) lcg51 (.clk(clk), .rst(rst), .enable(enable), .out(out));
              endcase


         52 : case (variant)
                      0: LCG #(.seed(seed), .width_state(106), .width_output(width_output), .multiplier(3622689089018661), .module_const(4503599627370449)) lcg52_0 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                      1: LCG #(.seed(seed), .width_state(104), .width_output(width_output), .multiplier(711667642880185), .module_const(4503599627370449)) lcg52_1 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                default: LCG #(.seed(seed), .width_state(106), .width_output(width_output), .multiplier(4359287924442956), module_const(4503599627370449)) lcg52 (.clk(clk), .rst(rst), .enable(enable), .out(out));
              endcase


         53 : case (variant)
                      0: LCG #(.seed(seed), .width_state(107), .width_output(width_output), .multiplier(4179081713689027), .module_const(9007199254740881)) lcg53_0 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                      1: LCG #(.seed(seed), .width_state(108), .width_output(width_output), .multiplier(5667072534355537), .module_const(9007199254740881)) lcg53_1 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                default: LCG #(.seed(seed), .width_state(106), .width_output(width_output), .multiplier(2082839274626558), module_const(9007199254740881)) lcg53 (.clk(clk), .rst(rst), .enable(enable), .out(out));
              endcase


         54 : case (variant)
                      0: LCG #(.seed(seed), .width_state(108), .width_output(width_output), .multiplier(3819217137918427), .module_const(18014398509481951)) lcg54_0 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                      1: LCG #(.seed(seed), .width_state(110), .width_output(width_output), .multiplier(11676603717543485), .module_const(18014398509481951)) lcg54_1 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                default: LCG #(.seed(seed), .width_state(110), .width_output(width_output), .multiplier(9131148267933071), module_const(18014398509481951)) lcg54 (.clk(clk), .rst(rst), .enable(enable), .out(out));
              endcase


         55 : case (variant)
                      0: LCG #(.seed(seed), .width_state(112), .width_output(width_output), .multiplier(19708881949174686), .module_const(36028797018963913)) lcg55_0 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                      1: LCG #(.seed(seed), .width_state(112), .width_output(width_output), .multiplier(32075972421209701), .module_const(36028797018963913)) lcg55_1 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                default: LCG #(.seed(seed), .width_state(112), .width_output(width_output), .multiplier(33266544676670489), module_const(36028797018963913)) lcg55 (.clk(clk), .rst(rst), .enable(enable), .out(out));
              endcase


         56 : case (variant)
                      0: LCG #(.seed(seed), .width_state(113), .width_output(width_output), .multiplier(26093644409268278), .module_const(72057594037927931)) lcg56_0 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                      1: LCG #(.seed(seed), .width_state(111), .width_output(width_output), .multiplier(4595551687828611), .module_const(72057594037927931)) lcg56_1 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                default: LCG #(.seed(seed), .width_state(111), .width_output(width_output), .multiplier(4595551687825993), module_const(72057594037927931)) lcg56 (.clk(clk), .rst(rst), .enable(enable), .out(out));
              endcase


         57 : case (variant)
                      0: LCG #(.seed(seed), .width_state(116), .width_output(width_output), .multiplier(95424006161758065), .module_const(144115188075855859)) lcg57_0 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                      1: LCG #(.seed(seed), .width_state(116), .width_output(width_output), .multiplier(133686472073660397), .module_const(144115188075855859)) lcg57_1 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                default: LCG #(.seed(seed), .width_state(116), .width_output(width_output), .multiplier(75953708294752990), module_const(144115188075855859)) lcg57 (.clk(clk), .rst(rst), .enable(enable), .out(out));
              endcase


         58 : case (variant)
                      0: LCG #(.seed(seed), .width_state(118), .width_output(width_output), .multiplier(163847936876980536), .module_const(288230376151711717)) lcg58_0 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                      1: LCG #(.seed(seed), .width_state(118), .width_output(width_output), .multiplier(206638310974457555), .module_const(288230376151711717)) lcg58_1 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                default: LCG #(.seed(seed), .width_state(117), .width_output(width_output), .multiplier(101565695086122187), module_const(288230376151711717)) lcg58 (.clk(clk), .rst(rst), .enable(enable), .out(out));
              endcase


         59 : case (variant)
                      0: LCG #(.seed(seed), .width_state(118), .width_output(width_output), .multiplier(124795884580648576), .module_const(576460752303423433)) lcg59_0 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                      1: LCG #(.seed(seed), .width_state(120), .width_output(width_output), .multiplier(573223409952553925), .module_const(576460752303423433)) lcg59_1 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                default: LCG #(.seed(seed), .width_state(120), .width_output(width_output), .multiplier(346764851511064641), module_const(576460752303423433)) lcg59 (.clk(clk), .rst(rst), .enable(enable), .out(out));
              endcase


         60 : case (variant)
                      0: LCG #(.seed(seed), .width_state(121), .width_output(width_output), .multiplier(439138238526007932), .module_const(1152921504606846883)) lcg60_0 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                      1: LCG #(.seed(seed), .width_state(122), .width_output(width_output), .multiplier(734022639675925522), .module_const(1152921504606846883)) lcg60_1 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                default: LCG #(.seed(seed), .width_state(121), .width_output(width_output), .multiplier(561860773102413563), module_const(1152921504606846883)) lcg60 (.clk(clk), .rst(rst), .enable(enable), .out(out));
              endcase


         61 : case (variant)
                      0: LCG #(.seed(seed), .width_state(123), .width_output(width_output), .multiplier(1070922063159934167), .module_const(2305843009213693951)) lcg61_0 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                      1: LCG #(.seed(seed), .width_state(124), .width_output(width_output), .multiplier(1267205010812451270), .module_const(2305843009213693951)) lcg61_1 (.clk(clk), .rst(rst), .enable(enable), .out(out));
                default: LCG #(.seed(seed), .width_state(124), .width_output(width_output), .multiplier(1351750484049952003), module_const(2305843009213693951)) lcg61 (.clk(clk), .rst(rst), .enable(enable), .out(out));
              endcase


       default: LCG #(.seed(seed), .width_state(18), .width_output(width_output), .multiplier(110), .module_const(509)) lcg9_default (.clk(clk), .rst(rst), .enable(enable), .out(out));
       endcase
    endgenerate
endmodule
