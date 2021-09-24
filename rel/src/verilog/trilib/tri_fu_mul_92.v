// © IBM Corp. 2020
// Licensed under the Apache License, Version 2.0 (the "License"), as modified by
// the terms below; you may not use the files in this repository except in
// compliance with the License as modified.
// You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
//
// Modified Terms:
//
//    1) For the purpose of the patent license granted to you in Section 3 of the
//    License, the "Work" hereby includes implementations of the work of authorship
//    in physical form.
//
//    2) Notwithstanding any terms to the contrary in the License, any licenses
//    necessary for implementation of the Work that are available from OpenPOWER
//    via the Power ISA End User License Agreement (EULA) are explicitly excluded
//    hereunder, and may be obtained from OpenPOWER under the terms and conditions
//    of the EULA.  
//
// Unless required by applicable law or agreed to in writing, the reference design
// distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
// WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License
// for the specific language governing permissions and limitations under the License.
// 
// Additional rights, including the ability to physically implement a softcore that
// is compliant with the required sections of the Power ISA Specification, are
// available at no cost under the terms of the OpenPOWER Power ISA EULA, which can be
// obtained (along with the Power ISA) here: https://openpowerfoundation.org. 

`timescale 1 ns / 1 ns

// *!****************************************************************
// *! FILE NAME    :  tri_fu_mul_92.v
// *! DESCRIPTION  :  double precision 9:2 compressor
// *!****************************************************************

   `include "tri_a2o.vh"


module tri_fu_mul_92(
   vdd,
   gnd,
   nclk,
   si,
   so,
   ex2_act,
   lcb_delay_lclkr,
   lcb_mpw1_b,
   lcb_mpw2_b,
   thold_b,
   force_t,
   lcb_sg,
   c_frac,
   a_frac,
   hot_one_out,
   sum92,
   car92
);
   parameter     inst = 0;
   inout         vdd;
   inout         gnd;
   input  [0:`NCLK_WIDTH-1]         nclk;		//perv
   input         si;		//perv
   output        so;		//perv
   input         ex2_act;		//act
   input         lcb_delay_lclkr;		//perv
   input         lcb_mpw1_b;		//perv
   input         lcb_mpw2_b;		//perv
   input         thold_b;		//lcbor
   input         force_t;		//lcbor
   input         lcb_sg;		//perv
   input [0:53]  c_frac;		// Multiplicand
   input [17:35] a_frac;		// Multiplier
   output        hot_one_out;
   output [2:74] sum92;
   output [1:74] car92;

   // ENTITY


   parameter     tiup = 1'b1;
   parameter     tidn = 1'b0;

   wire [0:8]    s_neg;
   wire [0:8]    s_x;
   wire [0:8]    s_x2;
   wire [0:7]    xtd_2_add;
   wire          hot_one_din;
   wire          hot_one_out_b;

   wire [2:60]   pp0_00;
   wire [4:62]   pp0_01;
   wire [6:64]   pp0_02;
   wire [8:66]   pp0_03;
   wire [10:68]  pp0_04;
   wire [12:70]  pp0_05;
   wire [14:72]  pp0_06;
   wire [16:74]  pp0_07;
   wire [17:74]  pp0_08;		// missing the hot one from neighbor 9:2
   wire [14:74]  pp1_05;		// sum
   wire [15:74]  pp1_04;		// car
   wire [8:70]   pp1_03;		// sum
   wire [9:68]   pp1_02;		// car
   wire [2:64]   pp1_01;		// sum
   wire [3:62]   pp1_00;		// car
   wire [8:74]   pp2_03;		// sum
   wire [13:74]  pp2_02;		// car
   wire [2:68]   pp2_01;		// sum
   wire [2:64]   pp2_00;		// car
   wire [2:74]   pp3_01;		// sum
   wire [1:74]   pp3_00;		// car
   wire [7:63]   pp3_00_ko;		// ko
   wire [2:74]   pp3_01_q_b;
   wire [1:74]   pp3_00_q_b;

   wire [0:72]   pp3_lat_sum_so;
   wire [0:70]   pp3_lat_car_so;
   wire          mul92_d1clk;
   wire          mul92_d2clk;
   wire   [0:`NCLK_WIDTH-1]         mul92_lclk;

   wire          unused;

   assign unused = pp0_00[2] | pp0_00[3] | pp0_00[59] | pp0_01[4] | pp0_01[61] | pp0_02[63] | pp0_02[6] | pp0_03[65] | pp0_03[8] | pp0_04[10] | pp0_04[67] | pp0_05[12] | pp0_05[69] | pp0_06[14] | pp0_06[71] | pp0_07[16] | pp0_07[73] | pp1_00[60] | pp1_00[61] | pp1_01[63] | pp1_02[66] | pp1_02[67] | pp1_03[69] | pp1_03[8] | pp1_04[72] | pp1_04[73] | pp1_05[14] | pp2_00[62] | pp2_00[63] | pp2_01[66] | pp2_01[67] | pp2_02[70] | pp2_02[72] | pp2_02[73] | pp2_03[8] | pp3_00[68] | pp3_00[70] | pp3_00[72] | pp3_00[73];

   ////##################################################
   ////# Booth Decoders
   ////##################################################

   tri_fu_mul_bthdcd bd_00(
      .i0(a_frac[17]),		//i--
      .i1(a_frac[18]),		//i--
      .i2(a_frac[19]),		//i--
      .s_neg(s_neg[0]),		//o--
      .s_x(s_x[0]),		//o--
      .s_x2(s_x2[0])		//o--
   );


   tri_fu_mul_bthdcd bd_01(
      .i0(a_frac[19]),		//i--
      .i1(a_frac[20]),		//i--
      .i2(a_frac[21]),		//i--
      .s_neg(s_neg[1]),		//o--
      .s_x(s_x[1]),		//o--
      .s_x2(s_x2[1])		//o--
   );


   tri_fu_mul_bthdcd bd_02(
      .i0(a_frac[21]),		//i--
      .i1(a_frac[22]),		//i--
      .i2(a_frac[23]),		//i--
      .s_neg(s_neg[2]),		//o--
      .s_x(s_x[2]),		//o--
      .s_x2(s_x2[2])		//o--
   );


   tri_fu_mul_bthdcd bd_03(
      .i0(a_frac[23]),		//i--
      .i1(a_frac[24]),		//i--
      .i2(a_frac[25]),		//i--
      .s_neg(s_neg[3]),		//o--
      .s_x(s_x[3]),		//o--
      .s_x2(s_x2[3])		//o--
   );


   tri_fu_mul_bthdcd bd_04(
      .i0(a_frac[25]),		//i--
      .i1(a_frac[26]),		//i--
      .i2(a_frac[27]),		//i--
      .s_neg(s_neg[4]),		//o--
      .s_x(s_x[4]),		//o--
      .s_x2(s_x2[4])		//o--
   );


   tri_fu_mul_bthdcd bd_05(
      .i0(a_frac[27]),		//i--
      .i1(a_frac[28]),		//i--
      .i2(a_frac[29]),		//i--
      .s_neg(s_neg[5]),		//o--
      .s_x(s_x[5]),		//o--
      .s_x2(s_x2[5])		//o--
   );


   tri_fu_mul_bthdcd bd_06(
      .i0(a_frac[29]),		//i--
      .i1(a_frac[30]),		//i--
      .i2(a_frac[31]),		//i--
      .s_neg(s_neg[6]),		//o--
      .s_x(s_x[6]),		//o--
      .s_x2(s_x2[6])		//o--
   );


   tri_fu_mul_bthdcd bd_07(
      .i0(a_frac[31]),		//i--
      .i1(a_frac[32]),		//i--
      .i2(a_frac[33]),		//i--
      .s_neg(s_neg[7]),		//o--
      .s_x(s_x[7]),		//o--
      .s_x2(s_x2[7])		//o--
   );


   tri_fu_mul_bthdcd bd_08(
      .i0(a_frac[33]),		//i--
      .i1(a_frac[34]),		//i--
      .i2(a_frac[35]),		//i--
      .s_neg(s_neg[8]),		//o--
      .s_x(s_x[8]),		//o--
      .s_x2(s_x2[8])		//o--
   );

   ////##################################################
   ////# Booth Mux Rows
   ////##################################################

   ////# NUMBERING SYSTEM RELATIVE TO COMPRESSOR TREE
   ////#
   ////#    0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000111111111
   ////#    0000000000111111111122222222223333333333444444444455555555556666666666777777777788888888889999999999000000000
   ////#    0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678
   ////#  0 ..DdddddddddddddddddddddddddddddddddddddddddddddddddddddD0s..................................................
   ////#  1 ..1aDdddddddddddddddddddddddddddddddddddddddddddddddddddddD0s................................................
   ////#  2 ....1aDdddddddddddddddddddddddddddddddddddddddddddddddddddddD0s..............................................
   ////#  3 ......1aDdddddddddddddddddddddddddddddddddddddddddddddddddddddD0s............................................
   ////#  4 ........1aDdddddddddddddddddddddddddddddddddddddddddddddddddddddD0s..........................................
   ////#  5 ..........1aDdddddddddddddddddddddddddddddddddddddddddddddddddddddD0s........................................
   ////#  6 ............1aDdddddddddddddddddddddddddddddddddddddddddddddddddddddD0s......................................
   ////#  7 ..............1aDdddddddddddddddddddddddddddddddddddddddddddddddddddddD0s....................................
   ////#  8 ................1aDdddddddddddddddddddddddddddddddddddddddddddddddddddddD0s..................................
   ////#  9 ..................1aDdddddddddddddddddddddddddddddddddddddddddddddddddddddD0s................................
   ////# 10 ....................1aDdddddddddddddddddddddddddddddddddddddddddddddddddddddD0s..............................
   ////# 11 ......................1aDdddddddddddddddddddddddddddddddddddddddddddddddddddddD0s............................
   ////# 12 ........................1aDdddddddddddddddddddddddddddddddddddddddddddddddddddddD0s..........................
   ////# 13 ..........................1aDdddddddddddddddddddddddddddddddddddddddddddddddddddddD0s........................
   ////# 14 ............................1aDdddddddddddddddddddddddddddddddddddddddddddddddddddddD0s......................
   ////# 15 ..............................1aDdddddddddddddddddddddddddddddddddddddddddddddddddddddD0s....................
   ////# 16 ................................1aDdddddddddddddddddddddddddddddddddddddddddddddddddddddD0s..................
   ////# 17 ..................................1aDdddddddddddddddddddddddddddddddddddddddddddddddddddddD0s................
   ////# 18 ....................................1aDdddddddddddddddddddddddddddddddddddddddddddddddddddddD0s..............
   ////# 19 ......................................1aDdddddddddddddddddddddddddddddddddddddddddddddddddddddD0s............
   ////# 20 ........................................1aDdddddddddddddddddddddddddddddddddddddddddddddddddddddD0s..........
   ////# 21 ..........................................1aDdddddddddddddddddddddddddddddddddddddddddddddddddddddD0s........
   ////# 22 ............................................1aDdddddddddddddddddddddddddddddddddddddddddddddddddddddD0s......
   ////# 23 ..............................................1aDdddddddddddddddddddddddddddddddddddddddddddddddddddddD0s....
   ////# 24 ................................................1aDdddddddddddddddddddddddddddddddddddddddddddddddddddddD0s..
   ////# 25 ..................................................1aDdddddddddddddddddddddddddddddddddddddddddddddddddddddD0s
   ////# 26 ...................................................assDdddddddddddddddddddddddddddddddddddddddddddddddddddddD

   assign pp0_00[2] = tiup;
   assign pp0_00[3] = xtd_2_add[0];

   assign xtd_2_add[0] = (~(s_neg[0] & (s_x[0] | s_x2[0])));
   //  sx_00_2: entity BTHMX_X1_A12TH    port map (
   //      SNEG  => s_neg(0) ,  --i--
   //      SX    => s_x(0) ,  --i--
   //      SX2   => s_x2(0) ,  --i--
   //      X     => tidn ,  --i--  ********
   //      RIGHT => left_xtd_2(0) ,  --i--  [n+1]
   //      LEFT  => left_xtd_2(0) ,  --o--  [n]
   //      Q     => xtd_2_sub(0));  --o--


   tri_fu_mul_bthrow bm_00(
      .s_neg(s_neg[0]),		//i--
      .s_x(s_x[0]),		//i--
      .s_x2(s_x2[0]),		//i--
      .x(c_frac[0:53]),		//i--
      .q(pp0_00[4:58]),		//o--
      .hot_one(hot_one_din)		//o--
   );

   //--------------------------------------------------------------------------

   assign pp0_01[4] = tiup;
   assign pp0_01[5] = xtd_2_add[1];

   assign xtd_2_add[1] = (~(s_neg[1] & (s_x[1] | s_x2[1])));
   //  sx_01_2: entity BTHMX_X1_A12TH    port map (
   //      SNEG  => s_neg(1) ,  --i--
   //      SX    => s_x(1) ,  --i--
   //      SX2   => s_x2(1) ,  --i--
   //      X     => tidn ,  --i--  ********
   //      RIGHT => left_xtd_2(1) ,  --i--  [n+1]
   //      LEFT  => left_xtd_2(1) ,  --o--  [n]
   //      Q     => xtd_2_sub(1));  --o--


   tri_fu_mul_bthrow bm_01(
      .s_neg(s_neg[1]),		//i--
      .s_x(s_x[1]),		//i--
      .s_x2(s_x2[1]),		//i--
      .x(c_frac[0:53]),		//i--
      .q(pp0_01[6:60]),		//o--
      .hot_one(pp0_00[60])		//i--
   );
   assign pp0_00[59] = tidn;

   //--------------------------------------------------------------------------

   assign pp0_02[6] = tiup;
   assign pp0_02[7] = xtd_2_add[2];

   assign xtd_2_add[2] = (~(s_neg[2] & (s_x[2] | s_x2[2])));
   //  sx_02_2: entity BTHMX_X1_A12TH    port map (
   //      SNEG  => s_neg(2) ,  --i--
   //      SX    => s_x(2) ,  --i--
   //      SX2   => s_x2(2) ,  --i--
   //      X     => tidn ,  --i--  ********
   //      RIGHT => left_xtd_2(2) ,  --i--  [n+1]
   //      LEFT  => left_xtd_2(2) ,  --o--  [n]
   //      Q     => xtd_2_sub(2));  --o--


   tri_fu_mul_bthrow bm_02(
      .s_neg(s_neg[2]),		//i--
      .s_x(s_x[2]),		//i--
      .s_x2(s_x2[2]),		//i--
      .x(c_frac[0:53]),		//i--
      .q(pp0_02[8:62]),		//o--
      .hot_one(pp0_01[62])		//i--
   );
   assign pp0_01[61] = tidn;

   //--------------------------------------------------------------------------

   assign pp0_03[8] = tiup;
   assign pp0_03[9] = xtd_2_add[3];

   assign xtd_2_add[3] = (~(s_neg[3] & (s_x[3] | s_x2[3])));
   //  sx_03_2: entity BTHMX_X1_A12TH    port map (
   //      SNEG  => s_neg(3) ,  --i--
   //      SX    => s_x(3) ,  --i--
   //      SX2   => s_x2(3) ,  --i--
   //      X     => tidn ,  --i--  ********
   //      RIGHT => left_xtd_2(3) ,  --i--  [n+1]
   //      LEFT  => left_xtd_2(3) ,  --o--  [n]
   //      Q     => xtd_2_sub(3));  --o--


   tri_fu_mul_bthrow bm_03(
      .s_neg(s_neg[3]),		//i--
      .s_x(s_x[3]),		//i--
      .s_x2(s_x2[3]),		//i--
      .x(c_frac[0:53]),		//i--
      .q(pp0_03[10:64]),		//o--
      .hot_one(pp0_02[64])		//i--
   );
   assign pp0_02[63] = tidn;

   //--------------------------------------------------------------------------

   assign pp0_04[10] = tiup;
   assign pp0_04[11] = xtd_2_add[4];

   assign xtd_2_add[4] = (~(s_neg[4] & (s_x[4] | s_x2[4])));
   //  sx_04_2: entity BTHMX_X1_A12TH    port map (
   //      SNEG  => s_neg(4) ,  --i--
   //      SX    => s_x(4) ,  --i--
   //      SX2   => s_x2(4) ,  --i--
   //      X     => tidn ,  --i--  ********
   //      RIGHT => left_xtd_2(4) ,  --i--  [n+1]
   //      LEFT  => left_xtd_2(4) ,  --o--  [n]
   //      Q     => xtd_2_sub(4));  --o--


   tri_fu_mul_bthrow bm_04(
      .s_neg(s_neg[4]),		//i--
      .s_x(s_x[4]),		//i--
      .s_x2(s_x2[4]),		//i--
      .x(c_frac[0:53]),		//i--
      .q(pp0_04[12:66]),		//o--
      .hot_one(pp0_03[66])		//i--
   );
   assign pp0_03[65] = tidn;

   //--------------------------------------------------------------------------

   assign pp0_05[12] = tiup;
   assign pp0_05[13] = xtd_2_add[5];

   assign xtd_2_add[5] = (~(s_neg[5] & (s_x[5] | s_x2[5])));
   //  sx_05_2: entity BTHMX_X1_A12TH    port map (
   //      SNEG  => s_neg(5) ,  --i--
   //      SX    => s_x(5) ,  --i--
   //      SX2   => s_x2(5) ,  --i--
   //      X     => tidn ,  --i--  ********
   //      RIGHT => left_xtd_2(5) ,  --i--  [n+1]
   //      LEFT  => left_xtd_2(5) ,  --o--  [n]
   //      Q     => xtd_2_sub(5));  --o--


   tri_fu_mul_bthrow bm_05(
      .s_neg(s_neg[5]),		//i--
      .s_x(s_x[5]),		//i--
      .s_x2(s_x2[5]),		//i--
      .x(c_frac[0:53]),		//i--
      .q(pp0_05[14:68]),		//o--
      .hot_one(pp0_04[68])		//i--
   );
   assign pp0_04[67] = tidn;

   //--------------------------------------------------------------------------

   assign pp0_06[14] = tiup;
   assign pp0_06[15] = xtd_2_add[6];

   assign xtd_2_add[6] = (~(s_neg[6] & (s_x[6] | s_x2[6])));
   //  sx_06_2: entity BTHMX_X1_A12TH    port map (
   //      SNEG  => s_neg(6) ,  --i--
   //      SX    => s_x(6) ,  --i--
   //      SX2   => s_x2(6) ,  --i--
   //      X     => tidn ,  --i--  ********
   //      RIGHT => left_xtd_2(6) ,  --i--  [n+1]
   //      LEFT  => left_xtd_2(6) ,  --o--  [n]
   //      Q     => xtd_2_sub(6));  --o--


   tri_fu_mul_bthrow bm_06(
      .s_neg(s_neg[6]),		//i--
      .s_x(s_x[6]),		//i--
      .s_x2(s_x2[6]),		//i--
      .x(c_frac[0:53]),		//i--
      .q(pp0_06[16:70]),		//o--
      .hot_one(pp0_05[70])		//i--
   );
   assign pp0_05[69] = tidn;

   //--------------------------------------------------------------------------

   assign pp0_07[16] = tiup;
   assign pp0_07[17] = xtd_2_add[7];

   assign xtd_2_add[7] = (~(s_neg[7] & (s_x[7] | s_x2[7])));
   //  sx_07_2: entity BTHMX_X1_A12TH    port map (
   //      SNEG  => s_neg(7) ,  --i--
   //      SX    => s_x(7) ,  --i--
   //      SX2   => s_x2(7) ,  --i--
   //      X     => tidn ,  --i--  ********
   //      RIGHT => left_xtd_2(7) ,  --i--  [n+1]
   //      LEFT  => left_xtd_2(7) ,  --o--  [n]
   //      Q     => xtd_2_sub(7));  --o--


   tri_fu_mul_bthrow bm_07(
      .s_neg(s_neg[7]),		//i--
      .s_x(s_x[7]),		//i--
      .s_x2(s_x2[7]),		//i--
      .x(c_frac[0:53]),		//i--
      .q(pp0_07[18:72]),		//o--
      .hot_one(pp0_06[72])		//i--
   );
   assign pp0_06[71] = tidn;

   //--------------------------------------------------------------------------
   // LSB ROW OF LSB 9:2 HAS unique sign extension
   //--------------------------------------------------------------------------

   // to get a "1"    ctl_s=1 ctl_a=1
   // to get a "0"    ctl_s=0 ctl_a=0
   // to get a "A"    ctl_s=0 ctl_a=1
   // to get a "S"    ctl_s=1 ctl_a=0

   //  ctl_lsb_92_b <= not ctl_lsb_92;

   ///#######################################################################
   ///# this is the unique part for the 3 version of tri_fu_mul_92
   ///#            MSB/LSB   sx_08_0   sx_08_1   sx_08_2
   ///# mul_92_0     10        '0'       '1'       Add
   ///# mul_92_1     00        '0'       '1'       Add
   ///# mul_92_2     01        Add       Sub       Sub
   ///#######################################################################

   generate
      if (inst == 0)
      begin : g0
         //inst.0
         assign pp0_08[17] = tidn;		// inst.0
         assign pp0_08[18] = tiup;		// inst.0
         assign pp0_08[19] = (~(s_neg[8] & (s_x[8] | s_x2[8])));		// inst.0
      end
   endgenerate

   generate
      if (inst == 1)
      begin : g1
         //inst.0
         assign pp0_08[17] = tidn;		// inst.0
         assign pp0_08[18] = tiup;		// inst.0
         assign pp0_08[19] = (~(s_neg[8] & (s_x[8] | s_x2[8])));		// inst.0
      end
   endgenerate

   generate
      if (inst == 2)
      begin : g2
         //inst.2
         //inst.2
         //inst.2
         assign pp0_08[17] = (~(s_neg[8] & (s_x[8] | s_x2[8])));		// inst.2
         assign pp0_08[18] = (s_neg[8] & (s_x[8] | s_x2[8]));		// inst.2
         assign pp0_08[19] = (s_neg[8] & (s_x[8] | s_x2[8]));		// inst.2
      end
   endgenerate


   tri_fu_mul_bthrow bm_08(
      .s_neg(s_neg[8]),		//i--
      .s_x(s_x[8]),		//i--
      .s_x2(s_x2[8]),		//i--
      .x(c_frac[0:53]),		//i--
      .q(pp0_08[20:74]),		//o--
      .hot_one(pp0_07[74])		//i--
   );
   assign pp0_07[73] = tidn;

   ////##################################################
   ////# Compressor Level 1
   ////##################################################

   ////###########################################################
   ////# LEON CHART
   ////###########################################################
   //  o: no logic done on the signal
   //  c: carry
   //  u: sum
   //  h: hot1
   //  H: hot 1 latched
   //  s: sign
   //  a: ! sign
   //  d: data from the booth muxes
   //  wWW:   01a / ass
   //  Kz:    1a / 00

   ////#    0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000111111111
   ////#    0000000000111111111122222222223333333333444444444455555555556666666666777777777788888888889999999999000000000
   ////#    0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678
   ////#  0 ..zzddddddddddddddddddddddddddddddddddddddddddddddddddddddd0h................................................
   ////#  1 ....1addddddddddddddddddddddddddddddddddddddddddddddddddddddd0h..............................................
   ////#  2 ......1addddddddddddddddddddddddddddddddddddddddddddddddddddddd0h............................................
   ////#  3 ........1addddddddddddddddddddddddddddddddddddddddddddddddddddddd0h..........................................
   ////#  4 ..........1addddddddddddddddddddddddddddddddddddddddddddddddddddddd0h........................................
   ////#  5 ............1addddddddddddddddddddddddddddddddddddddddddddddddddddddd0h......................................
   ////#  6 ..............1addddddddddddddddddddddddddddddddddddddddddddddddddddddd0h....................................
   ////#  7 ................1addddddddddddddddddddddddddddddddddddddddddddddddddddddd0h..................................
   ////#  8 .................wWWddddddddddddddddddddddddddddddddddddddddddddddddddddddd0h................................

   ////#    0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000111111111
   ////#    0000000000111111111122222222223333333333444444444455555555556666666666777777777788888888889999999999000000000
   ////#    0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678
   ////#  8 .................wWWddddddddddddddddddddddddddddddddddddddddddddddddddddddd.................................. pp0_08
   ////#  7 ................1addddddddddddddddddddddddddddddddddddddddddddddddddddddd0h.................................. pp0_07
   ////#  6 ..............1addddddddddddddddddddddddddddddddddddddddddddddddddddddd0h.................................... pp0_06
   ////# -------------------------------------------------------------------------------------
   ////#    ................233333333333333333333333333333333333333333333333333333323....
   ////#    ...............ouuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuoo.................................  pp1_05
   ////#    ..............occccccccccccccccccccccccccccccccccccccccccccccccccccccccc__o.................................  pp1_04

   assign pp1_05[74] = pp0_08[74];
   assign pp1_05[73] = pp0_08[73];

   assign pp1_04[74] = pp0_07[74];
   assign pp1_04[73] = tidn;
   assign pp1_04[72] = tidn;


   tri_csa32 pp1_02_csa_72(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_08[72]),		//i--
      .b(pp0_07[72]),		//i--
      .c(pp0_06[72]),		//i--
      .sum(pp1_05[72]),		//o--
      .car(pp1_04[71])		//o--
   );

   tri_fu_csa22_h2 pp1_02_csa_71(
      .a(pp0_08[71]),		//i--
      .b(pp0_07[71]),		//i--
      .sum(pp1_05[71]),		//o--
      .car(pp1_04[70])		//o--
   );

   tri_csa32 pp1_02_csa_70(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_08[70]),		//i--
      .b(pp0_07[70]),		//i--
      .c(pp0_06[70]),		//i--
      .sum(pp1_05[70]),		//o--
      .car(pp1_04[69])		//o--
   );

   tri_csa32 pp1_02_csa_69(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_08[69]),		//i--
      .b(pp0_07[69]),		//i--
      .c(pp0_06[69]),		//i--
      .sum(pp1_05[69]),		//o--
      .car(pp1_04[68])		//o--
   );

   tri_csa32 pp1_02_csa_68(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_08[68]),		//i--
      .b(pp0_07[68]),		//i--
      .c(pp0_06[68]),		//i--
      .sum(pp1_05[68]),		//o--
      .car(pp1_04[67])		//o--
   );

   tri_csa32 pp1_02_csa_67(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_08[67]),		//i--
      .b(pp0_07[67]),		//i--
      .c(pp0_06[67]),		//i--
      .sum(pp1_05[67]),		//o--
      .car(pp1_04[66])		//o--
   );

   tri_csa32 pp1_02_csa_66(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_08[66]),		//i--
      .b(pp0_07[66]),		//i--
      .c(pp0_06[66]),		//i--
      .sum(pp1_05[66]),		//o--
      .car(pp1_04[65])		//o--
   );

   tri_csa32 pp1_02_csa_65(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_08[65]),		//i--
      .b(pp0_07[65]),		//i--
      .c(pp0_06[65]),		//i--
      .sum(pp1_05[65]),		//o--
      .car(pp1_04[64])		//o--
   );

   tri_csa32 pp1_02_csa_64(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_08[64]),		//i--
      .b(pp0_07[64]),		//i--
      .c(pp0_06[64]),		//i--
      .sum(pp1_05[64]),		//o--
      .car(pp1_04[63])		//o--
   );

   tri_csa32 pp1_02_csa_63(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_08[63]),		//i--
      .b(pp0_07[63]),		//i--
      .c(pp0_06[63]),		//i--
      .sum(pp1_05[63]),		//o--
      .car(pp1_04[62])		//o--
   );

   tri_csa32 pp1_02_csa_62(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_08[62]),		//i--
      .b(pp0_07[62]),		//i--
      .c(pp0_06[62]),		//i--
      .sum(pp1_05[62]),		//o--
      .car(pp1_04[61])		//o--
   );

   tri_csa32 pp1_02_csa_61(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_08[61]),		//i--
      .b(pp0_07[61]),		//i--
      .c(pp0_06[61]),		//i--
      .sum(pp1_05[61]),		//o--
      .car(pp1_04[60])		//o--
   );

   tri_csa32 pp1_02_csa_60(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_08[60]),		//i--
      .b(pp0_07[60]),		//i--
      .c(pp0_06[60]),		//i--
      .sum(pp1_05[60]),		//o--
      .car(pp1_04[59])		//o--
   );

   tri_csa32 pp1_02_csa_59(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_08[59]),		//i--
      .b(pp0_07[59]),		//i--
      .c(pp0_06[59]),		//i--
      .sum(pp1_05[59]),		//o--
      .car(pp1_04[58])		//o--
   );

   tri_csa32 pp1_02_csa_58(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_08[58]),		//i--
      .b(pp0_07[58]),		//i--
      .c(pp0_06[58]),		//i--
      .sum(pp1_05[58]),		//o--
      .car(pp1_04[57])		//o--
   );

   tri_csa32 pp1_02_csa_57(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_08[57]),		//i--
      .b(pp0_07[57]),		//i--
      .c(pp0_06[57]),		//i--
      .sum(pp1_05[57]),		//o--
      .car(pp1_04[56])		//o--
   );

   tri_csa32 pp1_02_csa_56(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_08[56]),		//i--
      .b(pp0_07[56]),		//i--
      .c(pp0_06[56]),		//i--
      .sum(pp1_05[56]),		//o--
      .car(pp1_04[55])		//o--
   );

   tri_csa32 pp1_02_csa_55(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_08[55]),		//i--
      .b(pp0_07[55]),		//i--
      .c(pp0_06[55]),		//i--
      .sum(pp1_05[55]),		//o--
      .car(pp1_04[54])		//o--
   );

   tri_csa32 pp1_02_csa_54(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_08[54]),		//i--
      .b(pp0_07[54]),		//i--
      .c(pp0_06[54]),		//i--
      .sum(pp1_05[54]),		//o--
      .car(pp1_04[53])		//o--
   );

   tri_csa32 pp1_02_csa_53(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_08[53]),		//i--
      .b(pp0_07[53]),		//i--
      .c(pp0_06[53]),		//i--
      .sum(pp1_05[53]),		//o--
      .car(pp1_04[52])		//o--
   );

   tri_csa32 pp1_02_csa_52(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_08[52]),		//i--
      .b(pp0_07[52]),		//i--
      .c(pp0_06[52]),		//i--
      .sum(pp1_05[52]),		//o--
      .car(pp1_04[51])		//o--
   );

   tri_csa32 pp1_02_csa_51(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_08[51]),		//i--
      .b(pp0_07[51]),		//i--
      .c(pp0_06[51]),		//i--
      .sum(pp1_05[51]),		//o--
      .car(pp1_04[50])		//o--
   );

   tri_csa32 pp1_02_csa_50(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_08[50]),		//i--
      .b(pp0_07[50]),		//i--
      .c(pp0_06[50]),		//i--
      .sum(pp1_05[50]),		//o--
      .car(pp1_04[49])		//o--
   );

   tri_csa32 pp1_02_csa_49(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_08[49]),		//i--
      .b(pp0_07[49]),		//i--
      .c(pp0_06[49]),		//i--
      .sum(pp1_05[49]),		//o--
      .car(pp1_04[48])		//o--
   );

   tri_csa32 pp1_02_csa_48(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_08[48]),		//i--
      .b(pp0_07[48]),		//i--
      .c(pp0_06[48]),		//i--
      .sum(pp1_05[48]),		//o--
      .car(pp1_04[47])		//o--
   );

   tri_csa32 pp1_02_csa_47(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_08[47]),		//i--
      .b(pp0_07[47]),		//i--
      .c(pp0_06[47]),		//i--
      .sum(pp1_05[47]),		//o--
      .car(pp1_04[46])		//o--
   );

   tri_csa32 pp1_02_csa_46(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_08[46]),		//i--
      .b(pp0_07[46]),		//i--
      .c(pp0_06[46]),		//i--
      .sum(pp1_05[46]),		//o--
      .car(pp1_04[45])		//o--
   );

   tri_csa32 pp1_02_csa_45(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_08[45]),		//i--
      .b(pp0_07[45]),		//i--
      .c(pp0_06[45]),		//i--
      .sum(pp1_05[45]),		//o--
      .car(pp1_04[44])		//o--
   );

   tri_csa32 pp1_02_csa_44(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_08[44]),		//i--
      .b(pp0_07[44]),		//i--
      .c(pp0_06[44]),		//i--
      .sum(pp1_05[44]),		//o--
      .car(pp1_04[43])		//o--
   );

   tri_csa32 pp1_02_csa_43(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_08[43]),		//i--
      .b(pp0_07[43]),		//i--
      .c(pp0_06[43]),		//i--
      .sum(pp1_05[43]),		//o--
      .car(pp1_04[42])		//o--
   );

   tri_csa32 pp1_02_csa_42(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_08[42]),		//i--
      .b(pp0_07[42]),		//i--
      .c(pp0_06[42]),		//i--
      .sum(pp1_05[42]),		//o--
      .car(pp1_04[41])		//o--
   );

   tri_csa32 pp1_02_csa_41(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_08[41]),		//i--
      .b(pp0_07[41]),		//i--
      .c(pp0_06[41]),		//i--
      .sum(pp1_05[41]),		//o--
      .car(pp1_04[40])		//o--
   );

   tri_csa32 pp1_02_csa_40(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_08[40]),		//i--
      .b(pp0_07[40]),		//i--
      .c(pp0_06[40]),		//i--
      .sum(pp1_05[40]),		//o--
      .car(pp1_04[39])		//o--
   );

   tri_csa32 pp1_02_csa_39(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_08[39]),		//i--
      .b(pp0_07[39]),		//i--
      .c(pp0_06[39]),		//i--
      .sum(pp1_05[39]),		//o--
      .car(pp1_04[38])		//o--
   );

   tri_csa32 pp1_02_csa_38(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_08[38]),		//i--
      .b(pp0_07[38]),		//i--
      .c(pp0_06[38]),		//i--
      .sum(pp1_05[38]),		//o--
      .car(pp1_04[37])		//o--
   );

   tri_csa32 pp1_02_csa_37(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_08[37]),		//i--
      .b(pp0_07[37]),		//i--
      .c(pp0_06[37]),		//i--
      .sum(pp1_05[37]),		//o--
      .car(pp1_04[36])		//o--
   );

   tri_csa32 pp1_02_csa_36(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_08[36]),		//i--
      .b(pp0_07[36]),		//i--
      .c(pp0_06[36]),		//i--
      .sum(pp1_05[36]),		//o--
      .car(pp1_04[35])		//o--
   );

   tri_csa32 pp1_02_csa_35(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_08[35]),		//i--
      .b(pp0_07[35]),		//i--
      .c(pp0_06[35]),		//i--
      .sum(pp1_05[35]),		//o--
      .car(pp1_04[34])		//o--
   );

   tri_csa32 pp1_02_csa_34(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_08[34]),		//i--
      .b(pp0_07[34]),		//i--
      .c(pp0_06[34]),		//i--
      .sum(pp1_05[34]),		//o--
      .car(pp1_04[33])		//o--
   );

   tri_csa32 pp1_02_csa_33(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_08[33]),		//i--
      .b(pp0_07[33]),		//i--
      .c(pp0_06[33]),		//i--
      .sum(pp1_05[33]),		//o--
      .car(pp1_04[32])		//o--
   );

   tri_csa32 pp1_02_csa_32(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_08[32]),		//i--
      .b(pp0_07[32]),		//i--
      .c(pp0_06[32]),		//i--
      .sum(pp1_05[32]),		//o--
      .car(pp1_04[31])		//o--
   );

   tri_csa32 pp1_02_csa_31(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_08[31]),		//i--
      .b(pp0_07[31]),		//i--
      .c(pp0_06[31]),		//i--
      .sum(pp1_05[31]),		//o--
      .car(pp1_04[30])		//o--
   );

   tri_csa32 pp1_02_csa_30(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_08[30]),		//i--
      .b(pp0_07[30]),		//i--
      .c(pp0_06[30]),		//i--
      .sum(pp1_05[30]),		//o--
      .car(pp1_04[29])		//o--
   );

   tri_csa32 pp1_02_csa_29(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_08[29]),		//i--
      .b(pp0_07[29]),		//i--
      .c(pp0_06[29]),		//i--
      .sum(pp1_05[29]),		//o--
      .car(pp1_04[28])		//o--
   );

   tri_csa32 pp1_02_csa_28(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_08[28]),		//i--
      .b(pp0_07[28]),		//i--
      .c(pp0_06[28]),		//i--
      .sum(pp1_05[28]),		//o--
      .car(pp1_04[27])		//o--
   );

   tri_csa32 pp1_02_csa_27(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_08[27]),		//i--
      .b(pp0_07[27]),		//i--
      .c(pp0_06[27]),		//i--
      .sum(pp1_05[27]),		//o--
      .car(pp1_04[26])		//o--
   );

   tri_csa32 pp1_02_csa_26(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_08[26]),		//i--
      .b(pp0_07[26]),		//i--
      .c(pp0_06[26]),		//i--
      .sum(pp1_05[26]),		//o--
      .car(pp1_04[25])		//o--
   );

   tri_csa32 pp1_02_csa_25(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_08[25]),		//i--
      .b(pp0_07[25]),		//i--
      .c(pp0_06[25]),		//i--
      .sum(pp1_05[25]),		//o--
      .car(pp1_04[24])		//o--
   );

   tri_csa32 pp1_02_csa_24(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_08[24]),		//i--
      .b(pp0_07[24]),		//i--
      .c(pp0_06[24]),		//i--
      .sum(pp1_05[24]),		//o--
      .car(pp1_04[23])		//o--
   );

   tri_csa32 pp1_02_csa_23(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_08[23]),		//i--
      .b(pp0_07[23]),		//i--
      .c(pp0_06[23]),		//i--
      .sum(pp1_05[23]),		//o--
      .car(pp1_04[22])		//o--
   );

   tri_csa32 pp1_02_csa_22(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_08[22]),		//i--
      .b(pp0_07[22]),		//i--
      .c(pp0_06[22]),		//i--
      .sum(pp1_05[22]),		//o--
      .car(pp1_04[21])		//o--
   );

   tri_csa32 pp1_02_csa_21(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_08[21]),		//i--
      .b(pp0_07[21]),		//i--
      .c(pp0_06[21]),		//i--
      .sum(pp1_05[21]),		//o--
      .car(pp1_04[20])		//o--
   );

   tri_csa32 pp1_02_csa_20(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_08[20]),		//i--
      .b(pp0_07[20]),		//i--
      .c(pp0_06[20]),		//i--
      .sum(pp1_05[20]),		//o--
      .car(pp1_04[19])		//o--
   );

   tri_csa32 pp1_02_csa_19(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_08[19]),		//i--
      .b(pp0_07[19]),		//i--
      .c(pp0_06[19]),		//i--
      .sum(pp1_05[19]),		//o--
      .car(pp1_04[18])		//o--
   );

   tri_csa32 pp1_02_csa_18(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_08[18]),		//i--
      .b(pp0_07[18]),		//i--
      .c(pp0_06[18]),		//i--
      .sum(pp1_05[18]),		//o--
      .car(pp1_04[17])		//o--
   );

   tri_csa32 pp1_02_csa_17(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_08[17]),		//i--
      .b(pp0_07[17]),		//i--
      .c(pp0_06[17]),		//i--
      .sum(pp1_05[17]),		//o--
      .car(pp1_04[16])		//o--
   );

   tri_fu_csa22_h2 pp1_02_csa_16(
      .a(tiup),		//i--
      .b(pp0_06[16]),		//i--
      .sum(pp1_05[16]),		//o--
      .car(pp1_04[15])		//o--
   );
   assign pp1_05[15] = pp0_06[15];
   assign pp1_05[14] = tiup;

   ////#    0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000111111111
   ////#    0000000000111111111122222222223333333333444444444455555555556666666666777777777788888888889999999999000000000
   ////#    0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678
   ////#  5 ............1addddddddddddddddddddddddddddddddddddddddddddddddddddddd0h...................................... pp0_05
   ////#  4 ..........1addddddddddddddddddddddddddddddddddddddddddddddddddddddd0h........................................ pp0_04
   ////#  3 ........1addddddddddddddddddddddddddddddddddddddddddddddddddddddd0h.......................................... pp0_03
   ////# -------------------------------------------------------------------------------------
   ////#    ..........223333333333333333333333333333333333333333333333333333323....
   ////#    .........ouuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuoo_o.....................................  pp1_03
   ////#    ........occccccccccccccccccccccccccccccccccccccccccccccccccccccccc__o.......................................  pp1_02

   assign pp1_03[70] = pp0_05[70];
   assign pp1_03[69] = tidn;
   assign pp1_03[68] = pp0_05[68];
   assign pp1_03[67] = pp0_05[67];

   assign pp1_02[68] = pp0_04[68];
   assign pp1_02[67] = tidn;
   assign pp1_02[66] = tidn;


   tri_csa32 pp1_01_csa_66(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_05[66]),		//i--
      .b(pp0_04[66]),		//i--
      .c(pp0_03[66]),		//i--
      .sum(pp1_03[66]),		//o--
      .car(pp1_02[65])		//o--
   );

   tri_fu_csa22_h2 pp1_01_csa_65(
      .a(pp0_05[65]),		//i--
      .b(pp0_04[65]),		//i--
      .sum(pp1_03[65]),		//o--
      .car(pp1_02[64])		//o--
   );

   tri_csa32 pp1_01_csa_64(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_05[64]),		//i--
      .b(pp0_04[64]),		//i--
      .c(pp0_03[64]),		//i--
      .sum(pp1_03[64]),		//o--
      .car(pp1_02[63])		//o--
   );

   tri_csa32 pp1_01_csa_63(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_05[63]),		//i--
      .b(pp0_04[63]),		//i--
      .c(pp0_03[63]),		//i--
      .sum(pp1_03[63]),		//o--
      .car(pp1_02[62])		//o--
   );

   tri_csa32 pp1_01_csa_62(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_05[62]),		//i--
      .b(pp0_04[62]),		//i--
      .c(pp0_03[62]),		//i--
      .sum(pp1_03[62]),		//o--
      .car(pp1_02[61])		//o--
   );

   tri_csa32 pp1_01_csa_61(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_05[61]),		//i--
      .b(pp0_04[61]),		//i--
      .c(pp0_03[61]),		//i--
      .sum(pp1_03[61]),		//o--
      .car(pp1_02[60])		//o--
   );

   tri_csa32 pp1_01_csa_60(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_05[60]),		//i--
      .b(pp0_04[60]),		//i--
      .c(pp0_03[60]),		//i--
      .sum(pp1_03[60]),		//o--
      .car(pp1_02[59])		//o--
   );

   tri_csa32 pp1_01_csa_59(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_05[59]),		//i--
      .b(pp0_04[59]),		//i--
      .c(pp0_03[59]),		//i--
      .sum(pp1_03[59]),		//o--
      .car(pp1_02[58])		//o--
   );

   tri_csa32 pp1_01_csa_58(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_05[58]),		//i--
      .b(pp0_04[58]),		//i--
      .c(pp0_03[58]),		//i--
      .sum(pp1_03[58]),		//o--
      .car(pp1_02[57])		//o--
   );

   tri_csa32 pp1_01_csa_57(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_05[57]),		//i--
      .b(pp0_04[57]),		//i--
      .c(pp0_03[57]),		//i--
      .sum(pp1_03[57]),		//o--
      .car(pp1_02[56])		//o--
   );

   tri_csa32 pp1_01_csa_56(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_05[56]),		//i--
      .b(pp0_04[56]),		//i--
      .c(pp0_03[56]),		//i--
      .sum(pp1_03[56]),		//o--
      .car(pp1_02[55])		//o--
   );

   tri_csa32 pp1_01_csa_55(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_05[55]),		//i--
      .b(pp0_04[55]),		//i--
      .c(pp0_03[55]),		//i--
      .sum(pp1_03[55]),		//o--
      .car(pp1_02[54])		//o--
   );

   tri_csa32 pp1_01_csa_54(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_05[54]),		//i--
      .b(pp0_04[54]),		//i--
      .c(pp0_03[54]),		//i--
      .sum(pp1_03[54]),		//o--
      .car(pp1_02[53])		//o--
   );

   tri_csa32 pp1_01_csa_53(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_05[53]),		//i--
      .b(pp0_04[53]),		//i--
      .c(pp0_03[53]),		//i--
      .sum(pp1_03[53]),		//o--
      .car(pp1_02[52])		//o--
   );

   tri_csa32 pp1_01_csa_52(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_05[52]),		//i--
      .b(pp0_04[52]),		//i--
      .c(pp0_03[52]),		//i--
      .sum(pp1_03[52]),		//o--
      .car(pp1_02[51])		//o--
   );

   tri_csa32 pp1_01_csa_51(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_05[51]),		//i--
      .b(pp0_04[51]),		//i--
      .c(pp0_03[51]),		//i--
      .sum(pp1_03[51]),		//o--
      .car(pp1_02[50])		//o--
   );

   tri_csa32 pp1_01_csa_50(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_05[50]),		//i--
      .b(pp0_04[50]),		//i--
      .c(pp0_03[50]),		//i--
      .sum(pp1_03[50]),		//o--
      .car(pp1_02[49])		//o--
   );

   tri_csa32 pp1_01_csa_49(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_05[49]),		//i--
      .b(pp0_04[49]),		//i--
      .c(pp0_03[49]),		//i--
      .sum(pp1_03[49]),		//o--
      .car(pp1_02[48])		//o--
   );

   tri_csa32 pp1_01_csa_48(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_05[48]),		//i--
      .b(pp0_04[48]),		//i--
      .c(pp0_03[48]),		//i--
      .sum(pp1_03[48]),		//o--
      .car(pp1_02[47])		//o--
   );

   tri_csa32 pp1_01_csa_47(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_05[47]),		//i--
      .b(pp0_04[47]),		//i--
      .c(pp0_03[47]),		//i--
      .sum(pp1_03[47]),		//o--
      .car(pp1_02[46])		//o--
   );

   tri_csa32 pp1_01_csa_46(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_05[46]),		//i--
      .b(pp0_04[46]),		//i--
      .c(pp0_03[46]),		//i--
      .sum(pp1_03[46]),		//o--
      .car(pp1_02[45])		//o--
   );

   tri_csa32 pp1_01_csa_45(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_05[45]),		//i--
      .b(pp0_04[45]),		//i--
      .c(pp0_03[45]),		//i--
      .sum(pp1_03[45]),		//o--
      .car(pp1_02[44])		//o--
   );

   tri_csa32 pp1_01_csa_44(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_05[44]),		//i--
      .b(pp0_04[44]),		//i--
      .c(pp0_03[44]),		//i--
      .sum(pp1_03[44]),		//o--
      .car(pp1_02[43])		//o--
   );

   tri_csa32 pp1_01_csa_43(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_05[43]),		//i--
      .b(pp0_04[43]),		//i--
      .c(pp0_03[43]),		//i--
      .sum(pp1_03[43]),		//o--
      .car(pp1_02[42])		//o--
   );

   tri_csa32 pp1_01_csa_42(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_05[42]),		//i--
      .b(pp0_04[42]),		//i--
      .c(pp0_03[42]),		//i--
      .sum(pp1_03[42]),		//o--
      .car(pp1_02[41])		//o--
   );

   tri_csa32 pp1_01_csa_41(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_05[41]),		//i--
      .b(pp0_04[41]),		//i--
      .c(pp0_03[41]),		//i--
      .sum(pp1_03[41]),		//o--
      .car(pp1_02[40])		//o--
   );

   tri_csa32 pp1_01_csa_40(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_05[40]),		//i--
      .b(pp0_04[40]),		//i--
      .c(pp0_03[40]),		//i--
      .sum(pp1_03[40]),		//o--
      .car(pp1_02[39])		//o--
   );

   tri_csa32 pp1_01_csa_39(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_05[39]),		//i--
      .b(pp0_04[39]),		//i--
      .c(pp0_03[39]),		//i--
      .sum(pp1_03[39]),		//o--
      .car(pp1_02[38])		//o--
   );

   tri_csa32 pp1_01_csa_38(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_05[38]),		//i--
      .b(pp0_04[38]),		//i--
      .c(pp0_03[38]),		//i--
      .sum(pp1_03[38]),		//o--
      .car(pp1_02[37])		//o--
   );

   tri_csa32 pp1_01_csa_37(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_05[37]),		//i--
      .b(pp0_04[37]),		//i--
      .c(pp0_03[37]),		//i--
      .sum(pp1_03[37]),		//o--
      .car(pp1_02[36])		//o--
   );

   tri_csa32 pp1_01_csa_36(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_05[36]),		//i--
      .b(pp0_04[36]),		//i--
      .c(pp0_03[36]),		//i--
      .sum(pp1_03[36]),		//o--
      .car(pp1_02[35])		//o--
   );

   tri_csa32 pp1_01_csa_35(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_05[35]),		//i--
      .b(pp0_04[35]),		//i--
      .c(pp0_03[35]),		//i--
      .sum(pp1_03[35]),		//o--
      .car(pp1_02[34])		//o--
   );

   tri_csa32 pp1_01_csa_34(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_05[34]),		//i--
      .b(pp0_04[34]),		//i--
      .c(pp0_03[34]),		//i--
      .sum(pp1_03[34]),		//o--
      .car(pp1_02[33])		//o--
   );

   tri_csa32 pp1_01_csa_33(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_05[33]),		//i--
      .b(pp0_04[33]),		//i--
      .c(pp0_03[33]),		//i--
      .sum(pp1_03[33]),		//o--
      .car(pp1_02[32])		//o--
   );

   tri_csa32 pp1_01_csa_32(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_05[32]),		//i--
      .b(pp0_04[32]),		//i--
      .c(pp0_03[32]),		//i--
      .sum(pp1_03[32]),		//o--
      .car(pp1_02[31])		//o--
   );

   tri_csa32 pp1_01_csa_31(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_05[31]),		//i--
      .b(pp0_04[31]),		//i--
      .c(pp0_03[31]),		//i--
      .sum(pp1_03[31]),		//o--
      .car(pp1_02[30])		//o--
   );

   tri_csa32 pp1_01_csa_30(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_05[30]),		//i--
      .b(pp0_04[30]),		//i--
      .c(pp0_03[30]),		//i--
      .sum(pp1_03[30]),		//o--
      .car(pp1_02[29])		//o--
   );

   tri_csa32 pp1_01_csa_29(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_05[29]),		//i--
      .b(pp0_04[29]),		//i--
      .c(pp0_03[29]),		//i--
      .sum(pp1_03[29]),		//o--
      .car(pp1_02[28])		//o--
   );

   tri_csa32 pp1_01_csa_28(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_05[28]),		//i--
      .b(pp0_04[28]),		//i--
      .c(pp0_03[28]),		//i--
      .sum(pp1_03[28]),		//o--
      .car(pp1_02[27])		//o--
   );

   tri_csa32 pp1_01_csa_27(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_05[27]),		//i--
      .b(pp0_04[27]),		//i--
      .c(pp0_03[27]),		//i--
      .sum(pp1_03[27]),		//o--
      .car(pp1_02[26])		//o--
   );

   tri_csa32 pp1_01_csa_26(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_05[26]),		//i--
      .b(pp0_04[26]),		//i--
      .c(pp0_03[26]),		//i--
      .sum(pp1_03[26]),		//o--
      .car(pp1_02[25])		//o--
   );

   tri_csa32 pp1_01_csa_25(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_05[25]),		//i--
      .b(pp0_04[25]),		//i--
      .c(pp0_03[25]),		//i--
      .sum(pp1_03[25]),		//o--
      .car(pp1_02[24])		//o--
   );

   tri_csa32 pp1_01_csa_24(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_05[24]),		//i--
      .b(pp0_04[24]),		//i--
      .c(pp0_03[24]),		//i--
      .sum(pp1_03[24]),		//o--
      .car(pp1_02[23])		//o--
   );

   tri_csa32 pp1_01_csa_23(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_05[23]),		//i--
      .b(pp0_04[23]),		//i--
      .c(pp0_03[23]),		//i--
      .sum(pp1_03[23]),		//o--
      .car(pp1_02[22])		//o--
   );

   tri_csa32 pp1_01_csa_22(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_05[22]),		//i--
      .b(pp0_04[22]),		//i--
      .c(pp0_03[22]),		//i--
      .sum(pp1_03[22]),		//o--
      .car(pp1_02[21])		//o--
   );

   tri_csa32 pp1_01_csa_21(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_05[21]),		//i--
      .b(pp0_04[21]),		//i--
      .c(pp0_03[21]),		//i--
      .sum(pp1_03[21]),		//o--
      .car(pp1_02[20])		//o--
   );

   tri_csa32 pp1_01_csa_20(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_05[20]),		//i--
      .b(pp0_04[20]),		//i--
      .c(pp0_03[20]),		//i--
      .sum(pp1_03[20]),		//o--
      .car(pp1_02[19])		//o--
   );

   tri_csa32 pp1_01_csa_19(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_05[19]),		//i--
      .b(pp0_04[19]),		//i--
      .c(pp0_03[19]),		//i--
      .sum(pp1_03[19]),		//o--
      .car(pp1_02[18])		//o--
   );

   tri_csa32 pp1_01_csa_18(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_05[18]),		//i--
      .b(pp0_04[18]),		//i--
      .c(pp0_03[18]),		//i--
      .sum(pp1_03[18]),		//o--
      .car(pp1_02[17])		//o--
   );

   tri_csa32 pp1_01_csa_17(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_05[17]),		//i--
      .b(pp0_04[17]),		//i--
      .c(pp0_03[17]),		//i--
      .sum(pp1_03[17]),		//o--
      .car(pp1_02[16])		//o--
   );

   tri_csa32 pp1_01_csa_16(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_05[16]),		//i--
      .b(pp0_04[16]),		//i--
      .c(pp0_03[16]),		//i--
      .sum(pp1_03[16]),		//o--
      .car(pp1_02[15])		//o--
   );

   tri_csa32 pp1_01_csa_15(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_05[15]),		//i--
      .b(pp0_04[15]),		//i--
      .c(pp0_03[15]),		//i--
      .sum(pp1_03[15]),		//o--
      .car(pp1_02[14])		//o--
   );

   tri_csa32 pp1_01_csa_14(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_05[14]),		//i--
      .b(pp0_04[14]),		//i--
      .c(pp0_03[14]),		//i--
      .sum(pp1_03[14]),		//o--
      .car(pp1_02[13])		//o--
   );

   tri_csa32 pp1_01_csa_13(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_05[13]),		//i--
      .b(pp0_04[13]),		//i--
      .c(pp0_03[13]),		//i--
      .sum(pp1_03[13]),		//o--
      .car(pp1_02[12])		//o--
   );

   tri_csa32 pp1_01_csa_12(
      .vd(vdd),
      .gd(gnd),
      .a(tiup),		//i--
      .b(pp0_04[12]),		//i--
      .c(pp0_03[12]),		//i--
      .sum(pp1_03[12]),		//o--
      .car(pp1_02[11])		//o--
   );

   tri_fu_csa22_h2 pp1_01_csa_11(
      .a(pp0_04[11]),		//i--
      .b(pp0_03[11]),		//i--
      .sum(pp1_03[11]),		//o--
      .car(pp1_02[10])		//o--
   );

   tri_fu_csa22_h2 pp1_01_csa_10(
      .a(tiup),		//i--
      .b(pp0_03[10]),		//i--
      .sum(pp1_03[10]),		//o--
      .car(pp1_02[9])		//o--
   );
   assign pp1_03[9] = pp0_03[9];
   assign pp1_03[8] = tiup;

   ////#    0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000111111111
   ////#    0000000000111111111122222222223333333333444444444455555555556666666666777777777788888888889999999999000000000
   ////#    0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678
   ////#  2 ......1addddddddddddddddddddddddddddddddddddddddddddddddddddddd0h............................................ pp0_02
   ////#  1 ....1addddddddddddddddddddddddddddddddddddddddddddddddddddddd0h.............................................. pp0_01
   ////#  0 ..zzddddddddddddddddddddddddddddddddddddddddddddddddddddddd0h................................................ pp0_00
   ////# -------------------------------------------------------------------------------------
   ////#    ....223333333333333333333333333333333333333333333333333333323....
   ////#    ...ouuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuoo_o............................................ pp1_01
   ////#    ..occccccccccccccccccccccccccccccccccccccccccccccccccccccccc__o.............................................. pp1_00

   assign pp1_01[64] = pp0_02[64];
   assign pp1_01[63] = tidn;
   assign pp1_01[62] = pp0_02[62];
   assign pp1_01[61] = pp0_02[61];

   assign pp1_00[62] = pp0_01[62];
   assign pp1_00[61] = tidn;
   assign pp1_00[60] = tidn;


   tri_csa32 pp1_00_csa_60(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_02[60]),		//i--
      .b(pp0_01[60]),		//i--
      .c(pp0_00[60]),		//i--
      .sum(pp1_01[60]),		//o--
      .car(pp1_00[59])		//o--
   );

   tri_fu_csa22_h2 pp1_00_csa_59(
      .a(pp0_02[59]),		//i--
      .b(pp0_01[59]),		//i--
      .sum(pp1_01[59]),		//o--
      .car(pp1_00[58])		//o--
   );

   tri_csa32 pp1_00_csa_58(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_02[58]),		//i--
      .b(pp0_01[58]),		//i--
      .c(pp0_00[58]),		//i--
      .sum(pp1_01[58]),		//o--
      .car(pp1_00[57])		//o--
   );

   tri_csa32 pp1_00_csa_57(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_02[57]),		//i--
      .b(pp0_01[57]),		//i--
      .c(pp0_00[57]),		//i--
      .sum(pp1_01[57]),		//o--
      .car(pp1_00[56])		//o--
   );

   tri_csa32 pp1_00_csa_56(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_02[56]),		//i--
      .b(pp0_01[56]),		//i--
      .c(pp0_00[56]),		//i--
      .sum(pp1_01[56]),		//o--
      .car(pp1_00[55])		//o--
   );

   tri_csa32 pp1_00_csa_55(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_02[55]),		//i--
      .b(pp0_01[55]),		//i--
      .c(pp0_00[55]),		//i--
      .sum(pp1_01[55]),		//o--
      .car(pp1_00[54])		//o--
   );

   tri_csa32 pp1_00_csa_54(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_02[54]),		//i--
      .b(pp0_01[54]),		//i--
      .c(pp0_00[54]),		//i--
      .sum(pp1_01[54]),		//o--
      .car(pp1_00[53])		//o--
   );

   tri_csa32 pp1_00_csa_53(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_02[53]),		//i--
      .b(pp0_01[53]),		//i--
      .c(pp0_00[53]),		//i--
      .sum(pp1_01[53]),		//o--
      .car(pp1_00[52])		//o--
   );

   tri_csa32 pp1_00_csa_52(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_02[52]),		//i--
      .b(pp0_01[52]),		//i--
      .c(pp0_00[52]),		//i--
      .sum(pp1_01[52]),		//o--
      .car(pp1_00[51])		//o--
   );

   tri_csa32 pp1_00_csa_51(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_02[51]),		//i--
      .b(pp0_01[51]),		//i--
      .c(pp0_00[51]),		//i--
      .sum(pp1_01[51]),		//o--
      .car(pp1_00[50])		//o--
   );

   tri_csa32 pp1_00_csa_50(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_02[50]),		//i--
      .b(pp0_01[50]),		//i--
      .c(pp0_00[50]),		//i--
      .sum(pp1_01[50]),		//o--
      .car(pp1_00[49])		//o--
   );

   tri_csa32 pp1_00_csa_49(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_02[49]),		//i--
      .b(pp0_01[49]),		//i--
      .c(pp0_00[49]),		//i--
      .sum(pp1_01[49]),		//o--
      .car(pp1_00[48])		//o--
   );

   tri_csa32 pp1_00_csa_48(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_02[48]),		//i--
      .b(pp0_01[48]),		//i--
      .c(pp0_00[48]),		//i--
      .sum(pp1_01[48]),		//o--
      .car(pp1_00[47])		//o--
   );

   tri_csa32 pp1_00_csa_47(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_02[47]),		//i--
      .b(pp0_01[47]),		//i--
      .c(pp0_00[47]),		//i--
      .sum(pp1_01[47]),		//o--
      .car(pp1_00[46])		//o--
   );

   tri_csa32 pp1_00_csa_46(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_02[46]),		//i--
      .b(pp0_01[46]),		//i--
      .c(pp0_00[46]),		//i--
      .sum(pp1_01[46]),		//o--
      .car(pp1_00[45])		//o--
   );

   tri_csa32 pp1_00_csa_45(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_02[45]),		//i--
      .b(pp0_01[45]),		//i--
      .c(pp0_00[45]),		//i--
      .sum(pp1_01[45]),		//o--
      .car(pp1_00[44])		//o--
   );

   tri_csa32 pp1_00_csa_44(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_02[44]),		//i--
      .b(pp0_01[44]),		//i--
      .c(pp0_00[44]),		//i--
      .sum(pp1_01[44]),		//o--
      .car(pp1_00[43])		//o--
   );

   tri_csa32 pp1_00_csa_43(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_02[43]),		//i--
      .b(pp0_01[43]),		//i--
      .c(pp0_00[43]),		//i--
      .sum(pp1_01[43]),		//o--
      .car(pp1_00[42])		//o--
   );

   tri_csa32 pp1_00_csa_42(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_02[42]),		//i--
      .b(pp0_01[42]),		//i--
      .c(pp0_00[42]),		//i--
      .sum(pp1_01[42]),		//o--
      .car(pp1_00[41])		//o--
   );

   tri_csa32 pp1_00_csa_41(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_02[41]),		//i--
      .b(pp0_01[41]),		//i--
      .c(pp0_00[41]),		//i--
      .sum(pp1_01[41]),		//o--
      .car(pp1_00[40])		//o--
   );

   tri_csa32 pp1_00_csa_40(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_02[40]),		//i--
      .b(pp0_01[40]),		//i--
      .c(pp0_00[40]),		//i--
      .sum(pp1_01[40]),		//o--
      .car(pp1_00[39])		//o--
   );

   tri_csa32 pp1_00_csa_39(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_02[39]),		//i--
      .b(pp0_01[39]),		//i--
      .c(pp0_00[39]),		//i--
      .sum(pp1_01[39]),		//o--
      .car(pp1_00[38])		//o--
   );

   tri_csa32 pp1_00_csa_38(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_02[38]),		//i--
      .b(pp0_01[38]),		//i--
      .c(pp0_00[38]),		//i--
      .sum(pp1_01[38]),		//o--
      .car(pp1_00[37])		//o--
   );

   tri_csa32 pp1_00_csa_37(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_02[37]),		//i--
      .b(pp0_01[37]),		//i--
      .c(pp0_00[37]),		//i--
      .sum(pp1_01[37]),		//o--
      .car(pp1_00[36])		//o--
   );

   tri_csa32 pp1_00_csa_36(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_02[36]),		//i--
      .b(pp0_01[36]),		//i--
      .c(pp0_00[36]),		//i--
      .sum(pp1_01[36]),		//o--
      .car(pp1_00[35])		//o--
   );

   tri_csa32 pp1_00_csa_35(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_02[35]),		//i--
      .b(pp0_01[35]),		//i--
      .c(pp0_00[35]),		//i--
      .sum(pp1_01[35]),		//o--
      .car(pp1_00[34])		//o--
   );

   tri_csa32 pp1_00_csa_34(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_02[34]),		//i--
      .b(pp0_01[34]),		//i--
      .c(pp0_00[34]),		//i--
      .sum(pp1_01[34]),		//o--
      .car(pp1_00[33])		//o--
   );

   tri_csa32 pp1_00_csa_33(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_02[33]),		//i--
      .b(pp0_01[33]),		//i--
      .c(pp0_00[33]),		//i--
      .sum(pp1_01[33]),		//o--
      .car(pp1_00[32])		//o--
   );

   tri_csa32 pp1_00_csa_32(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_02[32]),		//i--
      .b(pp0_01[32]),		//i--
      .c(pp0_00[32]),		//i--
      .sum(pp1_01[32]),		//o--
      .car(pp1_00[31])		//o--
   );

   tri_csa32 pp1_00_csa_31(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_02[31]),		//i--
      .b(pp0_01[31]),		//i--
      .c(pp0_00[31]),		//i--
      .sum(pp1_01[31]),		//o--
      .car(pp1_00[30])		//o--
   );

   tri_csa32 pp1_00_csa_30(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_02[30]),		//i--
      .b(pp0_01[30]),		//i--
      .c(pp0_00[30]),		//i--
      .sum(pp1_01[30]),		//o--
      .car(pp1_00[29])		//o--
   );

   tri_csa32 pp1_00_csa_29(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_02[29]),		//i--
      .b(pp0_01[29]),		//i--
      .c(pp0_00[29]),		//i--
      .sum(pp1_01[29]),		//o--
      .car(pp1_00[28])		//o--
   );

   tri_csa32 pp1_00_csa_28(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_02[28]),		//i--
      .b(pp0_01[28]),		//i--
      .c(pp0_00[28]),		//i--
      .sum(pp1_01[28]),		//o--
      .car(pp1_00[27])		//o--
   );

   tri_csa32 pp1_00_csa_27(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_02[27]),		//i--
      .b(pp0_01[27]),		//i--
      .c(pp0_00[27]),		//i--
      .sum(pp1_01[27]),		//o--
      .car(pp1_00[26])		//o--
   );

   tri_csa32 pp1_00_csa_26(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_02[26]),		//i--
      .b(pp0_01[26]),		//i--
      .c(pp0_00[26]),		//i--
      .sum(pp1_01[26]),		//o--
      .car(pp1_00[25])		//o--
   );

   tri_csa32 pp1_00_csa_25(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_02[25]),		//i--
      .b(pp0_01[25]),		//i--
      .c(pp0_00[25]),		//i--
      .sum(pp1_01[25]),		//o--
      .car(pp1_00[24])		//o--
   );

   tri_csa32 pp1_00_csa_24(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_02[24]),		//i--
      .b(pp0_01[24]),		//i--
      .c(pp0_00[24]),		//i--
      .sum(pp1_01[24]),		//o--
      .car(pp1_00[23])		//o--
   );

   tri_csa32 pp1_00_csa_23(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_02[23]),		//i--
      .b(pp0_01[23]),		//i--
      .c(pp0_00[23]),		//i--
      .sum(pp1_01[23]),		//o--
      .car(pp1_00[22])		//o--
   );

   tri_csa32 pp1_00_csa_22(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_02[22]),		//i--
      .b(pp0_01[22]),		//i--
      .c(pp0_00[22]),		//i--
      .sum(pp1_01[22]),		//o--
      .car(pp1_00[21])		//o--
   );

   tri_csa32 pp1_00_csa_21(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_02[21]),		//i--
      .b(pp0_01[21]),		//i--
      .c(pp0_00[21]),		//i--
      .sum(pp1_01[21]),		//o--
      .car(pp1_00[20])		//o--
   );

   tri_csa32 pp1_00_csa_20(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_02[20]),		//i--
      .b(pp0_01[20]),		//i--
      .c(pp0_00[20]),		//i--
      .sum(pp1_01[20]),		//o--
      .car(pp1_00[19])		//o--
   );

   tri_csa32 pp1_00_csa_19(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_02[19]),		//i--
      .b(pp0_01[19]),		//i--
      .c(pp0_00[19]),		//i--
      .sum(pp1_01[19]),		//o--
      .car(pp1_00[18])		//o--
   );

   tri_csa32 pp1_00_csa_18(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_02[18]),		//i--
      .b(pp0_01[18]),		//i--
      .c(pp0_00[18]),		//i--
      .sum(pp1_01[18]),		//o--
      .car(pp1_00[17])		//o--
   );

   tri_csa32 pp1_00_csa_17(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_02[17]),		//i--
      .b(pp0_01[17]),		//i--
      .c(pp0_00[17]),		//i--
      .sum(pp1_01[17]),		//o--
      .car(pp1_00[16])		//o--
   );

   tri_csa32 pp1_00_csa_16(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_02[16]),		//i--
      .b(pp0_01[16]),		//i--
      .c(pp0_00[16]),		//i--
      .sum(pp1_01[16]),		//o--
      .car(pp1_00[15])		//o--
   );

   tri_csa32 pp1_00_csa_15(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_02[15]),		//i--
      .b(pp0_01[15]),		//i--
      .c(pp0_00[15]),		//i--
      .sum(pp1_01[15]),		//o--
      .car(pp1_00[14])		//o--
   );

   tri_csa32 pp1_00_csa_14(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_02[14]),		//i--
      .b(pp0_01[14]),		//i--
      .c(pp0_00[14]),		//i--
      .sum(pp1_01[14]),		//o--
      .car(pp1_00[13])		//o--
   );

   tri_csa32 pp1_00_csa_13(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_02[13]),		//i--
      .b(pp0_01[13]),		//i--
      .c(pp0_00[13]),		//i--
      .sum(pp1_01[13]),		//o--
      .car(pp1_00[12])		//o--
   );

   tri_csa32 pp1_00_csa_12(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_02[12]),		//i--
      .b(pp0_01[12]),		//i--
      .c(pp0_00[12]),		//i--
      .sum(pp1_01[12]),		//o--
      .car(pp1_00[11])		//o--
   );

   tri_csa32 pp1_00_csa_11(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_02[11]),		//i--
      .b(pp0_01[11]),		//i--
      .c(pp0_00[11]),		//i--
      .sum(pp1_01[11]),		//o--
      .car(pp1_00[10])		//o--
   );

   tri_csa32 pp1_00_csa_10(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_02[10]),		//i--
      .b(pp0_01[10]),		//i--
      .c(pp0_00[10]),		//i--
      .sum(pp1_01[10]),		//o--
      .car(pp1_00[9])		//o--
   );

   tri_csa32 pp1_00_csa_09(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_02[9]),		//i--
      .b(pp0_01[9]),		//i--
      .c(pp0_00[9]),		//i--
      .sum(pp1_01[9]),		//o--
      .car(pp1_00[8])		//o--
   );

   tri_csa32 pp1_00_csa_08(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_02[8]),		//i--
      .b(pp0_01[8]),		//i--
      .c(pp0_00[8]),		//i--
      .sum(pp1_01[8]),		//o--
      .car(pp1_00[7])		//o--
   );

   tri_csa32 pp1_00_csa_07(
      .vd(vdd),
      .gd(gnd),
      .a(pp0_02[7]),		//i--
      .b(pp0_01[7]),		//i--
      .c(pp0_00[7]),		//i--
      .sum(pp1_01[7]),		//o--
      .car(pp1_00[6])		//o--
   );

   tri_csa32 pp1_00_csa_06(
      .vd(vdd),
      .gd(gnd),
      .a(tiup),		//i--
      .b(pp0_01[6]),		//i--
      .c(pp0_00[6]),		//i--
      .sum(pp1_01[6]),		//o--
      .car(pp1_00[5])		//o--
   );

   tri_fu_csa22_h2 pp1_00_csa_05(
      .a(pp0_01[5]),		//i--
      .b(pp0_00[5]),		//i--
      .sum(pp1_01[5]),		//o--
      .car(pp1_00[4])		//o--
   );

   tri_fu_csa22_h2 pp1_00_csa_04(
      .a(tiup),		//i--
      .b(pp0_00[4]),		//i--
      .sum(pp1_01[4]),		//o--
      .car(pp1_00[3])		//o--
   );

   generate
      if (inst == 0)
      begin : gg0
         assign pp1_01[3] = tidn;		//unique for different copies of tri_fu_mul_92 ("0" for msb copy)
         assign pp1_01[2] = tidn;		//unique for different copies of tri_fu_mul_92 ("0" for msb copy)
      end
   endgenerate

   generate
      if (inst == 1)
      begin : gg1
         assign pp1_01[3] = pp0_00[3];		//unique for different copies of tri_fu_mul_92 ("0" for msb copy)
         assign pp1_01[2] = pp0_00[2];		//unique for different copies of tri_fu_mul_92 ("0" for msb copy)
      end
   endgenerate

   generate
      if (inst == 2)
      begin : gg2
         assign pp1_01[3] = pp0_00[3];		//unique for different copies of tri_fu_mul_92 ("0" for msb copy)
         assign pp1_01[2] = pp0_00[2];		//unique for different copies of tri_fu_mul_92 ("0" for msb copy)
      end
   endgenerate

   ////##################################################
   ////# Compressor Level 2
   ////##################################################

   ////#    0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000111111111
   ////#    0000000000111111111122222222223333333333444444444455555555556666666666777777777788888888889999999999000000000
   ////#    0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678
   ////#    ...............ouuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuoo..................................  pp1_05
   ////#    ..............occccccccccccccccccccccccccccccccccccccccccccccccccccccccc__o..................................  pp1_04
   ////#    .........ouuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuoo_o......................................  pp1_03
   ////# -------------------------------------------------------------------------------------
   ////#    ..............233333333333333333333333333333333333333333333333333333323
   ////#    .........ooooouuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuoooo.................................   pp2_03
   ////#    .............ccccccccccccccccccccccccccccccccccccccccccccccccccccccccc_o__o.................................   pp2_02

   assign pp2_03[74] = pp1_05[74];
   assign pp2_03[73] = pp1_05[73];
   assign pp2_03[72] = pp1_05[72];
   assign pp2_03[71] = pp1_05[71];

   assign pp2_02[74] = pp1_04[74];
   assign pp2_02[73] = tidn;
   assign pp2_02[72] = tidn;
   assign pp2_02[71] = pp1_04[71];
   assign pp2_02[70] = tidn;


   tri_csa32 pp2_01_csa_70(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_05[70]),		//i--
      .b(pp1_04[70]),		//i--
      .c(pp1_03[70]),		//i--
      .sum(pp2_03[70]),		//o--
      .car(pp2_02[69])		//o--
   );

   tri_fu_csa22_h2 pp2_01_csa_69(
      .a(pp1_05[69]),		//i--
      .b(pp1_04[69]),		//i--
      .sum(pp2_03[69]),		//o--
      .car(pp2_02[68])		//o--
   );

   tri_csa32 pp2_01_csa_68(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_05[68]),		//i--
      .b(pp1_04[68]),		//i--
      .c(pp1_03[68]),		//i--
      .sum(pp2_03[68]),		//o--
      .car(pp2_02[67])		//o--
   );

   tri_csa32 pp2_01_csa_67(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_05[67]),		//i--
      .b(pp1_04[67]),		//i--
      .c(pp1_03[67]),		//i--
      .sum(pp2_03[67]),		//o--
      .car(pp2_02[66])		//o--
   );

   tri_csa32 pp2_01_csa_66(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_05[66]),		//i--
      .b(pp1_04[66]),		//i--
      .c(pp1_03[66]),		//i--
      .sum(pp2_03[66]),		//o--
      .car(pp2_02[65])		//o--
   );

   tri_csa32 pp2_01_csa_65(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_05[65]),		//i--
      .b(pp1_04[65]),		//i--
      .c(pp1_03[65]),		//i--
      .sum(pp2_03[65]),		//o--
      .car(pp2_02[64])		//o--
   );

   tri_csa32 pp2_01_csa_64(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_05[64]),		//i--
      .b(pp1_04[64]),		//i--
      .c(pp1_03[64]),		//i--
      .sum(pp2_03[64]),		//o--
      .car(pp2_02[63])		//o--
   );

   tri_csa32 pp2_01_csa_63(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_05[63]),		//i--
      .b(pp1_04[63]),		//i--
      .c(pp1_03[63]),		//i--
      .sum(pp2_03[63]),		//o--
      .car(pp2_02[62])		//o--
   );

   tri_csa32 pp2_01_csa_62(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_05[62]),		//i--
      .b(pp1_04[62]),		//i--
      .c(pp1_03[62]),		//i--
      .sum(pp2_03[62]),		//o--
      .car(pp2_02[61])		//o--
   );

   tri_csa32 pp2_01_csa_61(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_05[61]),		//i--
      .b(pp1_04[61]),		//i--
      .c(pp1_03[61]),		//i--
      .sum(pp2_03[61]),		//o--
      .car(pp2_02[60])		//o--
   );

   tri_csa32 pp2_01_csa_60(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_05[60]),		//i--
      .b(pp1_04[60]),		//i--
      .c(pp1_03[60]),		//i--
      .sum(pp2_03[60]),		//o--
      .car(pp2_02[59])		//o--
   );

   tri_csa32 pp2_01_csa_59(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_05[59]),		//i--
      .b(pp1_04[59]),		//i--
      .c(pp1_03[59]),		//i--
      .sum(pp2_03[59]),		//o--
      .car(pp2_02[58])		//o--
   );

   tri_csa32 pp2_01_csa_58(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_05[58]),		//i--
      .b(pp1_04[58]),		//i--
      .c(pp1_03[58]),		//i--
      .sum(pp2_03[58]),		//o--
      .car(pp2_02[57])		//o--
   );

   tri_csa32 pp2_01_csa_57(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_05[57]),		//i--
      .b(pp1_04[57]),		//i--
      .c(pp1_03[57]),		//i--
      .sum(pp2_03[57]),		//o--
      .car(pp2_02[56])		//o--
   );

   tri_csa32 pp2_01_csa_56(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_05[56]),		//i--
      .b(pp1_04[56]),		//i--
      .c(pp1_03[56]),		//i--
      .sum(pp2_03[56]),		//o--
      .car(pp2_02[55])		//o--
   );

   tri_csa32 pp2_01_csa_55(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_05[55]),		//i--
      .b(pp1_04[55]),		//i--
      .c(pp1_03[55]),		//i--
      .sum(pp2_03[55]),		//o--
      .car(pp2_02[54])		//o--
   );

   tri_csa32 pp2_01_csa_54(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_05[54]),		//i--
      .b(pp1_04[54]),		//i--
      .c(pp1_03[54]),		//i--
      .sum(pp2_03[54]),		//o--
      .car(pp2_02[53])		//o--
   );

   tri_csa32 pp2_01_csa_53(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_05[53]),		//i--
      .b(pp1_04[53]),		//i--
      .c(pp1_03[53]),		//i--
      .sum(pp2_03[53]),		//o--
      .car(pp2_02[52])		//o--
   );

   tri_csa32 pp2_01_csa_52(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_05[52]),		//i--
      .b(pp1_04[52]),		//i--
      .c(pp1_03[52]),		//i--
      .sum(pp2_03[52]),		//o--
      .car(pp2_02[51])		//o--
   );

   tri_csa32 pp2_01_csa_51(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_05[51]),		//i--
      .b(pp1_04[51]),		//i--
      .c(pp1_03[51]),		//i--
      .sum(pp2_03[51]),		//o--
      .car(pp2_02[50])		//o--
   );

   tri_csa32 pp2_01_csa_50(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_05[50]),		//i--
      .b(pp1_04[50]),		//i--
      .c(pp1_03[50]),		//i--
      .sum(pp2_03[50]),		//o--
      .car(pp2_02[49])		//o--
   );

   tri_csa32 pp2_01_csa_49(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_05[49]),		//i--
      .b(pp1_04[49]),		//i--
      .c(pp1_03[49]),		//i--
      .sum(pp2_03[49]),		//o--
      .car(pp2_02[48])		//o--
   );

   tri_csa32 pp2_01_csa_48(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_05[48]),		//i--
      .b(pp1_04[48]),		//i--
      .c(pp1_03[48]),		//i--
      .sum(pp2_03[48]),		//o--
      .car(pp2_02[47])		//o--
   );

   tri_csa32 pp2_01_csa_47(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_05[47]),		//i--
      .b(pp1_04[47]),		//i--
      .c(pp1_03[47]),		//i--
      .sum(pp2_03[47]),		//o--
      .car(pp2_02[46])		//o--
   );

   tri_csa32 pp2_01_csa_46(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_05[46]),		//i--
      .b(pp1_04[46]),		//i--
      .c(pp1_03[46]),		//i--
      .sum(pp2_03[46]),		//o--
      .car(pp2_02[45])		//o--
   );

   tri_csa32 pp2_01_csa_45(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_05[45]),		//i--
      .b(pp1_04[45]),		//i--
      .c(pp1_03[45]),		//i--
      .sum(pp2_03[45]),		//o--
      .car(pp2_02[44])		//o--
   );

   tri_csa32 pp2_01_csa_44(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_05[44]),		//i--
      .b(pp1_04[44]),		//i--
      .c(pp1_03[44]),		//i--
      .sum(pp2_03[44]),		//o--
      .car(pp2_02[43])		//o--
   );

   tri_csa32 pp2_01_csa_43(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_05[43]),		//i--
      .b(pp1_04[43]),		//i--
      .c(pp1_03[43]),		//i--
      .sum(pp2_03[43]),		//o--
      .car(pp2_02[42])		//o--
   );

   tri_csa32 pp2_01_csa_42(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_05[42]),		//i--
      .b(pp1_04[42]),		//i--
      .c(pp1_03[42]),		//i--
      .sum(pp2_03[42]),		//o--
      .car(pp2_02[41])		//o--
   );

   tri_csa32 pp2_01_csa_41(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_05[41]),		//i--
      .b(pp1_04[41]),		//i--
      .c(pp1_03[41]),		//i--
      .sum(pp2_03[41]),		//o--
      .car(pp2_02[40])		//o--
   );

   tri_csa32 pp2_01_csa_40(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_05[40]),		//i--
      .b(pp1_04[40]),		//i--
      .c(pp1_03[40]),		//i--
      .sum(pp2_03[40]),		//o--
      .car(pp2_02[39])		//o--
   );

   tri_csa32 pp2_01_csa_39(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_05[39]),		//i--
      .b(pp1_04[39]),		//i--
      .c(pp1_03[39]),		//i--
      .sum(pp2_03[39]),		//o--
      .car(pp2_02[38])		//o--
   );

   tri_csa32 pp2_01_csa_38(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_05[38]),		//i--
      .b(pp1_04[38]),		//i--
      .c(pp1_03[38]),		//i--
      .sum(pp2_03[38]),		//o--
      .car(pp2_02[37])		//o--
   );

   tri_csa32 pp2_01_csa_37(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_05[37]),		//i--
      .b(pp1_04[37]),		//i--
      .c(pp1_03[37]),		//i--
      .sum(pp2_03[37]),		//o--
      .car(pp2_02[36])		//o--
   );

   tri_csa32 pp2_01_csa_36(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_05[36]),		//i--
      .b(pp1_04[36]),		//i--
      .c(pp1_03[36]),		//i--
      .sum(pp2_03[36]),		//o--
      .car(pp2_02[35])		//o--
   );

   tri_csa32 pp2_01_csa_35(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_05[35]),		//i--
      .b(pp1_04[35]),		//i--
      .c(pp1_03[35]),		//i--
      .sum(pp2_03[35]),		//o--
      .car(pp2_02[34])		//o--
   );

   tri_csa32 pp2_01_csa_34(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_05[34]),		//i--
      .b(pp1_04[34]),		//i--
      .c(pp1_03[34]),		//i--
      .sum(pp2_03[34]),		//o--
      .car(pp2_02[33])		//o--
   );

   tri_csa32 pp2_01_csa_33(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_05[33]),		//i--
      .b(pp1_04[33]),		//i--
      .c(pp1_03[33]),		//i--
      .sum(pp2_03[33]),		//o--
      .car(pp2_02[32])		//o--
   );

   tri_csa32 pp2_01_csa_32(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_05[32]),		//i--
      .b(pp1_04[32]),		//i--
      .c(pp1_03[32]),		//i--
      .sum(pp2_03[32]),		//o--
      .car(pp2_02[31])		//o--
   );

   tri_csa32 pp2_01_csa_31(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_05[31]),		//i--
      .b(pp1_04[31]),		//i--
      .c(pp1_03[31]),		//i--
      .sum(pp2_03[31]),		//o--
      .car(pp2_02[30])		//o--
   );

   tri_csa32 pp2_01_csa_30(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_05[30]),		//i--
      .b(pp1_04[30]),		//i--
      .c(pp1_03[30]),		//i--
      .sum(pp2_03[30]),		//o--
      .car(pp2_02[29])		//o--
   );

   tri_csa32 pp2_01_csa_29(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_05[29]),		//i--
      .b(pp1_04[29]),		//i--
      .c(pp1_03[29]),		//i--
      .sum(pp2_03[29]),		//o--
      .car(pp2_02[28])		//o--
   );

   tri_csa32 pp2_01_csa_28(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_05[28]),		//i--
      .b(pp1_04[28]),		//i--
      .c(pp1_03[28]),		//i--
      .sum(pp2_03[28]),		//o--
      .car(pp2_02[27])		//o--
   );

   tri_csa32 pp2_01_csa_27(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_05[27]),		//i--
      .b(pp1_04[27]),		//i--
      .c(pp1_03[27]),		//i--
      .sum(pp2_03[27]),		//o--
      .car(pp2_02[26])		//o--
   );

   tri_csa32 pp2_01_csa_26(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_05[26]),		//i--
      .b(pp1_04[26]),		//i--
      .c(pp1_03[26]),		//i--
      .sum(pp2_03[26]),		//o--
      .car(pp2_02[25])		//o--
   );

   tri_csa32 pp2_01_csa_25(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_05[25]),		//i--
      .b(pp1_04[25]),		//i--
      .c(pp1_03[25]),		//i--
      .sum(pp2_03[25]),		//o--
      .car(pp2_02[24])		//o--
   );

   tri_csa32 pp2_01_csa_24(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_05[24]),		//i--
      .b(pp1_04[24]),		//i--
      .c(pp1_03[24]),		//i--
      .sum(pp2_03[24]),		//o--
      .car(pp2_02[23])		//o--
   );

   tri_csa32 pp2_01_csa_23(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_05[23]),		//i--
      .b(pp1_04[23]),		//i--
      .c(pp1_03[23]),		//i--
      .sum(pp2_03[23]),		//o--
      .car(pp2_02[22])		//o--
   );

   tri_csa32 pp2_01_csa_22(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_05[22]),		//i--
      .b(pp1_04[22]),		//i--
      .c(pp1_03[22]),		//i--
      .sum(pp2_03[22]),		//o--
      .car(pp2_02[21])		//o--
   );

   tri_csa32 pp2_01_csa_21(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_05[21]),		//i--
      .b(pp1_04[21]),		//i--
      .c(pp1_03[21]),		//i--
      .sum(pp2_03[21]),		//o--
      .car(pp2_02[20])		//o--
   );

   tri_csa32 pp2_01_csa_20(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_05[20]),		//i--
      .b(pp1_04[20]),		//i--
      .c(pp1_03[20]),		//i--
      .sum(pp2_03[20]),		//o--
      .car(pp2_02[19])		//o--
   );

   tri_csa32 pp2_01_csa_19(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_05[19]),		//i--
      .b(pp1_04[19]),		//i--
      .c(pp1_03[19]),		//i--
      .sum(pp2_03[19]),		//o--
      .car(pp2_02[18])		//o--
   );

   tri_csa32 pp2_01_csa_18(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_05[18]),		//i--
      .b(pp1_04[18]),		//i--
      .c(pp1_03[18]),		//i--
      .sum(pp2_03[18]),		//o--
      .car(pp2_02[17])		//o--
   );

   tri_csa32 pp2_01_csa_17(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_05[17]),		//i--
      .b(pp1_04[17]),		//i--
      .c(pp1_03[17]),		//i--
      .sum(pp2_03[17]),		//o--
      .car(pp2_02[16])		//o--
   );

   tri_csa32 pp2_01_csa_16(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_05[16]),		//i--
      .b(pp1_04[16]),		//i--
      .c(pp1_03[16]),		//i--
      .sum(pp2_03[16]),		//o--
      .car(pp2_02[15])		//o--
   );

   tri_csa32 pp2_01_csa_15(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_05[15]),		//i--
      .b(pp1_04[15]),		//i--
      .c(pp1_03[15]),		//i--
      .sum(pp2_03[15]),		//o--
      .car(pp2_02[14])		//o--
   );

   tri_fu_csa22_h2 pp2_01_csa_14(
      .a(tiup),		//i--
      .b(pp1_03[14]),		//i--
      .sum(pp2_03[14]),		//o--
      .car(pp2_02[13])		//o--
   );
   assign pp2_03[13] = pp1_03[13];
   assign pp2_03[12] = pp1_03[12];
   assign pp2_03[11] = pp1_03[11];
   assign pp2_03[10] = pp1_03[10];
   assign pp2_03[9] = pp1_03[9];
   assign pp2_03[8] = tiup;

   ////#    0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000111111111
   ////#    0000000000111111111122222222223333333333444444444455555555556666666666777777777788888888889999999999000000000
   ////#    0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678
   ////#    ........occccccccccccccccccccccccccccccccccccccccccccccccccccccccc__o........................................  pp1_02
   ////#    ...ouuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuoo_o............................................  pp1_01
   ////#    ..occccccccccccccccccccccccccccccccccccccccccccccccccccccccc__o..............................................  pp1_00
   ////# -------------------------------------------------------------------------------------
   ////#       222223333333333333333333333333333333333333333333333333333223
   ////#    ..ouuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuooo__o........................................  pp2_01
   ////#    ..cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc__o............................................  pp2_00

   assign pp2_01[68] = pp1_02[68];
   assign pp2_01[67] = tidn;
   assign pp2_01[66] = tidn;
   assign pp2_01[65] = pp1_02[65];
   assign pp2_01[64] = pp1_02[64];
   assign pp2_01[63] = pp1_02[63];

   assign pp2_00[64] = pp1_01[64];
   assign pp2_00[63] = tidn;
   assign pp2_00[62] = tidn;


   tri_csa32 pp2_00_csa_62(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_02[62]),		//i--
      .b(pp1_01[62]),		//i--
      .c(pp1_00[62]),		//i--
      .sum(pp2_01[62]),		//o--
      .car(pp2_00[61])		//o--
   );

   tri_fu_csa22_h2 pp2_00_csa_61(
      .a(pp1_02[61]),		//i--
      .b(pp1_01[61]),		//i--
      .sum(pp2_01[61]),		//o--
      .car(pp2_00[60])		//o--
   );

   tri_fu_csa22_h2 pp2_00_csa_60(
      .a(pp1_02[60]),		//i--
      .b(pp1_01[60]),		//i--
      .sum(pp2_01[60]),		//o--
      .car(pp2_00[59])		//o--
   );

   tri_csa32 pp2_00_csa_59(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_02[59]),		//i--
      .b(pp1_01[59]),		//i--
      .c(pp1_00[59]),		//i--
      .sum(pp2_01[59]),		//o--
      .car(pp2_00[58])		//o--
   );

   tri_csa32 pp2_00_csa_58(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_02[58]),		//i--
      .b(pp1_01[58]),		//i--
      .c(pp1_00[58]),		//i--
      .sum(pp2_01[58]),		//o--
      .car(pp2_00[57])		//o--
   );

   tri_csa32 pp2_00_csa_57(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_02[57]),		//i--
      .b(pp1_01[57]),		//i--
      .c(pp1_00[57]),		//i--
      .sum(pp2_01[57]),		//o--
      .car(pp2_00[56])		//o--
   );

   tri_csa32 pp2_00_csa_56(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_02[56]),		//i--
      .b(pp1_01[56]),		//i--
      .c(pp1_00[56]),		//i--
      .sum(pp2_01[56]),		//o--
      .car(pp2_00[55])		//o--
   );

   tri_csa32 pp2_00_csa_55(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_02[55]),		//i--
      .b(pp1_01[55]),		//i--
      .c(pp1_00[55]),		//i--
      .sum(pp2_01[55]),		//o--
      .car(pp2_00[54])		//o--
   );

   tri_csa32 pp2_00_csa_54(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_02[54]),		//i--
      .b(pp1_01[54]),		//i--
      .c(pp1_00[54]),		//i--
      .sum(pp2_01[54]),		//o--
      .car(pp2_00[53])		//o--
   );

   tri_csa32 pp2_00_csa_53(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_02[53]),		//i--
      .b(pp1_01[53]),		//i--
      .c(pp1_00[53]),		//i--
      .sum(pp2_01[53]),		//o--
      .car(pp2_00[52])		//o--
   );

   tri_csa32 pp2_00_csa_52(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_02[52]),		//i--
      .b(pp1_01[52]),		//i--
      .c(pp1_00[52]),		//i--
      .sum(pp2_01[52]),		//o--
      .car(pp2_00[51])		//o--
   );

   tri_csa32 pp2_00_csa_51(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_02[51]),		//i--
      .b(pp1_01[51]),		//i--
      .c(pp1_00[51]),		//i--
      .sum(pp2_01[51]),		//o--
      .car(pp2_00[50])		//o--
   );

   tri_csa32 pp2_00_csa_50(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_02[50]),		//i--
      .b(pp1_01[50]),		//i--
      .c(pp1_00[50]),		//i--
      .sum(pp2_01[50]),		//o--
      .car(pp2_00[49])		//o--
   );

   tri_csa32 pp2_00_csa_49(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_02[49]),		//i--
      .b(pp1_01[49]),		//i--
      .c(pp1_00[49]),		//i--
      .sum(pp2_01[49]),		//o--
      .car(pp2_00[48])		//o--
   );

   tri_csa32 pp2_00_csa_48(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_02[48]),		//i--
      .b(pp1_01[48]),		//i--
      .c(pp1_00[48]),		//i--
      .sum(pp2_01[48]),		//o--
      .car(pp2_00[47])		//o--
   );

   tri_csa32 pp2_00_csa_47(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_02[47]),		//i--
      .b(pp1_01[47]),		//i--
      .c(pp1_00[47]),		//i--
      .sum(pp2_01[47]),		//o--
      .car(pp2_00[46])		//o--
   );

   tri_csa32 pp2_00_csa_46(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_02[46]),		//i--
      .b(pp1_01[46]),		//i--
      .c(pp1_00[46]),		//i--
      .sum(pp2_01[46]),		//o--
      .car(pp2_00[45])		//o--
   );

   tri_csa32 pp2_00_csa_45(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_02[45]),		//i--
      .b(pp1_01[45]),		//i--
      .c(pp1_00[45]),		//i--
      .sum(pp2_01[45]),		//o--
      .car(pp2_00[44])		//o--
   );

   tri_csa32 pp2_00_csa_44(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_02[44]),		//i--
      .b(pp1_01[44]),		//i--
      .c(pp1_00[44]),		//i--
      .sum(pp2_01[44]),		//o--
      .car(pp2_00[43])		//o--
   );

   tri_csa32 pp2_00_csa_43(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_02[43]),		//i--
      .b(pp1_01[43]),		//i--
      .c(pp1_00[43]),		//i--
      .sum(pp2_01[43]),		//o--
      .car(pp2_00[42])		//o--
   );

   tri_csa32 pp2_00_csa_42(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_02[42]),		//i--
      .b(pp1_01[42]),		//i--
      .c(pp1_00[42]),		//i--
      .sum(pp2_01[42]),		//o--
      .car(pp2_00[41])		//o--
   );

   tri_csa32 pp2_00_csa_41(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_02[41]),		//i--
      .b(pp1_01[41]),		//i--
      .c(pp1_00[41]),		//i--
      .sum(pp2_01[41]),		//o--
      .car(pp2_00[40])		//o--
   );

   tri_csa32 pp2_00_csa_40(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_02[40]),		//i--
      .b(pp1_01[40]),		//i--
      .c(pp1_00[40]),		//i--
      .sum(pp2_01[40]),		//o--
      .car(pp2_00[39])		//o--
   );

   tri_csa32 pp2_00_csa_39(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_02[39]),		//i--
      .b(pp1_01[39]),		//i--
      .c(pp1_00[39]),		//i--
      .sum(pp2_01[39]),		//o--
      .car(pp2_00[38])		//o--
   );

   tri_csa32 pp2_00_csa_38(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_02[38]),		//i--
      .b(pp1_01[38]),		//i--
      .c(pp1_00[38]),		//i--
      .sum(pp2_01[38]),		//o--
      .car(pp2_00[37])		//o--
   );

   tri_csa32 pp2_00_csa_37(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_02[37]),		//i--
      .b(pp1_01[37]),		//i--
      .c(pp1_00[37]),		//i--
      .sum(pp2_01[37]),		//o--
      .car(pp2_00[36])		//o--
   );

   tri_csa32 pp2_00_csa_36(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_02[36]),		//i--
      .b(pp1_01[36]),		//i--
      .c(pp1_00[36]),		//i--
      .sum(pp2_01[36]),		//o--
      .car(pp2_00[35])		//o--
   );

   tri_csa32 pp2_00_csa_35(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_02[35]),		//i--
      .b(pp1_01[35]),		//i--
      .c(pp1_00[35]),		//i--
      .sum(pp2_01[35]),		//o--
      .car(pp2_00[34])		//o--
   );

   tri_csa32 pp2_00_csa_34(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_02[34]),		//i--
      .b(pp1_01[34]),		//i--
      .c(pp1_00[34]),		//i--
      .sum(pp2_01[34]),		//o--
      .car(pp2_00[33])		//o--
   );

   tri_csa32 pp2_00_csa_33(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_02[33]),		//i--
      .b(pp1_01[33]),		//i--
      .c(pp1_00[33]),		//i--
      .sum(pp2_01[33]),		//o--
      .car(pp2_00[32])		//o--
   );

   tri_csa32 pp2_00_csa_32(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_02[32]),		//i--
      .b(pp1_01[32]),		//i--
      .c(pp1_00[32]),		//i--
      .sum(pp2_01[32]),		//o--
      .car(pp2_00[31])		//o--
   );

   tri_csa32 pp2_00_csa_31(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_02[31]),		//i--
      .b(pp1_01[31]),		//i--
      .c(pp1_00[31]),		//i--
      .sum(pp2_01[31]),		//o--
      .car(pp2_00[30])		//o--
   );

   tri_csa32 pp2_00_csa_30(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_02[30]),		//i--
      .b(pp1_01[30]),		//i--
      .c(pp1_00[30]),		//i--
      .sum(pp2_01[30]),		//o--
      .car(pp2_00[29])		//o--
   );

   tri_csa32 pp2_00_csa_29(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_02[29]),		//i--
      .b(pp1_01[29]),		//i--
      .c(pp1_00[29]),		//i--
      .sum(pp2_01[29]),		//o--
      .car(pp2_00[28])		//o--
   );

   tri_csa32 pp2_00_csa_28(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_02[28]),		//i--
      .b(pp1_01[28]),		//i--
      .c(pp1_00[28]),		//i--
      .sum(pp2_01[28]),		//o--
      .car(pp2_00[27])		//o--
   );

   tri_csa32 pp2_00_csa_27(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_02[27]),		//i--
      .b(pp1_01[27]),		//i--
      .c(pp1_00[27]),		//i--
      .sum(pp2_01[27]),		//o--
      .car(pp2_00[26])		//o--
   );

   tri_csa32 pp2_00_csa_26(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_02[26]),		//i--
      .b(pp1_01[26]),		//i--
      .c(pp1_00[26]),		//i--
      .sum(pp2_01[26]),		//o--
      .car(pp2_00[25])		//o--
   );

   tri_csa32 pp2_00_csa_25(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_02[25]),		//i--
      .b(pp1_01[25]),		//i--
      .c(pp1_00[25]),		//i--
      .sum(pp2_01[25]),		//o--
      .car(pp2_00[24])		//o--
   );

   tri_csa32 pp2_00_csa_24(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_02[24]),		//i--
      .b(pp1_01[24]),		//i--
      .c(pp1_00[24]),		//i--
      .sum(pp2_01[24]),		//o--
      .car(pp2_00[23])		//o--
   );

   tri_csa32 pp2_00_csa_23(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_02[23]),		//i--
      .b(pp1_01[23]),		//i--
      .c(pp1_00[23]),		//i--
      .sum(pp2_01[23]),		//o--
      .car(pp2_00[22])		//o--
   );

   tri_csa32 pp2_00_csa_22(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_02[22]),		//i--
      .b(pp1_01[22]),		//i--
      .c(pp1_00[22]),		//i--
      .sum(pp2_01[22]),		//o--
      .car(pp2_00[21])		//o--
   );

   tri_csa32 pp2_00_csa_21(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_02[21]),		//i--
      .b(pp1_01[21]),		//i--
      .c(pp1_00[21]),		//i--
      .sum(pp2_01[21]),		//o--
      .car(pp2_00[20])		//o--
   );

   tri_csa32 pp2_00_csa_20(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_02[20]),		//i--
      .b(pp1_01[20]),		//i--
      .c(pp1_00[20]),		//i--
      .sum(pp2_01[20]),		//o--
      .car(pp2_00[19])		//o--
   );

   tri_csa32 pp2_00_csa_19(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_02[19]),		//i--
      .b(pp1_01[19]),		//i--
      .c(pp1_00[19]),		//i--
      .sum(pp2_01[19]),		//o--
      .car(pp2_00[18])		//o--
   );

   tri_csa32 pp2_00_csa_18(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_02[18]),		//i--
      .b(pp1_01[18]),		//i--
      .c(pp1_00[18]),		//i--
      .sum(pp2_01[18]),		//o--
      .car(pp2_00[17])		//o--
   );

   tri_csa32 pp2_00_csa_17(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_02[17]),		//i--
      .b(pp1_01[17]),		//i--
      .c(pp1_00[17]),		//i--
      .sum(pp2_01[17]),		//o--
      .car(pp2_00[16])		//o--
   );

   tri_csa32 pp2_00_csa_16(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_02[16]),		//i--
      .b(pp1_01[16]),		//i--
      .c(pp1_00[16]),		//i--
      .sum(pp2_01[16]),		//o--
      .car(pp2_00[15])		//o--
   );

   tri_csa32 pp2_00_csa_15(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_02[15]),		//i--
      .b(pp1_01[15]),		//i--
      .c(pp1_00[15]),		//i--
      .sum(pp2_01[15]),		//o--
      .car(pp2_00[14])		//o--
   );

   tri_csa32 pp2_00_csa_14(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_02[14]),		//i--
      .b(pp1_01[14]),		//i--
      .c(pp1_00[14]),		//i--
      .sum(pp2_01[14]),		//o--
      .car(pp2_00[13])		//o--
   );

   tri_csa32 pp2_00_csa_13(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_02[13]),		//i--
      .b(pp1_01[13]),		//i--
      .c(pp1_00[13]),		//i--
      .sum(pp2_01[13]),		//o--
      .car(pp2_00[12])		//o--
   );

   tri_csa32 pp2_00_csa_12(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_02[12]),		//i--
      .b(pp1_01[12]),		//i--
      .c(pp1_00[12]),		//i--
      .sum(pp2_01[12]),		//o--
      .car(pp2_00[11])		//o--
   );

   tri_csa32 pp2_00_csa_11(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_02[11]),		//i--
      .b(pp1_01[11]),		//i--
      .c(pp1_00[11]),		//i--
      .sum(pp2_01[11]),		//o--
      .car(pp2_00[10])		//o--
   );

   tri_csa32 pp2_00_csa_10(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_02[10]),		//i--
      .b(pp1_01[10]),		//i--
      .c(pp1_00[10]),		//i--
      .sum(pp2_01[10]),		//o--
      .car(pp2_00[9])		//o--
   );

   tri_csa32 pp2_00_csa_09(
      .vd(vdd),
      .gd(gnd),
      .a(pp1_02[9]),		//i--
      .b(pp1_01[9]),		//i--
      .c(pp1_00[9]),		//i--
      .sum(pp2_01[9]),		//o--
      .car(pp2_00[8])		//o--
   );

   tri_fu_csa22_h2 pp2_00_csa_08(
      .a(pp1_01[8]),		//i--
      .b(pp1_00[8]),		//i--
      .sum(pp2_01[8]),		//o--
      .car(pp2_00[7])		//o--
   );

   tri_fu_csa22_h2 pp2_00_csa_07(
      .a(pp1_01[7]),		//i--
      .b(pp1_00[7]),		//i--
      .sum(pp2_01[7]),		//o--
      .car(pp2_00[6])		//o--
   );

   tri_fu_csa22_h2 pp2_00_csa_06(
      .a(pp1_01[6]),		//i--
      .b(pp1_00[6]),		//i--
      .sum(pp2_01[6]),		//o--
      .car(pp2_00[5])		//o--
   );

   tri_fu_csa22_h2 pp2_00_csa_05(
      .a(pp1_01[5]),		//i--
      .b(pp1_00[5]),		//i--
      .sum(pp2_01[5]),		//o--
      .car(pp2_00[4])		//o--
   );

   tri_fu_csa22_h2 pp2_00_csa_04(
      .a(pp1_01[4]),		//i--
      .b(pp1_00[4]),		//i--
      .sum(pp2_01[4]),		//o--
      .car(pp2_00[3])		//o--
   );

   tri_fu_csa22_h2 pp2_00_csa_03(
      .a(pp1_01[3]),		//i--
      .b(pp1_00[3]),		//i--
      .sum(pp2_01[3]),		//o--
      .car(pp2_00[2])		//o--
   );
   assign pp2_01[2] = pp1_01[2];

   ////##################################################
   ////# Compressor Level 3
   ////##################################################

   ////#    0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000111111111
   ////#    0000000000111111111122222222223333333333444444444455555555556666666666777777777788888888889999999999000000000
   ////#    0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678
   ////#    .........ooooouuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuoooo..................................  pp2_03
   ////#    .............ccccccccccccccccccccccccccccccccccccccccccccccccccccccccc_o__o..................................  pp2_02
   ////#    ..ouuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuooo__o........................................  pp2_01
   ////#    ..cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc__o............................................  pp2_00
   ////# ----------------------------------------------------------------------------------------------------------
   ////#    ..2222223333344444444444444444444444444444444444444444444444443343223........................................
   ////#    ..uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuoooooo..................................  pp3_01
   ////#    .ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc_o_o__o..................................  pp3_00

   assign pp3_01[74] = pp2_03[74];
   assign pp3_01[73] = pp2_03[73];
   assign pp3_01[72] = pp2_03[72];
   assign pp3_01[71] = pp2_03[71];
   assign pp3_01[70] = pp2_03[70];
   assign pp3_01[69] = pp2_03[69];

   assign pp3_00[74] = pp2_02[74];
   assign pp3_00[73] = tidn;
   assign pp3_00[72] = tidn;
   assign pp3_00[71] = pp2_02[71];
   assign pp3_00[70] = tidn;
   assign pp3_00[69] = pp2_02[69];
   assign pp3_00[68] = tidn;


   tri_csa32 pp3_00_csa_68(
      .vd(vdd),
      .gd(gnd),
      .a(pp2_03[68]),		//i--
      .b(pp2_02[68]),		//i--
      .c(pp2_01[68]),		//i--
      .sum(pp3_01[68]),		//o--
      .car(pp3_00[67])		//o--
   );

   tri_fu_csa22_h2 pp3_00_csa_67(
      .a(pp2_03[67]),		//i--
      .b(pp2_02[67]),		//i--
      .sum(pp3_01[67]),		//o--
      .car(pp3_00[66])		//o--
   );

   tri_fu_csa22_h2 pp3_00_csa_66(
      .a(pp2_03[66]),		//i--
      .b(pp2_02[66]),		//i--
      .sum(pp3_01[66]),		//o--
      .car(pp3_00[65])		//o--
   );

   tri_csa32 pp3_00_csa_65(
      .vd(vdd),
      .gd(gnd),
      .a(pp2_03[65]),		//i--
      .b(pp2_02[65]),		//i--
      .c(pp2_01[65]),		//i--
      .sum(pp3_01[65]),		//o--
      .car(pp3_00[64])		//o--
   );

   tri_csa42 pp3_00_csa_64(
      .vd(vdd),
      .gd(gnd),
      .a(pp2_03[64]),		//i--
      .b(pp2_02[64]),		//i--
      .c(pp2_01[64]),		//i--
      .d(pp2_00[64]),		//i--
      .ki(tidn),		//i--
      .ko(pp3_00_ko[63]),		//o--
      .sum(pp3_01[64]),		//o--
      .car(pp3_00[63])		//o--
   );

   tri_csa42 pp3_00_csa_63(
      .vd(vdd),
      .gd(gnd),
      .a(pp2_03[63]),		//i--
      .b(pp2_02[63]),		//i--
      .c(pp2_01[63]),		//i--
      .d(tidn),		//i--
      .ki(pp3_00_ko[63]),		//i--
      .ko(pp3_00_ko[62]),		//o--
      .sum(pp3_01[63]),		//o--
      .car(pp3_00[62])		//o--
   );

   tri_csa42 pp3_00_csa_62(
      .vd(vdd),
      .gd(gnd),
      .a(pp2_03[62]),		//i--
      .b(pp2_02[62]),		//i--
      .c(pp2_01[62]),		//i--
      .d(tidn),		//i--
      .ki(pp3_00_ko[62]),		//i--
      .ko(pp3_00_ko[61]),		//o--
      .sum(pp3_01[62]),		//o--
      .car(pp3_00[61])		//o--
   );

   tri_csa42 pp3_00_csa_61(
      .vd(vdd),
      .gd(gnd),
      .a(pp2_03[61]),		//i--
      .b(pp2_02[61]),		//i--
      .c(pp2_01[61]),		//i--
      .d(pp2_00[61]),		//i--
      .ki(pp3_00_ko[61]),		//i--
      .ko(pp3_00_ko[60]),		//o--
      .sum(pp3_01[61]),		//o--
      .car(pp3_00[60])		//o--
   );

   tri_csa42 pp3_00_csa_60(
      .vd(vdd),
      .gd(gnd),
      .a(pp2_03[60]),		//i--
      .b(pp2_02[60]),		//i--
      .c(pp2_01[60]),		//i--
      .d(pp2_00[60]),		//i--
      .ki(pp3_00_ko[60]),		//i--
      .ko(pp3_00_ko[59]),		//o--
      .sum(pp3_01[60]),		//o--
      .car(pp3_00[59])		//o--
   );

   tri_csa42 pp3_00_csa_59(
      .vd(vdd),
      .gd(gnd),
      .a(pp2_03[59]),		//i--
      .b(pp2_02[59]),		//i--
      .c(pp2_01[59]),		//i--
      .d(pp2_00[59]),		//i--
      .ki(pp3_00_ko[59]),		//i--
      .ko(pp3_00_ko[58]),		//o--
      .sum(pp3_01[59]),		//o--
      .car(pp3_00[58])		//o--
   );

   tri_csa42 pp3_00_csa_58(
      .vd(vdd),
      .gd(gnd),
      .a(pp2_03[58]),		//i--
      .b(pp2_02[58]),		//i--
      .c(pp2_01[58]),		//i--
      .d(pp2_00[58]),		//i--
      .ki(pp3_00_ko[58]),		//i--
      .ko(pp3_00_ko[57]),		//o--
      .sum(pp3_01[58]),		//o--
      .car(pp3_00[57])		//o--
   );

   tri_csa42 pp3_00_csa_57(
      .vd(vdd),
      .gd(gnd),
      .a(pp2_03[57]),		//i--
      .b(pp2_02[57]),		//i--
      .c(pp2_01[57]),		//i--
      .d(pp2_00[57]),		//i--
      .ki(pp3_00_ko[57]),		//i--
      .ko(pp3_00_ko[56]),		//o--
      .sum(pp3_01[57]),		//o--
      .car(pp3_00[56])		//o--
   );

   tri_csa42 pp3_00_csa_56(
      .vd(vdd),
      .gd(gnd),
      .a(pp2_03[56]),		//i--
      .b(pp2_02[56]),		//i--
      .c(pp2_01[56]),		//i--
      .d(pp2_00[56]),		//i--
      .ki(pp3_00_ko[56]),		//i--
      .ko(pp3_00_ko[55]),		//o--
      .sum(pp3_01[56]),		//o--
      .car(pp3_00[55])		//o--
   );

   tri_csa42 pp3_00_csa_55(
      .vd(vdd),
      .gd(gnd),
      .a(pp2_03[55]),		//i--
      .b(pp2_02[55]),		//i--
      .c(pp2_01[55]),		//i--
      .d(pp2_00[55]),		//i--
      .ki(pp3_00_ko[55]),		//i--
      .ko(pp3_00_ko[54]),		//o--
      .sum(pp3_01[55]),		//o--
      .car(pp3_00[54])		//o--
   );

   tri_csa42 pp3_00_csa_54(
      .vd(vdd),
      .gd(gnd),
      .a(pp2_03[54]),		//i--
      .b(pp2_02[54]),		//i--
      .c(pp2_01[54]),		//i--
      .d(pp2_00[54]),		//i--
      .ki(pp3_00_ko[54]),		//i--
      .ko(pp3_00_ko[53]),		//o--
      .sum(pp3_01[54]),		//o--
      .car(pp3_00[53])		//o--
   );

   tri_csa42 pp3_00_csa_53(
      .vd(vdd),
      .gd(gnd),
      .a(pp2_03[53]),		//i--
      .b(pp2_02[53]),		//i--
      .c(pp2_01[53]),		//i--
      .d(pp2_00[53]),		//i--
      .ki(pp3_00_ko[53]),		//i--
      .ko(pp3_00_ko[52]),		//o--
      .sum(pp3_01[53]),		//o--
      .car(pp3_00[52])		//o--
   );

   tri_csa42 pp3_00_csa_52(
      .vd(vdd),
      .gd(gnd),
      .a(pp2_03[52]),		//i--
      .b(pp2_02[52]),		//i--
      .c(pp2_01[52]),		//i--
      .d(pp2_00[52]),		//i--
      .ki(pp3_00_ko[52]),		//i--
      .ko(pp3_00_ko[51]),		//o--
      .sum(pp3_01[52]),		//o--
      .car(pp3_00[51])		//o--
   );

   tri_csa42 pp3_00_csa_51(
      .vd(vdd),
      .gd(gnd),
      .a(pp2_03[51]),		//i--
      .b(pp2_02[51]),		//i--
      .c(pp2_01[51]),		//i--
      .d(pp2_00[51]),		//i--
      .ki(pp3_00_ko[51]),		//i--
      .ko(pp3_00_ko[50]),		//o--
      .sum(pp3_01[51]),		//o--
      .car(pp3_00[50])		//o--
   );

   tri_csa42 pp3_00_csa_50(
      .vd(vdd),
      .gd(gnd),
      .a(pp2_03[50]),		//i--
      .b(pp2_02[50]),		//i--
      .c(pp2_01[50]),		//i--
      .d(pp2_00[50]),		//i--
      .ki(pp3_00_ko[50]),		//i--
      .ko(pp3_00_ko[49]),		//o--
      .sum(pp3_01[50]),		//o--
      .car(pp3_00[49])		//o--
   );

   tri_csa42 pp3_00_csa_49(
      .vd(vdd),
      .gd(gnd),
      .a(pp2_03[49]),		//i--
      .b(pp2_02[49]),		//i--
      .c(pp2_01[49]),		//i--
      .d(pp2_00[49]),		//i--
      .ki(pp3_00_ko[49]),		//i--
      .ko(pp3_00_ko[48]),		//o--
      .sum(pp3_01[49]),		//o--
      .car(pp3_00[48])		//o--
   );

   tri_csa42 pp3_00_csa_48(
      .vd(vdd),
      .gd(gnd),
      .a(pp2_03[48]),		//i--
      .b(pp2_02[48]),		//i--
      .c(pp2_01[48]),		//i--
      .d(pp2_00[48]),		//i--
      .ki(pp3_00_ko[48]),		//i--
      .ko(pp3_00_ko[47]),		//o--
      .sum(pp3_01[48]),		//o--
      .car(pp3_00[47])		//o--
   );

   tri_csa42 pp3_00_csa_47(
      .vd(vdd),
      .gd(gnd),
      .a(pp2_03[47]),		//i--
      .b(pp2_02[47]),		//i--
      .c(pp2_01[47]),		//i--
      .d(pp2_00[47]),		//i--
      .ki(pp3_00_ko[47]),		//i--
      .ko(pp3_00_ko[46]),		//o--
      .sum(pp3_01[47]),		//o--
      .car(pp3_00[46])		//o--
   );

   tri_csa42 pp3_00_csa_46(
      .vd(vdd),
      .gd(gnd),
      .a(pp2_03[46]),		//i--
      .b(pp2_02[46]),		//i--
      .c(pp2_01[46]),		//i--
      .d(pp2_00[46]),		//i--
      .ki(pp3_00_ko[46]),		//i--
      .ko(pp3_00_ko[45]),		//o--
      .sum(pp3_01[46]),		//o--
      .car(pp3_00[45])		//o--
   );

   tri_csa42 pp3_00_csa_45(
      .vd(vdd),
      .gd(gnd),
      .a(pp2_03[45]),		//i--
      .b(pp2_02[45]),		//i--
      .c(pp2_01[45]),		//i--
      .d(pp2_00[45]),		//i--
      .ki(pp3_00_ko[45]),		//i--
      .ko(pp3_00_ko[44]),		//o--
      .sum(pp3_01[45]),		//o--
      .car(pp3_00[44])		//o--
   );

   tri_csa42 pp3_00_csa_44(
      .vd(vdd),
      .gd(gnd),
      .a(pp2_03[44]),		//i--
      .b(pp2_02[44]),		//i--
      .c(pp2_01[44]),		//i--
      .d(pp2_00[44]),		//i--
      .ki(pp3_00_ko[44]),		//i--
      .ko(pp3_00_ko[43]),		//o--
      .sum(pp3_01[44]),		//o--
      .car(pp3_00[43])		//o--
   );

   tri_csa42 pp3_00_csa_43(
      .vd(vdd),
      .gd(gnd),
      .a(pp2_03[43]),		//i--
      .b(pp2_02[43]),		//i--
      .c(pp2_01[43]),		//i--
      .d(pp2_00[43]),		//i--
      .ki(pp3_00_ko[43]),		//i--
      .ko(pp3_00_ko[42]),		//o--
      .sum(pp3_01[43]),		//o--
      .car(pp3_00[42])		//o--
   );

   tri_csa42 pp3_00_csa_42(
      .vd(vdd),
      .gd(gnd),
      .a(pp2_03[42]),		//i--
      .b(pp2_02[42]),		//i--
      .c(pp2_01[42]),		//i--
      .d(pp2_00[42]),		//i--
      .ki(pp3_00_ko[42]),		//i--
      .ko(pp3_00_ko[41]),		//o--
      .sum(pp3_01[42]),		//o--
      .car(pp3_00[41])		//o--
   );

   tri_csa42 pp3_00_csa_41(
      .vd(vdd),
      .gd(gnd),
      .a(pp2_03[41]),		//i--
      .b(pp2_02[41]),		//i--
      .c(pp2_01[41]),		//i--
      .d(pp2_00[41]),		//i--
      .ki(pp3_00_ko[41]),		//i--
      .ko(pp3_00_ko[40]),		//o--
      .sum(pp3_01[41]),		//o--
      .car(pp3_00[40])		//o--
   );

   tri_csa42 pp3_00_csa_40(
      .vd(vdd),
      .gd(gnd),
      .a(pp2_03[40]),		//i--
      .b(pp2_02[40]),		//i--
      .c(pp2_01[40]),		//i--
      .d(pp2_00[40]),		//i--
      .ki(pp3_00_ko[40]),		//i--
      .ko(pp3_00_ko[39]),		//o--
      .sum(pp3_01[40]),		//o--
      .car(pp3_00[39])		//o--
   );

   tri_csa42 pp3_00_csa_39(
      .vd(vdd),
      .gd(gnd),
      .a(pp2_03[39]),		//i--
      .b(pp2_02[39]),		//i--
      .c(pp2_01[39]),		//i--
      .d(pp2_00[39]),		//i--
      .ki(pp3_00_ko[39]),		//i--
      .ko(pp3_00_ko[38]),		//o--
      .sum(pp3_01[39]),		//o--
      .car(pp3_00[38])		//o--
   );

   tri_csa42 pp3_00_csa_38(
      .vd(vdd),
      .gd(gnd),
      .a(pp2_03[38]),		//i--
      .b(pp2_02[38]),		//i--
      .c(pp2_01[38]),		//i--
      .d(pp2_00[38]),		//i--
      .ki(pp3_00_ko[38]),		//i--
      .ko(pp3_00_ko[37]),		//o--
      .sum(pp3_01[38]),		//o--
      .car(pp3_00[37])		//o--
   );

   tri_csa42 pp3_00_csa_37(
      .vd(vdd),
      .gd(gnd),
      .a(pp2_03[37]),		//i--
      .b(pp2_02[37]),		//i--
      .c(pp2_01[37]),		//i--
      .d(pp2_00[37]),		//i--
      .ki(pp3_00_ko[37]),		//i--
      .ko(pp3_00_ko[36]),		//o--
      .sum(pp3_01[37]),		//o--
      .car(pp3_00[36])		//o--
   );

   tri_csa42 pp3_00_csa_36(
      .vd(vdd),
      .gd(gnd),
      .a(pp2_03[36]),		//i--
      .b(pp2_02[36]),		//i--
      .c(pp2_01[36]),		//i--
      .d(pp2_00[36]),		//i--
      .ki(pp3_00_ko[36]),		//i--
      .ko(pp3_00_ko[35]),		//o--
      .sum(pp3_01[36]),		//o--
      .car(pp3_00[35])		//o--
   );

   tri_csa42 pp3_00_csa_35(
      .vd(vdd),
      .gd(gnd),
      .a(pp2_03[35]),		//i--
      .b(pp2_02[35]),		//i--
      .c(pp2_01[35]),		//i--
      .d(pp2_00[35]),		//i--
      .ki(pp3_00_ko[35]),		//i--
      .ko(pp3_00_ko[34]),		//o--
      .sum(pp3_01[35]),		//o--
      .car(pp3_00[34])		//o--
   );

   tri_csa42 pp3_00_csa_34(
      .vd(vdd),
      .gd(gnd),
      .a(pp2_03[34]),		//i--
      .b(pp2_02[34]),		//i--
      .c(pp2_01[34]),		//i--
      .d(pp2_00[34]),		//i--
      .ki(pp3_00_ko[34]),		//i--
      .ko(pp3_00_ko[33]),		//o--
      .sum(pp3_01[34]),		//o--
      .car(pp3_00[33])		//o--
   );

   tri_csa42 pp3_00_csa_33(
      .vd(vdd),
      .gd(gnd),
      .a(pp2_03[33]),		//i--
      .b(pp2_02[33]),		//i--
      .c(pp2_01[33]),		//i--
      .d(pp2_00[33]),		//i--
      .ki(pp3_00_ko[33]),		//i--
      .ko(pp3_00_ko[32]),		//o--
      .sum(pp3_01[33]),		//o--
      .car(pp3_00[32])		//o--
   );

   tri_csa42 pp3_00_csa_32(
      .vd(vdd),
      .gd(gnd),
      .a(pp2_03[32]),		//i--
      .b(pp2_02[32]),		//i--
      .c(pp2_01[32]),		//i--
      .d(pp2_00[32]),		//i--
      .ki(pp3_00_ko[32]),		//i--
      .ko(pp3_00_ko[31]),		//o--
      .sum(pp3_01[32]),		//o--
      .car(pp3_00[31])		//o--
   );

   tri_csa42 pp3_00_csa_31(
      .vd(vdd),
      .gd(gnd),
      .a(pp2_03[31]),		//i--
      .b(pp2_02[31]),		//i--
      .c(pp2_01[31]),		//i--
      .d(pp2_00[31]),		//i--
      .ki(pp3_00_ko[31]),		//i--
      .ko(pp3_00_ko[30]),		//o--
      .sum(pp3_01[31]),		//o--
      .car(pp3_00[30])		//o--
   );

   tri_csa42 pp3_00_csa_30(
      .vd(vdd),
      .gd(gnd),
      .a(pp2_03[30]),		//i--
      .b(pp2_02[30]),		//i--
      .c(pp2_01[30]),		//i--
      .d(pp2_00[30]),		//i--
      .ki(pp3_00_ko[30]),		//i--
      .ko(pp3_00_ko[29]),		//o--
      .sum(pp3_01[30]),		//o--
      .car(pp3_00[29])		//o--
   );

   tri_csa42 pp3_00_csa_29(
      .vd(vdd),
      .gd(gnd),
      .a(pp2_03[29]),		//i--
      .b(pp2_02[29]),		//i--
      .c(pp2_01[29]),		//i--
      .d(pp2_00[29]),		//i--
      .ki(pp3_00_ko[29]),		//i--
      .ko(pp3_00_ko[28]),		//o--
      .sum(pp3_01[29]),		//o--
      .car(pp3_00[28])		//o--
   );

   tri_csa42 pp3_00_csa_28(
      .vd(vdd),
      .gd(gnd),
      .a(pp2_03[28]),		//i--
      .b(pp2_02[28]),		//i--
      .c(pp2_01[28]),		//i--
      .d(pp2_00[28]),		//i--
      .ki(pp3_00_ko[28]),		//i--
      .ko(pp3_00_ko[27]),		//o--
      .sum(pp3_01[28]),		//o--
      .car(pp3_00[27])		//o--
   );

   tri_csa42 pp3_00_csa_27(
      .vd(vdd),
      .gd(gnd),
      .a(pp2_03[27]),		//i--
      .b(pp2_02[27]),		//i--
      .c(pp2_01[27]),		//i--
      .d(pp2_00[27]),		//i--
      .ki(pp3_00_ko[27]),		//i--
      .ko(pp3_00_ko[26]),		//o--
      .sum(pp3_01[27]),		//o--
      .car(pp3_00[26])		//o--
   );

   tri_csa42 pp3_00_csa_26(
      .vd(vdd),
      .gd(gnd),
      .a(pp2_03[26]),		//i--
      .b(pp2_02[26]),		//i--
      .c(pp2_01[26]),		//i--
      .d(pp2_00[26]),		//i--
      .ki(pp3_00_ko[26]),		//i--
      .ko(pp3_00_ko[25]),		//o--
      .sum(pp3_01[26]),		//o--
      .car(pp3_00[25])		//o--
   );

   tri_csa42 pp3_00_csa_25(
      .vd(vdd),
      .gd(gnd),
      .a(pp2_03[25]),		//i--
      .b(pp2_02[25]),		//i--
      .c(pp2_01[25]),		//i--
      .d(pp2_00[25]),		//i--
      .ki(pp3_00_ko[25]),		//i--
      .ko(pp3_00_ko[24]),		//o--
      .sum(pp3_01[25]),		//o--
      .car(pp3_00[24])		//o--
   );

   tri_csa42 pp3_00_csa_24(
      .vd(vdd),
      .gd(gnd),
      .a(pp2_03[24]),		//i--
      .b(pp2_02[24]),		//i--
      .c(pp2_01[24]),		//i--
      .d(pp2_00[24]),		//i--
      .ki(pp3_00_ko[24]),		//i--
      .ko(pp3_00_ko[23]),		//o--
      .sum(pp3_01[24]),		//o--
      .car(pp3_00[23])		//o--
   );

   tri_csa42 pp3_00_csa_23(
      .vd(vdd),
      .gd(gnd),
      .a(pp2_03[23]),		//i--
      .b(pp2_02[23]),		//i--
      .c(pp2_01[23]),		//i--
      .d(pp2_00[23]),		//i--
      .ki(pp3_00_ko[23]),		//i--
      .ko(pp3_00_ko[22]),		//o--
      .sum(pp3_01[23]),		//o--
      .car(pp3_00[22])		//o--
   );

   tri_csa42 pp3_00_csa_22(
      .vd(vdd),
      .gd(gnd),
      .a(pp2_03[22]),		//i--
      .b(pp2_02[22]),		//i--
      .c(pp2_01[22]),		//i--
      .d(pp2_00[22]),		//i--
      .ki(pp3_00_ko[22]),		//i--
      .ko(pp3_00_ko[21]),		//o--
      .sum(pp3_01[22]),		//o--
      .car(pp3_00[21])		//o--
   );

   tri_csa42 pp3_00_csa_21(
      .vd(vdd),
      .gd(gnd),
      .a(pp2_03[21]),		//i--
      .b(pp2_02[21]),		//i--
      .c(pp2_01[21]),		//i--
      .d(pp2_00[21]),		//i--
      .ki(pp3_00_ko[21]),		//i--
      .ko(pp3_00_ko[20]),		//o--
      .sum(pp3_01[21]),		//o--
      .car(pp3_00[20])		//o--
   );

   tri_csa42 pp3_00_csa_20(
      .vd(vdd),
      .gd(gnd),
      .a(pp2_03[20]),		//i--
      .b(pp2_02[20]),		//i--
      .c(pp2_01[20]),		//i--
      .d(pp2_00[20]),		//i--
      .ki(pp3_00_ko[20]),		//i--
      .ko(pp3_00_ko[19]),		//o--
      .sum(pp3_01[20]),		//o--
      .car(pp3_00[19])		//o--
   );

   tri_csa42 pp3_00_csa_19(
      .vd(vdd),
      .gd(gnd),
      .a(pp2_03[19]),		//i--
      .b(pp2_02[19]),		//i--
      .c(pp2_01[19]),		//i--
      .d(pp2_00[19]),		//i--
      .ki(pp3_00_ko[19]),		//i--
      .ko(pp3_00_ko[18]),		//o--
      .sum(pp3_01[19]),		//o--
      .car(pp3_00[18])		//o--
   );

   tri_csa42 pp3_00_csa_18(
      .vd(vdd),
      .gd(gnd),
      .a(pp2_03[18]),		//i--
      .b(pp2_02[18]),		//i--
      .c(pp2_01[18]),		//i--
      .d(pp2_00[18]),		//i--
      .ki(pp3_00_ko[18]),		//i--
      .ko(pp3_00_ko[17]),		//o--
      .sum(pp3_01[18]),		//o--
      .car(pp3_00[17])		//o--
   );

   tri_csa42 pp3_00_csa_17(
      .vd(vdd),
      .gd(gnd),
      .a(pp2_03[17]),		//i--
      .b(pp2_02[17]),		//i--
      .c(pp2_01[17]),		//i--
      .d(pp2_00[17]),		//i--
      .ki(pp3_00_ko[17]),		//i--
      .ko(pp3_00_ko[16]),		//o--
      .sum(pp3_01[17]),		//o--
      .car(pp3_00[16])		//o--
   );

   tri_csa42 pp3_00_csa_16(
      .vd(vdd),
      .gd(gnd),
      .a(pp2_03[16]),		//i--
      .b(pp2_02[16]),		//i--
      .c(pp2_01[16]),		//i--
      .d(pp2_00[16]),		//i--
      .ki(pp3_00_ko[16]),		//i--
      .ko(pp3_00_ko[15]),		//o--
      .sum(pp3_01[16]),		//o--
      .car(pp3_00[15])		//o--
   );

   tri_csa42 pp3_00_csa_15(
      .vd(vdd),
      .gd(gnd),
      .a(pp2_03[15]),		//i--
      .b(pp2_02[15]),		//i--
      .c(pp2_01[15]),		//i--
      .d(pp2_00[15]),		//i--
      .ki(pp3_00_ko[15]),		//i--
      .ko(pp3_00_ko[14]),		//o--
      .sum(pp3_01[15]),		//o--
      .car(pp3_00[14])		//o--
   );

   tri_csa42 pp3_00_csa_14(
      .vd(vdd),
      .gd(gnd),
      .a(pp2_03[14]),		//i--
      .b(pp2_02[14]),		//i--
      .c(pp2_01[14]),		//i--
      .d(pp2_00[14]),		//i--
      .ki(pp3_00_ko[14]),		//i--
      .ko(pp3_00_ko[13]),		//o--
      .sum(pp3_01[14]),		//o--
      .car(pp3_00[13])		//o--
   );

   tri_csa42 pp3_00_csa_13(
      .vd(vdd),
      .gd(gnd),
      .a(pp2_03[13]),		//i--
      .b(pp2_02[13]),		//i--
      .c(pp2_01[13]),		//i--
      .d(pp2_00[13]),		//i--
      .ki(pp3_00_ko[13]),		//i--
      .ko(pp3_00_ko[12]),		//o--
      .sum(pp3_01[13]),		//o--
      .car(pp3_00[12])		//o--
   );

   tri_csa42 pp3_00_csa_12(
      .vd(vdd),
      .gd(gnd),
      .a(pp2_03[12]),		//i--
      .b(pp2_01[12]),		//i--
      .c(pp2_00[12]),		//i--
      .d(tidn),		//i--
      .ki(pp3_00_ko[12]),		//i--
      .ko(pp3_00_ko[11]),		//o--
      .sum(pp3_01[12]),		//o--
      .car(pp3_00[11])		//o--
   );

   tri_csa42 pp3_00_csa_11(
      .vd(vdd),
      .gd(gnd),
      .a(pp2_03[11]),		//i--
      .b(pp2_01[11]),		//i--
      .c(pp2_00[11]),		//i--
      .d(tidn),		//i--
      .ki(pp3_00_ko[11]),		//i--
      .ko(pp3_00_ko[10]),		//o--
      .sum(pp3_01[11]),		//o--
      .car(pp3_00[10])		//o--
   );

   tri_csa42 pp3_00_csa_10(
      .vd(vdd),
      .gd(gnd),
      .a(pp2_03[10]),		//i--
      .b(pp2_01[10]),		//i--
      .c(pp2_00[10]),		//i--
      .d(tidn),		//i--
      .ki(pp3_00_ko[10]),		//i--
      .ko(pp3_00_ko[9]),		//o--
      .sum(pp3_01[10]),		//o--
      .car(pp3_00[9])		//o--
   );

   tri_csa42 pp3_00_csa_09(
      .vd(vdd),
      .gd(gnd),
      .a(pp2_03[9]),		//i--
      .b(pp2_01[9]),		//i--
      .c(pp2_00[9]),		//i--
      .d(tidn),		//i--
      .ki(pp3_00_ko[9]),		//i--
      .ko(pp3_00_ko[8]),		//o--
      .sum(pp3_01[9]),		//o--
      .car(pp3_00[8])		//o--
   );

   tri_csa42 pp3_00_csa_08(
      .vd(vdd),
      .gd(gnd),
      .a(tiup),		//i--
      .b(pp2_01[8]),		//i--
      .c(pp2_00[8]),		//i--
      .d(tidn),		//i--
      .ki(pp3_00_ko[8]),		//i--
      .ko(pp3_00_ko[7]),		//o--
      .sum(pp3_01[8]),		//o--
      .car(pp3_00[7])		//o--
   );

   tri_csa32 pp3_00_csa_07(
      .vd(vdd),
      .gd(gnd),
      .a(pp2_01[7]),		//i--
      .b(pp2_00[7]),		//i--
      .c(pp3_00_ko[7]),		//i--
      .sum(pp3_01[7]),		//o--
      .car(pp3_00[6])		//o--
   );

   tri_fu_csa22_h2 pp3_00_csa_06(
      .a(pp2_01[6]),		//i--
      .b(pp2_00[6]),		//i--
      .sum(pp3_01[6]),		//o--
      .car(pp3_00[5])		//o--
   );

   tri_fu_csa22_h2 pp3_00_csa_05(
      .a(pp2_01[5]),		//i--
      .b(pp2_00[5]),		//i--
      .sum(pp3_01[5]),		//o--
      .car(pp3_00[4])		//o--
   );

   tri_fu_csa22_h2 pp3_00_csa_04(
      .a(pp2_01[4]),		//i--
      .b(pp2_00[4]),		//i--
      .sum(pp3_01[4]),		//o--
      .car(pp3_00[3])		//o--
   );

   tri_fu_csa22_h2 pp3_00_csa_03(
      .a(pp2_01[3]),		//i--
      .b(pp2_00[3]),		//i--
      .sum(pp3_01[3]),		//o--
      .car(pp3_00[2])		//o--
   );

   tri_fu_csa22_h2 pp3_00_csa_02(
      .a(pp2_01[2]),		//i--
      .b(pp2_00[2]),		//i--
      .sum(pp3_01[2]),		//o--
      .car(pp3_00[1])		//o--
   );

   ////#####################################################################
   ////## LATCH ROW <cs_latd2s_in>   scan(r-l-r)
   ////#####################################################################


   tri_lcbnd  mul92_lcb(
      .delay_lclkr(lcb_delay_lclkr),		//in -- tidn ,
      //d_mode      =>  --d_mode           ,--in -- tiup ,
      .mpw1_b(lcb_mpw1_b),		//in -- tidn ,
      .mpw2_b(lcb_mpw2_b),		//in -- tidn ,
      .force_t(force_t),		//in -- tidn ,
      .nclk(nclk),		//in
      .vd(vdd),		//inout
      .gd(gnd),		//inout
      .act(ex2_act),		//in
      .sg(lcb_sg),		//in
      .thold_b(thold_b),		//in
      .d1clk(mul92_d1clk),		//out
      .d2clk(mul92_d2clk),		//out
      .lclk(mul92_lclk)		//out
   );


   tri_inv_nlats #(.WIDTH(73),  .NEEDS_SRESET(0)) pp3_lat_sum(
      .vd(vdd),
      .gd(gnd),
      .lclk(mul92_lclk),		//lclk.clk
      .d1clk(mul92_d1clk),
      .d2clk(mul92_d2clk),
      .scanin({si,
               pp3_lat_sum_so[0:71]}),
      .scanout(pp3_lat_sum_so[0:72]),
      .d(pp3_01[2:74]),
      .qb(pp3_01_q_b[2:74])
   );


   tri_inv_nlats #(.WIDTH(71),   .NEEDS_SRESET(0)) pp3_lat_car(
      .vd(vdd),
      .gd(gnd),
      .lclk(mul92_lclk),		//lclk.clk
      .d1clk(mul92_d1clk),
      .d2clk(mul92_d2clk),
      .scanin({ pp3_lat_car_so[1:70],
                pp3_lat_sum_so[72]}),
      .scanout(pp3_lat_car_so[0:70]),
      .d({pp3_00[1:67],
          pp3_00[69],
          hot_one_din,
          pp3_00[71],
          pp3_00[74]}),
      //------------------------------
      .qb({ pp3_00_q_b[1:67],
            pp3_00_q_b[69],
            hot_one_out_b,
            pp3_00_q_b[71],
            pp3_00_q_b[74]})
   );

   assign pp3_00_q_b[68] = tiup;
   assign pp3_00_q_b[70] = tiup;
   assign pp3_00_q_b[72] = tiup;
   assign pp3_00_q_b[73] = tiup;
   assign hot_one_out = (~hot_one_out_b);

   assign sum92[2:74] = (~pp3_01_q_b[2:74]);
   assign car92[1:74] = (~pp3_00_q_b[1:74]);

   ////################################################################
   ////# scan string
   ////################################################################
   assign so = pp3_lat_car_so[0];

endmodule
