
echo "=== REPORTS ==="
find reports -type f

echo "=== OUTPUTS ==="
find outputs -type f

echo "=== INPUTS ==="
find inputs -type f

echo "=== SCRIPTS ==="
find scripts -type f
=== REPORTS ===
reports/checks.rpt
reports/registers.rpt
reports/summary.rpt
reports/post_synth_stat.rpt
reports/power.rpt
reports/pre_synth_stat.rpt
reports/max_timing.rpt
reports/stats.json
reports/min_timing.rpt
reports/post_synth_stat_hier.rpt
=== OUTPUTS ===
outputs/uart_top.json
outputs/uart_top.v
outputs/netlist.sdc
=== INPUTS ===
=== SCRIPTS ===
scripts/flow_synth.tcl
c2s-nitj-047-gagan-sharma@compcarta-chipin-c2s1:~/catalyzer_projects/digital/uart/run/synthesis$ cat reports/summary.rpt reports/post_synth_stat.rpt reports/max_timing.rpt reports/min_timing.rpt reports/power.rpt reports/checks.rpt reports/registers.rpt reports/post_synth_stat_hier.rpt reports/stats.json outputs/uart_top.v outputs/netlist.sdc scripts/flow_synth.tcl
max (setup)  WNS 5.449154171013652  TNS 0.0
min (hold)   WNS 0.8854797701260958  TNS 0.0

46. Printing statistics.

=== uart_top ===

        +----------Local Count, excluding submodules.
        |        +-Local Area, excluding submodules.
        |        | 
      240        - wires
      304        - wire bits
      240        - public wires
      304        - public wire bits
        9        - ports
       23        - port bits
      292    3E+03 cells
        1    8.758   sky130_fd_sc_hd__a211o_1
        3   22.522   sky130_fd_sc_hd__a211oi_1
        1    10.01   sky130_fd_sc_hd__a21bo_1
        1    7.507   sky130_fd_sc_hd__a21o_1
       25   125.12   sky130_fd_sc_hd__a21oi_1
        3   26.275   sky130_fd_sc_hd__a22o_1
        3   22.522   sky130_fd_sc_hd__a22oi_1
        1    6.256   sky130_fd_sc_hd__a31oi_1
        3   18.768   sky130_fd_sc_hd__and2_0
       10    62.56   sky130_fd_sc_hd__and3_1
        8   70.067   sky130_fd_sc_hd__and4_1
        7   26.275   sky130_fd_sc_hd__clkinv_1
       69 1.73E+03   sky130_fd_sc_hd__dfrtp_1
        1   26.275   sky130_fd_sc_hd__dfstp_2
        9  101.347   sky130_fd_sc_hd__mux2_1
        1    10.01   sky130_fd_sc_hd__mux2i_1
       27  101.347   sky130_fd_sc_hd__nand2_1
        4   25.024   sky130_fd_sc_hd__nand2b_1
        5   25.024   sky130_fd_sc_hd__nand3_1
        3   22.522   sky130_fd_sc_hd__nand3b_1
        4   25.024   sky130_fd_sc_hd__nand4_1
        1    8.758   sky130_fd_sc_hd__nand4b_1
       41  153.898   sky130_fd_sc_hd__nor2_1
        3   18.768   sky130_fd_sc_hd__nor2b_1
       18   90.086   sky130_fd_sc_hd__nor3_1
        2   15.014   sky130_fd_sc_hd__nor3b_1
        3   18.768   sky130_fd_sc_hd__nor4_1
        2   17.517   sky130_fd_sc_hd__nor4b_1
        2   20.019   sky130_fd_sc_hd__nor4bb_1
        2   15.014   sky130_fd_sc_hd__o211ai_1
       17   85.082   sky130_fd_sc_hd__o21ai_0
        3   18.768   sky130_fd_sc_hd__o22ai_1
        3   22.522   sky130_fd_sc_hd__o31ai_1
        1    6.256   sky130_fd_sc_hd__or2_0
        2   15.014   sky130_fd_sc_hd__or4_1
        2   17.517   sky130_fd_sc_hd__xnor2_1
        1    8.758   sky130_fd_sc_hd__xor2_1

   Chip area for module '\uart_top': 3001.628800
     of which used for sequential elements: 1752.931200 (58.40%)

Startpoint: tx_instxstate_sky130_fd_sc_hd__dfrtp_1_Q_1
            (rising edge-triggered flip-flop clocked by clk)
Endpoint: tx_instxstate_sky130_fd_sc_hd__dfrtp_1_Q
          (rising edge-triggered flip-flop clocked by clk)
Path Group: clk
Path Type: max

Fanout     Cap    Slew   Delay    Time   Description
-----------------------------------------------------------------------------
                  0.00    0.00    0.00   clock clk (rise edge)
                          0.00    0.00   clock network delay (ideal)
                  0.00    0.00    0.00 ^ tx_instxstate_sky130_fd_sc_hd__dfrtp_1_Q_1/CLK (sky130_fd_sc_hd__dfrtp_1)
     6    0.01    0.14    0.80    0.80 v tx_instxstate_sky130_fd_sc_hd__dfrtp_1_Q_1/Q (sky130_fd_sc_hd__dfrtp_1)
                                         tx_instxstate[0] (net)
                  0.14    0.00    0.80 v tx_instxstate_sky130_fd_sc_hd__nor2_1_A_1/A (sky130_fd_sc_hd__nor2_1)
    14    0.03    1.28    1.11    1.91 ^ tx_instxstate_sky130_fd_sc_hd__nor2_1_A_1/Y (sky130_fd_sc_hd__nor2_1)
                                         net_64 (net)
                  1.28    0.00    1.91 ^ tx_start_sky130_fd_sc_hd__and2_0_A/B (sky130_fd_sc_hd__and2_0)
     6    0.01    0.42    0.86    2.77 ^ tx_start_sky130_fd_sc_hd__and2_0_A/X (sky130_fd_sc_hd__and2_0)
                                         net_60 (net)
                  0.42    0.00    2.77 ^ tx_instxbaud_tick_sky130_fd_sc_hd__a21oi_1_A1/B1 (sky130_fd_sc_hd__a21oi_1)
     1    0.00    0.07    0.17    2.94 v tx_instxbaud_tick_sky130_fd_sc_hd__a21oi_1_A1/Y (sky130_fd_sc_hd__a21oi_1)
                                         net_58 (net)
                  0.07    0.00    2.94 v net_57_sky130_fd_sc_hd__a21oi_1_Y/B1 (sky130_fd_sc_hd__a21oi_1)
     2    0.01    0.33    0.34    3.28 ^ net_57_sky130_fd_sc_hd__a21oi_1_Y/Y (sky130_fd_sc_hd__a21oi_1)
                                         net_57 (net)
                  0.33    0.00    3.28 ^ tx_instxstate_sky130_fd_sc_hd__mux2_1_A0/S (sky130_fd_sc_hd__mux2_1)
     1    0.00    0.09    0.87    4.15 v tx_instxstate_sky130_fd_sc_hd__mux2_1_A0/X (sky130_fd_sc_hd__mux2_1)
                                         net_73 (net)
                  0.09    0.00    4.15 v tx_instxstate_sky130_fd_sc_hd__dfrtp_1_Q/D (sky130_fd_sc_hd__dfrtp_1)
                                  4.15   data arrival time

                  0.00   10.00   10.00   clock clk (rise edge)
                          0.00   10.00   clock network delay (ideal)
                          0.00   10.00   clock reconvergence pessimism
                                 10.00 ^ tx_instxstate_sky130_fd_sc_hd__dfrtp_1_Q/CLK (sky130_fd_sc_hd__dfrtp_1)
                         -0.40    9.60   library setup time
                                  9.60   data required time
-----------------------------------------------------------------------------
                                  9.60   data required time
                                 -4.15   data arrival time
-----------------------------------------------------------------------------
                                  5.45   slack (MET)


Startpoint: data_out_sky130_fd_sc_hd__dfrtp_1_Q
            (rising edge-triggered flip-flop clocked by clk)
Endpoint: data_out_sky130_fd_sc_hd__dfrtp_1_Q
          (rising edge-triggered flip-flop clocked by clk)
Path Group: clk
Path Type: min

Fanout     Cap    Slew   Delay    Time   Description
-----------------------------------------------------------------------------
                  0.00    0.00    0.00   clock clk (rise edge)
                          0.00    0.00   clock network delay (ideal)
                  0.00    0.00    0.00 ^ data_out_sky130_fd_sc_hd__dfrtp_1_Q/CLK (sky130_fd_sc_hd__dfrtp_1)
     2    0.00    0.06    0.61    0.61 ^ data_out_sky130_fd_sc_hd__dfrtp_1_Q/Q (sky130_fd_sc_hd__dfrtp_1)
                                         data_out[6] (net)
                  0.06    0.00    0.61 ^ data_out_sky130_fd_sc_hd__mux2_1_A0_6/A0 (sky130_fd_sc_hd__mux2_1)
     1    0.00    0.06    0.20    0.81 ^ data_out_sky130_fd_sc_hd__mux2_1_A0_6/X (sky130_fd_sc_hd__mux2_1)
                                         net_120 (net)
                  0.06    0.00    0.81 ^ data_out_sky130_fd_sc_hd__dfrtp_1_Q/D (sky130_fd_sc_hd__dfrtp_1)
                                  0.81   data arrival time

                  0.00    0.00    0.00   clock clk (rise edge)
                          0.00    0.00   clock network delay (ideal)
                          0.00    0.00   clock reconvergence pessimism
                                  0.00 ^ data_out_sky130_fd_sc_hd__dfrtp_1_Q/CLK (sky130_fd_sc_hd__dfrtp_1)
                         -0.08   -0.08   library hold time
                                 -0.08   data required time
-----------------------------------------------------------------------------
                                 -0.08   data required time
                                 -0.81   data arrival time
-----------------------------------------------------------------------------
                                  0.89   slack (MET)


Group                    Internal    Switching      Leakage        Total
                            Power        Power        Power        Power (Watts)
------------------------------------------------------------------------
Sequential           2.472023e-04 1.345267e-05 9.961939e-11 2.606550e-04  84.8%
Combinational        2.416184e-05 2.253287e-05 9.034942e-11 4.669479e-05  15.2%
Clock                0.000000e+00 0.000000e+00 0.000000e+00 0.000000e+00   0.0%
Macro                0.000000e+00 0.000000e+00 0.000000e+00 0.000000e+00   0.0%
Pad                  0.000000e+00 0.000000e+00 0.000000e+00 0.000000e+00   0.0%
------------------------------------------------------------------------
Total                2.713642e-04 3.598554e-05 1.899688e-10 3.073499e-04 100.0%
                            88.3%        11.7%         0.0%
Log File: /home/c2s-nitj-047-gagan-sharma/my_projects/uart/run/synthesis/logs/synthesis.log
Errors: 0
Warnings: 5
--------------------------------
47. Printing statistics.

=== uart_top ===

        +----------Local Count, excluding submodules.
        |        +-Local Area, excluding submodules.
        |        | 
      240        - wires
      304        - wire bits
      240        - public wires
      304        - public wire bits
        9        - ports
       23        - port bits
      292    3E+03 cells
        1    8.758   sky130_fd_sc_hd__a211o_1
        3   22.522   sky130_fd_sc_hd__a211oi_1
        1    10.01   sky130_fd_sc_hd__a21bo_1
        1    7.507   sky130_fd_sc_hd__a21o_1
       25   125.12   sky130_fd_sc_hd__a21oi_1
        3   26.275   sky130_fd_sc_hd__a22o_1
        3   22.522   sky130_fd_sc_hd__a22oi_1
        1    6.256   sky130_fd_sc_hd__a31oi_1
        3   18.768   sky130_fd_sc_hd__and2_0
       10    62.56   sky130_fd_sc_hd__and3_1
        8   70.067   sky130_fd_sc_hd__and4_1
        7   26.275   sky130_fd_sc_hd__clkinv_1
       69 1.73E+03   sky130_fd_sc_hd__dfrtp_1
        1   26.275   sky130_fd_sc_hd__dfstp_2
        9  101.347   sky130_fd_sc_hd__mux2_1
        1    10.01   sky130_fd_sc_hd__mux2i_1
       27  101.347   sky130_fd_sc_hd__nand2_1
        4   25.024   sky130_fd_sc_hd__nand2b_1
        5   25.024   sky130_fd_sc_hd__nand3_1
        3   22.522   sky130_fd_sc_hd__nand3b_1
        4   25.024   sky130_fd_sc_hd__nand4_1
        1    8.758   sky130_fd_sc_hd__nand4b_1
       41  153.898   sky130_fd_sc_hd__nor2_1
        3   18.768   sky130_fd_sc_hd__nor2b_1
       18   90.086   sky130_fd_sc_hd__nor3_1
        2   15.014   sky130_fd_sc_hd__nor3b_1
        3   18.768   sky130_fd_sc_hd__nor4_1
        2   17.517   sky130_fd_sc_hd__nor4b_1
        2   20.019   sky130_fd_sc_hd__nor4bb_1
        2   15.014   sky130_fd_sc_hd__o211ai_1
       17   85.082   sky130_fd_sc_hd__o21ai_0
        3   18.768   sky130_fd_sc_hd__o22ai_1
        3   22.522   sky130_fd_sc_hd__o31ai_1
        1    6.256   sky130_fd_sc_hd__or2_0
        2   15.014   sky130_fd_sc_hd__or4_1
        2   17.517   sky130_fd_sc_hd__xnor2_1
        1    8.758   sky130_fd_sc_hd__xor2_1

   Chip area for module '\uart_top': 3001.628800
     of which used for sequential elements: 1752.931200 (58.40%)

{
  "SYNTHESIS_STATS": {
    "DESIGN_STATS": {
      "NUM_CELLS": ["Number of cells", 292],
      "NUM_PORTS": ["Number of ports", 9],
      "NUM_PORT_BITS": ["Number of port bits", 23],
      "NUM_WIRES": ["Number of wires", 240],
      "NUM_WIRE_BITS": ["Number of wire bits", 304]
    },
    "AREA_STATS": {
      "CHIP_AREA": ["Total chip area", 3001.63, "μm²"],
      "SEQ_AREA": ["Sequential cell area", 1752.93, "μm²"]
    },
    "TIMING_STATS": {
      "HOLD_WORST": ["Worst hold slack", 0.89, "ns"],
      "SETUP_WORST": ["Worst setup slack", 5.45, "ns"],
      "TNS": ["Total Negative Slack", 0, "ns"],
      "WNS": ["Worst Negative Slack", 0, "ns"]
    },
    "POWER_STATS": {
      "POWER_CLOCK": ["Clock power", 0, "W"],
      "POWER_COMBO": ["Combinational power", 4.66948e-05, "W"],
      "POWER_INTERNAL": ["Total internal power", 0.000271364, "W"],
      "POWER_LEAKAGE": ["Total leakage power", 1.89969e-10, "W"],
      "POWER_MACRO": ["Macro power", 0, "W"],
      "POWER_PAD": ["Pad power", 0, "W"],
      "POWER_SEQ": ["Sequential power", 0.000260655, "W"],
      "POWER_SWITCHING": ["Total switching power", 3.59855e-05, "W"],
      "POWER_TOTAL": ["Total power", 0.00030735, "W"]
    }
  }
}
/* Generated by Yosys 0.66 (git sha1 UNKNOWN-dirty, g++ 13.3.0-6ubuntu2~24.04.1 -fPIC -O3) [compcartasolutions/timing-aware-synthesis-flow] */

module uart_top(clk, rst_n, data_in, tx_start, data_out, tx_busy, tx_done, rx_busy, rx_done);
  input clk;
  wire clk;
  input rst_n;
  wire rst_n;
  input [7:0] data_in;
  wire [7:0] data_in;
  input tx_start;
  wire tx_start;
  output [7:0] data_out;
  wire [7:0] data_out;
  output tx_busy;
  wire tx_busy;
  output tx_done;
  wire tx_done;
  output rx_busy;
  wire rx_busy;
  output rx_done;
  wire rx_done;
  wire net_0;
  wire net_1;
  wire net_10;
  wire net_100;
  wire net_101;
  wire net_102;
  wire net_103;
  wire net_104;
  wire net_105;
  wire net_106;
  wire net_107;
  wire net_108;
  wire net_109;
  wire net_11;
  wire net_110;
  wire net_111;
  wire net_112;
  wire net_113;
  wire net_114;
  wire net_115;
  wire net_116;
  wire net_117;
  wire net_118;
  wire net_119;
  wire net_12;
  wire net_120;
  wire net_121;
  wire net_122;
  wire net_123;
  wire net_124;
  wire net_125;
  wire net_126;
  wire net_127;
  wire net_128;
  wire net_129;
  wire net_13;
  wire net_130;
  wire net_131;
  wire net_132;
  wire net_133;
  wire net_134;
  wire net_135;
  wire net_136;
  wire net_137;
  wire net_138;
  wire net_139;
  wire net_14;
  wire net_140;
  wire net_141;
  wire net_142;
  wire net_143;
  wire net_144;
  wire net_145;
  wire net_146;
  wire net_147;
  wire net_148;
  wire net_149;
  wire net_15;
  wire net_150;
  wire net_151;
  wire net_152;
  wire net_153;
  wire net_154;
  wire net_155;
  wire net_156;
  wire net_157;
  wire net_158;
  wire net_159;
  wire net_16;
  wire net_160;
  wire net_161;
  wire net_162;
  wire net_163;
  wire net_164;
  wire net_165;
  wire net_166;
  wire net_167;
  wire net_168;
  wire net_169;
  wire net_17;
  wire net_170;
  wire net_171;
  wire net_172;
  wire net_173;
  wire net_174;
  wire net_175;
  wire net_176;
  wire net_177;
  wire net_178;
  wire net_179;
  wire net_18;
  wire net_180;
  wire net_181;
  wire net_182;
  wire net_183;
  wire net_184;
  wire net_185;
  wire net_186;
  wire net_187;
  wire net_188;
  wire net_189;
  wire net_19;
  wire net_190;
  wire net_191;
  wire net_192;
  wire net_193;
  wire net_194;
  wire net_195;
  wire net_196;
  wire net_197;
  wire net_198;
  wire net_199;
  wire net_2;
  wire net_20;
  wire net_200;
  wire net_201;
  wire net_202;
  wire net_203;
  wire net_204;
  wire net_205;
  wire net_206;
  wire net_207;
  wire net_208;
  wire net_209;
  wire net_21;
  wire net_210;
  wire net_211;
  wire net_212;
  wire net_213;
  wire net_214;
  wire net_215;
  wire net_216;
  wire net_217;
  wire net_218;
  wire net_22;
  wire net_23;
  wire net_24;
  wire net_25;
  wire net_26;
  wire net_27;
  wire net_28;
  wire net_29;
  wire net_3;
  wire net_30;
  wire net_31;
  wire net_32;
  wire net_33;
  wire net_34;
  wire net_35;
  wire net_36;
  wire net_37;
  wire net_38;
  wire net_39;
  wire net_4;
  wire net_40;
  wire net_41;
  wire net_42;
  wire net_43;
  wire net_44;
  wire net_45;
  wire net_46;
  wire net_47;
  wire net_48;
  wire net_49;
  wire net_5;
  wire net_50;
  wire net_51;
  wire net_52;
  wire net_53;
  wire net_54;
  wire net_55;
  wire net_56;
  wire net_57;
  wire net_58;
  wire net_59;
  wire net_6;
  wire net_60;
  wire net_61;
  wire net_62;
  wire net_63;
  wire net_64;
  wire net_65;
  wire net_66;
  wire net_67;
  wire net_68;
  wire net_69;
  wire net_7;
  wire net_70;
  wire net_71;
  wire net_72;
  wire net_73;
  wire net_74;
  wire net_75;
  wire net_76;
  wire net_77;
  wire net_78;
  wire net_79;
  wire net_8;
  wire net_80;
  wire net_81;
  wire net_82;
  wire net_83;
  wire net_84;
  wire net_85;
  wire net_86;
  wire net_87;
  wire net_88;
  wire net_89;
  wire net_9;
  wire net_90;
  wire net_91;
  wire net_92;
  wire net_93;
  wire net_94;
  wire net_95;
  wire net_96;
  wire net_97;
  wire net_98;
  wire net_99;
  wire [15:0] rx_instxbaud_cnt;
  wire rx_instxbaud_tick;
  wire [2:0] rx_instxbit_cnt;
  wire rx_instxprev_rx;
  wire rx_instxrx;
  wire [7:0] rx_instxshifter;
  wire [1:0] rx_instxstate;
  wire [15:0] tx_instxbaud_cnt;
  wire tx_instxbaud_tick;
  wire [2:0] tx_instxbit_cnt;
  wire [7:0] tx_instxshifter;
  wire [1:0] tx_instxstate;
  sky130_fd_sc_hd__a22o_1 data_in_sky130_fd_sc_hd__a22o_1_A1 (
    .A1(data_in[7]),
    .A2(net_60),
    .B1(net_25),
    .B2(tx_instxshifter[7]),
    .X(net_72)
  );
  sky130_fd_sc_hd__nand2_1 data_in_sky130_fd_sc_hd__nand2_1_A (
    .A(data_in[3]),
    .B(net_60),
    .Y(net_34)
  );
  sky130_fd_sc_hd__nand2_1 data_in_sky130_fd_sc_hd__nand2_1_A_1 (
    .A(data_in[4]),
    .B(net_60),
    .Y(net_32)
  );
  sky130_fd_sc_hd__nand2_1 data_in_sky130_fd_sc_hd__nand2_1_A_2 (
    .A(data_in[5]),
    .B(net_60),
    .Y(net_30)
  );
  sky130_fd_sc_hd__nor2_1 data_in_sky130_fd_sc_hd__nor2_1_A (
    .A(data_in[6]),
    .B(net_59),
    .Y(net_28)
  );
  sky130_fd_sc_hd__o22ai_1 data_in_sky130_fd_sc_hd__o22ai_1_A1 (
    .A1(data_in[0]),
    .A2(net_59),
    .B1(net_26),
    .B2(tx_instxshifter[0]),
    .Y(net_41)
  );
  sky130_fd_sc_hd__o22ai_1 data_in_sky130_fd_sc_hd__o22ai_1_A1_1 (
    .A1(data_in[1]),
    .A2(net_59),
    .B1(net_26),
    .B2(tx_instxshifter[1]),
    .Y(net_39)
  );
  sky130_fd_sc_hd__o22ai_1 data_in_sky130_fd_sc_hd__o22ai_1_A1_2 (
    .A1(data_in[2]),
    .A2(net_59),
    .B1(net_26),
    .B2(tx_instxshifter[2]),
    .Y(net_37)
  );
  sky130_fd_sc_hd__dfrtp_1 data_out_sky130_fd_sc_hd__dfrtp_1_Q (
    .CLK(clk),
    .D(net_120),
    .Q(data_out[6]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 data_out_sky130_fd_sc_hd__dfrtp_1_Q_1 (
    .CLK(clk),
    .D(net_119),
    .Q(data_out[5]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 data_out_sky130_fd_sc_hd__dfrtp_1_Q_2 (
    .CLK(clk),
    .D(net_118),
    .Q(data_out[4]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 data_out_sky130_fd_sc_hd__dfrtp_1_Q_3 (
    .CLK(clk),
    .D(net_117),
    .Q(data_out[3]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 data_out_sky130_fd_sc_hd__dfrtp_1_Q_4 (
    .CLK(clk),
    .D(net_116),
    .Q(data_out[2]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 data_out_sky130_fd_sc_hd__dfrtp_1_Q_5 (
    .CLK(clk),
    .D(net_77),
    .Q(data_out[7]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 data_out_sky130_fd_sc_hd__dfrtp_1_Q_6 (
    .CLK(clk),
    .D(net_115),
    .Q(data_out[1]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 data_out_sky130_fd_sc_hd__dfrtp_1_Q_7 (
    .CLK(clk),
    .D(net_114),
    .Q(data_out[0]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__mux2_1 data_out_sky130_fd_sc_hd__mux2_1_A0 (
    .A0(data_out[0]),
    .A1(rx_instxshifter[0]),
    .S(net_172),
    .X(net_114)
  );
  sky130_fd_sc_hd__mux2_1 data_out_sky130_fd_sc_hd__mux2_1_A0_1 (
    .A0(data_out[1]),
    .A1(rx_instxshifter[1]),
    .S(net_172),
    .X(net_115)
  );
  sky130_fd_sc_hd__mux2_1 data_out_sky130_fd_sc_hd__mux2_1_A0_2 (
    .A0(data_out[2]),
    .A1(rx_instxshifter[2]),
    .S(net_172),
    .X(net_116)
  );
  sky130_fd_sc_hd__mux2_1 data_out_sky130_fd_sc_hd__mux2_1_A0_3 (
    .A0(data_out[3]),
    .A1(rx_instxshifter[3]),
    .S(net_172),
    .X(net_117)
  );
  sky130_fd_sc_hd__mux2_1 data_out_sky130_fd_sc_hd__mux2_1_A0_4 (
    .A0(data_out[4]),
    .A1(rx_instxshifter[4]),
    .S(net_172),
    .X(net_118)
  );
  sky130_fd_sc_hd__mux2_1 data_out_sky130_fd_sc_hd__mux2_1_A0_5 (
    .A0(data_out[5]),
    .A1(rx_instxshifter[5]),
    .S(net_172),
    .X(net_119)
  );
  sky130_fd_sc_hd__mux2_1 data_out_sky130_fd_sc_hd__mux2_1_A0_6 (
    .A0(data_out[6]),
    .A1(rx_instxshifter[6]),
    .S(net_172),
    .X(net_120)
  );
  sky130_fd_sc_hd__nor3_1 net_100_sky130_fd_sc_hd__nor3_1_Y (
    .A(net_2),
    .B(net_11),
    .C(net_14),
    .Y(net_100)
  );
  sky130_fd_sc_hd__nor2_1 net_101_sky130_fd_sc_hd__nor2_1_Y (
    .A(net_3),
    .B(net_13),
    .Y(net_101)
  );
  sky130_fd_sc_hd__a21oi_1 net_102_sky130_fd_sc_hd__a21oi_1_Y (
    .A1(net_67),
    .A2(net_4),
    .B1(net_12),
    .Y(net_102)
  );
  sky130_fd_sc_hd__nor3_1 net_103_sky130_fd_sc_hd__nor3_1_Y (
    .A(net_166),
    .B(net_5),
    .C(net_6),
    .Y(net_103)
  );
  sky130_fd_sc_hd__nor2_1 net_105_sky130_fd_sc_hd__nor2_1_Y (
    .A(net_166),
    .B(net_205),
    .Y(net_105)
  );
  sky130_fd_sc_hd__o21ai_0 net_106_sky130_fd_sc_hd__o21ai_0_Y (
    .A1(net_202),
    .A2(net_203),
    .B1(net_200),
    .Y(net_106)
  );
  sky130_fd_sc_hd__o21ai_0 net_107_sky130_fd_sc_hd__o21ai_0_Y (
    .A1(net_198),
    .A2(net_199),
    .B1(net_196),
    .Y(net_107)
  );
  sky130_fd_sc_hd__nand2_1 net_108_sky130_fd_sc_hd__nand2_1_Y (
    .A(net_194),
    .B(net_195),
    .Y(net_108)
  );
  sky130_fd_sc_hd__o31ai_1 net_109_sky130_fd_sc_hd__o31ai_1_Y (
    .A1(net_169),
    .A2(net_190),
    .A3(net_191),
    .B1(net_188),
    .Y(net_109)
  );
  sky130_fd_sc_hd__nand4_1 net_10_sky130_fd_sc_hd__nand4_1_Y (
    .A(net_207),
    .B(net_216),
    .C(net_8),
    .D(net_9),
    .Y(net_10)
  );
  sky130_fd_sc_hd__nand2_1 net_110_sky130_fd_sc_hd__nand2_1_Y (
    .A(net_184),
    .B(net_187),
    .Y(net_110)
  );
  sky130_fd_sc_hd__nand2_1 net_111_sky130_fd_sc_hd__nand2_1_Y (
    .A(net_180),
    .B(net_183),
    .Y(net_111)
  );
  sky130_fd_sc_hd__o21ai_0 net_113_sky130_fd_sc_hd__o21ai_0_Y (
    .A1(net_175),
    .A2(net_176),
    .B1(net_174),
    .Y(net_113)
  );
  sky130_fd_sc_hd__nor3_1 net_121_sky130_fd_sc_hd__nor3_1_Y (
    .A(net_69),
    .B(net_65),
    .C(net_47),
    .Y(net_121)
  );
  sky130_fd_sc_hd__nor3_1 net_123_sky130_fd_sc_hd__nor3_1_Y (
    .A(net_64),
    .B(net_163),
    .C(net_164),
    .Y(net_123)
  );
  sky130_fd_sc_hd__nor3_1 net_126_sky130_fd_sc_hd__nor3_1_Y (
    .A(net_64),
    .B(net_55),
    .C(net_158),
    .Y(net_126)
  );
  sky130_fd_sc_hd__nor3_1 net_127_sky130_fd_sc_hd__nor3_1_Y (
    .A(net_64),
    .B(net_54),
    .C(net_157),
    .Y(net_127)
  );
  sky130_fd_sc_hd__nor2_1 net_128_sky130_fd_sc_hd__nor2_1_Y (
    .A(net_147),
    .B(net_156),
    .Y(net_128)
  );
  sky130_fd_sc_hd__nor3_1 net_129_sky130_fd_sc_hd__nor3_1_Y (
    .A(net_53),
    .B(net_147),
    .C(net_155),
    .Y(net_129)
  );
  sky130_fd_sc_hd__nor2_1 net_130_sky130_fd_sc_hd__nor2_1_Y (
    .A(net_52),
    .B(net_154),
    .Y(net_130)
  );
  sky130_fd_sc_hd__nor3_1 net_132_sky130_fd_sc_hd__nor3_1_Y (
    .A(net_64),
    .B(net_51),
    .C(net_152),
    .Y(net_132)
  );
  sky130_fd_sc_hd__nor3_1 net_133_sky130_fd_sc_hd__nor3_1_Y (
    .A(net_64),
    .B(net_50),
    .C(net_151),
    .Y(net_133)
  );
  sky130_fd_sc_hd__nor3_1 net_135_sky130_fd_sc_hd__nor3_1_Y (
    .A(net_49),
    .B(net_147),
    .C(net_149),
    .Y(net_135)
  );
  sky130_fd_sc_hd__nor3_1 net_136_sky130_fd_sc_hd__nor3_1_Y (
    .A(net_64),
    .B(net_48),
    .C(net_148),
    .Y(net_136)
  );
  sky130_fd_sc_hd__nor3_1 net_138_sky130_fd_sc_hd__nor3_1_Y (
    .A(net_64),
    .B(net_121),
    .C(net_140),
    .Y(net_138)
  );
  sky130_fd_sc_hd__nor2_1 net_172_sky130_fd_sc_hd__nor2_1_Y (
    .A(net_169),
    .B(net_171),
    .Y(net_172)
  );
  sky130_fd_sc_hd__a21oi_1 net_173_sky130_fd_sc_hd__a21oi_1_Y (
    .A1(net_168),
    .A2(net_171),
    .B1(net_166),
    .Y(net_173)
  );
  sky130_fd_sc_hd__nand2_1 net_176_sky130_fd_sc_hd__nand2_1_Y (
    .A(net_168),
    .B(net_170),
    .Y(net_176)
  );
  sky130_fd_sc_hd__nor2_1 net_193_sky130_fd_sc_hd__nor2_1_Y (
    .A(net_169),
    .B(net_192),
    .Y(net_193)
  );
  sky130_fd_sc_hd__nand3_1 net_210_sky130_fd_sc_hd__nand3_1_Y (
    .A(net_207),
    .B(net_208),
    .C(net_209),
    .Y(net_210)
  );
  sky130_fd_sc_hd__nand2_1 net_214_sky130_fd_sc_hd__nand2_1_Y (
    .A(net_178),
    .B(net_213),
    .Y(net_214)
  );
  sky130_fd_sc_hd__nor2_1 net_25_sky130_fd_sc_hd__nor2_1_Y (
    .A(net_60),
    .B(net_160),
    .Y(net_25)
  );
  sky130_fd_sc_hd__nand2_1 net_26_sky130_fd_sc_hd__nand2_1_Y (
    .A(net_59),
    .B(net_161),
    .Y(net_26)
  );
  sky130_fd_sc_hd__nor2_1 net_44_sky130_fd_sc_hd__nor2_1_Y (
    .A(net_166),
    .B(net_71),
    .Y(net_44)
  );
  sky130_fd_sc_hd__a21oi_1 net_57_sky130_fd_sc_hd__a21oi_1_Y (
    .A1(net_63),
    .A2(net_61),
    .B1(net_58),
    .Y(net_57)
  );
  sky130_fd_sc_hd__nor3_1 net_5_sky130_fd_sc_hd__nor3_1_Y (
    .A(net_68),
    .B(net_67),
    .C(net_4),
    .Y(net_5)
  );
  sky130_fd_sc_hd__a21oi_1 net_74_sky130_fd_sc_hd__a21oi_1_Y (
    .A1(net_45),
    .A2(net_46),
    .B1(net_64),
    .Y(net_74)
  );
  sky130_fd_sc_hd__a21oi_1 net_75_sky130_fd_sc_hd__a21oi_1_Y (
    .A1(net_66),
    .A2(net_162),
    .B1(net_64),
    .Y(net_75)
  );
  sky130_fd_sc_hd__nor2_1 net_76_sky130_fd_sc_hd__nor2_1_Y (
    .A(net_64),
    .B(net_146),
    .Y(net_76)
  );
  sky130_fd_sc_hd__and2_0 net_79_sky130_fd_sc_hd__and2_0_X (
    .A(net_213),
    .B(net_44),
    .X(net_79)
  );
  sky130_fd_sc_hd__nor2_1 net_80_sky130_fd_sc_hd__nor2_1_Y (
    .A(net_166),
    .B(net_10),
    .Y(net_80)
  );
  sky130_fd_sc_hd__a21oi_1 net_81_sky130_fd_sc_hd__a21oi_1_Y (
    .A1(net_42),
    .A2(net_43),
    .B1(net_166),
    .Y(net_81)
  );
  sky130_fd_sc_hd__nor2_1 net_82_sky130_fd_sc_hd__nor2_1_Y (
    .A(net_40),
    .B(net_41),
    .Y(net_82)
  );
  sky130_fd_sc_hd__nor2_1 net_83_sky130_fd_sc_hd__nor2_1_Y (
    .A(net_38),
    .B(net_39),
    .Y(net_83)
  );
  sky130_fd_sc_hd__nor2_1 net_84_sky130_fd_sc_hd__nor2_1_Y (
    .A(net_36),
    .B(net_37),
    .Y(net_84)
  );
  sky130_fd_sc_hd__nand2_1 net_85_sky130_fd_sc_hd__nand2_1_Y (
    .A(net_34),
    .B(net_35),
    .Y(net_85)
  );
  sky130_fd_sc_hd__nand2_1 net_86_sky130_fd_sc_hd__nand2_1_Y (
    .A(net_32),
    .B(net_33),
    .Y(net_86)
  );
  sky130_fd_sc_hd__nand2_1 net_87_sky130_fd_sc_hd__nand2_1_Y (
    .A(net_30),
    .B(net_31),
    .Y(net_87)
  );
  sky130_fd_sc_hd__nor3_1 net_88_sky130_fd_sc_hd__nor3_1_Y (
    .A(net_27),
    .B(net_28),
    .C(net_29),
    .Y(net_88)
  );
  sky130_fd_sc_hd__nor3_1 net_91_sky130_fd_sc_hd__nor3_1_Y (
    .A(net_166),
    .B(net_208),
    .C(net_23),
    .Y(net_91)
  );
  sky130_fd_sc_hd__nor2_1 net_92_sky130_fd_sc_hd__nor2_1_Y (
    .A(net_216),
    .B(net_22),
    .Y(net_92)
  );
  sky130_fd_sc_hd__nor2_1 net_93_sky130_fd_sc_hd__nor2_1_Y (
    .A(net_11),
    .B(net_21),
    .Y(net_93)
  );
  sky130_fd_sc_hd__nor3_1 net_94_sky130_fd_sc_hd__nor3_1_Y (
    .A(net_217),
    .B(net_11),
    .C(net_20),
    .Y(net_94)
  );
  sky130_fd_sc_hd__nor2_1 net_95_sky130_fd_sc_hd__nor2_1_Y (
    .A(net_218),
    .B(net_19),
    .Y(net_95)
  );
  sky130_fd_sc_hd__nor3_1 net_97_sky130_fd_sc_hd__nor3_1_Y (
    .A(net_166),
    .B(net_0),
    .C(net_17),
    .Y(net_97)
  );
  sky130_fd_sc_hd__nor2_1 net_98_sky130_fd_sc_hd__nor2_1_Y (
    .A(net_1),
    .B(net_16),
    .Y(net_98)
  );
  sky130_fd_sc_hd__a22o_1 rx_busy_sky130_fd_sc_hd__a22o_1_A2 (
    .A1(rx_instxbit_cnt[2]),
    .A2(rx_busy),
    .B1(net_168),
    .B2(net_192),
    .X(net_78)
  );
  sky130_fd_sc_hd__clkinv_1 rx_busy_sky130_fd_sc_hd__clkinv_1_Y (
    .A(net_166),
    .Y(rx_busy)
  );
  sky130_fd_sc_hd__nand2_1 rx_busy_sky130_fd_sc_hd__nand2_1_A (
    .A(rx_busy),
    .B(net_10),
    .Y(net_11)
  );
  sky130_fd_sc_hd__o21ai_0 rx_busy_sky130_fd_sc_hd__o21ai_0_B1 (
    .A1(rx_instxbaud_cnt[0]),
    .A2(rx_instxbaud_cnt[1]),
    .B1(rx_busy),
    .Y(net_24)
  );
  sky130_fd_sc_hd__o21ai_0 rx_busy_sky130_fd_sc_hd__o21ai_0_B1_1 (
    .A1(rx_instxbaud_cnt[3]),
    .A2(net_208),
    .B1(rx_busy),
    .Y(net_22)
  );
  sky130_fd_sc_hd__o21ai_0 rx_busy_sky130_fd_sc_hd__o21ai_0_B1_2 (
    .A1(rx_instxbaud_cnt[6]),
    .A2(net_217),
    .B1(rx_busy),
    .Y(net_19)
  );
  sky130_fd_sc_hd__o21ai_0 rx_busy_sky130_fd_sc_hd__o21ai_0_B1_3 (
    .A1(rx_instxbaud_cnt[9]),
    .A2(net_0),
    .B1(rx_busy),
    .Y(net_16)
  );
  sky130_fd_sc_hd__o21ai_0 rx_busy_sky130_fd_sc_hd__o21ai_0_B1_4 (
    .A1(rx_instxbaud_cnt[10]),
    .A2(net_1),
    .B1(rx_busy),
    .Y(net_15)
  );
  sky130_fd_sc_hd__o21ai_0 rx_busy_sky130_fd_sc_hd__o21ai_0_B1_5 (
    .A1(rx_instxbaud_cnt[12]),
    .A2(net_2),
    .B1(rx_busy),
    .Y(net_13)
  );
  sky130_fd_sc_hd__dfrtp_1 rx_done_sky130_fd_sc_hd__dfrtp_1_Q (
    .CLK(clk),
    .D(net_71),
    .Q(rx_done),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__a211oi_1 rx_instxbaud_cnt_sky130_fd_sc_hd__a211oi_1_A1 (
    .A1(rx_instxbaud_cnt[7]),
    .A2(net_218),
    .B1(net_11),
    .C1(net_18),
    .Y(net_96)
  );
  sky130_fd_sc_hd__a21o_1 rx_instxbaud_cnt_sky130_fd_sc_hd__a21o_1_A1 (
    .A1(rx_instxbaud_cnt[13]),
    .A2(net_3),
    .B1(net_11),
    .X(net_12)
  );
  sky130_fd_sc_hd__a21oi_1 rx_instxbaud_cnt_sky130_fd_sc_hd__a21oi_1_A1 (
    .A1(rx_instxbaud_cnt[0]),
    .A2(rx_instxbaud_cnt[1]),
    .B1(net_24),
    .Y(net_90)
  );
  sky130_fd_sc_hd__a21oi_1 rx_instxbaud_cnt_sky130_fd_sc_hd__a21oi_1_A1_1 (
    .A1(rx_instxbaud_cnt[0]),
    .A2(rx_instxbaud_cnt[1]),
    .B1(rx_instxbaud_cnt[2]),
    .Y(net_23)
  );
  sky130_fd_sc_hd__a21oi_1 rx_instxbaud_cnt_sky130_fd_sc_hd__a21oi_1_A1_2 (
    .A1(rx_instxbaud_cnt[4]),
    .A2(net_216),
    .B1(rx_instxbaud_cnt[5]),
    .Y(net_20)
  );
  sky130_fd_sc_hd__a21oi_1 rx_instxbaud_cnt_sky130_fd_sc_hd__a21oi_1_A1_3 (
    .A1(rx_instxbaud_cnt[7]),
    .A2(net_218),
    .B1(rx_instxbaud_cnt[8]),
    .Y(net_17)
  );
  sky130_fd_sc_hd__a21oi_1 rx_instxbaud_cnt_sky130_fd_sc_hd__a21oi_1_A1_4 (
    .A1(rx_instxbaud_cnt[10]),
    .A2(net_1),
    .B1(net_15),
    .Y(net_99)
  );
  sky130_fd_sc_hd__a21oi_1 rx_instxbaud_cnt_sky130_fd_sc_hd__a21oi_1_A1_5 (
    .A1(rx_instxbaud_cnt[10]),
    .A2(net_1),
    .B1(rx_instxbaud_cnt[11]),
    .Y(net_14)
  );
  sky130_fd_sc_hd__a21oi_1 rx_instxbaud_cnt_sky130_fd_sc_hd__a21oi_1_A1_6 (
    .A1(rx_instxbaud_cnt[13]),
    .A2(net_3),
    .B1(rx_instxbaud_cnt[14]),
    .Y(net_6)
  );
  sky130_fd_sc_hd__and3_1 rx_instxbaud_cnt_sky130_fd_sc_hd__and3_1_A (
    .A(rx_instxbaud_cnt[11]),
    .B(rx_instxbaud_cnt[10]),
    .C(net_1),
    .X(net_2)
  );
  sky130_fd_sc_hd__and3_1 rx_instxbaud_cnt_sky130_fd_sc_hd__and3_1_A_1 (
    .A(rx_instxbaud_cnt[7]),
    .B(rx_instxbaud_cnt[8]),
    .C(net_218),
    .X(net_0)
  );
  sky130_fd_sc_hd__and3_1 rx_instxbaud_cnt_sky130_fd_sc_hd__and3_1_A_2 (
    .A(rx_instxbaud_cnt[4]),
    .B(rx_instxbaud_cnt[5]),
    .C(net_216),
    .X(net_217)
  );
  sky130_fd_sc_hd__and3_1 rx_instxbaud_cnt_sky130_fd_sc_hd__and3_1_A_3 (
    .A(rx_instxbaud_cnt[0]),
    .B(rx_instxbaud_cnt[2]),
    .C(rx_instxbaud_cnt[1]),
    .X(net_208)
  );
  sky130_fd_sc_hd__and4_1 rx_instxbaud_cnt_sky130_fd_sc_hd__and4_1_A (
    .A(rx_instxbaud_cnt[11]),
    .B(rx_instxbaud_cnt[10]),
    .C(rx_instxbaud_cnt[12]),
    .D(net_1),
    .X(net_3)
  );
  sky130_fd_sc_hd__and4_1 rx_instxbaud_cnt_sky130_fd_sc_hd__and4_1_A_1 (
    .A(rx_instxbaud_cnt[7]),
    .B(rx_instxbaud_cnt[8]),
    .C(rx_instxbaud_cnt[9]),
    .D(net_218),
    .X(net_1)
  );
  sky130_fd_sc_hd__and4_1 rx_instxbaud_cnt_sky130_fd_sc_hd__and4_1_A_2 (
    .A(rx_instxbaud_cnt[4]),
    .B(rx_instxbaud_cnt[6]),
    .C(rx_instxbaud_cnt[5]),
    .D(net_216),
    .X(net_218)
  );
  sky130_fd_sc_hd__and4_1 rx_instxbaud_cnt_sky130_fd_sc_hd__and4_1_A_3 (
    .A(rx_instxbaud_cnt[3]),
    .B(rx_instxbaud_cnt[0]),
    .C(rx_instxbaud_cnt[2]),
    .D(rx_instxbaud_cnt[1]),
    .X(net_216)
  );
  sky130_fd_sc_hd__clkinv_1 rx_instxbaud_cnt_sky130_fd_sc_hd__clkinv_1_A (
    .A(rx_instxbaud_cnt[13]),
    .Y(net_67)
  );
  sky130_fd_sc_hd__clkinv_1 rx_instxbaud_cnt_sky130_fd_sc_hd__clkinv_1_A_1 (
    .A(rx_instxbaud_cnt[14]),
    .Y(net_68)
  );
  sky130_fd_sc_hd__dfrtp_1 rx_instxbaud_cnt_sky130_fd_sc_hd__dfrtp_1_Q (
    .CLK(clk),
    .D(net_90),
    .Q(rx_instxbaud_cnt[1]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 rx_instxbaud_cnt_sky130_fd_sc_hd__dfrtp_1_Q_1 (
    .CLK(clk),
    .D(net_89),
    .Q(rx_instxbaud_cnt[0]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 rx_instxbaud_cnt_sky130_fd_sc_hd__dfrtp_1_Q_10 (
    .CLK(clk),
    .D(net_98),
    .Q(rx_instxbaud_cnt[9]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 rx_instxbaud_cnt_sky130_fd_sc_hd__dfrtp_1_Q_11 (
    .CLK(clk),
    .D(net_99),
    .Q(rx_instxbaud_cnt[10]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 rx_instxbaud_cnt_sky130_fd_sc_hd__dfrtp_1_Q_12 (
    .CLK(clk),
    .D(net_100),
    .Q(rx_instxbaud_cnt[11]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 rx_instxbaud_cnt_sky130_fd_sc_hd__dfrtp_1_Q_13 (
    .CLK(clk),
    .D(net_101),
    .Q(rx_instxbaud_cnt[12]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 rx_instxbaud_cnt_sky130_fd_sc_hd__dfrtp_1_Q_14 (
    .CLK(clk),
    .D(net_102),
    .Q(rx_instxbaud_cnt[13]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 rx_instxbaud_cnt_sky130_fd_sc_hd__dfrtp_1_Q_15 (
    .CLK(clk),
    .D(net_103),
    .Q(rx_instxbaud_cnt[14]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 rx_instxbaud_cnt_sky130_fd_sc_hd__dfrtp_1_Q_2 (
    .CLK(clk),
    .D(net_81),
    .Q(rx_instxbaud_cnt[15]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 rx_instxbaud_cnt_sky130_fd_sc_hd__dfrtp_1_Q_3 (
    .CLK(clk),
    .D(net_91),
    .Q(rx_instxbaud_cnt[2]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 rx_instxbaud_cnt_sky130_fd_sc_hd__dfrtp_1_Q_4 (
    .CLK(clk),
    .D(net_92),
    .Q(rx_instxbaud_cnt[3]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 rx_instxbaud_cnt_sky130_fd_sc_hd__dfrtp_1_Q_5 (
    .CLK(clk),
    .D(net_93),
    .Q(rx_instxbaud_cnt[4]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 rx_instxbaud_cnt_sky130_fd_sc_hd__dfrtp_1_Q_6 (
    .CLK(clk),
    .D(net_94),
    .Q(rx_instxbaud_cnt[5]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 rx_instxbaud_cnt_sky130_fd_sc_hd__dfrtp_1_Q_7 (
    .CLK(clk),
    .D(net_95),
    .Q(rx_instxbaud_cnt[6]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 rx_instxbaud_cnt_sky130_fd_sc_hd__dfrtp_1_Q_8 (
    .CLK(clk),
    .D(net_96),
    .Q(rx_instxbaud_cnt[7]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 rx_instxbaud_cnt_sky130_fd_sc_hd__dfrtp_1_Q_9 (
    .CLK(clk),
    .D(net_97),
    .Q(rx_instxbaud_cnt[8]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__nand2_1 rx_instxbaud_cnt_sky130_fd_sc_hd__nand2_1_A (
    .A(rx_instxbaud_cnt[13]),
    .B(rx_instxbaud_cnt[5]),
    .Y(net_7)
  );
  sky130_fd_sc_hd__nand4_1 rx_instxbaud_cnt_sky130_fd_sc_hd__nand4_1_A (
    .A(rx_instxbaud_cnt[11]),
    .B(rx_instxbaud_cnt[10]),
    .C(rx_instxbaud_cnt[12]),
    .D(net_1),
    .Y(net_4)
  );
  sky130_fd_sc_hd__nand4b_1 rx_instxbaud_cnt_sky130_fd_sc_hd__nand4b_1_B (
    .A_N(rx_instxbaud_cnt[11]),
    .B(rx_instxbaud_cnt[10]),
    .C(rx_instxbaud_cnt[4]),
    .D(rx_instxbaud_cnt[6]),
    .Y(net_206)
  );
  sky130_fd_sc_hd__nor2_1 rx_instxbaud_cnt_sky130_fd_sc_hd__nor2_1_A (
    .A(rx_instxbaud_cnt[0]),
    .B(net_166),
    .Y(net_89)
  );
  sky130_fd_sc_hd__nor2_1 rx_instxbaud_cnt_sky130_fd_sc_hd__nor2_1_A_1 (
    .A(rx_instxbaud_cnt[7]),
    .B(net_218),
    .Y(net_18)
  );
  sky130_fd_sc_hd__nor3_1 rx_instxbaud_cnt_sky130_fd_sc_hd__nor3_1_A (
    .A(rx_instxbaud_cnt[6]),
    .B(rx_instxbaud_cnt[12]),
    .C(net_7),
    .Y(net_8)
  );
  sky130_fd_sc_hd__nor4_1 rx_instxbaud_cnt_sky130_fd_sc_hd__nor4_1_A (
    .A(rx_instxbaud_cnt[3]),
    .B(rx_instxbaud_cnt[7]),
    .C(net_206),
    .D(net_210),
    .Y(net_211)
  );
  sky130_fd_sc_hd__nor4_1 rx_instxbaud_cnt_sky130_fd_sc_hd__nor4_1_A_1 (
    .A(rx_instxbaud_cnt[14]),
    .B(rx_instxbaud_cnt[8]),
    .C(rx_instxbaud_cnt[15]),
    .D(rx_instxbaud_cnt[9]),
    .Y(net_207)
  );
  sky130_fd_sc_hd__nor4bb_1 rx_instxbaud_cnt_sky130_fd_sc_hd__nor4bb_1_A (
    .A(rx_instxbaud_cnt[10]),
    .B(rx_instxbaud_cnt[4]),
    .C_N(rx_instxbaud_cnt[7]),
    .D_N(rx_instxbaud_cnt[11]),
    .Y(net_9)
  );
  sky130_fd_sc_hd__o31ai_1 rx_instxbaud_cnt_sky130_fd_sc_hd__o31ai_1_B1 (
    .A1(net_68),
    .A2(net_67),
    .A3(net_4),
    .B1(rx_instxbaud_cnt[15]),
    .Y(net_42)
  );
  sky130_fd_sc_hd__or4_1 rx_instxbaud_cnt_sky130_fd_sc_hd__or4_1_C (
    .A(net_68),
    .B(net_67),
    .C(rx_instxbaud_cnt[15]),
    .D(net_4),
    .X(net_43)
  );
  sky130_fd_sc_hd__xnor2_1 rx_instxbaud_cnt_sky130_fd_sc_hd__xnor2_1_A (
    .A(rx_instxbaud_cnt[4]),
    .B(net_216),
    .Y(net_21)
  );
  sky130_fd_sc_hd__and3_1 rx_instxbaud_tick_sky130_fd_sc_hd__and3_1_C (
    .A(rx_instxstate[0]),
    .B(rx_instxstate[1]),
    .C(rx_instxbaud_tick),
    .X(net_71)
  );
  sky130_fd_sc_hd__dfrtp_1 rx_instxbaud_tick_sky130_fd_sc_hd__dfrtp_1_Q (
    .CLK(clk),
    .D(net_80),
    .Q(rx_instxbaud_tick),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__nand2_1 rx_instxbaud_tick_sky130_fd_sc_hd__nand2_1_B (
    .A(rx_instxstate[1]),
    .B(rx_instxbaud_tick),
    .Y(net_167)
  );
  sky130_fd_sc_hd__nand2b_1 rx_instxbaud_tick_sky130_fd_sc_hd__nand2b_1_A_N (
    .A_N(rx_instxbaud_tick),
    .B(rx_instxstate[1]),
    .Y(net_178)
  );
  sky130_fd_sc_hd__dfrtp_1 rx_instxbit_cnt_sky130_fd_sc_hd__dfrtp_1_Q (
    .CLK(clk),
    .D(net_113),
    .Q(rx_instxbit_cnt[1]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 rx_instxbit_cnt_sky130_fd_sc_hd__dfrtp_1_Q_1 (
    .CLK(clk),
    .D(net_112),
    .Q(rx_instxbit_cnt[0]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 rx_instxbit_cnt_sky130_fd_sc_hd__dfrtp_1_Q_2 (
    .CLK(clk),
    .D(net_78),
    .Q(rx_instxbit_cnt[2]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__nand2_1 rx_instxbit_cnt_sky130_fd_sc_hd__nand2_1_A (
    .A(rx_instxbit_cnt[2]),
    .B(net_175),
    .Y(net_189)
  );
  sky130_fd_sc_hd__nand2_1 rx_instxbit_cnt_sky130_fd_sc_hd__nand2_1_A_1 (
    .A(rx_instxbit_cnt[0]),
    .B(net_173),
    .Y(net_177)
  );
  sky130_fd_sc_hd__nand2_1 rx_instxbit_cnt_sky130_fd_sc_hd__nand2_1_A_2 (
    .A(rx_instxbit_cnt[1]),
    .B(net_173),
    .Y(net_174)
  );
  sky130_fd_sc_hd__nand2_1 rx_instxbit_cnt_sky130_fd_sc_hd__nand2_1_A_3 (
    .A(rx_instxbit_cnt[0]),
    .B(rx_instxbit_cnt[1]),
    .Y(net_170)
  );
  sky130_fd_sc_hd__nand3_1 rx_instxbit_cnt_sky130_fd_sc_hd__nand3_1_A (
    .A(rx_instxbit_cnt[0]),
    .B(rx_instxbit_cnt[1]),
    .C(rx_instxbit_cnt[2]),
    .Y(net_171)
  );
  sky130_fd_sc_hd__nand3b_1 rx_instxbit_cnt_sky130_fd_sc_hd__nand3b_1_B (
    .A_N(rx_instxbit_cnt[1]),
    .B(rx_instxbit_cnt[2]),
    .C(rx_instxbit_cnt[0]),
    .Y(net_185)
  );
  sky130_fd_sc_hd__nand3b_1 rx_instxbit_cnt_sky130_fd_sc_hd__nand3b_1_B_1 (
    .A_N(rx_instxbit_cnt[0]),
    .B(rx_instxbit_cnt[1]),
    .C(rx_instxbit_cnt[2]),
    .Y(net_181)
  );
  sky130_fd_sc_hd__nor2_1 rx_instxbit_cnt_sky130_fd_sc_hd__nor2_1_A (
    .A(rx_instxbit_cnt[2]),
    .B(net_170),
    .Y(net_192)
  );
  sky130_fd_sc_hd__nor2_1 rx_instxbit_cnt_sky130_fd_sc_hd__nor2_1_A_1 (
    .A(rx_instxbit_cnt[0]),
    .B(rx_instxbit_cnt[1]),
    .Y(net_175)
  );
  sky130_fd_sc_hd__nor3b_1 rx_instxbit_cnt_sky130_fd_sc_hd__nor3b_1_A (
    .A(rx_instxbit_cnt[1]),
    .B(rx_instxbit_cnt[2]),
    .C_N(rx_instxbit_cnt[0]),
    .Y(net_201)
  );
  sky130_fd_sc_hd__nor3b_1 rx_instxbit_cnt_sky130_fd_sc_hd__nor3b_1_A_1 (
    .A(rx_instxbit_cnt[0]),
    .B(rx_instxbit_cnt[2]),
    .C_N(rx_instxbit_cnt[1]),
    .Y(net_197)
  );
  sky130_fd_sc_hd__nor4_1 rx_instxbit_cnt_sky130_fd_sc_hd__nor4_1_A (
    .A(rx_instxbit_cnt[0]),
    .B(rx_instxbit_cnt[1]),
    .C(rx_instxbit_cnt[2]),
    .D(net_179),
    .Y(net_204)
  );
  sky130_fd_sc_hd__o21ai_0 rx_instxbit_cnt_sky130_fd_sc_hd__o21ai_0_A1 (
    .A1(rx_instxbit_cnt[0]),
    .A2(net_169),
    .B1(net_177),
    .Y(net_112)
  );
  sky130_fd_sc_hd__a211o_1 rx_instxprev_rx_sky130_fd_sc_hd__a211o_1_A1 (
    .A1(rx_instxprev_rx),
    .A2(net_212),
    .B1(net_211),
    .C1(rx_instxstate[1]),
    .X(net_213)
  );
  sky130_fd_sc_hd__dfstp_2 rx_instxprev_rx_sky130_fd_sc_hd__dfstp_2_Q (
    .CLK(clk),
    .D(rx_instxrx),
    .Q(rx_instxprev_rx),
    .SET_B(rst_n)
  );
  sky130_fd_sc_hd__a21bo_1 rx_instxrx_sky130_fd_sc_hd__a21bo_1_X (
    .A1(tx_instxshifter[0]),
    .A2(net_63),
    .B1_N(net_62),
    .X(rx_instxrx)
  );
  sky130_fd_sc_hd__mux2_1 rx_instxrx_sky130_fd_sc_hd__mux2_1_A1 (
    .A0(data_out[7]),
    .A1(rx_instxrx),
    .S(net_172),
    .X(net_77)
  );
  sky130_fd_sc_hd__mux2i_1 rx_instxrx_sky130_fd_sc_hd__mux2i_1_A1 (
    .A0(rx_instxshifter[0]),
    .A1(rx_instxrx),
    .S(net_204),
    .Y(net_205)
  );
  sky130_fd_sc_hd__nand3_1 rx_instxrx_sky130_fd_sc_hd__nand3_1_A (
    .A(rx_instxrx),
    .B(net_168),
    .C(net_192),
    .Y(net_195)
  );
  sky130_fd_sc_hd__nor2_1 rx_instxrx_sky130_fd_sc_hd__nor2_1_A (
    .A(rx_instxrx),
    .B(net_189),
    .Y(net_190)
  );
  sky130_fd_sc_hd__nor2_1 rx_instxrx_sky130_fd_sc_hd__nor2_1_B (
    .A(rx_instxstate[0]),
    .B(rx_instxrx),
    .Y(net_212)
  );
  sky130_fd_sc_hd__nor2b_1 rx_instxrx_sky130_fd_sc_hd__nor2b_1_A (
    .A(rx_instxrx),
    .B_N(net_201),
    .Y(net_202)
  );
  sky130_fd_sc_hd__nor2b_1 rx_instxrx_sky130_fd_sc_hd__nor2b_1_A_1 (
    .A(rx_instxrx),
    .B_N(net_197),
    .Y(net_198)
  );
  sky130_fd_sc_hd__o211ai_1 rx_instxrx_sky130_fd_sc_hd__o211ai_1_A1 (
    .A1(rx_instxrx),
    .A2(net_185),
    .B1(net_186),
    .C1(net_168),
    .Y(net_187)
  );
  sky130_fd_sc_hd__o211ai_1 rx_instxrx_sky130_fd_sc_hd__o211ai_1_A1_1 (
    .A1(rx_instxrx),
    .A2(net_181),
    .B1(net_182),
    .C1(net_168),
    .Y(net_183)
  );
  sky130_fd_sc_hd__a21oi_1 rx_instxshifter_sky130_fd_sc_hd__a21oi_1_B1 (
    .A1(rx_instxbit_cnt[2]),
    .A2(net_175),
    .B1(rx_instxshifter[4]),
    .Y(net_191)
  );
  sky130_fd_sc_hd__dfrtp_1 rx_instxshifter_sky130_fd_sc_hd__dfrtp_1_Q (
    .CLK(clk),
    .D(net_111),
    .Q(rx_instxshifter[6]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 rx_instxshifter_sky130_fd_sc_hd__dfrtp_1_Q_1 (
    .CLK(clk),
    .D(net_110),
    .Q(rx_instxshifter[5]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 rx_instxshifter_sky130_fd_sc_hd__dfrtp_1_Q_2 (
    .CLK(clk),
    .D(net_109),
    .Q(rx_instxshifter[4]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 rx_instxshifter_sky130_fd_sc_hd__dfrtp_1_Q_3 (
    .CLK(clk),
    .D(net_108),
    .Q(rx_instxshifter[3]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 rx_instxshifter_sky130_fd_sc_hd__dfrtp_1_Q_4 (
    .CLK(clk),
    .D(net_107),
    .Q(rx_instxshifter[2]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 rx_instxshifter_sky130_fd_sc_hd__dfrtp_1_Q_5 (
    .CLK(clk),
    .D(net_106),
    .Q(rx_instxshifter[1]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 rx_instxshifter_sky130_fd_sc_hd__dfrtp_1_Q_6 (
    .CLK(clk),
    .D(net_105),
    .Q(rx_instxshifter[0]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__nand2_1 rx_instxshifter_sky130_fd_sc_hd__nand2_1_A (
    .A(rx_instxshifter[1]),
    .B(net_179),
    .Y(net_200)
  );
  sky130_fd_sc_hd__nand2_1 rx_instxshifter_sky130_fd_sc_hd__nand2_1_A_1 (
    .A(rx_instxshifter[2]),
    .B(net_179),
    .Y(net_196)
  );
  sky130_fd_sc_hd__nand2_1 rx_instxshifter_sky130_fd_sc_hd__nand2_1_A_2 (
    .A(rx_instxshifter[4]),
    .B(net_179),
    .Y(net_188)
  );
  sky130_fd_sc_hd__nand2_1 rx_instxshifter_sky130_fd_sc_hd__nand2_1_A_3 (
    .A(rx_instxshifter[5]),
    .B(net_179),
    .Y(net_184)
  );
  sky130_fd_sc_hd__nand2_1 rx_instxshifter_sky130_fd_sc_hd__nand2_1_A_4 (
    .A(rx_instxshifter[6]),
    .B(net_179),
    .Y(net_180)
  );
  sky130_fd_sc_hd__nand2b_1 rx_instxshifter_sky130_fd_sc_hd__nand2b_1_A_N (
    .A_N(rx_instxshifter[5]),
    .B(net_185),
    .Y(net_186)
  );
  sky130_fd_sc_hd__nand2b_1 rx_instxshifter_sky130_fd_sc_hd__nand2b_1_A_N_1 (
    .A_N(rx_instxshifter[6]),
    .B(net_181),
    .Y(net_182)
  );
  sky130_fd_sc_hd__o21ai_0 rx_instxshifter_sky130_fd_sc_hd__o21ai_0_A1 (
    .A1(rx_instxshifter[1]),
    .A2(net_201),
    .B1(net_168),
    .Y(net_203)
  );
  sky130_fd_sc_hd__o21ai_0 rx_instxshifter_sky130_fd_sc_hd__o21ai_0_A1_1 (
    .A1(rx_instxshifter[2]),
    .A2(net_197),
    .B1(net_168),
    .Y(net_199)
  );
  sky130_fd_sc_hd__o21ai_0 rx_instxshifter_sky130_fd_sc_hd__o21ai_0_B1 (
    .A1(net_179),
    .A2(net_193),
    .B1(rx_instxshifter[3]),
    .Y(net_194)
  );
  sky130_fd_sc_hd__a21oi_1 rx_instxstate_sky130_fd_sc_hd__a21oi_1_A1 (
    .A1(rx_instxstate[1]),
    .A2(net_171),
    .B1(net_179),
    .Y(net_215)
  );
  sky130_fd_sc_hd__a22o_1 rx_instxstate_sky130_fd_sc_hd__a22o_1_A1 (
    .A1(rx_instxstate[0]),
    .A2(net_214),
    .B1(net_215),
    .B2(net_213),
    .X(net_104)
  );
  sky130_fd_sc_hd__dfrtp_1 rx_instxstate_sky130_fd_sc_hd__dfrtp_1_Q (
    .CLK(clk),
    .D(net_79),
    .Q(rx_instxstate[1]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 rx_instxstate_sky130_fd_sc_hd__dfrtp_1_Q_1 (
    .CLK(clk),
    .D(net_104),
    .Q(rx_instxstate[0]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__nand2b_1 rx_instxstate_sky130_fd_sc_hd__nand2b_1_A_N (
    .A_N(rx_instxstate[0]),
    .B(net_178),
    .Y(net_179)
  );
  sky130_fd_sc_hd__nor2_1 rx_instxstate_sky130_fd_sc_hd__nor2_1_A (
    .A(rx_instxstate[0]),
    .B(net_167),
    .Y(net_168)
  );
  sky130_fd_sc_hd__nor2_1 rx_instxstate_sky130_fd_sc_hd__nor2_1_A_1 (
    .A(rx_instxstate[0]),
    .B(rx_instxstate[1]),
    .Y(net_166)
  );
  sky130_fd_sc_hd__nor4bb_1 rx_instxstate_sky130_fd_sc_hd__nor4bb_1_D_N (
    .A(rx_instxbaud_cnt[13]),
    .B(rx_instxbaud_cnt[5]),
    .C_N(rx_instxbaud_cnt[12]),
    .D_N(rx_instxstate[0]),
    .Y(net_209)
  );
  sky130_fd_sc_hd__or2_0 rx_instxstate_sky130_fd_sc_hd__or2_0_A (
    .A(rx_instxstate[0]),
    .B(net_167),
    .X(net_169)
  );
  sky130_fd_sc_hd__clkinv_1 tx_busy_sky130_fd_sc_hd__clkinv_1_Y (
    .A(net_64),
    .Y(tx_busy)
  );
  sky130_fd_sc_hd__nand2_1 tx_busy_sky130_fd_sc_hd__nand2_1_A (
    .A(tx_busy),
    .B(net_146),
    .Y(net_147)
  );
  sky130_fd_sc_hd__o21ai_0 tx_busy_sky130_fd_sc_hd__o21ai_0_B1 (
    .A1(tx_instxbit_cnt[0]),
    .A2(net_160),
    .B1(tx_busy),
    .Y(net_165)
  );
  sky130_fd_sc_hd__o21ai_0 tx_busy_sky130_fd_sc_hd__o21ai_0_B1_1 (
    .A1(tx_instxbaud_cnt[0]),
    .A2(tx_instxbaud_cnt[1]),
    .B1(tx_busy),
    .Y(net_159)
  );
  sky130_fd_sc_hd__o21ai_0 tx_busy_sky130_fd_sc_hd__o21ai_0_B1_2 (
    .A1(tx_instxbaud_cnt[6]),
    .A2(net_53),
    .B1(tx_busy),
    .Y(net_154)
  );
  sky130_fd_sc_hd__o21ai_0 tx_busy_sky130_fd_sc_hd__o21ai_0_B1_3 (
    .A1(tx_instxbaud_cnt[10]),
    .A2(net_50),
    .B1(tx_busy),
    .Y(net_150)
  );
  sky130_fd_sc_hd__dfrtp_1 tx_done_sky130_fd_sc_hd__dfrtp_1_Q (
    .CLK(clk),
    .D(net_70),
    .Q(tx_done),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__a211oi_1 tx_instxbaud_cnt_sky130_fd_sc_hd__a211oi_1_A1 (
    .A1(tx_instxbaud_cnt[7]),
    .A2(net_52),
    .B1(net_147),
    .C1(net_153),
    .Y(net_131)
  );
  sky130_fd_sc_hd__a211oi_1 tx_instxbaud_cnt_sky130_fd_sc_hd__a211oi_1_A1_1 (
    .A1(tx_instxbaud_cnt[13]),
    .A2(net_48),
    .B1(net_141),
    .C1(net_147),
    .Y(net_137)
  );
  sky130_fd_sc_hd__a21oi_1 tx_instxbaud_cnt_sky130_fd_sc_hd__a21oi_1_A1 (
    .A1(tx_instxbaud_cnt[0]),
    .A2(tx_instxbaud_cnt[1]),
    .B1(net_159),
    .Y(net_125)
  );
  sky130_fd_sc_hd__a21oi_1 tx_instxbaud_cnt_sky130_fd_sc_hd__a21oi_1_A1_1 (
    .A1(tx_instxbaud_cnt[0]),
    .A2(tx_instxbaud_cnt[1]),
    .B1(tx_instxbaud_cnt[2]),
    .Y(net_158)
  );
  sky130_fd_sc_hd__a21oi_1 tx_instxbaud_cnt_sky130_fd_sc_hd__a21oi_1_A1_2 (
    .A1(tx_instxbaud_cnt[4]),
    .A2(net_54),
    .B1(tx_instxbaud_cnt[5]),
    .Y(net_155)
  );
  sky130_fd_sc_hd__a21oi_1 tx_instxbaud_cnt_sky130_fd_sc_hd__a21oi_1_A1_3 (
    .A1(tx_instxbaud_cnt[7]),
    .A2(net_52),
    .B1(tx_instxbaud_cnt[8]),
    .Y(net_152)
  );
  sky130_fd_sc_hd__a21oi_1 tx_instxbaud_cnt_sky130_fd_sc_hd__a21oi_1_A1_4 (
    .A1(tx_instxbaud_cnt[10]),
    .A2(net_50),
    .B1(net_150),
    .Y(net_134)
  );
  sky130_fd_sc_hd__a21oi_1 tx_instxbaud_cnt_sky130_fd_sc_hd__a21oi_1_A1_5 (
    .A1(tx_instxbaud_cnt[10]),
    .A2(net_50),
    .B1(tx_instxbaud_cnt[11]),
    .Y(net_149)
  );
  sky130_fd_sc_hd__a21oi_1 tx_instxbaud_cnt_sky130_fd_sc_hd__a21oi_1_A1_6 (
    .A1(tx_instxbaud_cnt[13]),
    .A2(net_48),
    .B1(tx_instxbaud_cnt[14]),
    .Y(net_140)
  );
  sky130_fd_sc_hd__and3_1 tx_instxbaud_cnt_sky130_fd_sc_hd__and3_1_A (
    .A(tx_instxbaud_cnt[10]),
    .B(tx_instxbaud_cnt[11]),
    .C(net_50),
    .X(net_49)
  );
  sky130_fd_sc_hd__and3_1 tx_instxbaud_cnt_sky130_fd_sc_hd__and3_1_A_1 (
    .A(tx_instxbaud_cnt[7]),
    .B(tx_instxbaud_cnt[8]),
    .C(net_52),
    .X(net_51)
  );
  sky130_fd_sc_hd__and3_1 tx_instxbaud_cnt_sky130_fd_sc_hd__and3_1_A_2 (
    .A(tx_instxbaud_cnt[5]),
    .B(tx_instxbaud_cnt[4]),
    .C(net_54),
    .X(net_53)
  );
  sky130_fd_sc_hd__and3_1 tx_instxbaud_cnt_sky130_fd_sc_hd__and3_1_A_3 (
    .A(tx_instxbaud_cnt[2]),
    .B(tx_instxbaud_cnt[0]),
    .C(tx_instxbaud_cnt[1]),
    .X(net_55)
  );
  sky130_fd_sc_hd__and4_1 tx_instxbaud_cnt_sky130_fd_sc_hd__and4_1_A (
    .A(tx_instxbaud_cnt[12]),
    .B(tx_instxbaud_cnt[10]),
    .C(tx_instxbaud_cnt[11]),
    .D(net_50),
    .X(net_48)
  );
  sky130_fd_sc_hd__and4_1 tx_instxbaud_cnt_sky130_fd_sc_hd__and4_1_A_1 (
    .A(tx_instxbaud_cnt[7]),
    .B(tx_instxbaud_cnt[8]),
    .C(tx_instxbaud_cnt[9]),
    .D(net_52),
    .X(net_50)
  );
  sky130_fd_sc_hd__and4_1 tx_instxbaud_cnt_sky130_fd_sc_hd__and4_1_A_2 (
    .A(tx_instxbaud_cnt[5]),
    .B(tx_instxbaud_cnt[4]),
    .C(tx_instxbaud_cnt[6]),
    .D(net_54),
    .X(net_52)
  );
  sky130_fd_sc_hd__and4_1 tx_instxbaud_cnt_sky130_fd_sc_hd__and4_1_A_3 (
    .A(tx_instxbaud_cnt[2]),
    .B(tx_instxbaud_cnt[3]),
    .C(tx_instxbaud_cnt[0]),
    .D(tx_instxbaud_cnt[1]),
    .X(net_54)
  );
  sky130_fd_sc_hd__clkinv_1 tx_instxbaud_cnt_sky130_fd_sc_hd__clkinv_1_A (
    .A(tx_instxbaud_cnt[14]),
    .Y(net_69)
  );
  sky130_fd_sc_hd__clkinv_1 tx_instxbaud_cnt_sky130_fd_sc_hd__clkinv_1_A_1 (
    .A(tx_instxbaud_cnt[13]),
    .Y(net_65)
  );
  sky130_fd_sc_hd__dfrtp_1 tx_instxbaud_cnt_sky130_fd_sc_hd__dfrtp_1_Q (
    .CLK(clk),
    .D(net_74),
    .Q(tx_instxbaud_cnt[15]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 tx_instxbaud_cnt_sky130_fd_sc_hd__dfrtp_1_Q_1 (
    .CLK(clk),
    .D(net_126),
    .Q(tx_instxbaud_cnt[2]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 tx_instxbaud_cnt_sky130_fd_sc_hd__dfrtp_1_Q_10 (
    .CLK(clk),
    .D(net_135),
    .Q(tx_instxbaud_cnt[11]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 tx_instxbaud_cnt_sky130_fd_sc_hd__dfrtp_1_Q_11 (
    .CLK(clk),
    .D(net_136),
    .Q(tx_instxbaud_cnt[12]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 tx_instxbaud_cnt_sky130_fd_sc_hd__dfrtp_1_Q_12 (
    .CLK(clk),
    .D(net_137),
    .Q(tx_instxbaud_cnt[13]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 tx_instxbaud_cnt_sky130_fd_sc_hd__dfrtp_1_Q_13 (
    .CLK(clk),
    .D(net_138),
    .Q(tx_instxbaud_cnt[14]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 tx_instxbaud_cnt_sky130_fd_sc_hd__dfrtp_1_Q_14 (
    .CLK(clk),
    .D(net_124),
    .Q(tx_instxbaud_cnt[0]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 tx_instxbaud_cnt_sky130_fd_sc_hd__dfrtp_1_Q_15 (
    .CLK(clk),
    .D(net_125),
    .Q(tx_instxbaud_cnt[1]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 tx_instxbaud_cnt_sky130_fd_sc_hd__dfrtp_1_Q_2 (
    .CLK(clk),
    .D(net_127),
    .Q(tx_instxbaud_cnt[3]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 tx_instxbaud_cnt_sky130_fd_sc_hd__dfrtp_1_Q_3 (
    .CLK(clk),
    .D(net_128),
    .Q(tx_instxbaud_cnt[4]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 tx_instxbaud_cnt_sky130_fd_sc_hd__dfrtp_1_Q_4 (
    .CLK(clk),
    .D(net_129),
    .Q(tx_instxbaud_cnt[5]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 tx_instxbaud_cnt_sky130_fd_sc_hd__dfrtp_1_Q_5 (
    .CLK(clk),
    .D(net_130),
    .Q(tx_instxbaud_cnt[6]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 tx_instxbaud_cnt_sky130_fd_sc_hd__dfrtp_1_Q_6 (
    .CLK(clk),
    .D(net_131),
    .Q(tx_instxbaud_cnt[7]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 tx_instxbaud_cnt_sky130_fd_sc_hd__dfrtp_1_Q_7 (
    .CLK(clk),
    .D(net_132),
    .Q(tx_instxbaud_cnt[8]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 tx_instxbaud_cnt_sky130_fd_sc_hd__dfrtp_1_Q_8 (
    .CLK(clk),
    .D(net_133),
    .Q(tx_instxbaud_cnt[9]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 tx_instxbaud_cnt_sky130_fd_sc_hd__dfrtp_1_Q_9 (
    .CLK(clk),
    .D(net_134),
    .Q(tx_instxbaud_cnt[10]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__nand3b_1 tx_instxbaud_cnt_sky130_fd_sc_hd__nand3b_1_A_N (
    .A_N(tx_instxbaud_cnt[4]),
    .B(net_54),
    .C(net_145),
    .Y(net_146)
  );
  sky130_fd_sc_hd__nand4_1 tx_instxbaud_cnt_sky130_fd_sc_hd__nand4_1_A (
    .A(tx_instxbaud_cnt[7]),
    .B(tx_instxbaud_cnt[13]),
    .C(net_142),
    .D(net_143),
    .Y(net_144)
  );
  sky130_fd_sc_hd__nand4_1 tx_instxbaud_cnt_sky130_fd_sc_hd__nand4_1_A_1 (
    .A(tx_instxbaud_cnt[12]),
    .B(tx_instxbaud_cnt[10]),
    .C(tx_instxbaud_cnt[11]),
    .D(net_50),
    .Y(net_47)
  );
  sky130_fd_sc_hd__nor2_1 tx_instxbaud_cnt_sky130_fd_sc_hd__nor2_1_A (
    .A(tx_instxbaud_cnt[0]),
    .B(net_64),
    .Y(net_124)
  );
  sky130_fd_sc_hd__nor2_1 tx_instxbaud_cnt_sky130_fd_sc_hd__nor2_1_A_1 (
    .A(tx_instxbaud_cnt[3]),
    .B(net_55),
    .Y(net_157)
  );
  sky130_fd_sc_hd__nor2_1 tx_instxbaud_cnt_sky130_fd_sc_hd__nor2_1_A_2 (
    .A(tx_instxbaud_cnt[7]),
    .B(net_52),
    .Y(net_153)
  );
  sky130_fd_sc_hd__nor2_1 tx_instxbaud_cnt_sky130_fd_sc_hd__nor2_1_A_3 (
    .A(tx_instxbaud_cnt[9]),
    .B(net_51),
    .Y(net_151)
  );
  sky130_fd_sc_hd__nor2_1 tx_instxbaud_cnt_sky130_fd_sc_hd__nor2_1_A_4 (
    .A(tx_instxbaud_cnt[12]),
    .B(net_49),
    .Y(net_148)
  );
  sky130_fd_sc_hd__nor2_1 tx_instxbaud_cnt_sky130_fd_sc_hd__nor2_1_A_5 (
    .A(tx_instxbaud_cnt[10]),
    .B(tx_instxbaud_cnt[8]),
    .Y(net_142)
  );
  sky130_fd_sc_hd__nor2_1 tx_instxbaud_cnt_sky130_fd_sc_hd__nor2_1_A_6 (
    .A(tx_instxbaud_cnt[13]),
    .B(net_48),
    .Y(net_141)
  );
  sky130_fd_sc_hd__nor4b_1 tx_instxbaud_cnt_sky130_fd_sc_hd__nor4b_1_A (
    .A(tx_instxbaud_cnt[9]),
    .B(net_144),
    .C(tx_instxbaud_cnt[6]),
    .D_N(tx_instxbaud_cnt[11]),
    .Y(net_145)
  );
  sky130_fd_sc_hd__nor4b_1 tx_instxbaud_cnt_sky130_fd_sc_hd__nor4b_1_A_1 (
    .A(tx_instxbaud_cnt[15]),
    .B(tx_instxbaud_cnt[14]),
    .C(tx_instxbaud_cnt[12]),
    .D_N(tx_instxbaud_cnt[5]),
    .Y(net_143)
  );
  sky130_fd_sc_hd__o31ai_1 tx_instxbaud_cnt_sky130_fd_sc_hd__o31ai_1_B1 (
    .A1(net_69),
    .A2(net_65),
    .A3(net_47),
    .B1(tx_instxbaud_cnt[15]),
    .Y(net_45)
  );
  sky130_fd_sc_hd__or4_1 tx_instxbaud_cnt_sky130_fd_sc_hd__or4_1_A (
    .A(tx_instxbaud_cnt[15]),
    .B(net_69),
    .C(net_65),
    .D(net_47),
    .X(net_46)
  );
  sky130_fd_sc_hd__xnor2_1 tx_instxbaud_cnt_sky130_fd_sc_hd__xnor2_1_A (
    .A(tx_instxbaud_cnt[4]),
    .B(net_54),
    .Y(net_156)
  );
  sky130_fd_sc_hd__a21oi_1 tx_instxbaud_tick_sky130_fd_sc_hd__a21oi_1_A1 (
    .A1(tx_instxbaud_tick),
    .A2(tx_busy),
    .B1(net_60),
    .Y(net_58)
  );
  sky130_fd_sc_hd__a21oi_1 tx_instxbaud_tick_sky130_fd_sc_hd__a21oi_1_A2 (
    .A1(tx_instxstate[0]),
    .A2(tx_instxbaud_tick),
    .B1(net_56),
    .Y(net_139)
  );
  sky130_fd_sc_hd__and2_0 tx_instxbaud_tick_sky130_fd_sc_hd__and2_0_A (
    .A(tx_instxbaud_tick),
    .B(net_63),
    .X(net_160)
  );
  sky130_fd_sc_hd__and3_1 tx_instxbaud_tick_sky130_fd_sc_hd__and3_1_C (
    .A(tx_instxstate[0]),
    .B(tx_instxstate[1]),
    .C(tx_instxbaud_tick),
    .X(net_70)
  );
  sky130_fd_sc_hd__dfrtp_1 tx_instxbaud_tick_sky130_fd_sc_hd__dfrtp_1_Q (
    .CLK(clk),
    .D(net_76),
    .Q(tx_instxbaud_tick),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__nand2_1 tx_instxbaud_tick_sky130_fd_sc_hd__nand2_1_A (
    .A(tx_instxbaud_tick),
    .B(net_63),
    .Y(net_161)
  );
  sky130_fd_sc_hd__a21oi_1 tx_instxbit_cnt_sky130_fd_sc_hd__a21oi_1_A1 (
    .A1(tx_instxbit_cnt[0]),
    .A2(net_160),
    .B1(tx_instxbit_cnt[1]),
    .Y(net_164)
  );
  sky130_fd_sc_hd__a31oi_1 tx_instxbit_cnt_sky130_fd_sc_hd__a31oi_1_A1 (
    .A1(tx_instxbit_cnt[0]),
    .A2(net_61),
    .A3(net_160),
    .B1(net_165),
    .Y(net_122)
  );
  sky130_fd_sc_hd__clkinv_1 tx_instxbit_cnt_sky130_fd_sc_hd__clkinv_1_A (
    .A(tx_instxbit_cnt[2]),
    .Y(net_66)
  );
  sky130_fd_sc_hd__dfrtp_1 tx_instxbit_cnt_sky130_fd_sc_hd__dfrtp_1_Q (
    .CLK(clk),
    .D(net_75),
    .Q(tx_instxbit_cnt[2]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 tx_instxbit_cnt_sky130_fd_sc_hd__dfrtp_1_Q_1 (
    .CLK(clk),
    .D(net_123),
    .Q(tx_instxbit_cnt[1]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 tx_instxbit_cnt_sky130_fd_sc_hd__dfrtp_1_Q_2 (
    .CLK(clk),
    .D(net_122),
    .Q(tx_instxbit_cnt[0]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__nand3_1 tx_instxbit_cnt_sky130_fd_sc_hd__nand3_1_A (
    .A(tx_instxbit_cnt[0]),
    .B(tx_instxbit_cnt[1]),
    .C(net_160),
    .Y(net_162)
  );
  sky130_fd_sc_hd__nand3_1 tx_instxbit_cnt_sky130_fd_sc_hd__nand3_1_A_1 (
    .A(tx_instxbit_cnt[2]),
    .B(tx_instxbit_cnt[0]),
    .C(tx_instxbit_cnt[1]),
    .Y(net_61)
  );
  sky130_fd_sc_hd__nor2_1 tx_instxbit_cnt_sky130_fd_sc_hd__nor2_1_A (
    .A(tx_instxbit_cnt[2]),
    .B(net_162),
    .Y(net_163)
  );
  sky130_fd_sc_hd__a22oi_1 tx_instxshifter_sky130_fd_sc_hd__a22oi_1_A1 (
    .A1(tx_instxshifter[4]),
    .A2(net_160),
    .B1(net_25),
    .B2(tx_instxshifter[3]),
    .Y(net_35)
  );
  sky130_fd_sc_hd__a22oi_1 tx_instxshifter_sky130_fd_sc_hd__a22oi_1_A1_1 (
    .A1(tx_instxshifter[5]),
    .A2(net_160),
    .B1(net_25),
    .B2(tx_instxshifter[4]),
    .Y(net_33)
  );
  sky130_fd_sc_hd__a22oi_1 tx_instxshifter_sky130_fd_sc_hd__a22oi_1_A1_2 (
    .A1(tx_instxshifter[6]),
    .A2(net_160),
    .B1(net_25),
    .B2(tx_instxshifter[5]),
    .Y(net_31)
  );
  sky130_fd_sc_hd__dfrtp_1 tx_instxshifter_sky130_fd_sc_hd__dfrtp_1_Q (
    .CLK(clk),
    .D(net_72),
    .Q(tx_instxshifter[7]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 tx_instxshifter_sky130_fd_sc_hd__dfrtp_1_Q_1 (
    .CLK(clk),
    .D(net_88),
    .Q(tx_instxshifter[6]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 tx_instxshifter_sky130_fd_sc_hd__dfrtp_1_Q_2 (
    .CLK(clk),
    .D(net_87),
    .Q(tx_instxshifter[5]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 tx_instxshifter_sky130_fd_sc_hd__dfrtp_1_Q_3 (
    .CLK(clk),
    .D(net_86),
    .Q(tx_instxshifter[4]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 tx_instxshifter_sky130_fd_sc_hd__dfrtp_1_Q_4 (
    .CLK(clk),
    .D(net_85),
    .Q(tx_instxshifter[3]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 tx_instxshifter_sky130_fd_sc_hd__dfrtp_1_Q_5 (
    .CLK(clk),
    .D(net_84),
    .Q(tx_instxshifter[2]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 tx_instxshifter_sky130_fd_sc_hd__dfrtp_1_Q_6 (
    .CLK(clk),
    .D(net_83),
    .Q(tx_instxshifter[1]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 tx_instxshifter_sky130_fd_sc_hd__dfrtp_1_Q_7 (
    .CLK(clk),
    .D(net_82),
    .Q(tx_instxshifter[0]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__nor2_1 tx_instxshifter_sky130_fd_sc_hd__nor2_1_A (
    .A(tx_instxshifter[1]),
    .B(net_161),
    .Y(net_40)
  );
  sky130_fd_sc_hd__nor2_1 tx_instxshifter_sky130_fd_sc_hd__nor2_1_A_1 (
    .A(tx_instxshifter[2]),
    .B(net_161),
    .Y(net_38)
  );
  sky130_fd_sc_hd__nor2_1 tx_instxshifter_sky130_fd_sc_hd__nor2_1_A_2 (
    .A(tx_instxshifter[3]),
    .B(net_161),
    .Y(net_36)
  );
  sky130_fd_sc_hd__nor2_1 tx_instxshifter_sky130_fd_sc_hd__nor2_1_A_3 (
    .A(tx_instxshifter[7]),
    .B(net_161),
    .Y(net_29)
  );
  sky130_fd_sc_hd__nor2_1 tx_instxshifter_sky130_fd_sc_hd__nor2_1_A_4 (
    .A(tx_instxshifter[6]),
    .B(net_26),
    .Y(net_27)
  );
  sky130_fd_sc_hd__dfrtp_1 tx_instxstate_sky130_fd_sc_hd__dfrtp_1_Q (
    .CLK(clk),
    .D(net_73),
    .Q(tx_instxstate[1]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 tx_instxstate_sky130_fd_sc_hd__dfrtp_1_Q_1 (
    .CLK(clk),
    .D(net_139),
    .Q(tx_instxstate[0]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__mux2_1 tx_instxstate_sky130_fd_sc_hd__mux2_1_A0 (
    .A0(tx_instxstate[1]),
    .A1(net_62),
    .S(net_57),
    .X(net_73)
  );
  sky130_fd_sc_hd__nor2_1 tx_instxstate_sky130_fd_sc_hd__nor2_1_A (
    .A(tx_instxstate[0]),
    .B(net_57),
    .Y(net_56)
  );
  sky130_fd_sc_hd__nor2_1 tx_instxstate_sky130_fd_sc_hd__nor2_1_A_1 (
    .A(tx_instxstate[0]),
    .B(tx_instxstate[1]),
    .Y(net_64)
  );
  sky130_fd_sc_hd__nor2b_1 tx_instxstate_sky130_fd_sc_hd__nor2b_1_A (
    .A(tx_instxstate[0]),
    .B_N(tx_instxstate[1]),
    .Y(net_63)
  );
  sky130_fd_sc_hd__xor2_1 tx_instxstate_sky130_fd_sc_hd__xor2_1_A (
    .A(tx_instxstate[0]),
    .B(tx_instxstate[1]),
    .X(net_62)
  );
  sky130_fd_sc_hd__and2_0 tx_start_sky130_fd_sc_hd__and2_0_A (
    .A(tx_start),
    .B(net_64),
    .X(net_60)
  );
  sky130_fd_sc_hd__nand2_1 tx_start_sky130_fd_sc_hd__nand2_1_A (
    .A(tx_start),
    .B(net_64),
    .Y(net_59)
  );
endmodule
# netlist-object-aligned SDC, generated by Yosys write_sdc
# source: /home/c2s-nitj-047-gagan-sharma/my_projects/uart/inputs/uart.sdc
create_clock -name clk -period 10 [get_ports clk]
# =========================================================
# Generated by : Catalyzer
# Tool Version : alpha_v0.1
# Date         : 2026-09-01 16:57:45
# User Name    : c2s-nitj-047-gagan-sharma
# Host Name    : compcarta-chipin-c2s1
# Design Name  : uart_top
# File         : /home/c2s-nitj-047-gagan-sharma/my_projects/uart/run/synthesis/scripts/flow_synth.tcl
# =========================================================

czer_yosys read_liberty -lib /edacloud/tools/catalyzer/tech_libs/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__ss_n40C_1v60.lib

# Read the design files specified in the environment variable
czer_read_design_file $::env(DESIGN_FILE_LIST)

# Check design hierarchy and set top module
czer_yosys hierarchy -check -top $::env(DESIGN_NAME)

# Read design SDC. -warn downgrades unresolved SDC object references (e.g. a
# clock on a port that does not exist in the netlist) from a fatal error to a
# warning, so a minor SDC/RTL mismatch does not abort the whole synthesis run
# (read_sdc otherwise log_error-exits yosys).
czer_yosys read_sdc -warn $::env(SDC_FILE)

# Generate pre-synthesis statistics report
czer_yosys tee -o reports/pre_synth_stat.rpt stat 

# Perform generic synthesis
czer_synth_generic

# Map the synthesized design to the target library
czer_synth_libmap

# Map level-sensitive latches ($_DLATCH_P_/$_DLATCH_N_) to the PDK's latch
# cells. yosys has no latch liberty mapper (dfflibmap is FF-only), so a residual
# generic latch (e.g. a behavioral clock-gate latch) would otherwise reach
# OpenSTA / PnR unmapped and break them. A per-PDK techmap file
# tech_libs/<PDK>/latch_map.v maps the generic latches to real cells; PDKs
# without such a file skip this step gracefully.
if {[file exists $::env(CATALYZER_DIR)/tech_libs/$::env(PDK)/latch_map.v]} {
    czer_yosys techmap -map $::env(CATALYZER_DIR)/tech_libs/$::env(PDK)/latch_map.v
}

# Optimize the synthesized design
czer_synth_optimize

# Strip simulation-only cells ($print/$display/$write, assertions, etc.) that
# survive from the RTL. They are meaningless in a gate netlist and OpenSTA's
# verilog reader rejects them (e.g. a `$write(...)` debug statement in the RTL
# is emitted as an always/$write block and broke opensta_timing). The cell-type
# "$" must survive TWO Tcl evaluations (catalyzer sources this file, then yosys
# re-parses the piped command under -import), so it is triple-backslashed here:
# flow `\\\$` -> catalyzer Tcl `\$` -> yosys Tcl literal `$`.
czer_yosys delete t:\\\$print t:\\\$check t:\\\$assert t:\\\$assume t:\\\$cover t:\\\$live t:\\\$fair

# Fanout & timing optimization
czer_yosys repair_fanout -limit 50 -buf $::env(SYNTH_DRIVING_CELL) A X

# Report timing
czer_yosys opensta_timing -report_dir reports/

# Report power
czer_yosys report_power -activity 0.2 -duty 0.5 -scope $::env(DESIGN_NAME) -report reports/power.rpt
# Generate post-synthesis Flat statistics report
czer_yosys tee -o reports/post_synth_stat.rpt stat -liberty /edacloud/tools/catalyzer/tech_libs/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__ss_n40C_1v60.lib
# Generate post-synthesis hier statistics report
czer_yosys tee -o reports/post_synth_stat_hier.rpt stat -liberty /edacloud/tools/catalyzer/tech_libs/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__ss_n40C_1v60.lib -top $::env(DESIGN_NAME)

# Improving the default naming 
czer_yosys sanitize_names -fill x -cells

# Generate verilog file 
czer_yosys write_verilog -noattr -noexpr -nohex -nodec -defparam ./outputs/$::env(DESIGN_NAME).v

# Generate JSON representation of the synthesized design
czer_yosys write_json ./outputs/$::env(DESIGN_NAME).json

# Create output SDC 
czer_yosys write_sdc outputs/netlist.sdc

c2s-nitj-047-gagan-sharma@compcarta-chipin-c2s1:~/catalyzer_projects/digital/uart/run/synthesis$ ls
catalyzer.cmd  inputs  logs  outputs  reports  scripts  tmp
c2s-nitj-047-gagan-sharma@compcarta-chipin-c2s1:~/catalyzer_projects/digital/uart/run/synthesis$ cd outputs
c2s-nitj-047-gagan-sharma@compcarta-chipin-c2s1:~/catalyzer_projects/digital/uart/run/synthesis/outputs$ ls
netlist.sdc  uart_top.json  uart_top.v
c2s-nitj-047-gagan-sharma@compcarta-chipin-c2s1:~/catalyzer_projects/digital/uart/run/synthesis/outputs$ catnetlist.sdc
catnetlist.sdc: command not found
c2s-nitj-047-gagan-sharma@compcarta-chipin-c2s1:~/catalyzer_projects/digital/uart/run/synthesis/outputs$ cd netlist.sdc
-bash: cd: netlist.sdc: Not a directory
c2s-nitj-047-gagan-sharma@compcarta-chipin-c2s1:~/catalyzer_projects/digital/uart/run/synthesis/outputs$ cat netlist.sdc
# netlist-object-aligned SDC, generated by Yosys write_sdc
# source: /home/c2s-nitj-047-gagan-sharma/my_projects/uart/inputs/uart.sdc
create_clock -name clk -period 10 [get_ports clk]
c2s-nitj-047-gagan-sharma@compcarta-chipin-c2s1:~/catalyzer_projects/digital/uart/run/synthesis/outputs$ cat uart_top.v
/* Generated by Yosys 0.66 (git sha1 UNKNOWN-dirty, g++ 13.3.0-6ubuntu2~24.04.1 -fPIC -O3) [compcartasolutions/timing-aware-synthesis-flow] */

module uart_top(clk, rst_n, data_in, tx_start, data_out, tx_busy, tx_done, rx_busy, rx_done);
  input clk;
  wire clk;
  input rst_n;
  wire rst_n;
  input [7:0] data_in;
  wire [7:0] data_in;
  input tx_start;
  wire tx_start;
  output [7:0] data_out;
  wire [7:0] data_out;
  output tx_busy;
  wire tx_busy;
  output tx_done;
  wire tx_done;
  output rx_busy;
  wire rx_busy;
  output rx_done;
  wire rx_done;
  wire net_0;
  wire net_1;
  wire net_10;
  wire net_100;
  wire net_101;
  wire net_102;
  wire net_103;
  wire net_104;
  wire net_105;
  wire net_106;
  wire net_107;
  wire net_108;
  wire net_109;
  wire net_11;
  wire net_110;
  wire net_111;
  wire net_112;
  wire net_113;
  wire net_114;
  wire net_115;
  wire net_116;
  wire net_117;
  wire net_118;
  wire net_119;
  wire net_12;
  wire net_120;
  wire net_121;
  wire net_122;
  wire net_123;
  wire net_124;
  wire net_125;
  wire net_126;
  wire net_127;
  wire net_128;
  wire net_129;
  wire net_13;
  wire net_130;
  wire net_131;
  wire net_132;
  wire net_133;
  wire net_134;
  wire net_135;
  wire net_136;
  wire net_137;
  wire net_138;
  wire net_139;
  wire net_14;
  wire net_140;
  wire net_141;
  wire net_142;
  wire net_143;
  wire net_144;
  wire net_145;
  wire net_146;
  wire net_147;
  wire net_148;
  wire net_149;
  wire net_15;
  wire net_150;
  wire net_151;
  wire net_152;
  wire net_153;
  wire net_154;
  wire net_155;
  wire net_156;
  wire net_157;
  wire net_158;
  wire net_159;
  wire net_16;
  wire net_160;
  wire net_161;
  wire net_162;
  wire net_163;
  wire net_164;
  wire net_165;
  wire net_166;
  wire net_167;
  wire net_168;
  wire net_169;
  wire net_17;
  wire net_170;
  wire net_171;
  wire net_172;
  wire net_173;
  wire net_174;
  wire net_175;
  wire net_176;
  wire net_177;
  wire net_178;
  wire net_179;
  wire net_18;
  wire net_180;
  wire net_181;
  wire net_182;
  wire net_183;
  wire net_184;
  wire net_185;
  wire net_186;
  wire net_187;
  wire net_188;
  wire net_189;
  wire net_19;
  wire net_190;
  wire net_191;
  wire net_192;
  wire net_193;
  wire net_194;
  wire net_195;
  wire net_196;
  wire net_197;
  wire net_198;
  wire net_199;
  wire net_2;
  wire net_20;
  wire net_200;
  wire net_201;
  wire net_202;
  wire net_203;
  wire net_204;
  wire net_205;
  wire net_206;
  wire net_207;
  wire net_208;
  wire net_209;
  wire net_21;
  wire net_210;
  wire net_211;
  wire net_212;
  wire net_213;
  wire net_214;
  wire net_215;
  wire net_216;
  wire net_217;
  wire net_218;
  wire net_22;
  wire net_23;
  wire net_24;
  wire net_25;
  wire net_26;
  wire net_27;
  wire net_28;
  wire net_29;
  wire net_3;
  wire net_30;
  wire net_31;
  wire net_32;
  wire net_33;
  wire net_34;
  wire net_35;
  wire net_36;
  wire net_37;
  wire net_38;
  wire net_39;
  wire net_4;
  wire net_40;
  wire net_41;
  wire net_42;
  wire net_43;
  wire net_44;
  wire net_45;
  wire net_46;
  wire net_47;
  wire net_48;
  wire net_49;
  wire net_5;
  wire net_50;
  wire net_51;
  wire net_52;
  wire net_53;
  wire net_54;
  wire net_55;
  wire net_56;
  wire net_57;
  wire net_58;
  wire net_59;
  wire net_6;
  wire net_60;
  wire net_61;
  wire net_62;
  wire net_63;
  wire net_64;
  wire net_65;
  wire net_66;
  wire net_67;
  wire net_68;
  wire net_69;
  wire net_7;
  wire net_70;
  wire net_71;
  wire net_72;
  wire net_73;
  wire net_74;
  wire net_75;
  wire net_76;
  wire net_77;
  wire net_78;
  wire net_79;
  wire net_8;
  wire net_80;
  wire net_81;
  wire net_82;
  wire net_83;
  wire net_84;
  wire net_85;
  wire net_86;
  wire net_87;
  wire net_88;
  wire net_89;
  wire net_9;
  wire net_90;
  wire net_91;
  wire net_92;
  wire net_93;
  wire net_94;
  wire net_95;
  wire net_96;
  wire net_97;
  wire net_98;
  wire net_99;
  wire [15:0] rx_instxbaud_cnt;
  wire rx_instxbaud_tick;
  wire [2:0] rx_instxbit_cnt;
  wire rx_instxprev_rx;
  wire rx_instxrx;
  wire [7:0] rx_instxshifter;
  wire [1:0] rx_instxstate;
  wire [15:0] tx_instxbaud_cnt;
  wire tx_instxbaud_tick;
  wire [2:0] tx_instxbit_cnt;
  wire [7:0] tx_instxshifter;
  wire [1:0] tx_instxstate;
  sky130_fd_sc_hd__a22o_1 data_in_sky130_fd_sc_hd__a22o_1_A1 (
    .A1(data_in[7]),
    .A2(net_60),
    .B1(net_25),
    .B2(tx_instxshifter[7]),
    .X(net_72)
  );
  sky130_fd_sc_hd__nand2_1 data_in_sky130_fd_sc_hd__nand2_1_A (
    .A(data_in[3]),
    .B(net_60),
    .Y(net_34)
  );
  sky130_fd_sc_hd__nand2_1 data_in_sky130_fd_sc_hd__nand2_1_A_1 (
    .A(data_in[4]),
    .B(net_60),
    .Y(net_32)
  );
  sky130_fd_sc_hd__nand2_1 data_in_sky130_fd_sc_hd__nand2_1_A_2 (
    .A(data_in[5]),
    .B(net_60),
    .Y(net_30)
  );
  sky130_fd_sc_hd__nor2_1 data_in_sky130_fd_sc_hd__nor2_1_A (
    .A(data_in[6]),
    .B(net_59),
    .Y(net_28)
  );
  sky130_fd_sc_hd__o22ai_1 data_in_sky130_fd_sc_hd__o22ai_1_A1 (
    .A1(data_in[0]),
    .A2(net_59),
    .B1(net_26),
    .B2(tx_instxshifter[0]),
    .Y(net_41)
  );
  sky130_fd_sc_hd__o22ai_1 data_in_sky130_fd_sc_hd__o22ai_1_A1_1 (
    .A1(data_in[1]),
    .A2(net_59),
    .B1(net_26),
    .B2(tx_instxshifter[1]),
    .Y(net_39)
  );
  sky130_fd_sc_hd__o22ai_1 data_in_sky130_fd_sc_hd__o22ai_1_A1_2 (
    .A1(data_in[2]),
    .A2(net_59),
    .B1(net_26),
    .B2(tx_instxshifter[2]),
    .Y(net_37)
  );
  sky130_fd_sc_hd__dfrtp_1 data_out_sky130_fd_sc_hd__dfrtp_1_Q (
    .CLK(clk),
    .D(net_120),
    .Q(data_out[6]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 data_out_sky130_fd_sc_hd__dfrtp_1_Q_1 (
    .CLK(clk),
    .D(net_119),
    .Q(data_out[5]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 data_out_sky130_fd_sc_hd__dfrtp_1_Q_2 (
    .CLK(clk),
    .D(net_118),
    .Q(data_out[4]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 data_out_sky130_fd_sc_hd__dfrtp_1_Q_3 (
    .CLK(clk),
    .D(net_117),
    .Q(data_out[3]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 data_out_sky130_fd_sc_hd__dfrtp_1_Q_4 (
    .CLK(clk),
    .D(net_116),
    .Q(data_out[2]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 data_out_sky130_fd_sc_hd__dfrtp_1_Q_5 (
    .CLK(clk),
    .D(net_77),
    .Q(data_out[7]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 data_out_sky130_fd_sc_hd__dfrtp_1_Q_6 (
    .CLK(clk),
    .D(net_115),
    .Q(data_out[1]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 data_out_sky130_fd_sc_hd__dfrtp_1_Q_7 (
    .CLK(clk),
    .D(net_114),
    .Q(data_out[0]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__mux2_1 data_out_sky130_fd_sc_hd__mux2_1_A0 (
    .A0(data_out[0]),
    .A1(rx_instxshifter[0]),
    .S(net_172),
    .X(net_114)
  );
  sky130_fd_sc_hd__mux2_1 data_out_sky130_fd_sc_hd__mux2_1_A0_1 (
    .A0(data_out[1]),
    .A1(rx_instxshifter[1]),
    .S(net_172),
    .X(net_115)
  );
  sky130_fd_sc_hd__mux2_1 data_out_sky130_fd_sc_hd__mux2_1_A0_2 (
    .A0(data_out[2]),
    .A1(rx_instxshifter[2]),
    .S(net_172),
    .X(net_116)
  );
  sky130_fd_sc_hd__mux2_1 data_out_sky130_fd_sc_hd__mux2_1_A0_3 (
    .A0(data_out[3]),
    .A1(rx_instxshifter[3]),
    .S(net_172),
    .X(net_117)
  );
  sky130_fd_sc_hd__mux2_1 data_out_sky130_fd_sc_hd__mux2_1_A0_4 (
    .A0(data_out[4]),
    .A1(rx_instxshifter[4]),
    .S(net_172),
    .X(net_118)
  );
  sky130_fd_sc_hd__mux2_1 data_out_sky130_fd_sc_hd__mux2_1_A0_5 (
    .A0(data_out[5]),
    .A1(rx_instxshifter[5]),
    .S(net_172),
    .X(net_119)
  );
  sky130_fd_sc_hd__mux2_1 data_out_sky130_fd_sc_hd__mux2_1_A0_6 (
    .A0(data_out[6]),
    .A1(rx_instxshifter[6]),
    .S(net_172),
    .X(net_120)
  );
  sky130_fd_sc_hd__nor3_1 net_100_sky130_fd_sc_hd__nor3_1_Y (
    .A(net_2),
    .B(net_11),
    .C(net_14),
    .Y(net_100)
  );
  sky130_fd_sc_hd__nor2_1 net_101_sky130_fd_sc_hd__nor2_1_Y (
    .A(net_3),
    .B(net_13),
    .Y(net_101)
  );
  sky130_fd_sc_hd__a21oi_1 net_102_sky130_fd_sc_hd__a21oi_1_Y (
    .A1(net_67),
    .A2(net_4),
    .B1(net_12),
    .Y(net_102)
  );
  sky130_fd_sc_hd__nor3_1 net_103_sky130_fd_sc_hd__nor3_1_Y (
    .A(net_166),
    .B(net_5),
    .C(net_6),
    .Y(net_103)
  );
  sky130_fd_sc_hd__nor2_1 net_105_sky130_fd_sc_hd__nor2_1_Y (
    .A(net_166),
    .B(net_205),
    .Y(net_105)
  );
  sky130_fd_sc_hd__o21ai_0 net_106_sky130_fd_sc_hd__o21ai_0_Y (
    .A1(net_202),
    .A2(net_203),
    .B1(net_200),
    .Y(net_106)
  );
  sky130_fd_sc_hd__o21ai_0 net_107_sky130_fd_sc_hd__o21ai_0_Y (
    .A1(net_198),
    .A2(net_199),
    .B1(net_196),
    .Y(net_107)
  );
  sky130_fd_sc_hd__nand2_1 net_108_sky130_fd_sc_hd__nand2_1_Y (
    .A(net_194),
    .B(net_195),
    .Y(net_108)
  );
  sky130_fd_sc_hd__o31ai_1 net_109_sky130_fd_sc_hd__o31ai_1_Y (
    .A1(net_169),
    .A2(net_190),
    .A3(net_191),
    .B1(net_188),
    .Y(net_109)
  );
  sky130_fd_sc_hd__nand4_1 net_10_sky130_fd_sc_hd__nand4_1_Y (
    .A(net_207),
    .B(net_216),
    .C(net_8),
    .D(net_9),
    .Y(net_10)
  );
  sky130_fd_sc_hd__nand2_1 net_110_sky130_fd_sc_hd__nand2_1_Y (
    .A(net_184),
    .B(net_187),
    .Y(net_110)
  );
  sky130_fd_sc_hd__nand2_1 net_111_sky130_fd_sc_hd__nand2_1_Y (
    .A(net_180),
    .B(net_183),
    .Y(net_111)
  );
  sky130_fd_sc_hd__o21ai_0 net_113_sky130_fd_sc_hd__o21ai_0_Y (
    .A1(net_175),
    .A2(net_176),
    .B1(net_174),
    .Y(net_113)
  );
  sky130_fd_sc_hd__nor3_1 net_121_sky130_fd_sc_hd__nor3_1_Y (
    .A(net_69),
    .B(net_65),
    .C(net_47),
    .Y(net_121)
  );
  sky130_fd_sc_hd__nor3_1 net_123_sky130_fd_sc_hd__nor3_1_Y (
    .A(net_64),
    .B(net_163),
    .C(net_164),
    .Y(net_123)
  );
  sky130_fd_sc_hd__nor3_1 net_126_sky130_fd_sc_hd__nor3_1_Y (
    .A(net_64),
    .B(net_55),
    .C(net_158),
    .Y(net_126)
  );
  sky130_fd_sc_hd__nor3_1 net_127_sky130_fd_sc_hd__nor3_1_Y (
    .A(net_64),
    .B(net_54),
    .C(net_157),
    .Y(net_127)
  );
  sky130_fd_sc_hd__nor2_1 net_128_sky130_fd_sc_hd__nor2_1_Y (
    .A(net_147),
    .B(net_156),
    .Y(net_128)
  );
  sky130_fd_sc_hd__nor3_1 net_129_sky130_fd_sc_hd__nor3_1_Y (
    .A(net_53),
    .B(net_147),
    .C(net_155),
    .Y(net_129)
  );
  sky130_fd_sc_hd__nor2_1 net_130_sky130_fd_sc_hd__nor2_1_Y (
    .A(net_52),
    .B(net_154),
    .Y(net_130)
  );
  sky130_fd_sc_hd__nor3_1 net_132_sky130_fd_sc_hd__nor3_1_Y (
    .A(net_64),
    .B(net_51),
    .C(net_152),
    .Y(net_132)
  );
  sky130_fd_sc_hd__nor3_1 net_133_sky130_fd_sc_hd__nor3_1_Y (
    .A(net_64),
    .B(net_50),
    .C(net_151),
    .Y(net_133)
  );
  sky130_fd_sc_hd__nor3_1 net_135_sky130_fd_sc_hd__nor3_1_Y (
    .A(net_49),
    .B(net_147),
    .C(net_149),
    .Y(net_135)
  );
  sky130_fd_sc_hd__nor3_1 net_136_sky130_fd_sc_hd__nor3_1_Y (
    .A(net_64),
    .B(net_48),
    .C(net_148),
    .Y(net_136)
  );
  sky130_fd_sc_hd__nor3_1 net_138_sky130_fd_sc_hd__nor3_1_Y (
    .A(net_64),
    .B(net_121),
    .C(net_140),
    .Y(net_138)
  );
  sky130_fd_sc_hd__nor2_1 net_172_sky130_fd_sc_hd__nor2_1_Y (
    .A(net_169),
    .B(net_171),
    .Y(net_172)
  );
  sky130_fd_sc_hd__a21oi_1 net_173_sky130_fd_sc_hd__a21oi_1_Y (
    .A1(net_168),
    .A2(net_171),
    .B1(net_166),
    .Y(net_173)
  );
  sky130_fd_sc_hd__nand2_1 net_176_sky130_fd_sc_hd__nand2_1_Y (
    .A(net_168),
    .B(net_170),
    .Y(net_176)
  );
  sky130_fd_sc_hd__nor2_1 net_193_sky130_fd_sc_hd__nor2_1_Y (
    .A(net_169),
    .B(net_192),
    .Y(net_193)
  );
  sky130_fd_sc_hd__nand3_1 net_210_sky130_fd_sc_hd__nand3_1_Y (
    .A(net_207),
    .B(net_208),
    .C(net_209),
    .Y(net_210)
  );
  sky130_fd_sc_hd__nand2_1 net_214_sky130_fd_sc_hd__nand2_1_Y (
    .A(net_178),
    .B(net_213),
    .Y(net_214)
  );
  sky130_fd_sc_hd__nor2_1 net_25_sky130_fd_sc_hd__nor2_1_Y (
    .A(net_60),
    .B(net_160),
    .Y(net_25)
  );
  sky130_fd_sc_hd__nand2_1 net_26_sky130_fd_sc_hd__nand2_1_Y (
    .A(net_59),
    .B(net_161),
    .Y(net_26)
  );
  sky130_fd_sc_hd__nor2_1 net_44_sky130_fd_sc_hd__nor2_1_Y (
    .A(net_166),
    .B(net_71),
    .Y(net_44)
  );
  sky130_fd_sc_hd__a21oi_1 net_57_sky130_fd_sc_hd__a21oi_1_Y (
    .A1(net_63),
    .A2(net_61),
    .B1(net_58),
    .Y(net_57)
  );
  sky130_fd_sc_hd__nor3_1 net_5_sky130_fd_sc_hd__nor3_1_Y (
    .A(net_68),
    .B(net_67),
    .C(net_4),
    .Y(net_5)
  );
  sky130_fd_sc_hd__a21oi_1 net_74_sky130_fd_sc_hd__a21oi_1_Y (
    .A1(net_45),
    .A2(net_46),
    .B1(net_64),
    .Y(net_74)
  );
  sky130_fd_sc_hd__a21oi_1 net_75_sky130_fd_sc_hd__a21oi_1_Y (
    .A1(net_66),
    .A2(net_162),
    .B1(net_64),
    .Y(net_75)
  );
  sky130_fd_sc_hd__nor2_1 net_76_sky130_fd_sc_hd__nor2_1_Y (
    .A(net_64),
    .B(net_146),
    .Y(net_76)
  );
  sky130_fd_sc_hd__and2_0 net_79_sky130_fd_sc_hd__and2_0_X (
    .A(net_213),
    .B(net_44),
    .X(net_79)
  );
  sky130_fd_sc_hd__nor2_1 net_80_sky130_fd_sc_hd__nor2_1_Y (
    .A(net_166),
    .B(net_10),
    .Y(net_80)
  );
  sky130_fd_sc_hd__a21oi_1 net_81_sky130_fd_sc_hd__a21oi_1_Y (
    .A1(net_42),
    .A2(net_43),
    .B1(net_166),
    .Y(net_81)
  );
  sky130_fd_sc_hd__nor2_1 net_82_sky130_fd_sc_hd__nor2_1_Y (
    .A(net_40),
    .B(net_41),
    .Y(net_82)
  );
  sky130_fd_sc_hd__nor2_1 net_83_sky130_fd_sc_hd__nor2_1_Y (
    .A(net_38),
    .B(net_39),
    .Y(net_83)
  );
  sky130_fd_sc_hd__nor2_1 net_84_sky130_fd_sc_hd__nor2_1_Y (
    .A(net_36),
    .B(net_37),
    .Y(net_84)
  );
  sky130_fd_sc_hd__nand2_1 net_85_sky130_fd_sc_hd__nand2_1_Y (
    .A(net_34),
    .B(net_35),
    .Y(net_85)
  );
  sky130_fd_sc_hd__nand2_1 net_86_sky130_fd_sc_hd__nand2_1_Y (
    .A(net_32),
    .B(net_33),
    .Y(net_86)
  );
  sky130_fd_sc_hd__nand2_1 net_87_sky130_fd_sc_hd__nand2_1_Y (
    .A(net_30),
    .B(net_31),
    .Y(net_87)
  );
  sky130_fd_sc_hd__nor3_1 net_88_sky130_fd_sc_hd__nor3_1_Y (
    .A(net_27),
    .B(net_28),
    .C(net_29),
    .Y(net_88)
  );
  sky130_fd_sc_hd__nor3_1 net_91_sky130_fd_sc_hd__nor3_1_Y (
    .A(net_166),
    .B(net_208),
    .C(net_23),
    .Y(net_91)
  );
  sky130_fd_sc_hd__nor2_1 net_92_sky130_fd_sc_hd__nor2_1_Y (
    .A(net_216),
    .B(net_22),
    .Y(net_92)
  );
  sky130_fd_sc_hd__nor2_1 net_93_sky130_fd_sc_hd__nor2_1_Y (
    .A(net_11),
    .B(net_21),
    .Y(net_93)
  );
  sky130_fd_sc_hd__nor3_1 net_94_sky130_fd_sc_hd__nor3_1_Y (
    .A(net_217),
    .B(net_11),
    .C(net_20),
    .Y(net_94)
  );
  sky130_fd_sc_hd__nor2_1 net_95_sky130_fd_sc_hd__nor2_1_Y (
    .A(net_218),
    .B(net_19),
    .Y(net_95)
  );
  sky130_fd_sc_hd__nor3_1 net_97_sky130_fd_sc_hd__nor3_1_Y (
    .A(net_166),
    .B(net_0),
    .C(net_17),
    .Y(net_97)
  );
  sky130_fd_sc_hd__nor2_1 net_98_sky130_fd_sc_hd__nor2_1_Y (
    .A(net_1),
    .B(net_16),
    .Y(net_98)
  );
  sky130_fd_sc_hd__a22o_1 rx_busy_sky130_fd_sc_hd__a22o_1_A2 (
    .A1(rx_instxbit_cnt[2]),
    .A2(rx_busy),
    .B1(net_168),
    .B2(net_192),
    .X(net_78)
  );
  sky130_fd_sc_hd__clkinv_1 rx_busy_sky130_fd_sc_hd__clkinv_1_Y (
    .A(net_166),
    .Y(rx_busy)
  );
  sky130_fd_sc_hd__nand2_1 rx_busy_sky130_fd_sc_hd__nand2_1_A (
    .A(rx_busy),
    .B(net_10),
    .Y(net_11)
  );
  sky130_fd_sc_hd__o21ai_0 rx_busy_sky130_fd_sc_hd__o21ai_0_B1 (
    .A1(rx_instxbaud_cnt[0]),
    .A2(rx_instxbaud_cnt[1]),
    .B1(rx_busy),
    .Y(net_24)
  );
  sky130_fd_sc_hd__o21ai_0 rx_busy_sky130_fd_sc_hd__o21ai_0_B1_1 (
    .A1(rx_instxbaud_cnt[3]),
    .A2(net_208),
    .B1(rx_busy),
    .Y(net_22)
  );
  sky130_fd_sc_hd__o21ai_0 rx_busy_sky130_fd_sc_hd__o21ai_0_B1_2 (
    .A1(rx_instxbaud_cnt[6]),
    .A2(net_217),
    .B1(rx_busy),
    .Y(net_19)
  );
  sky130_fd_sc_hd__o21ai_0 rx_busy_sky130_fd_sc_hd__o21ai_0_B1_3 (
    .A1(rx_instxbaud_cnt[9]),
    .A2(net_0),
    .B1(rx_busy),
    .Y(net_16)
  );
  sky130_fd_sc_hd__o21ai_0 rx_busy_sky130_fd_sc_hd__o21ai_0_B1_4 (
    .A1(rx_instxbaud_cnt[10]),
    .A2(net_1),
    .B1(rx_busy),
    .Y(net_15)
  );
  sky130_fd_sc_hd__o21ai_0 rx_busy_sky130_fd_sc_hd__o21ai_0_B1_5 (
    .A1(rx_instxbaud_cnt[12]),
    .A2(net_2),
    .B1(rx_busy),
    .Y(net_13)
  );
  sky130_fd_sc_hd__dfrtp_1 rx_done_sky130_fd_sc_hd__dfrtp_1_Q (
    .CLK(clk),
    .D(net_71),
    .Q(rx_done),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__a211oi_1 rx_instxbaud_cnt_sky130_fd_sc_hd__a211oi_1_A1 (
    .A1(rx_instxbaud_cnt[7]),
    .A2(net_218),
    .B1(net_11),
    .C1(net_18),
    .Y(net_96)
  );
  sky130_fd_sc_hd__a21o_1 rx_instxbaud_cnt_sky130_fd_sc_hd__a21o_1_A1 (
    .A1(rx_instxbaud_cnt[13]),
    .A2(net_3),
    .B1(net_11),
    .X(net_12)
  );
  sky130_fd_sc_hd__a21oi_1 rx_instxbaud_cnt_sky130_fd_sc_hd__a21oi_1_A1 (
    .A1(rx_instxbaud_cnt[0]),
    .A2(rx_instxbaud_cnt[1]),
    .B1(net_24),
    .Y(net_90)
  );
  sky130_fd_sc_hd__a21oi_1 rx_instxbaud_cnt_sky130_fd_sc_hd__a21oi_1_A1_1 (
    .A1(rx_instxbaud_cnt[0]),
    .A2(rx_instxbaud_cnt[1]),
    .B1(rx_instxbaud_cnt[2]),
    .Y(net_23)
  );
  sky130_fd_sc_hd__a21oi_1 rx_instxbaud_cnt_sky130_fd_sc_hd__a21oi_1_A1_2 (
    .A1(rx_instxbaud_cnt[4]),
    .A2(net_216),
    .B1(rx_instxbaud_cnt[5]),
    .Y(net_20)
  );
  sky130_fd_sc_hd__a21oi_1 rx_instxbaud_cnt_sky130_fd_sc_hd__a21oi_1_A1_3 (
    .A1(rx_instxbaud_cnt[7]),
    .A2(net_218),
    .B1(rx_instxbaud_cnt[8]),
    .Y(net_17)
  );
  sky130_fd_sc_hd__a21oi_1 rx_instxbaud_cnt_sky130_fd_sc_hd__a21oi_1_A1_4 (
    .A1(rx_instxbaud_cnt[10]),
    .A2(net_1),
    .B1(net_15),
    .Y(net_99)
  );
  sky130_fd_sc_hd__a21oi_1 rx_instxbaud_cnt_sky130_fd_sc_hd__a21oi_1_A1_5 (
    .A1(rx_instxbaud_cnt[10]),
    .A2(net_1),
    .B1(rx_instxbaud_cnt[11]),
    .Y(net_14)
  );
  sky130_fd_sc_hd__a21oi_1 rx_instxbaud_cnt_sky130_fd_sc_hd__a21oi_1_A1_6 (
    .A1(rx_instxbaud_cnt[13]),
    .A2(net_3),
    .B1(rx_instxbaud_cnt[14]),
    .Y(net_6)
  );
  sky130_fd_sc_hd__and3_1 rx_instxbaud_cnt_sky130_fd_sc_hd__and3_1_A (
    .A(rx_instxbaud_cnt[11]),
    .B(rx_instxbaud_cnt[10]),
    .C(net_1),
    .X(net_2)
  );
  sky130_fd_sc_hd__and3_1 rx_instxbaud_cnt_sky130_fd_sc_hd__and3_1_A_1 (
    .A(rx_instxbaud_cnt[7]),
    .B(rx_instxbaud_cnt[8]),
    .C(net_218),
    .X(net_0)
  );
  sky130_fd_sc_hd__and3_1 rx_instxbaud_cnt_sky130_fd_sc_hd__and3_1_A_2 (
    .A(rx_instxbaud_cnt[4]),
    .B(rx_instxbaud_cnt[5]),
    .C(net_216),
    .X(net_217)
  );
  sky130_fd_sc_hd__and3_1 rx_instxbaud_cnt_sky130_fd_sc_hd__and3_1_A_3 (
    .A(rx_instxbaud_cnt[0]),
    .B(rx_instxbaud_cnt[2]),
    .C(rx_instxbaud_cnt[1]),
    .X(net_208)
  );
  sky130_fd_sc_hd__and4_1 rx_instxbaud_cnt_sky130_fd_sc_hd__and4_1_A (
    .A(rx_instxbaud_cnt[11]),
    .B(rx_instxbaud_cnt[10]),
    .C(rx_instxbaud_cnt[12]),
    .D(net_1),
    .X(net_3)
  );
  sky130_fd_sc_hd__and4_1 rx_instxbaud_cnt_sky130_fd_sc_hd__and4_1_A_1 (
    .A(rx_instxbaud_cnt[7]),
    .B(rx_instxbaud_cnt[8]),
    .C(rx_instxbaud_cnt[9]),
    .D(net_218),
    .X(net_1)
  );
  sky130_fd_sc_hd__and4_1 rx_instxbaud_cnt_sky130_fd_sc_hd__and4_1_A_2 (
    .A(rx_instxbaud_cnt[4]),
    .B(rx_instxbaud_cnt[6]),
    .C(rx_instxbaud_cnt[5]),
    .D(net_216),
    .X(net_218)
  );
  sky130_fd_sc_hd__and4_1 rx_instxbaud_cnt_sky130_fd_sc_hd__and4_1_A_3 (
    .A(rx_instxbaud_cnt[3]),
    .B(rx_instxbaud_cnt[0]),
    .C(rx_instxbaud_cnt[2]),
    .D(rx_instxbaud_cnt[1]),
    .X(net_216)
  );
  sky130_fd_sc_hd__clkinv_1 rx_instxbaud_cnt_sky130_fd_sc_hd__clkinv_1_A (
    .A(rx_instxbaud_cnt[13]),
    .Y(net_67)
  );
  sky130_fd_sc_hd__clkinv_1 rx_instxbaud_cnt_sky130_fd_sc_hd__clkinv_1_A_1 (
    .A(rx_instxbaud_cnt[14]),
    .Y(net_68)
  );
  sky130_fd_sc_hd__dfrtp_1 rx_instxbaud_cnt_sky130_fd_sc_hd__dfrtp_1_Q (
    .CLK(clk),
    .D(net_90),
    .Q(rx_instxbaud_cnt[1]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 rx_instxbaud_cnt_sky130_fd_sc_hd__dfrtp_1_Q_1 (
    .CLK(clk),
    .D(net_89),
    .Q(rx_instxbaud_cnt[0]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 rx_instxbaud_cnt_sky130_fd_sc_hd__dfrtp_1_Q_10 (
    .CLK(clk),
    .D(net_98),
    .Q(rx_instxbaud_cnt[9]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 rx_instxbaud_cnt_sky130_fd_sc_hd__dfrtp_1_Q_11 (
    .CLK(clk),
    .D(net_99),
    .Q(rx_instxbaud_cnt[10]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 rx_instxbaud_cnt_sky130_fd_sc_hd__dfrtp_1_Q_12 (
    .CLK(clk),
    .D(net_100),
    .Q(rx_instxbaud_cnt[11]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 rx_instxbaud_cnt_sky130_fd_sc_hd__dfrtp_1_Q_13 (
    .CLK(clk),
    .D(net_101),
    .Q(rx_instxbaud_cnt[12]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 rx_instxbaud_cnt_sky130_fd_sc_hd__dfrtp_1_Q_14 (
    .CLK(clk),
    .D(net_102),
    .Q(rx_instxbaud_cnt[13]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 rx_instxbaud_cnt_sky130_fd_sc_hd__dfrtp_1_Q_15 (
    .CLK(clk),
    .D(net_103),
    .Q(rx_instxbaud_cnt[14]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 rx_instxbaud_cnt_sky130_fd_sc_hd__dfrtp_1_Q_2 (
    .CLK(clk),
    .D(net_81),
    .Q(rx_instxbaud_cnt[15]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 rx_instxbaud_cnt_sky130_fd_sc_hd__dfrtp_1_Q_3 (
    .CLK(clk),
    .D(net_91),
    .Q(rx_instxbaud_cnt[2]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 rx_instxbaud_cnt_sky130_fd_sc_hd__dfrtp_1_Q_4 (
    .CLK(clk),
    .D(net_92),
    .Q(rx_instxbaud_cnt[3]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 rx_instxbaud_cnt_sky130_fd_sc_hd__dfrtp_1_Q_5 (
    .CLK(clk),
    .D(net_93),
    .Q(rx_instxbaud_cnt[4]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 rx_instxbaud_cnt_sky130_fd_sc_hd__dfrtp_1_Q_6 (
    .CLK(clk),
    .D(net_94),
    .Q(rx_instxbaud_cnt[5]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 rx_instxbaud_cnt_sky130_fd_sc_hd__dfrtp_1_Q_7 (
    .CLK(clk),
    .D(net_95),
    .Q(rx_instxbaud_cnt[6]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 rx_instxbaud_cnt_sky130_fd_sc_hd__dfrtp_1_Q_8 (
    .CLK(clk),
    .D(net_96),
    .Q(rx_instxbaud_cnt[7]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 rx_instxbaud_cnt_sky130_fd_sc_hd__dfrtp_1_Q_9 (
    .CLK(clk),
    .D(net_97),
    .Q(rx_instxbaud_cnt[8]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__nand2_1 rx_instxbaud_cnt_sky130_fd_sc_hd__nand2_1_A (
    .A(rx_instxbaud_cnt[13]),
    .B(rx_instxbaud_cnt[5]),
    .Y(net_7)
  );
  sky130_fd_sc_hd__nand4_1 rx_instxbaud_cnt_sky130_fd_sc_hd__nand4_1_A (
    .A(rx_instxbaud_cnt[11]),
    .B(rx_instxbaud_cnt[10]),
    .C(rx_instxbaud_cnt[12]),
    .D(net_1),
    .Y(net_4)
  );
  sky130_fd_sc_hd__nand4b_1 rx_instxbaud_cnt_sky130_fd_sc_hd__nand4b_1_B (
    .A_N(rx_instxbaud_cnt[11]),
    .B(rx_instxbaud_cnt[10]),
    .C(rx_instxbaud_cnt[4]),
    .D(rx_instxbaud_cnt[6]),
    .Y(net_206)
  );
  sky130_fd_sc_hd__nor2_1 rx_instxbaud_cnt_sky130_fd_sc_hd__nor2_1_A (
    .A(rx_instxbaud_cnt[0]),
    .B(net_166),
    .Y(net_89)
  );
  sky130_fd_sc_hd__nor2_1 rx_instxbaud_cnt_sky130_fd_sc_hd__nor2_1_A_1 (
    .A(rx_instxbaud_cnt[7]),
    .B(net_218),
    .Y(net_18)
  );
  sky130_fd_sc_hd__nor3_1 rx_instxbaud_cnt_sky130_fd_sc_hd__nor3_1_A (
    .A(rx_instxbaud_cnt[6]),
    .B(rx_instxbaud_cnt[12]),
    .C(net_7),
    .Y(net_8)
  );
  sky130_fd_sc_hd__nor4_1 rx_instxbaud_cnt_sky130_fd_sc_hd__nor4_1_A (
    .A(rx_instxbaud_cnt[3]),
    .B(rx_instxbaud_cnt[7]),
    .C(net_206),
    .D(net_210),
    .Y(net_211)
  );
  sky130_fd_sc_hd__nor4_1 rx_instxbaud_cnt_sky130_fd_sc_hd__nor4_1_A_1 (
    .A(rx_instxbaud_cnt[14]),
    .B(rx_instxbaud_cnt[8]),
    .C(rx_instxbaud_cnt[15]),
    .D(rx_instxbaud_cnt[9]),
    .Y(net_207)
  );
  sky130_fd_sc_hd__nor4bb_1 rx_instxbaud_cnt_sky130_fd_sc_hd__nor4bb_1_A (
    .A(rx_instxbaud_cnt[10]),
    .B(rx_instxbaud_cnt[4]),
    .C_N(rx_instxbaud_cnt[7]),
    .D_N(rx_instxbaud_cnt[11]),
    .Y(net_9)
  );
  sky130_fd_sc_hd__o31ai_1 rx_instxbaud_cnt_sky130_fd_sc_hd__o31ai_1_B1 (
    .A1(net_68),
    .A2(net_67),
    .A3(net_4),
    .B1(rx_instxbaud_cnt[15]),
    .Y(net_42)
  );
  sky130_fd_sc_hd__or4_1 rx_instxbaud_cnt_sky130_fd_sc_hd__or4_1_C (
    .A(net_68),
    .B(net_67),
    .C(rx_instxbaud_cnt[15]),
    .D(net_4),
    .X(net_43)
  );
  sky130_fd_sc_hd__xnor2_1 rx_instxbaud_cnt_sky130_fd_sc_hd__xnor2_1_A (
    .A(rx_instxbaud_cnt[4]),
    .B(net_216),
    .Y(net_21)
  );
  sky130_fd_sc_hd__and3_1 rx_instxbaud_tick_sky130_fd_sc_hd__and3_1_C (
    .A(rx_instxstate[0]),
    .B(rx_instxstate[1]),
    .C(rx_instxbaud_tick),
    .X(net_71)
  );
  sky130_fd_sc_hd__dfrtp_1 rx_instxbaud_tick_sky130_fd_sc_hd__dfrtp_1_Q (
    .CLK(clk),
    .D(net_80),
    .Q(rx_instxbaud_tick),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__nand2_1 rx_instxbaud_tick_sky130_fd_sc_hd__nand2_1_B (
    .A(rx_instxstate[1]),
    .B(rx_instxbaud_tick),
    .Y(net_167)
  );
  sky130_fd_sc_hd__nand2b_1 rx_instxbaud_tick_sky130_fd_sc_hd__nand2b_1_A_N (
    .A_N(rx_instxbaud_tick),
    .B(rx_instxstate[1]),
    .Y(net_178)
  );
  sky130_fd_sc_hd__dfrtp_1 rx_instxbit_cnt_sky130_fd_sc_hd__dfrtp_1_Q (
    .CLK(clk),
    .D(net_113),
    .Q(rx_instxbit_cnt[1]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 rx_instxbit_cnt_sky130_fd_sc_hd__dfrtp_1_Q_1 (
    .CLK(clk),
    .D(net_112),
    .Q(rx_instxbit_cnt[0]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 rx_instxbit_cnt_sky130_fd_sc_hd__dfrtp_1_Q_2 (
    .CLK(clk),
    .D(net_78),
    .Q(rx_instxbit_cnt[2]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__nand2_1 rx_instxbit_cnt_sky130_fd_sc_hd__nand2_1_A (
    .A(rx_instxbit_cnt[2]),
    .B(net_175),
    .Y(net_189)
  );
  sky130_fd_sc_hd__nand2_1 rx_instxbit_cnt_sky130_fd_sc_hd__nand2_1_A_1 (
    .A(rx_instxbit_cnt[0]),
    .B(net_173),
    .Y(net_177)
  );
  sky130_fd_sc_hd__nand2_1 rx_instxbit_cnt_sky130_fd_sc_hd__nand2_1_A_2 (
    .A(rx_instxbit_cnt[1]),
    .B(net_173),
    .Y(net_174)
  );
  sky130_fd_sc_hd__nand2_1 rx_instxbit_cnt_sky130_fd_sc_hd__nand2_1_A_3 (
    .A(rx_instxbit_cnt[0]),
    .B(rx_instxbit_cnt[1]),
    .Y(net_170)
  );
  sky130_fd_sc_hd__nand3_1 rx_instxbit_cnt_sky130_fd_sc_hd__nand3_1_A (
    .A(rx_instxbit_cnt[0]),
    .B(rx_instxbit_cnt[1]),
    .C(rx_instxbit_cnt[2]),
    .Y(net_171)
  );
  sky130_fd_sc_hd__nand3b_1 rx_instxbit_cnt_sky130_fd_sc_hd__nand3b_1_B (
    .A_N(rx_instxbit_cnt[1]),
    .B(rx_instxbit_cnt[2]),
    .C(rx_instxbit_cnt[0]),
    .Y(net_185)
  );
  sky130_fd_sc_hd__nand3b_1 rx_instxbit_cnt_sky130_fd_sc_hd__nand3b_1_B_1 (
    .A_N(rx_instxbit_cnt[0]),
    .B(rx_instxbit_cnt[1]),
    .C(rx_instxbit_cnt[2]),
    .Y(net_181)
  );
  sky130_fd_sc_hd__nor2_1 rx_instxbit_cnt_sky130_fd_sc_hd__nor2_1_A (
    .A(rx_instxbit_cnt[2]),
    .B(net_170),
    .Y(net_192)
  );
  sky130_fd_sc_hd__nor2_1 rx_instxbit_cnt_sky130_fd_sc_hd__nor2_1_A_1 (
    .A(rx_instxbit_cnt[0]),
    .B(rx_instxbit_cnt[1]),
    .Y(net_175)
  );
  sky130_fd_sc_hd__nor3b_1 rx_instxbit_cnt_sky130_fd_sc_hd__nor3b_1_A (
    .A(rx_instxbit_cnt[1]),
    .B(rx_instxbit_cnt[2]),
    .C_N(rx_instxbit_cnt[0]),
    .Y(net_201)
  );
  sky130_fd_sc_hd__nor3b_1 rx_instxbit_cnt_sky130_fd_sc_hd__nor3b_1_A_1 (
    .A(rx_instxbit_cnt[0]),
    .B(rx_instxbit_cnt[2]),
    .C_N(rx_instxbit_cnt[1]),
    .Y(net_197)
  );
  sky130_fd_sc_hd__nor4_1 rx_instxbit_cnt_sky130_fd_sc_hd__nor4_1_A (
    .A(rx_instxbit_cnt[0]),
    .B(rx_instxbit_cnt[1]),
    .C(rx_instxbit_cnt[2]),
    .D(net_179),
    .Y(net_204)
  );
  sky130_fd_sc_hd__o21ai_0 rx_instxbit_cnt_sky130_fd_sc_hd__o21ai_0_A1 (
    .A1(rx_instxbit_cnt[0]),
    .A2(net_169),
    .B1(net_177),
    .Y(net_112)
  );
  sky130_fd_sc_hd__a211o_1 rx_instxprev_rx_sky130_fd_sc_hd__a211o_1_A1 (
    .A1(rx_instxprev_rx),
    .A2(net_212),
    .B1(net_211),
    .C1(rx_instxstate[1]),
    .X(net_213)
  );
  sky130_fd_sc_hd__dfstp_2 rx_instxprev_rx_sky130_fd_sc_hd__dfstp_2_Q (
    .CLK(clk),
    .D(rx_instxrx),
    .Q(rx_instxprev_rx),
    .SET_B(rst_n)
  );
  sky130_fd_sc_hd__a21bo_1 rx_instxrx_sky130_fd_sc_hd__a21bo_1_X (
    .A1(tx_instxshifter[0]),
    .A2(net_63),
    .B1_N(net_62),
    .X(rx_instxrx)
  );
  sky130_fd_sc_hd__mux2_1 rx_instxrx_sky130_fd_sc_hd__mux2_1_A1 (
    .A0(data_out[7]),
    .A1(rx_instxrx),
    .S(net_172),
    .X(net_77)
  );
  sky130_fd_sc_hd__mux2i_1 rx_instxrx_sky130_fd_sc_hd__mux2i_1_A1 (
    .A0(rx_instxshifter[0]),
    .A1(rx_instxrx),
    .S(net_204),
    .Y(net_205)
  );
  sky130_fd_sc_hd__nand3_1 rx_instxrx_sky130_fd_sc_hd__nand3_1_A (
    .A(rx_instxrx),
    .B(net_168),
    .C(net_192),
    .Y(net_195)
  );
  sky130_fd_sc_hd__nor2_1 rx_instxrx_sky130_fd_sc_hd__nor2_1_A (
    .A(rx_instxrx),
    .B(net_189),
    .Y(net_190)
  );
  sky130_fd_sc_hd__nor2_1 rx_instxrx_sky130_fd_sc_hd__nor2_1_B (
    .A(rx_instxstate[0]),
    .B(rx_instxrx),
    .Y(net_212)
  );
  sky130_fd_sc_hd__nor2b_1 rx_instxrx_sky130_fd_sc_hd__nor2b_1_A (
    .A(rx_instxrx),
    .B_N(net_201),
    .Y(net_202)
  );
  sky130_fd_sc_hd__nor2b_1 rx_instxrx_sky130_fd_sc_hd__nor2b_1_A_1 (
    .A(rx_instxrx),
    .B_N(net_197),
    .Y(net_198)
  );
  sky130_fd_sc_hd__o211ai_1 rx_instxrx_sky130_fd_sc_hd__o211ai_1_A1 (
    .A1(rx_instxrx),
    .A2(net_185),
    .B1(net_186),
    .C1(net_168),
    .Y(net_187)
  );
  sky130_fd_sc_hd__o211ai_1 rx_instxrx_sky130_fd_sc_hd__o211ai_1_A1_1 (
    .A1(rx_instxrx),
    .A2(net_181),
    .B1(net_182),
    .C1(net_168),
    .Y(net_183)
  );
  sky130_fd_sc_hd__a21oi_1 rx_instxshifter_sky130_fd_sc_hd__a21oi_1_B1 (
    .A1(rx_instxbit_cnt[2]),
    .A2(net_175),
    .B1(rx_instxshifter[4]),
    .Y(net_191)
  );
  sky130_fd_sc_hd__dfrtp_1 rx_instxshifter_sky130_fd_sc_hd__dfrtp_1_Q (
    .CLK(clk),
    .D(net_111),
    .Q(rx_instxshifter[6]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 rx_instxshifter_sky130_fd_sc_hd__dfrtp_1_Q_1 (
    .CLK(clk),
    .D(net_110),
    .Q(rx_instxshifter[5]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 rx_instxshifter_sky130_fd_sc_hd__dfrtp_1_Q_2 (
    .CLK(clk),
    .D(net_109),
    .Q(rx_instxshifter[4]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 rx_instxshifter_sky130_fd_sc_hd__dfrtp_1_Q_3 (
    .CLK(clk),
    .D(net_108),
    .Q(rx_instxshifter[3]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 rx_instxshifter_sky130_fd_sc_hd__dfrtp_1_Q_4 (
    .CLK(clk),
    .D(net_107),
    .Q(rx_instxshifter[2]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 rx_instxshifter_sky130_fd_sc_hd__dfrtp_1_Q_5 (
    .CLK(clk),
    .D(net_106),
    .Q(rx_instxshifter[1]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 rx_instxshifter_sky130_fd_sc_hd__dfrtp_1_Q_6 (
    .CLK(clk),
    .D(net_105),
    .Q(rx_instxshifter[0]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__nand2_1 rx_instxshifter_sky130_fd_sc_hd__nand2_1_A (
    .A(rx_instxshifter[1]),
    .B(net_179),
    .Y(net_200)
  );
  sky130_fd_sc_hd__nand2_1 rx_instxshifter_sky130_fd_sc_hd__nand2_1_A_1 (
    .A(rx_instxshifter[2]),
    .B(net_179),
    .Y(net_196)
  );
  sky130_fd_sc_hd__nand2_1 rx_instxshifter_sky130_fd_sc_hd__nand2_1_A_2 (
    .A(rx_instxshifter[4]),
    .B(net_179),
    .Y(net_188)
  );
  sky130_fd_sc_hd__nand2_1 rx_instxshifter_sky130_fd_sc_hd__nand2_1_A_3 (
    .A(rx_instxshifter[5]),
    .B(net_179),
    .Y(net_184)
  );
  sky130_fd_sc_hd__nand2_1 rx_instxshifter_sky130_fd_sc_hd__nand2_1_A_4 (
    .A(rx_instxshifter[6]),
    .B(net_179),
    .Y(net_180)
  );
  sky130_fd_sc_hd__nand2b_1 rx_instxshifter_sky130_fd_sc_hd__nand2b_1_A_N (
    .A_N(rx_instxshifter[5]),
    .B(net_185),
    .Y(net_186)
  );
  sky130_fd_sc_hd__nand2b_1 rx_instxshifter_sky130_fd_sc_hd__nand2b_1_A_N_1 (
    .A_N(rx_instxshifter[6]),
    .B(net_181),
    .Y(net_182)
  );
  sky130_fd_sc_hd__o21ai_0 rx_instxshifter_sky130_fd_sc_hd__o21ai_0_A1 (
    .A1(rx_instxshifter[1]),
    .A2(net_201),
    .B1(net_168),
    .Y(net_203)
  );
  sky130_fd_sc_hd__o21ai_0 rx_instxshifter_sky130_fd_sc_hd__o21ai_0_A1_1 (
    .A1(rx_instxshifter[2]),
    .A2(net_197),
    .B1(net_168),
    .Y(net_199)
  );
  sky130_fd_sc_hd__o21ai_0 rx_instxshifter_sky130_fd_sc_hd__o21ai_0_B1 (
    .A1(net_179),
    .A2(net_193),
    .B1(rx_instxshifter[3]),
    .Y(net_194)
  );
  sky130_fd_sc_hd__a21oi_1 rx_instxstate_sky130_fd_sc_hd__a21oi_1_A1 (
    .A1(rx_instxstate[1]),
    .A2(net_171),
    .B1(net_179),
    .Y(net_215)
  );
  sky130_fd_sc_hd__a22o_1 rx_instxstate_sky130_fd_sc_hd__a22o_1_A1 (
    .A1(rx_instxstate[0]),
    .A2(net_214),
    .B1(net_215),
    .B2(net_213),
    .X(net_104)
  );
  sky130_fd_sc_hd__dfrtp_1 rx_instxstate_sky130_fd_sc_hd__dfrtp_1_Q (
    .CLK(clk),
    .D(net_79),
    .Q(rx_instxstate[1]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 rx_instxstate_sky130_fd_sc_hd__dfrtp_1_Q_1 (
    .CLK(clk),
    .D(net_104),
    .Q(rx_instxstate[0]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__nand2b_1 rx_instxstate_sky130_fd_sc_hd__nand2b_1_A_N (
    .A_N(rx_instxstate[0]),
    .B(net_178),
    .Y(net_179)
  );
  sky130_fd_sc_hd__nor2_1 rx_instxstate_sky130_fd_sc_hd__nor2_1_A (
    .A(rx_instxstate[0]),
    .B(net_167),
    .Y(net_168)
  );
  sky130_fd_sc_hd__nor2_1 rx_instxstate_sky130_fd_sc_hd__nor2_1_A_1 (
    .A(rx_instxstate[0]),
    .B(rx_instxstate[1]),
    .Y(net_166)
  );
  sky130_fd_sc_hd__nor4bb_1 rx_instxstate_sky130_fd_sc_hd__nor4bb_1_D_N (
    .A(rx_instxbaud_cnt[13]),
    .B(rx_instxbaud_cnt[5]),
    .C_N(rx_instxbaud_cnt[12]),
    .D_N(rx_instxstate[0]),
    .Y(net_209)
  );
  sky130_fd_sc_hd__or2_0 rx_instxstate_sky130_fd_sc_hd__or2_0_A (
    .A(rx_instxstate[0]),
    .B(net_167),
    .X(net_169)
  );
  sky130_fd_sc_hd__clkinv_1 tx_busy_sky130_fd_sc_hd__clkinv_1_Y (
    .A(net_64),
    .Y(tx_busy)
  );
  sky130_fd_sc_hd__nand2_1 tx_busy_sky130_fd_sc_hd__nand2_1_A (
    .A(tx_busy),
    .B(net_146),
    .Y(net_147)
  );
  sky130_fd_sc_hd__o21ai_0 tx_busy_sky130_fd_sc_hd__o21ai_0_B1 (
    .A1(tx_instxbit_cnt[0]),
    .A2(net_160),
    .B1(tx_busy),
    .Y(net_165)
  );
  sky130_fd_sc_hd__o21ai_0 tx_busy_sky130_fd_sc_hd__o21ai_0_B1_1 (
    .A1(tx_instxbaud_cnt[0]),
    .A2(tx_instxbaud_cnt[1]),
    .B1(tx_busy),
    .Y(net_159)
  );
  sky130_fd_sc_hd__o21ai_0 tx_busy_sky130_fd_sc_hd__o21ai_0_B1_2 (
    .A1(tx_instxbaud_cnt[6]),
    .A2(net_53),
    .B1(tx_busy),
    .Y(net_154)
  );
  sky130_fd_sc_hd__o21ai_0 tx_busy_sky130_fd_sc_hd__o21ai_0_B1_3 (
    .A1(tx_instxbaud_cnt[10]),
    .A2(net_50),
    .B1(tx_busy),
    .Y(net_150)
  );
  sky130_fd_sc_hd__dfrtp_1 tx_done_sky130_fd_sc_hd__dfrtp_1_Q (
    .CLK(clk),
    .D(net_70),
    .Q(tx_done),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__a211oi_1 tx_instxbaud_cnt_sky130_fd_sc_hd__a211oi_1_A1 (
    .A1(tx_instxbaud_cnt[7]),
    .A2(net_52),
    .B1(net_147),
    .C1(net_153),
    .Y(net_131)
  );
  sky130_fd_sc_hd__a211oi_1 tx_instxbaud_cnt_sky130_fd_sc_hd__a211oi_1_A1_1 (
    .A1(tx_instxbaud_cnt[13]),
    .A2(net_48),
    .B1(net_141),
    .C1(net_147),
    .Y(net_137)
  );
  sky130_fd_sc_hd__a21oi_1 tx_instxbaud_cnt_sky130_fd_sc_hd__a21oi_1_A1 (
    .A1(tx_instxbaud_cnt[0]),
    .A2(tx_instxbaud_cnt[1]),
    .B1(net_159),
    .Y(net_125)
  );
  sky130_fd_sc_hd__a21oi_1 tx_instxbaud_cnt_sky130_fd_sc_hd__a21oi_1_A1_1 (
    .A1(tx_instxbaud_cnt[0]),
    .A2(tx_instxbaud_cnt[1]),
    .B1(tx_instxbaud_cnt[2]),
    .Y(net_158)
  );
  sky130_fd_sc_hd__a21oi_1 tx_instxbaud_cnt_sky130_fd_sc_hd__a21oi_1_A1_2 (
    .A1(tx_instxbaud_cnt[4]),
    .A2(net_54),
    .B1(tx_instxbaud_cnt[5]),
    .Y(net_155)
  );
  sky130_fd_sc_hd__a21oi_1 tx_instxbaud_cnt_sky130_fd_sc_hd__a21oi_1_A1_3 (
    .A1(tx_instxbaud_cnt[7]),
    .A2(net_52),
    .B1(tx_instxbaud_cnt[8]),
    .Y(net_152)
  );
  sky130_fd_sc_hd__a21oi_1 tx_instxbaud_cnt_sky130_fd_sc_hd__a21oi_1_A1_4 (
    .A1(tx_instxbaud_cnt[10]),
    .A2(net_50),
    .B1(net_150),
    .Y(net_134)
  );
  sky130_fd_sc_hd__a21oi_1 tx_instxbaud_cnt_sky130_fd_sc_hd__a21oi_1_A1_5 (
    .A1(tx_instxbaud_cnt[10]),
    .A2(net_50),
    .B1(tx_instxbaud_cnt[11]),
    .Y(net_149)
  );
  sky130_fd_sc_hd__a21oi_1 tx_instxbaud_cnt_sky130_fd_sc_hd__a21oi_1_A1_6 (
    .A1(tx_instxbaud_cnt[13]),
    .A2(net_48),
    .B1(tx_instxbaud_cnt[14]),
    .Y(net_140)
  );
  sky130_fd_sc_hd__and3_1 tx_instxbaud_cnt_sky130_fd_sc_hd__and3_1_A (
    .A(tx_instxbaud_cnt[10]),
    .B(tx_instxbaud_cnt[11]),
    .C(net_50),
    .X(net_49)
  );
  sky130_fd_sc_hd__and3_1 tx_instxbaud_cnt_sky130_fd_sc_hd__and3_1_A_1 (
    .A(tx_instxbaud_cnt[7]),
    .B(tx_instxbaud_cnt[8]),
    .C(net_52),
    .X(net_51)
  );
  sky130_fd_sc_hd__and3_1 tx_instxbaud_cnt_sky130_fd_sc_hd__and3_1_A_2 (
    .A(tx_instxbaud_cnt[5]),
    .B(tx_instxbaud_cnt[4]),
    .C(net_54),
    .X(net_53)
  );
  sky130_fd_sc_hd__and3_1 tx_instxbaud_cnt_sky130_fd_sc_hd__and3_1_A_3 (
    .A(tx_instxbaud_cnt[2]),
    .B(tx_instxbaud_cnt[0]),
    .C(tx_instxbaud_cnt[1]),
    .X(net_55)
  );
  sky130_fd_sc_hd__and4_1 tx_instxbaud_cnt_sky130_fd_sc_hd__and4_1_A (
    .A(tx_instxbaud_cnt[12]),
    .B(tx_instxbaud_cnt[10]),
    .C(tx_instxbaud_cnt[11]),
    .D(net_50),
    .X(net_48)
  );
  sky130_fd_sc_hd__and4_1 tx_instxbaud_cnt_sky130_fd_sc_hd__and4_1_A_1 (
    .A(tx_instxbaud_cnt[7]),
    .B(tx_instxbaud_cnt[8]),
    .C(tx_instxbaud_cnt[9]),
    .D(net_52),
    .X(net_50)
  );
  sky130_fd_sc_hd__and4_1 tx_instxbaud_cnt_sky130_fd_sc_hd__and4_1_A_2 (
    .A(tx_instxbaud_cnt[5]),
    .B(tx_instxbaud_cnt[4]),
    .C(tx_instxbaud_cnt[6]),
    .D(net_54),
    .X(net_52)
  );
  sky130_fd_sc_hd__and4_1 tx_instxbaud_cnt_sky130_fd_sc_hd__and4_1_A_3 (
    .A(tx_instxbaud_cnt[2]),
    .B(tx_instxbaud_cnt[3]),
    .C(tx_instxbaud_cnt[0]),
    .D(tx_instxbaud_cnt[1]),
    .X(net_54)
  );
  sky130_fd_sc_hd__clkinv_1 tx_instxbaud_cnt_sky130_fd_sc_hd__clkinv_1_A (
    .A(tx_instxbaud_cnt[14]),
    .Y(net_69)
  );
  sky130_fd_sc_hd__clkinv_1 tx_instxbaud_cnt_sky130_fd_sc_hd__clkinv_1_A_1 (
    .A(tx_instxbaud_cnt[13]),
    .Y(net_65)
  );
  sky130_fd_sc_hd__dfrtp_1 tx_instxbaud_cnt_sky130_fd_sc_hd__dfrtp_1_Q (
    .CLK(clk),
    .D(net_74),
    .Q(tx_instxbaud_cnt[15]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 tx_instxbaud_cnt_sky130_fd_sc_hd__dfrtp_1_Q_1 (
    .CLK(clk),
    .D(net_126),
    .Q(tx_instxbaud_cnt[2]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 tx_instxbaud_cnt_sky130_fd_sc_hd__dfrtp_1_Q_10 (
    .CLK(clk),
    .D(net_135),
    .Q(tx_instxbaud_cnt[11]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 tx_instxbaud_cnt_sky130_fd_sc_hd__dfrtp_1_Q_11 (
    .CLK(clk),
    .D(net_136),
    .Q(tx_instxbaud_cnt[12]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 tx_instxbaud_cnt_sky130_fd_sc_hd__dfrtp_1_Q_12 (
    .CLK(clk),
    .D(net_137),
    .Q(tx_instxbaud_cnt[13]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 tx_instxbaud_cnt_sky130_fd_sc_hd__dfrtp_1_Q_13 (
    .CLK(clk),
    .D(net_138),
    .Q(tx_instxbaud_cnt[14]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 tx_instxbaud_cnt_sky130_fd_sc_hd__dfrtp_1_Q_14 (
    .CLK(clk),
    .D(net_124),
    .Q(tx_instxbaud_cnt[0]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 tx_instxbaud_cnt_sky130_fd_sc_hd__dfrtp_1_Q_15 (
    .CLK(clk),
    .D(net_125),
    .Q(tx_instxbaud_cnt[1]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 tx_instxbaud_cnt_sky130_fd_sc_hd__dfrtp_1_Q_2 (
    .CLK(clk),
    .D(net_127),
    .Q(tx_instxbaud_cnt[3]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 tx_instxbaud_cnt_sky130_fd_sc_hd__dfrtp_1_Q_3 (
    .CLK(clk),
    .D(net_128),
    .Q(tx_instxbaud_cnt[4]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 tx_instxbaud_cnt_sky130_fd_sc_hd__dfrtp_1_Q_4 (
    .CLK(clk),
    .D(net_129),
    .Q(tx_instxbaud_cnt[5]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 tx_instxbaud_cnt_sky130_fd_sc_hd__dfrtp_1_Q_5 (
    .CLK(clk),
    .D(net_130),
    .Q(tx_instxbaud_cnt[6]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 tx_instxbaud_cnt_sky130_fd_sc_hd__dfrtp_1_Q_6 (
    .CLK(clk),
    .D(net_131),
    .Q(tx_instxbaud_cnt[7]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 tx_instxbaud_cnt_sky130_fd_sc_hd__dfrtp_1_Q_7 (
    .CLK(clk),
    .D(net_132),
    .Q(tx_instxbaud_cnt[8]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 tx_instxbaud_cnt_sky130_fd_sc_hd__dfrtp_1_Q_8 (
    .CLK(clk),
    .D(net_133),
    .Q(tx_instxbaud_cnt[9]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 tx_instxbaud_cnt_sky130_fd_sc_hd__dfrtp_1_Q_9 (
    .CLK(clk),
    .D(net_134),
    .Q(tx_instxbaud_cnt[10]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__nand3b_1 tx_instxbaud_cnt_sky130_fd_sc_hd__nand3b_1_A_N (
    .A_N(tx_instxbaud_cnt[4]),
    .B(net_54),
    .C(net_145),
    .Y(net_146)
  );
  sky130_fd_sc_hd__nand4_1 tx_instxbaud_cnt_sky130_fd_sc_hd__nand4_1_A (
    .A(tx_instxbaud_cnt[7]),
    .B(tx_instxbaud_cnt[13]),
    .C(net_142),
    .D(net_143),
    .Y(net_144)
  );
  sky130_fd_sc_hd__nand4_1 tx_instxbaud_cnt_sky130_fd_sc_hd__nand4_1_A_1 (
    .A(tx_instxbaud_cnt[12]),
    .B(tx_instxbaud_cnt[10]),
    .C(tx_instxbaud_cnt[11]),
    .D(net_50),
    .Y(net_47)
  );
  sky130_fd_sc_hd__nor2_1 tx_instxbaud_cnt_sky130_fd_sc_hd__nor2_1_A (
    .A(tx_instxbaud_cnt[0]),
    .B(net_64),
    .Y(net_124)
  );
  sky130_fd_sc_hd__nor2_1 tx_instxbaud_cnt_sky130_fd_sc_hd__nor2_1_A_1 (
    .A(tx_instxbaud_cnt[3]),
    .B(net_55),
    .Y(net_157)
  );
  sky130_fd_sc_hd__nor2_1 tx_instxbaud_cnt_sky130_fd_sc_hd__nor2_1_A_2 (
    .A(tx_instxbaud_cnt[7]),
    .B(net_52),
    .Y(net_153)
  );
  sky130_fd_sc_hd__nor2_1 tx_instxbaud_cnt_sky130_fd_sc_hd__nor2_1_A_3 (
    .A(tx_instxbaud_cnt[9]),
    .B(net_51),
    .Y(net_151)
  );
  sky130_fd_sc_hd__nor2_1 tx_instxbaud_cnt_sky130_fd_sc_hd__nor2_1_A_4 (
    .A(tx_instxbaud_cnt[12]),
    .B(net_49),
    .Y(net_148)
  );
  sky130_fd_sc_hd__nor2_1 tx_instxbaud_cnt_sky130_fd_sc_hd__nor2_1_A_5 (
    .A(tx_instxbaud_cnt[10]),
    .B(tx_instxbaud_cnt[8]),
    .Y(net_142)
  );
  sky130_fd_sc_hd__nor2_1 tx_instxbaud_cnt_sky130_fd_sc_hd__nor2_1_A_6 (
    .A(tx_instxbaud_cnt[13]),
    .B(net_48),
    .Y(net_141)
  );
  sky130_fd_sc_hd__nor4b_1 tx_instxbaud_cnt_sky130_fd_sc_hd__nor4b_1_A (
    .A(tx_instxbaud_cnt[9]),
    .B(net_144),
    .C(tx_instxbaud_cnt[6]),
    .D_N(tx_instxbaud_cnt[11]),
    .Y(net_145)
  );
  sky130_fd_sc_hd__nor4b_1 tx_instxbaud_cnt_sky130_fd_sc_hd__nor4b_1_A_1 (
    .A(tx_instxbaud_cnt[15]),
    .B(tx_instxbaud_cnt[14]),
    .C(tx_instxbaud_cnt[12]),
    .D_N(tx_instxbaud_cnt[5]),
    .Y(net_143)
  );
  sky130_fd_sc_hd__o31ai_1 tx_instxbaud_cnt_sky130_fd_sc_hd__o31ai_1_B1 (
    .A1(net_69),
    .A2(net_65),
    .A3(net_47),
    .B1(tx_instxbaud_cnt[15]),
    .Y(net_45)
  );
  sky130_fd_sc_hd__or4_1 tx_instxbaud_cnt_sky130_fd_sc_hd__or4_1_A (
    .A(tx_instxbaud_cnt[15]),
    .B(net_69),
    .C(net_65),
    .D(net_47),
    .X(net_46)
  );
  sky130_fd_sc_hd__xnor2_1 tx_instxbaud_cnt_sky130_fd_sc_hd__xnor2_1_A (
    .A(tx_instxbaud_cnt[4]),
    .B(net_54),
    .Y(net_156)
  );
  sky130_fd_sc_hd__a21oi_1 tx_instxbaud_tick_sky130_fd_sc_hd__a21oi_1_A1 (
    .A1(tx_instxbaud_tick),
    .A2(tx_busy),
    .B1(net_60),
    .Y(net_58)
  );
  sky130_fd_sc_hd__a21oi_1 tx_instxbaud_tick_sky130_fd_sc_hd__a21oi_1_A2 (
    .A1(tx_instxstate[0]),
    .A2(tx_instxbaud_tick),
    .B1(net_56),
    .Y(net_139)
  );
  sky130_fd_sc_hd__and2_0 tx_instxbaud_tick_sky130_fd_sc_hd__and2_0_A (
    .A(tx_instxbaud_tick),
    .B(net_63),
    .X(net_160)
  );
  sky130_fd_sc_hd__and3_1 tx_instxbaud_tick_sky130_fd_sc_hd__and3_1_C (
    .A(tx_instxstate[0]),
    .B(tx_instxstate[1]),
    .C(tx_instxbaud_tick),
    .X(net_70)
  );
  sky130_fd_sc_hd__dfrtp_1 tx_instxbaud_tick_sky130_fd_sc_hd__dfrtp_1_Q (
    .CLK(clk),
    .D(net_76),
    .Q(tx_instxbaud_tick),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__nand2_1 tx_instxbaud_tick_sky130_fd_sc_hd__nand2_1_A (
    .A(tx_instxbaud_tick),
    .B(net_63),
    .Y(net_161)
  );
  sky130_fd_sc_hd__a21oi_1 tx_instxbit_cnt_sky130_fd_sc_hd__a21oi_1_A1 (
    .A1(tx_instxbit_cnt[0]),
    .A2(net_160),
    .B1(tx_instxbit_cnt[1]),
    .Y(net_164)
  );
  sky130_fd_sc_hd__a31oi_1 tx_instxbit_cnt_sky130_fd_sc_hd__a31oi_1_A1 (
    .A1(tx_instxbit_cnt[0]),
    .A2(net_61),
    .A3(net_160),
    .B1(net_165),
    .Y(net_122)
  );
  sky130_fd_sc_hd__clkinv_1 tx_instxbit_cnt_sky130_fd_sc_hd__clkinv_1_A (
    .A(tx_instxbit_cnt[2]),
    .Y(net_66)
  );
  sky130_fd_sc_hd__dfrtp_1 tx_instxbit_cnt_sky130_fd_sc_hd__dfrtp_1_Q (
    .CLK(clk),
    .D(net_75),
    .Q(tx_instxbit_cnt[2]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 tx_instxbit_cnt_sky130_fd_sc_hd__dfrtp_1_Q_1 (
    .CLK(clk),
    .D(net_123),
    .Q(tx_instxbit_cnt[1]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 tx_instxbit_cnt_sky130_fd_sc_hd__dfrtp_1_Q_2 (
    .CLK(clk),
    .D(net_122),
    .Q(tx_instxbit_cnt[0]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__nand3_1 tx_instxbit_cnt_sky130_fd_sc_hd__nand3_1_A (
    .A(tx_instxbit_cnt[0]),
    .B(tx_instxbit_cnt[1]),
    .C(net_160),
    .Y(net_162)
  );
  sky130_fd_sc_hd__nand3_1 tx_instxbit_cnt_sky130_fd_sc_hd__nand3_1_A_1 (
    .A(tx_instxbit_cnt[2]),
    .B(tx_instxbit_cnt[0]),
    .C(tx_instxbit_cnt[1]),
    .Y(net_61)
  );
  sky130_fd_sc_hd__nor2_1 tx_instxbit_cnt_sky130_fd_sc_hd__nor2_1_A (
    .A(tx_instxbit_cnt[2]),
    .B(net_162),
    .Y(net_163)
  );
  sky130_fd_sc_hd__a22oi_1 tx_instxshifter_sky130_fd_sc_hd__a22oi_1_A1 (
    .A1(tx_instxshifter[4]),
    .A2(net_160),
    .B1(net_25),
    .B2(tx_instxshifter[3]),
    .Y(net_35)
  );
  sky130_fd_sc_hd__a22oi_1 tx_instxshifter_sky130_fd_sc_hd__a22oi_1_A1_1 (
    .A1(tx_instxshifter[5]),
    .A2(net_160),
    .B1(net_25),
    .B2(tx_instxshifter[4]),
    .Y(net_33)
  );
  sky130_fd_sc_hd__a22oi_1 tx_instxshifter_sky130_fd_sc_hd__a22oi_1_A1_2 (
    .A1(tx_instxshifter[6]),
    .A2(net_160),
    .B1(net_25),
    .B2(tx_instxshifter[5]),
    .Y(net_31)
  );
  sky130_fd_sc_hd__dfrtp_1 tx_instxshifter_sky130_fd_sc_hd__dfrtp_1_Q (
    .CLK(clk),
    .D(net_72),
    .Q(tx_instxshifter[7]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 tx_instxshifter_sky130_fd_sc_hd__dfrtp_1_Q_1 (
    .CLK(clk),
    .D(net_88),
    .Q(tx_instxshifter[6]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 tx_instxshifter_sky130_fd_sc_hd__dfrtp_1_Q_2 (
    .CLK(clk),
    .D(net_87),
    .Q(tx_instxshifter[5]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 tx_instxshifter_sky130_fd_sc_hd__dfrtp_1_Q_3 (
    .CLK(clk),
    .D(net_86),
    .Q(tx_instxshifter[4]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 tx_instxshifter_sky130_fd_sc_hd__dfrtp_1_Q_4 (
    .CLK(clk),
    .D(net_85),
    .Q(tx_instxshifter[3]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 tx_instxshifter_sky130_fd_sc_hd__dfrtp_1_Q_5 (
    .CLK(clk),
    .D(net_84),
    .Q(tx_instxshifter[2]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 tx_instxshifter_sky130_fd_sc_hd__dfrtp_1_Q_6 (
    .CLK(clk),
    .D(net_83),
    .Q(tx_instxshifter[1]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 tx_instxshifter_sky130_fd_sc_hd__dfrtp_1_Q_7 (
    .CLK(clk),
    .D(net_82),
    .Q(tx_instxshifter[0]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__nor2_1 tx_instxshifter_sky130_fd_sc_hd__nor2_1_A (
    .A(tx_instxshifter[1]),
    .B(net_161),
    .Y(net_40)
  );
  sky130_fd_sc_hd__nor2_1 tx_instxshifter_sky130_fd_sc_hd__nor2_1_A_1 (
    .A(tx_instxshifter[2]),
    .B(net_161),
    .Y(net_38)
  );
  sky130_fd_sc_hd__nor2_1 tx_instxshifter_sky130_fd_sc_hd__nor2_1_A_2 (
    .A(tx_instxshifter[3]),
    .B(net_161),
    .Y(net_36)
  );
  sky130_fd_sc_hd__nor2_1 tx_instxshifter_sky130_fd_sc_hd__nor2_1_A_3 (
    .A(tx_instxshifter[7]),
    .B(net_161),
    .Y(net_29)
  );
  sky130_fd_sc_hd__nor2_1 tx_instxshifter_sky130_fd_sc_hd__nor2_1_A_4 (
    .A(tx_instxshifter[6]),
    .B(net_26),
    .Y(net_27)
  );
  sky130_fd_sc_hd__dfrtp_1 tx_instxstate_sky130_fd_sc_hd__dfrtp_1_Q (
    .CLK(clk),
    .D(net_73),
    .Q(tx_instxstate[1]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 tx_instxstate_sky130_fd_sc_hd__dfrtp_1_Q_1 (
    .CLK(clk),
    .D(net_139),
    .Q(tx_instxstate[0]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__mux2_1 tx_instxstate_sky130_fd_sc_hd__mux2_1_A0 (
    .A0(tx_instxstate[1]),
    .A1(net_62),
    .S(net_57),
    .X(net_73)
  );
  sky130_fd_sc_hd__nor2_1 tx_instxstate_sky130_fd_sc_hd__nor2_1_A (
    .A(tx_instxstate[0]),
    .B(net_57),
    .Y(net_56)
  );
  sky130_fd_sc_hd__nor2_1 tx_instxstate_sky130_fd_sc_hd__nor2_1_A_1 (
    .A(tx_instxstate[0]),
    .B(tx_instxstate[1]),
    .Y(net_64)
  );
  sky130_fd_sc_hd__nor2b_1 tx_instxstate_sky130_fd_sc_hd__nor2b_1_A (
    .A(tx_instxstate[0]),
    .B_N(tx_instxstate[1]),
    .Y(net_63)
  );
  sky130_fd_sc_hd__xor2_1 tx_instxstate_sky130_fd_sc_hd__xor2_1_A (
    .A(tx_instxstate[0]),
    .B(tx_instxstate[1]),
    .X(net_62)
  );
  sky130_fd_sc_hd__and2_0 tx_start_sky130_fd_sc_hd__and2_0_A (
    .A(tx_start),
    .B(net_64),
    .X(net_60)
  );
  sky130_fd_sc_hd__nand2_1 tx_start_sky130_fd_sc_hd__nand2_1_A (
    .A(tx_start),
    .B(net_64),
    .Y(net_59)
  );
endmodule
