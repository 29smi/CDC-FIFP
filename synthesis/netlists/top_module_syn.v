/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06-SP1
// Date      : Fri Jan 31 22:54:15 2025
/////////////////////////////////////////////////////////////


module write_control_logic ( write_clk, write_enable, read_addr_gray, 
        write_rst, full, write_addr, write_enable_1, write_addr_gray );
  input [3:0] read_addr_gray;
  output [3:0] write_addr;
  output [3:0] write_addr_gray;
  input write_clk, write_enable, write_rst;
  output full, write_enable_1;
  wire   n44, n45, n46, N2, N10, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n1, n2, n3, n4, n15, n16, n17, n18, n19, n20, n21, n22, n23,
         \write_addr[3] , n25, n26, n28, n29, n31, n32, n33, n35, n36, n37,
         n39, n41, n42, n43;
  wire   [3:0] write_addr_next;
  assign write_addr_gray[3] = \write_addr[3] ;
  assign write_addr[3] = \write_addr[3] ;

  DFFR_K \write_addr_reg[1]  ( .D(n18), .CLK(write_clk), .RN(n41), .Q(n45) );
  AND4_F U6 ( .A(n5), .B(n6), .C(n7), .D(n8), .Z(N10) );
  XNOR2_C U13 ( .A(n11), .B(n18), .Z(n6) );
  XNOR2_C U16 ( .A(n19), .B(write_addr_next[2]), .Z(n5) );
  NOR2_D U20 ( .A(n43), .B(n1), .Z(N2) );
  DFFR_K full_reg ( .D(N10), .CLK(write_clk), .RN(n41), .Q(n1), .QBAR(n35) );
  DFFR_K \write_addr_reg[0]  ( .D(n20), .CLK(write_clk), .RN(n41), .Q(n46) );
  DFFR_K \write_addr_reg[2]  ( .D(write_addr_next[2]), .CLK(write_clk), .RN(
        n41), .Q(n44) );
  DFFR_K \write_addr_reg[3]  ( .D(n17), .CLK(write_clk), .RN(n41), .QBAR(n4)
         );
  INVERT_N U3 ( .A(n39), .Z(write_addr[0]) );
  INVERT_I U4 ( .A(n46), .Z(n39) );
  INVERT_E U5 ( .A(n23), .Z(n21) );
  XOR2_C U7 ( .A(\write_addr[3] ), .B(n9), .Z(write_addr_next[3]) );
  INVERT_J U8 ( .A(n36), .Z(n33) );
  XNOR2_C U9 ( .A(n25), .B(n22), .Z(n2) );
  XNOR2_C U10 ( .A(n28), .B(write_addr[0]), .Z(n3) );
  INVERT_I U11 ( .A(n44), .Z(n29) );
  INVERT_H U12 ( .A(n29), .Z(n32) );
  INVERTBAL_J U14 ( .A(n45), .Z(n37) );
  XNOR2_B U15 ( .A(n25), .B(write_addr[0]), .Z(write_addr_gray[0]) );
  INVERT_I U17 ( .A(write_addr[1]), .Z(n25) );
  INVERT_H U18 ( .A(n29), .Z(write_addr[2]) );
  NAND2_E U19 ( .A(n31), .B(n16), .Z(n9) );
  INVERT_F U21 ( .A(n10), .Z(n15) );
  INVERT_H U22 ( .A(n15), .Z(n16) );
  NOR2_D U23 ( .A(n25), .B(n22), .Z(n10) );
  XNOR2_B U24 ( .A(n31), .B(n25), .Z(write_addr_gray[1]) );
  INVERT_H U25 ( .A(write_addr_next[3]), .Z(n17) );
  INVERT_H U26 ( .A(n2), .Z(n18) );
  XOR2_I U27 ( .A(n16), .B(n32), .Z(write_addr_next[2]) );
  INVERT_H U28 ( .A(n26), .Z(write_enable_1) );
  XNOR2_C U29 ( .A(read_addr_gray[2]), .B(read_addr_gray[3]), .Z(n14) );
  INVERT_H U30 ( .A(n14), .Z(n19) );
  XOR2_J U31 ( .A(read_addr_gray[1]), .B(n19), .Z(n11) );
  INVERT_H U32 ( .A(n3), .Z(n20) );
  INVERT_H U33 ( .A(n21), .Z(n22) );
  AND2_H U34 ( .A(write_addr[0]), .B(n28), .Z(n13) );
  INVERT_D U35 ( .A(n13), .Z(n23) );
  INVERT_I U36 ( .A(n4), .Z(\write_addr[3] ) );
  INVERT_H U37 ( .A(N2), .Z(n26) );
  INVERT_F U38 ( .A(n26), .Z(n28) );
  INVERT_O U39 ( .A(n37), .Z(write_addr[1]) );
  INVERT_F U40 ( .A(n29), .Z(n31) );
  INVERT_O U41 ( .A(n33), .Z(full) );
  INVERT_H U42 ( .A(n35), .Z(n36) );
  XOR2_B U43 ( .A(n11), .B(n12), .Z(n7) );
  XOR2_B U44 ( .A(read_addr_gray[3]), .B(n17), .Z(n8) );
  XNOR2_B U45 ( .A(read_addr_gray[0]), .B(n20), .Z(n12) );
  XOR2_B U46 ( .A(\write_addr[3] ), .B(n32), .Z(write_addr_gray[2]) );
  INVERT_K U47 ( .A(n42), .Z(n41) );
  INVERT_H U48 ( .A(write_rst), .Z(n42) );
  INVERT_D U49 ( .A(write_enable), .Z(n43) );
endmodule


module read_control_logic ( read_clk, read_rst, read_enable, write_addr_gray, 
        empty, read_addr, read_enable_1, read_addr_gray );
  input [3:0] write_addr_gray;
  output [3:0] read_addr;
  output [3:0] read_addr_gray;
  input read_clk, read_rst, read_enable;
  output empty, read_enable_1;
  wire   n40, n41, n42, N2, N8, n3, n6, n7, n8, n9, n10, n11, n13, n14, n15,
         n2, n4, n5, n12, n16, n17, n18, n19, n20, n21, n23, n24, n25, n26,
         n28, n29, n30, n31, n32, n33, n35, n37, n38, n39;
  wire   [3:0] read_addr_next;
  assign read_addr_gray[3] = read_addr[3];
  assign read_enable_1 = N2;

  AND4_F U6 ( .A(n6), .B(n16), .C(n8), .D(n9), .Z(N8) );
  XNOR2_C U7 ( .A(n10), .B(n20), .Z(n9) );
  XNOR2_C U9 ( .A(n32), .B(read_addr_next[2]), .Z(n8) );
  XOR2_C U16 ( .A(n10), .B(n15), .Z(n6) );
  DFFR_E \read_addr_reg[0]  ( .D(read_addr_next[0]), .CLK(read_clk), .RN(n37), 
        .Q(n42), .QBAR(n5) );
  DFFR_E \read_addr_reg[2]  ( .D(read_addr_next[2]), .CLK(read_clk), .RN(n37), 
        .Q(n40) );
  DFFR_E \read_addr_reg[3]  ( .D(n19), .CLK(read_clk), .RN(n37), .Q(
        read_addr[3]), .QBAR(n30) );
  DFFS_E empty_reg ( .D(N8), .CLK(read_clk), .S(n38), .QBAR(n28) );
  DFFR_E \read_addr_reg[1]  ( .D(n20), .CLK(read_clk), .RN(n37), .Q(n41), 
        .QBAR(n3) );
  XOR2_D U3 ( .A(N2), .B(read_addr[0]), .Z(read_addr_next[0]) );
  XOR2_C U4 ( .A(n31), .B(n14), .Z(read_addr_next[3]) );
  XNOR2_C U5 ( .A(n24), .B(read_addr[0]), .Z(read_addr_gray[0]) );
  XNOR2_C U8 ( .A(write_addr_gray[2]), .B(write_addr_gray[3]), .Z(n2) );
  XNOR2_C U10 ( .A(n24), .B(n11), .Z(n4) );
  INVERT_H U11 ( .A(n5), .Z(n12) );
  INVERT_J U12 ( .A(n23), .Z(n24) );
  XNOR2_C U13 ( .A(read_addr[2]), .B(n24), .Z(read_addr_gray[1]) );
  INVERT_M U14 ( .A(n33), .Z(read_addr[2]) );
  NAND2BAL_E U15 ( .A(read_addr[2]), .B(n18), .Z(n14) );
  XOR2_B U17 ( .A(write_addr_gray[3]), .B(n19), .Z(n7) );
  INVERT_D U18 ( .A(n7), .Z(n16) );
  INVERT_F U19 ( .A(n13), .Z(n17) );
  INVERT_H U20 ( .A(n17), .Z(n18) );
  NOR2_D U21 ( .A(n24), .B(n11), .Z(n13) );
  XNOR2_C U22 ( .A(write_addr_gray[0]), .B(read_addr_next[0]), .Z(n15) );
  INVERT_J U23 ( .A(n42), .Z(n35) );
  INVERT_H U24 ( .A(read_addr_next[3]), .Z(n19) );
  INVERT_H U25 ( .A(n4), .Z(n20) );
  XOR2_I U26 ( .A(n18), .B(read_addr[2]), .Z(read_addr_next[2]) );
  INVERT_H U27 ( .A(read_enable), .Z(n39) );
  INVERT_H U28 ( .A(n41), .Z(n21) );
  INVERT_I U29 ( .A(n21), .Z(read_addr[1]) );
  NAND2_F U30 ( .A(n12), .B(N2), .Z(n11) );
  NOR2_H U31 ( .A(n39), .B(n26), .Z(N2) );
  INVERT_H U32 ( .A(n3), .Z(n23) );
  INVERT_K U33 ( .A(n29), .Z(n25) );
  INVERT_H U34 ( .A(n25), .Z(n26) );
  INVERT_O U35 ( .A(n25), .Z(empty) );
  INVERT_H U36 ( .A(n28), .Z(n29) );
  INVERT_O U37 ( .A(n35), .Z(read_addr[0]) );
  INVERT_H U38 ( .A(n30), .Z(n31) );
  INVERT_H U39 ( .A(n2), .Z(n32) );
  XOR2_J U40 ( .A(write_addr_gray[1]), .B(n32), .Z(n10) );
  INVERT_I U41 ( .A(n40), .Z(n33) );
  XOR2_B U42 ( .A(read_addr[3]), .B(read_addr[2]), .Z(read_addr_gray[2]) );
  INVERT_I U43 ( .A(read_rst), .Z(n38) );
  INVERT_J U44 ( .A(n38), .Z(n37) );
endmodule


module fifo_memory ( write_data, write_addr, write_enable_1, read_addr, 
        read_enable_1, write_clk, write_rst, read_clk, read_rst, read_data );
  input [7:0] write_data;
  input [3:0] write_addr;
  input [3:0] read_addr;
  output [7:0] read_data;
  input write_enable_1, read_enable_1, write_clk, write_rst, read_clk,
         read_rst;
  wire   n349, \fifo_data[0][7] , \fifo_data[0][6] , \fifo_data[0][5] ,
         \fifo_data[0][4] , \fifo_data[0][3] , \fifo_data[0][2] ,
         \fifo_data[0][1] , \fifo_data[0][0] , \fifo_data[1][7] ,
         \fifo_data[1][6] , \fifo_data[1][5] , \fifo_data[1][4] ,
         \fifo_data[1][3] , \fifo_data[1][2] , \fifo_data[1][1] ,
         \fifo_data[1][0] , \fifo_data[2][7] , \fifo_data[2][6] ,
         \fifo_data[2][5] , \fifo_data[2][4] , \fifo_data[2][3] ,
         \fifo_data[2][2] , \fifo_data[2][1] , \fifo_data[2][0] ,
         \fifo_data[3][7] , \fifo_data[3][6] , \fifo_data[3][5] ,
         \fifo_data[3][4] , \fifo_data[3][3] , \fifo_data[3][2] ,
         \fifo_data[3][1] , \fifo_data[3][0] , \fifo_data[4][7] ,
         \fifo_data[4][6] , \fifo_data[4][5] , \fifo_data[4][4] ,
         \fifo_data[4][3] , \fifo_data[4][2] , \fifo_data[4][1] ,
         \fifo_data[4][0] , \fifo_data[5][7] , \fifo_data[5][6] ,
         \fifo_data[5][5] , \fifo_data[5][4] , \fifo_data[5][3] ,
         \fifo_data[5][2] , \fifo_data[5][1] , \fifo_data[5][0] ,
         \fifo_data[6][7] , \fifo_data[6][6] , \fifo_data[6][5] ,
         \fifo_data[6][4] , \fifo_data[6][3] , \fifo_data[6][2] ,
         \fifo_data[6][1] , \fifo_data[6][0] , \fifo_data[7][7] ,
         \fifo_data[7][6] , \fifo_data[7][5] , \fifo_data[7][4] ,
         \fifo_data[7][3] , \fifo_data[7][2] , \fifo_data[7][1] ,
         \fifo_data[7][0] , N30, N31, N32, N33, N34, N36, N37, n3, n12, n14,
         n17, n20, n22, n23, n25, n27, n29, n31, n32, n33, n34, n35, n36, n37,
         n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51,
         n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65,
         n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79,
         n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93,
         n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105,
         n106, n107, n108, n109, n110, n111, n112, n113, n114, n115, n119,
         n120, n121, n122, n123, n124, n125, n126, n127, n128, n129, n130,
         n131, n132, n133, n134, n135, n136, n137, n138, n141, n142, n143,
         n144, n145, n146, n147, n148, n149, n150, n151, n152, n153, n154,
         n159, n160, n161, n162, n163, n164, n165, n166, n1, n2, n4, n5, n6,
         n7, n8, n9, n10, n11, n13, n15, n16, n18, n19, n21, n24, n26, n28,
         n30, n116, n117, n118, n139, n140, n155, n156, n157, n158, n167, n168,
         n169, n170, n171, n172, n173, n174, n175, n176, n177, n178, n179,
         n180, n181, n182, n183, n184, n185, n186, n187, n188, n189, n190,
         n191, n192, n193, n194, n195, n196, n197, n198, n199, n200, n201,
         n202, n203, n204, n205, n207, n209, n211, n213, n215, n218, n219,
         n220, n221, n222, n223, n224, n225, n226, n227, n228, n229, n230,
         n231, n232, n233, n234, n235, n236, n237, n238, n239, n240, n241,
         n242, n243, n244, n245, n246, n247, n248, n249, n250, n251, n252,
         n253, n254, n256, n257, n258, n259, n260, n261, n262, n263, n264,
         n265, n266, n267, n268, n269, n270, n271, n272, n273, n274, n275,
         n276, n277, n278, n279, n280, n281, n282, n283, n284, n285, n286,
         n287, n288, n289, n290, n291, n292, n293, n294, n295, n296, n297,
         n298, n299, n300, n301, n302, n303, n304, n305, n306, n307, n308,
         n309, n310, n311, n312, n313, n314, n315, n316, n317, n318, n319,
         n320, n321, n322, n323, n324, n325, n326, n327, n328, n329, n330,
         n331, n332, n333, n334, n335, n336, n337, n338, n339, n340, n341,
         n342, n343, n344, n345, n346, n347, n348;

  DFFR_K \fifo_data_reg[0][7]  ( .D(n166), .CLK(write_clk), .RN(n306), .Q(
        \fifo_data[0][7] ), .QBAR(n31) );
  DFFR_K \fifo_data_reg[0][6]  ( .D(n165), .CLK(write_clk), .RN(n306), .Q(
        \fifo_data[0][6] ), .QBAR(n32) );
  DFFR_K \fifo_data_reg[0][5]  ( .D(n164), .CLK(write_clk), .RN(n306), .Q(
        \fifo_data[0][5] ), .QBAR(n33) );
  DFFR_K \fifo_data_reg[0][4]  ( .D(n163), .CLK(write_clk), .RN(n306), .Q(
        \fifo_data[0][4] ), .QBAR(n34) );
  DFFR_K \fifo_data_reg[0][3]  ( .D(n162), .CLK(write_clk), .RN(n306), .Q(
        \fifo_data[0][3] ), .QBAR(n35) );
  DFFR_K \fifo_data_reg[0][2]  ( .D(n161), .CLK(write_clk), .RN(n313), .Q(
        \fifo_data[0][2] ), .QBAR(n36) );
  DFFR_K \fifo_data_reg[0][1]  ( .D(n160), .CLK(write_clk), .RN(n312), .Q(
        \fifo_data[0][1] ), .QBAR(n37) );
  DFFR_K \fifo_data_reg[0][0]  ( .D(n159), .CLK(write_clk), .RN(n306), .Q(
        \fifo_data[0][0] ), .QBAR(n38) );
  DFFR_K \fifo_data_reg[1][7]  ( .D(n19), .CLK(write_clk), .RN(n315), .Q(
        \fifo_data[1][7] ), .QBAR(n39) );
  DFFR_K \fifo_data_reg[1][6]  ( .D(n18), .CLK(write_clk), .RN(n314), .Q(
        \fifo_data[1][6] ), .QBAR(n40) );
  DFFR_K \fifo_data_reg[1][5]  ( .D(n16), .CLK(write_clk), .RN(n307), .Q(
        \fifo_data[1][5] ), .QBAR(n41) );
  DFFR_K \fifo_data_reg[1][4]  ( .D(n15), .CLK(write_clk), .RN(n307), .Q(
        \fifo_data[1][4] ), .QBAR(n42) );
  DFFR_K \fifo_data_reg[1][3]  ( .D(n154), .CLK(write_clk), .RN(n307), .Q(
        \fifo_data[1][3] ), .QBAR(n43) );
  DFFR_K \fifo_data_reg[1][2]  ( .D(n153), .CLK(write_clk), .RN(n307), .Q(
        \fifo_data[1][2] ), .QBAR(n44) );
  DFFR_K \fifo_data_reg[1][1]  ( .D(n152), .CLK(write_clk), .RN(n307), .Q(
        \fifo_data[1][1] ), .QBAR(n45) );
  DFFR_K \fifo_data_reg[1][0]  ( .D(n151), .CLK(write_clk), .RN(n308), .Q(
        \fifo_data[1][0] ), .QBAR(n46) );
  DFFR_K \fifo_data_reg[2][7]  ( .D(n150), .CLK(write_clk), .RN(n308), .Q(
        \fifo_data[2][7] ), .QBAR(n47) );
  DFFR_K \fifo_data_reg[2][6]  ( .D(n149), .CLK(write_clk), .RN(n308), .Q(
        \fifo_data[2][6] ), .QBAR(n48) );
  DFFR_K \fifo_data_reg[2][5]  ( .D(n148), .CLK(write_clk), .RN(n308), .Q(
        \fifo_data[2][5] ), .QBAR(n49) );
  DFFR_K \fifo_data_reg[2][4]  ( .D(n147), .CLK(write_clk), .RN(n308), .Q(
        \fifo_data[2][4] ), .QBAR(n50) );
  DFFR_K \fifo_data_reg[2][3]  ( .D(n146), .CLK(write_clk), .RN(n309), .Q(
        \fifo_data[2][3] ), .QBAR(n51) );
  DFFR_K \fifo_data_reg[2][2]  ( .D(n145), .CLK(write_clk), .RN(n309), .Q(
        \fifo_data[2][2] ), .QBAR(n52) );
  DFFR_K \fifo_data_reg[2][1]  ( .D(n144), .CLK(write_clk), .RN(n309), .Q(
        \fifo_data[2][1] ), .QBAR(n53) );
  DFFR_K \fifo_data_reg[2][0]  ( .D(n143), .CLK(write_clk), .RN(n309), .Q(
        \fifo_data[2][0] ), .QBAR(n54) );
  DFFR_K \fifo_data_reg[3][7]  ( .D(n142), .CLK(write_clk), .RN(n309), .Q(
        \fifo_data[3][7] ), .QBAR(n55) );
  DFFR_K \fifo_data_reg[3][6]  ( .D(n141), .CLK(write_clk), .RN(n310), .Q(
        \fifo_data[3][6] ), .QBAR(n56) );
  DFFR_K \fifo_data_reg[3][5]  ( .D(n2), .CLK(write_clk), .RN(n310), .Q(
        \fifo_data[3][5] ), .QBAR(n57) );
  DFFR_K \fifo_data_reg[3][4]  ( .D(n1), .CLK(write_clk), .RN(n310), .Q(
        \fifo_data[3][4] ), .QBAR(n58) );
  DFFR_K \fifo_data_reg[3][3]  ( .D(n138), .CLK(write_clk), .RN(n310), .Q(
        \fifo_data[3][3] ), .QBAR(n59) );
  DFFR_K \fifo_data_reg[3][2]  ( .D(n137), .CLK(write_clk), .RN(n310), .Q(
        \fifo_data[3][2] ), .QBAR(n60) );
  DFFR_K \fifo_data_reg[3][1]  ( .D(n136), .CLK(write_clk), .RN(n311), .Q(
        \fifo_data[3][1] ), .QBAR(n61) );
  DFFR_K \fifo_data_reg[3][0]  ( .D(n135), .CLK(write_clk), .RN(n311), .Q(
        \fifo_data[3][0] ), .QBAR(n62) );
  DFFR_K \fifo_data_reg[4][7]  ( .D(n134), .CLK(write_clk), .RN(n311), .Q(
        \fifo_data[4][7] ), .QBAR(n63) );
  DFFR_K \fifo_data_reg[4][6]  ( .D(n133), .CLK(write_clk), .RN(n311), .Q(
        \fifo_data[4][6] ), .QBAR(n64) );
  DFFR_K \fifo_data_reg[4][5]  ( .D(n132), .CLK(write_clk), .RN(n311), .Q(
        \fifo_data[4][5] ), .QBAR(n65) );
  DFFR_K \fifo_data_reg[4][4]  ( .D(n131), .CLK(write_clk), .RN(n312), .Q(
        \fifo_data[4][4] ), .QBAR(n66) );
  DFFR_K \fifo_data_reg[4][3]  ( .D(n130), .CLK(write_clk), .RN(n312), .Q(
        \fifo_data[4][3] ), .QBAR(n67) );
  DFFR_K \fifo_data_reg[4][2]  ( .D(n129), .CLK(write_clk), .RN(n312), .Q(
        \fifo_data[4][2] ), .QBAR(n68) );
  DFFR_K \fifo_data_reg[4][1]  ( .D(n128), .CLK(write_clk), .RN(n312), .Q(
        \fifo_data[4][1] ), .QBAR(n69) );
  DFFR_K \fifo_data_reg[4][0]  ( .D(n127), .CLK(write_clk), .RN(n312), .Q(
        \fifo_data[4][0] ), .QBAR(n70) );
  DFFR_K \fifo_data_reg[5][7]  ( .D(n126), .CLK(write_clk), .RN(n313), .Q(
        \fifo_data[5][7] ), .QBAR(n71) );
  DFFR_K \fifo_data_reg[5][6]  ( .D(n125), .CLK(write_clk), .RN(n313), .Q(
        \fifo_data[5][6] ), .QBAR(n72) );
  DFFR_K \fifo_data_reg[5][5]  ( .D(n124), .CLK(write_clk), .RN(n313), .Q(
        \fifo_data[5][5] ), .QBAR(n73) );
  DFFR_K \fifo_data_reg[5][4]  ( .D(n123), .CLK(write_clk), .RN(n313), .Q(
        \fifo_data[5][4] ), .QBAR(n74) );
  DFFR_K \fifo_data_reg[5][3]  ( .D(n122), .CLK(write_clk), .RN(n313), .Q(
        \fifo_data[5][3] ), .QBAR(n75) );
  DFFR_K \fifo_data_reg[5][2]  ( .D(n121), .CLK(write_clk), .RN(n314), .Q(
        \fifo_data[5][2] ), .QBAR(n76) );
  DFFR_K \fifo_data_reg[5][1]  ( .D(n120), .CLK(write_clk), .RN(n314), .Q(
        \fifo_data[5][1] ), .QBAR(n77) );
  DFFR_K \fifo_data_reg[5][0]  ( .D(n119), .CLK(write_clk), .RN(n314), .Q(
        \fifo_data[5][0] ), .QBAR(n78) );
  DFFR_K \fifo_data_reg[6][7]  ( .D(n13), .CLK(write_clk), .RN(n314), .Q(
        \fifo_data[6][7] ), .QBAR(n79) );
  DFFR_K \fifo_data_reg[6][6]  ( .D(n11), .CLK(write_clk), .RN(n314), .Q(
        \fifo_data[6][6] ), .QBAR(n80) );
  DFFR_K \fifo_data_reg[6][5]  ( .D(n10), .CLK(write_clk), .RN(n315), .Q(
        \fifo_data[6][5] ), .QBAR(n81) );
  DFFR_K \fifo_data_reg[6][4]  ( .D(n115), .CLK(write_clk), .RN(n315), .Q(
        \fifo_data[6][4] ), .QBAR(n82) );
  DFFR_K \fifo_data_reg[6][3]  ( .D(n114), .CLK(write_clk), .RN(n315), .Q(
        \fifo_data[6][3] ), .QBAR(n83) );
  DFFR_K \fifo_data_reg[6][2]  ( .D(n113), .CLK(write_clk), .RN(n315), .Q(
        \fifo_data[6][2] ), .QBAR(n84) );
  DFFR_K \fifo_data_reg[6][1]  ( .D(n112), .CLK(write_clk), .RN(n315), .Q(
        \fifo_data[6][1] ), .QBAR(n85) );
  DFFR_K \fifo_data_reg[6][0]  ( .D(n111), .CLK(write_clk), .RN(n308), .Q(
        \fifo_data[6][0] ), .QBAR(n86) );
  DFFR_K \fifo_data_reg[7][7]  ( .D(n110), .CLK(write_clk), .RN(write_rst), 
        .Q(\fifo_data[7][7] ), .QBAR(n87) );
  DFFR_K \fifo_data_reg[7][6]  ( .D(n109), .CLK(write_clk), .RN(n311), .Q(
        \fifo_data[7][6] ), .QBAR(n88) );
  DFFR_K \fifo_data_reg[7][5]  ( .D(n108), .CLK(write_clk), .RN(n310), .Q(
        \fifo_data[7][5] ), .QBAR(n89) );
  DFFR_K \fifo_data_reg[7][4]  ( .D(n107), .CLK(write_clk), .RN(n309), .Q(
        \fifo_data[7][4] ), .QBAR(n90) );
  DFFR_K \fifo_data_reg[7][3]  ( .D(n106), .CLK(write_clk), .RN(n316), .Q(
        \fifo_data[7][3] ), .QBAR(n91) );
  DFFR_K \fifo_data_reg[7][2]  ( .D(n105), .CLK(write_clk), .RN(n316), .Q(
        \fifo_data[7][2] ), .QBAR(n92) );
  DFFR_K \fifo_data_reg[7][1]  ( .D(n104), .CLK(write_clk), .RN(n316), .Q(
        \fifo_data[7][1] ), .QBAR(n93) );
  DFFR_K \fifo_data_reg[7][0]  ( .D(n103), .CLK(write_clk), .RN(n316), .Q(
        \fifo_data[7][0] ), .QBAR(n94) );
  DFFR_E \read_data_reg[0]  ( .D(n95), .CLK(read_clk), .RN(n304), .QBAR(n9) );
  DFFR_E \read_data_reg[3]  ( .D(n98), .CLK(read_clk), .RN(n303), .QBAR(n7) );
  DFFR_E \read_data_reg[4]  ( .D(n99), .CLK(read_clk), .RN(n303), .Q(n349), 
        .QBAR(n21) );
  DFFR_E \read_data_reg[5]  ( .D(n100), .CLK(read_clk), .RN(n303), .QBAR(n6)
         );
  DFFR_E \read_data_reg[6]  ( .D(n101), .CLK(read_clk), .RN(n303), .QBAR(n5)
         );
  DFFR_E \read_data_reg[7]  ( .D(n102), .CLK(read_clk), .RN(n303), .QBAR(n4)
         );
  DFFR_E \read_data_reg[1]  ( .D(n96), .CLK(read_clk), .RN(n304), .QBAR(n8) );
  DFFR_E \read_data_reg[2]  ( .D(n97), .CLK(read_clk), .RN(n304), .QBAR(n256)
         );
  INVERT_H U2 ( .A(n236), .Z(n234) );
  BUFFER_I U3 ( .A(n290), .Z(n236) );
  NOR2_D U4 ( .A(n296), .B(n297), .Z(n293) );
  INVERT_E U5 ( .A(n169), .Z(n259) );
  INVERT_E U6 ( .A(n194), .Z(n192) );
  INVERT_D U7 ( .A(n288), .Z(n239) );
  INVERT_D U8 ( .A(n289), .Z(n241) );
  INVERT_D U9 ( .A(N33), .Z(n247) );
  INVERT_H U10 ( .A(read_addr[2]), .Z(n296) );
  INVERT_K U11 ( .A(n223), .Z(n224) );
  INVERT_H U12 ( .A(n225), .Z(n223) );
  INVERT_K U13 ( .A(n226), .Z(n227) );
  INVERT_H U14 ( .A(n340), .Z(n226) );
  INVERT_K U15 ( .A(write_addr[1]), .Z(n222) );
  INVERT_M U16 ( .A(n228), .Z(n229) );
  INVERT_I U17 ( .A(n230), .Z(n228) );
  INVERT_D U18 ( .A(n281), .Z(n261) );
  INVERT_E U19 ( .A(n188), .Z(n186) );
  INVERT_E U20 ( .A(n117), .Z(n30) );
  INVERT_E U21 ( .A(n191), .Z(n189) );
  INVERT_E U22 ( .A(read_addr[0]), .Z(n240) );
  INVERT_J U23 ( .A(n233), .Z(n231) );
  INVERT_L U24 ( .A(n118), .Z(n139) );
  INVERT_H U25 ( .A(n323), .Z(n321) );
  INVERT_H U26 ( .A(n218), .Z(n219) );
  OAI22_B U27 ( .A1(n58), .A2(n184), .B1(n344), .B2(n22), .Z(n1) );
  OAI22_B U28 ( .A1(n57), .A2(n184), .B1(n343), .B2(n22), .Z(n2) );
  INVERT_H U29 ( .A(write_addr[0]), .Z(n340) );
  INVERT_K U30 ( .A(n235), .Z(n157) );
  INVERT_K U31 ( .A(n234), .Z(n235) );
  INVERT_D U32 ( .A(n276), .Z(n185) );
  INVERT_D U33 ( .A(n26), .Z(n169) );
  INVERT_M U34 ( .A(n139), .Z(n330) );
  OAI22_B U35 ( .A1(n81), .A2(n338), .B1(n343), .B2(n180), .Z(n10) );
  OAI22_B U36 ( .A1(n80), .A2(n338), .B1(n342), .B2(n180), .Z(n11) );
  OAI22_B U37 ( .A1(n79), .A2(n338), .B1(n341), .B2(n180), .Z(n13) );
  OAI22_B U38 ( .A1(n42), .A2(n332), .B1(n344), .B2(n178), .Z(n15) );
  OAI22_B U39 ( .A1(n41), .A2(n332), .B1(n343), .B2(n178), .Z(n16) );
  OAI22_B U40 ( .A1(n40), .A2(n332), .B1(n342), .B2(n178), .Z(n18) );
  OAI22_B U41 ( .A1(n39), .A2(n332), .B1(n341), .B2(n178), .Z(n19) );
  BUFFER_J U42 ( .A(n293), .Z(n299) );
  INVERT_D U43 ( .A(n279), .Z(n204) );
  INVERT_K U44 ( .A(read_addr[0]), .Z(n298) );
  INVERT_J U45 ( .A(n270), .Z(n209) );
  INVERT_I U46 ( .A(n4), .Z(n270) );
  INVERT_J U47 ( .A(n271), .Z(n211) );
  INVERT_I U48 ( .A(n5), .Z(n271) );
  INVERT_J U49 ( .A(n272), .Z(n213) );
  INVERT_I U50 ( .A(n6), .Z(n272) );
  INVERT_J U51 ( .A(n274), .Z(n215) );
  INVERT_I U52 ( .A(n7), .Z(n274) );
  INVERT_J U53 ( .A(n269), .Z(n207) );
  INVERT_I U54 ( .A(n8), .Z(n269) );
  INVERT_J U55 ( .A(n275), .Z(n205) );
  INVERT_I U56 ( .A(n9), .Z(n275) );
  AO22_F U57 ( .A1(n277), .A2(read_addr[0]), .B1(n185), .B2(n298), .Z(N37) );
  AND2_H U58 ( .A(n286), .B(n298), .Z(n244) );
  INVERT_D U59 ( .A(n244), .Z(n24) );
  BUFFER_F U60 ( .A(n280), .Z(n26) );
  NAND2BAL_E U61 ( .A(n190), .B(n116), .Z(N34) );
  AND2_H U62 ( .A(n24), .B(n245), .Z(N32) );
  INVERT_D U63 ( .A(N32), .Z(n28) );
  INVERT_E U64 ( .A(n30), .Z(n116) );
  AND2_H U65 ( .A(read_addr[0]), .B(n283), .Z(n252) );
  INVERT_D U66 ( .A(n252), .Z(n117) );
  AO22_F U67 ( .A1(n270), .A2(n330), .B1(N30), .B2(n139), .Z(n102) );
  INVERT_I U68 ( .A(n302), .Z(n118) );
  INVERT_H U69 ( .A(n301), .Z(n302) );
  AO22_F U70 ( .A1(n271), .A2(n330), .B1(N31), .B2(n139), .Z(n101) );
  AO22_F U71 ( .A1(n272), .A2(n330), .B1(n139), .B2(n28), .Z(n100) );
  AO22_F U72 ( .A1(n274), .A2(n330), .B1(n265), .B2(N34), .Z(n98) );
  AO22_F U73 ( .A1(n269), .A2(n330), .B1(n248), .B2(N36), .Z(n96) );
  NAND2BAL_E U74 ( .A(n193), .B(n187), .Z(N36) );
  AOI2222_I U75 ( .A1(\fifo_data[6][0] ), .A2(n155), .B1(\fifo_data[4][0] ), 
        .B2(n171), .C1(\fifo_data[2][0] ), .C2(n232), .D1(\fifo_data[0][0] ), 
        .D2(n158), .Z(n276) );
  AOI2222_I U76 ( .A1(\fifo_data[7][1] ), .A2(n155), .B1(\fifo_data[5][1] ), 
        .B2(n171), .C1(\fifo_data[3][1] ), .C2(n232), .D1(\fifo_data[1][1] ), 
        .D2(n168), .Z(n279) );
  INVERT_M U77 ( .A(n140), .Z(n155) );
  AO2222_F U78 ( .A1(\fifo_data[7][4] ), .A2(n155), .B1(\fifo_data[5][4] ), 
        .B2(n171), .C1(\fifo_data[3][4] ), .C2(n232), .D1(\fifo_data[1][4] ), 
        .D2(n158), .Z(n285) );
  INVERT_M U79 ( .A(n170), .Z(n171) );
  AO2222_F U80 ( .A1(\fifo_data[7][7] ), .A2(n156), .B1(\fifo_data[5][7] ), 
        .B2(n172), .C1(\fifo_data[3][7] ), .C2(n232), .D1(\fifo_data[1][7] ), 
        .D2(n167), .Z(n295) );
  AO2222_F U81 ( .A1(\fifo_data[6][7] ), .A2(n156), .B1(\fifo_data[4][7] ), 
        .B2(n172), .C1(\fifo_data[2][7] ), .C2(n232), .D1(\fifo_data[0][7] ), 
        .D2(n167), .Z(n294) );
  AO2222_F U82 ( .A1(\fifo_data[6][6] ), .A2(n155), .B1(\fifo_data[4][6] ), 
        .B2(n172), .C1(\fifo_data[2][6] ), .C2(n232), .D1(\fifo_data[0][6] ), 
        .D2(n235), .Z(n288) );
  AO2222_F U83 ( .A1(\fifo_data[7][6] ), .A2(n155), .B1(\fifo_data[5][6] ), 
        .B2(n171), .C1(\fifo_data[3][6] ), .C2(n232), .D1(\fifo_data[1][6] ), 
        .D2(n167), .Z(n289) );
  AO2222_F U84 ( .A1(\fifo_data[7][0] ), .A2(n155), .B1(\fifo_data[5][0] ), 
        .B2(n171), .C1(\fifo_data[3][0] ), .C2(n232), .D1(\fifo_data[1][0] ), 
        .D2(n158), .Z(n277) );
  BUFFER_K U85 ( .A(n291), .Z(n233) );
  INVERT_K U86 ( .A(n299), .Z(n140) );
  INVERT_M U87 ( .A(n140), .Z(n156) );
  AO2222_F U88 ( .A1(\fifo_data[6][4] ), .A2(n155), .B1(\fifo_data[4][4] ), 
        .B2(n171), .C1(\fifo_data[2][4] ), .C2(n232), .D1(\fifo_data[0][4] ), 
        .D2(n158), .Z(n284) );
  AO2222_F U89 ( .A1(\fifo_data[7][2] ), .A2(n155), .B1(\fifo_data[5][2] ), 
        .B2(n171), .C1(\fifo_data[3][2] ), .C2(n232), .D1(\fifo_data[1][2] ), 
        .D2(n235), .Z(n281) );
  INVERT_I U90 ( .A(n157), .Z(n158) );
  INVERT_I U91 ( .A(n157), .Z(n167) );
  INVERT_I U92 ( .A(n157), .Z(n168) );
  AOI2222_H U93 ( .A1(\fifo_data[6][2] ), .A2(n156), .B1(\fifo_data[4][2] ), 
        .B2(n171), .C1(\fifo_data[2][2] ), .C2(n232), .D1(\fifo_data[0][2] ), 
        .D2(n168), .Z(n280) );
  INVERT_K U94 ( .A(n300), .Z(n170) );
  INVERT_M U95 ( .A(n170), .Z(n172) );
  AO22_F U96 ( .A1(read_addr[0]), .A2(n285), .B1(n284), .B2(n298), .Z(N33) );
  OAI22_B U97 ( .A1(n74), .A2(n337), .B1(n344), .B2(n198), .Z(n123) );
  INVERT_M U98 ( .A(write_data[4]), .Z(n344) );
  OAI22_B U99 ( .A1(n34), .A2(n331), .B1(n344), .B2(n174), .Z(n163) );
  OAI22_B U100 ( .A1(n35), .A2(n331), .B1(n345), .B2(n174), .Z(n162) );
  OAI22_B U101 ( .A1(n75), .A2(n337), .B1(n345), .B2(n198), .Z(n122) );
  INVERT_M U102 ( .A(write_data[3]), .Z(n345) );
  OAI22_B U103 ( .A1(n36), .A2(n331), .B1(n346), .B2(n174), .Z(n161) );
  OAI22_B U104 ( .A1(n76), .A2(n337), .B1(n346), .B2(n198), .Z(n121) );
  INVERT_M U105 ( .A(write_data[2]), .Z(n346) );
  OAI22_B U106 ( .A1(n33), .A2(n331), .B1(n343), .B2(n174), .Z(n164) );
  INVERT_M U107 ( .A(write_data[5]), .Z(n343) );
  OAI22_B U108 ( .A1(n68), .A2(n336), .B1(n346), .B2(n176), .Z(n129) );
  OAI22_B U109 ( .A1(n67), .A2(n336), .B1(n345), .B2(n176), .Z(n130) );
  OAI22_B U110 ( .A1(n66), .A2(n336), .B1(n344), .B2(n176), .Z(n131) );
  OAI22_B U111 ( .A1(n65), .A2(n336), .B1(n343), .B2(n176), .Z(n132) );
  INVERT_M U112 ( .A(n176), .Z(n336) );
  OAI22_B U113 ( .A1(n64), .A2(n336), .B1(n342), .B2(n176), .Z(n133) );
  INVERT_M U114 ( .A(write_data[6]), .Z(n342) );
  OAI22_B U115 ( .A1(n32), .A2(n331), .B1(n342), .B2(n174), .Z(n165) );
  INVERT_M U116 ( .A(n174), .Z(n331) );
  OAI22_B U117 ( .A1(n70), .A2(n336), .B1(n348), .B2(n176), .Z(n127) );
  OAI22_B U118 ( .A1(n38), .A2(n331), .B1(n348), .B2(n174), .Z(n159) );
  INVERT_M U119 ( .A(write_data[0]), .Z(n348) );
  OAI22_B U120 ( .A1(n46), .A2(n332), .B1(n348), .B2(n178), .Z(n151) );
  INVERT_I U121 ( .A(n29), .Z(n173) );
  INVERT_N U122 ( .A(n173), .Z(n174) );
  NAND3_E U123 ( .A(n227), .B(n222), .C(n229), .Z(n29) );
  INVERT_I U124 ( .A(n20), .Z(n175) );
  INVERT_N U125 ( .A(n175), .Z(n176) );
  NAND3_E U126 ( .A(n227), .B(n222), .C(n224), .Z(n20) );
  OAI22_B U127 ( .A1(n69), .A2(n336), .B1(n347), .B2(n176), .Z(n128) );
  OAI22_B U128 ( .A1(n37), .A2(n331), .B1(n347), .B2(n174), .Z(n160) );
  INVERT_M U129 ( .A(write_data[1]), .Z(n347) );
  OAI22_B U130 ( .A1(n45), .A2(n332), .B1(n347), .B2(n178), .Z(n152) );
  OAI22_B U131 ( .A1(n44), .A2(n332), .B1(n346), .B2(n178), .Z(n153) );
  OAI22_B U132 ( .A1(n43), .A2(n332), .B1(n345), .B2(n178), .Z(n154) );
  INVERT_M U133 ( .A(n178), .Z(n332) );
  INVERT_I U134 ( .A(n27), .Z(n177) );
  INVERT_N U135 ( .A(n177), .Z(n178) );
  NAND3_E U136 ( .A(write_addr[0]), .B(n222), .C(n229), .Z(n27) );
  OAI22_B U137 ( .A1(n63), .A2(n336), .B1(n341), .B2(n176), .Z(n134) );
  OAI22_B U138 ( .A1(n31), .A2(n331), .B1(n341), .B2(n174), .Z(n166) );
  INVERT_M U139 ( .A(write_data[7]), .Z(n341) );
  OAI22_B U140 ( .A1(n86), .A2(n338), .B1(n348), .B2(n180), .Z(n111) );
  OAI22_B U141 ( .A1(n85), .A2(n338), .B1(n347), .B2(n180), .Z(n112) );
  OAI22_B U142 ( .A1(n84), .A2(n338), .B1(n346), .B2(n180), .Z(n113) );
  OAI22_B U143 ( .A1(n83), .A2(n338), .B1(n345), .B2(n180), .Z(n114) );
  OAI22_B U144 ( .A1(n82), .A2(n338), .B1(n344), .B2(n180), .Z(n115) );
  INVERT_M U145 ( .A(n180), .Z(n338) );
  INVERT_I U146 ( .A(n14), .Z(n179) );
  INVERT_N U147 ( .A(n179), .Z(n180) );
  NAND3_E U148 ( .A(n224), .B(n227), .C(write_addr[1]), .Z(n14) );
  OAI22_B U149 ( .A1(n54), .A2(n333), .B1(n348), .B2(n182), .Z(n143) );
  OAI22_B U150 ( .A1(n53), .A2(n333), .B1(n347), .B2(n182), .Z(n144) );
  OAI22_B U151 ( .A1(n52), .A2(n333), .B1(n346), .B2(n182), .Z(n145) );
  OAI22_B U152 ( .A1(n51), .A2(n333), .B1(n345), .B2(n182), .Z(n146) );
  OAI22_B U153 ( .A1(n50), .A2(n333), .B1(n344), .B2(n182), .Z(n147) );
  OAI22_B U154 ( .A1(n49), .A2(n333), .B1(n343), .B2(n182), .Z(n148) );
  INVERT_M U155 ( .A(n182), .Z(n333) );
  INVERT_I U156 ( .A(n25), .Z(n181) );
  INVERT_N U157 ( .A(n181), .Z(n182) );
  NAND3_E U158 ( .A(write_addr[1]), .B(n227), .C(n229), .Z(n25) );
  OAI22_B U159 ( .A1(n48), .A2(n333), .B1(n342), .B2(n182), .Z(n149) );
  OAI22_B U160 ( .A1(n47), .A2(n333), .B1(n341), .B2(n182), .Z(n150) );
  OAI22_B U161 ( .A1(n59), .A2(n184), .B1(n345), .B2(n22), .Z(n138) );
  INVERT_I U162 ( .A(n334), .Z(n183) );
  INVERT_M U163 ( .A(n183), .Z(n184) );
  OAI22_B U164 ( .A1(n62), .A2(n184), .B1(n348), .B2(n22), .Z(n135) );
  OAI22_B U165 ( .A1(n61), .A2(n184), .B1(n347), .B2(n22), .Z(n136) );
  OAI22_B U166 ( .A1(n60), .A2(n184), .B1(n346), .B2(n22), .Z(n137) );
  NAND3_K U167 ( .A(write_addr[1]), .B(write_addr[0]), .C(n229), .Z(n22) );
  OAI22_B U168 ( .A1(n56), .A2(n184), .B1(n342), .B2(n22), .Z(n141) );
  INVERT_I U169 ( .A(n339), .Z(n220) );
  OAI22_B U170 ( .A1(n93), .A2(n221), .B1(n200), .B2(n347), .Z(n104) );
  OAI22_B U171 ( .A1(n94), .A2(n221), .B1(n200), .B2(n348), .Z(n103) );
  OAI22_B U172 ( .A1(n92), .A2(n221), .B1(n200), .B2(n346), .Z(n105) );
  OAI22_B U173 ( .A1(n91), .A2(n221), .B1(n200), .B2(n345), .Z(n106) );
  INVERT_M U174 ( .A(n220), .Z(n221) );
  OAI22_B U175 ( .A1(n90), .A2(n221), .B1(n200), .B2(n344), .Z(n107) );
  OAI22_B U176 ( .A1(n89), .A2(n221), .B1(n200), .B2(n343), .Z(n108) );
  OAI22_B U177 ( .A1(n88), .A2(n221), .B1(n200), .B2(n342), .Z(n109) );
  AO2222_F U178 ( .A1(\fifo_data[7][3] ), .A2(n156), .B1(\fifo_data[5][3] ), 
        .B2(n172), .C1(\fifo_data[3][3] ), .C2(n233), .D1(\fifo_data[1][3] ), 
        .D2(n168), .Z(n283) );
  BUFFER_J U179 ( .A(n23), .Z(n230) );
  NOR2_D U180 ( .A(n335), .B(write_addr[2]), .Z(n23) );
  NOR2_D U181 ( .A(read_addr[1]), .B(read_addr[2]), .Z(n290) );
  INVERT_E U182 ( .A(n186), .Z(n187) );
  AND2_H U183 ( .A(read_addr[0]), .B(n204), .Z(n254) );
  INVERT_D U184 ( .A(n254), .Z(n188) );
  INVERT_E U185 ( .A(n189), .Z(n190) );
  AND2_H U186 ( .A(n282), .B(n240), .Z(n251) );
  INVERT_D U187 ( .A(n251), .Z(n191) );
  INVERT_E U188 ( .A(n192), .Z(n193) );
  AND2_H U189 ( .A(n260), .B(n278), .Z(n253) );
  INVERT_D U190 ( .A(n253), .Z(n194) );
  INVERT_E U191 ( .A(n287), .Z(n195) );
  INVERT_H U192 ( .A(n195), .Z(n196) );
  INVERT_E U193 ( .A(n237), .Z(N31) );
  INVERT_I U194 ( .A(n219), .Z(n197) );
  INVERT_N U195 ( .A(n197), .Z(n198) );
  INVERT_I U196 ( .A(n3), .Z(n199) );
  INVERT_M U197 ( .A(n199), .Z(n200) );
  NAND3_E U198 ( .A(write_addr[0]), .B(n224), .C(write_addr[1]), .Z(n3) );
  OAI22_B U199 ( .A1(n73), .A2(n337), .B1(n343), .B2(n198), .Z(n124) );
  OAI22_B U200 ( .A1(n72), .A2(n337), .B1(n342), .B2(n198), .Z(n125) );
  INVERT_C U201 ( .A(n201), .Z(n126) );
  NOR2_C U202 ( .A(n341), .B(n198), .Z(n202) );
  NOR2_C U203 ( .A(n71), .B(n337), .Z(n203) );
  NOR2_C U204 ( .A(n202), .B(n203), .Z(n201) );
  INVERT_M U205 ( .A(n198), .Z(n337) );
  OAI22_B U206 ( .A1(n55), .A2(n184), .B1(n341), .B2(n22), .Z(n142) );
  OAI22_B U207 ( .A1(n87), .A2(n221), .B1(n200), .B2(n341), .Z(n110) );
  AO22_F U208 ( .A1(n275), .A2(n330), .B1(n265), .B2(N37), .Z(n95) );
  NOR2_D U209 ( .A(n297), .B(read_addr[2]), .Z(n291) );
  INVERT_H U210 ( .A(read_addr[1]), .Z(n297) );
  INVERT_O U211 ( .A(n205), .Z(read_data[0]) );
  INVERT_O U212 ( .A(n207), .Z(read_data[1]) );
  INVERT_O U213 ( .A(n209), .Z(read_data[7]) );
  INVERT_O U214 ( .A(n211), .Z(read_data[6]) );
  INVERT_O U215 ( .A(n213), .Z(read_data[5]) );
  INVERT_O U216 ( .A(n215), .Z(read_data[3]) );
  NAND2_E U217 ( .A(read_addr[0]), .B(n196), .Z(n245) );
  AO2222_H U218 ( .A1(\fifo_data[7][5] ), .A2(n156), .B1(\fifo_data[5][5] ), 
        .B2(n172), .C1(\fifo_data[3][5] ), .C2(n232), .D1(\fifo_data[1][5] ), 
        .D2(n235), .Z(n287) );
  AO2222_F U219 ( .A1(\fifo_data[6][5] ), .A2(n156), .B1(\fifo_data[4][5] ), 
        .B2(n172), .C1(\fifo_data[2][5] ), .C2(n232), .D1(\fifo_data[0][5] ), 
        .D2(n167), .Z(n286) );
  AO2222_F U220 ( .A1(\fifo_data[6][3] ), .A2(n156), .B1(\fifo_data[4][3] ), 
        .B2(n172), .C1(\fifo_data[2][3] ), .C2(n232), .D1(\fifo_data[0][3] ), 
        .D2(n168), .Z(n282) );
  AO2222_F U221 ( .A1(\fifo_data[6][1] ), .A2(n156), .B1(\fifo_data[4][1] ), 
        .B2(n172), .C1(\fifo_data[2][1] ), .C2(n232), .D1(\fifo_data[0][1] ), 
        .D2(n235), .Z(n278) );
  INVERT_O U222 ( .A(n273), .Z(read_data[4]) );
  NAND2_E U223 ( .A(write_enable_1), .B(write_addr[2]), .Z(n12) );
  INVERT_H U224 ( .A(n17), .Z(n218) );
  INVERT_H U225 ( .A(read_enable_1), .Z(n301) );
  INVERT_F U226 ( .A(n12), .Z(n225) );
  OAI22_B U227 ( .A1(n77), .A2(n337), .B1(n347), .B2(n198), .Z(n120) );
  OAI22_B U228 ( .A1(n78), .A2(n337), .B1(n348), .B2(n198), .Z(n119) );
  INVERT_H U229 ( .A(n22), .Z(n334) );
  BUFFER_J U230 ( .A(n292), .Z(n300) );
  INVERT_O U231 ( .A(n231), .Z(n232) );
  AO22_F U232 ( .A1(read_addr[0]), .A2(n295), .B1(n294), .B2(n260), .Z(N30) );
  INVERT_D U233 ( .A(n298), .Z(n238) );
  NOR2_C U234 ( .A(n238), .B(n239), .Z(n242) );
  NOR2_C U235 ( .A(n298), .B(n241), .Z(n243) );
  NOR2_C U236 ( .A(n242), .B(n243), .Z(n237) );
  INVERT_C U237 ( .A(n246), .Z(n99) );
  INVERT_H U238 ( .A(n330), .Z(n248) );
  NOR2_C U239 ( .A(n118), .B(n247), .Z(n249) );
  NOR2_C U240 ( .A(n248), .B(n21), .Z(n250) );
  NOR2_C U241 ( .A(n249), .B(n250), .Z(n246) );
  INVERT_O U242 ( .A(n266), .Z(read_data[2]) );
  INVERT_H U243 ( .A(n256), .Z(n257) );
  INVERT_K U244 ( .A(n257), .Z(n266) );
  INVERT_F U245 ( .A(read_addr[0]), .Z(n260) );
  NOR2_C U246 ( .A(read_addr[0]), .B(n259), .Z(n262) );
  NOR2_C U247 ( .A(n298), .B(n261), .Z(n263) );
  NOR2_C U248 ( .A(n262), .B(n263), .Z(n258) );
  INVERT_C U249 ( .A(n264), .Z(n97) );
  INVERT_H U250 ( .A(n330), .Z(n265) );
  NOR2_C U251 ( .A(n330), .B(n258), .Z(n267) );
  NOR2_C U252 ( .A(n139), .B(n266), .Z(n268) );
  NOR2_C U253 ( .A(n267), .B(n268), .Z(n264) );
  INVERT_J U254 ( .A(n349), .Z(n273) );
  INVERT_I U255 ( .A(n326), .Z(n325) );
  INVERT_I U256 ( .A(n327), .Z(n324) );
  INVERT_I U257 ( .A(n328), .Z(n327) );
  INVERT_I U258 ( .A(n329), .Z(n328) );
  INVERT_H U259 ( .A(n200), .Z(n339) );
  INVERT_J U260 ( .A(n324), .Z(n319) );
  INVERT_J U261 ( .A(n324), .Z(n320) );
  INVERT_J U262 ( .A(n325), .Z(n317) );
  INVERT_J U263 ( .A(n325), .Z(n318) );
  INVERT_I U264 ( .A(n327), .Z(n323) );
  INVERT_I U265 ( .A(n328), .Z(n326) );
  INVERT_I U266 ( .A(read_rst), .Z(n305) );
  INVERT_K U267 ( .A(n317), .Z(n315) );
  INVERT_K U268 ( .A(n317), .Z(n314) );
  INVERT_K U269 ( .A(n318), .Z(n313) );
  INVERT_K U270 ( .A(n318), .Z(n312) );
  INVERT_K U271 ( .A(n319), .Z(n311) );
  INVERT_K U272 ( .A(n319), .Z(n310) );
  INVERT_K U273 ( .A(n320), .Z(n309) );
  INVERT_K U274 ( .A(n320), .Z(n308) );
  INVERT_K U275 ( .A(n321), .Z(n307) );
  INVERT_K U276 ( .A(n322), .Z(n306) );
  INVERT_H U277 ( .A(n323), .Z(n322) );
  INVERT_J U278 ( .A(n326), .Z(n316) );
  INVERT_K U279 ( .A(n305), .Z(n303) );
  INVERT_I U280 ( .A(n305), .Z(n304) );
  INVERT_H U281 ( .A(write_rst), .Z(n329) );
  NAND3_D U282 ( .A(n224), .B(n222), .C(write_addr[0]), .Z(n17) );
  NOR2_D U283 ( .A(n296), .B(read_addr[1]), .Z(n292) );
  INVERT_D U284 ( .A(write_enable_1), .Z(n335) );
endmodule


module gray_code_sync_1 ( gray_in, clkb, clka, clka_rst, clkb_rst, gray_out );
  input [3:0] gray_in;
  output [3:0] gray_out;
  input clkb, clka, clka_rst, clkb_rst;
  wire   n1, n2, n3, n4, n5;
  wire   [3:0] gray_sync1;
  wire   [3:0] gray_sync2;

  DFFR_K \gray_sync1_reg[3]  ( .D(gray_in[3]), .CLK(clka), .RN(n4), .Q(
        gray_sync1[3]) );
  DFFR_K \gray_sync1_reg[2]  ( .D(gray_in[2]), .CLK(clka), .RN(n4), .Q(
        gray_sync1[2]) );
  DFFR_K \gray_sync1_reg[1]  ( .D(gray_in[1]), .CLK(clka), .RN(n4), .Q(
        gray_sync1[1]) );
  DFFR_K \gray_sync1_reg[0]  ( .D(gray_in[0]), .CLK(clka), .RN(n4), .Q(
        gray_sync1[0]) );
  DFFR_E \gray_out_reg[0]  ( .D(gray_sync2[0]), .CLK(clkb), .RN(n2), .Q(
        gray_out[0]) );
  DFFR_E \gray_out_reg[2]  ( .D(gray_sync2[2]), .CLK(clkb), .RN(n2), .Q(
        gray_out[2]) );
  DFFR_E \gray_out_reg[1]  ( .D(gray_sync2[1]), .CLK(clkb), .RN(n2), .Q(
        gray_out[1]) );
  DFFR_E \gray_sync2_reg[3]  ( .D(gray_sync1[3]), .CLK(clkb), .RN(n1), .Q(
        gray_sync2[3]) );
  DFFR_E \gray_sync2_reg[2]  ( .D(gray_sync1[2]), .CLK(clkb), .RN(n1), .Q(
        gray_sync2[2]) );
  DFFR_E \gray_sync2_reg[1]  ( .D(gray_sync1[1]), .CLK(clkb), .RN(n1), .Q(
        gray_sync2[1]) );
  DFFR_E \gray_sync2_reg[0]  ( .D(gray_sync1[0]), .CLK(clkb), .RN(n1), .Q(
        gray_sync2[0]) );
  DFFR_E \gray_out_reg[3]  ( .D(gray_sync2[3]), .CLK(clkb), .RN(n1), .Q(
        gray_out[3]) );
  INVERT_I U3 ( .A(clkb_rst), .Z(n3) );
  INVERT_K U4 ( .A(n3), .Z(n1) );
  INVERT_I U5 ( .A(n3), .Z(n2) );
  INVERT_J U6 ( .A(n5), .Z(n4) );
  INVERT_H U7 ( .A(clka_rst), .Z(n5) );
endmodule


module gray_code_sync_0 ( gray_in, clkb, clka, clka_rst, clkb_rst, gray_out );
  input [3:0] gray_in;
  output [3:0] gray_out;
  input clkb, clka, clka_rst, clkb_rst;
  wire   n1, n3, n4, n5, n6, n7;
  wire   [3:0] gray_sync1;
  wire   [3:0] gray_sync2;

  DFFR_K \gray_sync2_reg[3]  ( .D(gray_sync1[3]), .CLK(clkb), .RN(n5), .Q(
        gray_sync2[3]) );
  DFFR_K \gray_sync2_reg[2]  ( .D(gray_sync1[2]), .CLK(clkb), .RN(n5), .Q(
        gray_sync2[2]) );
  DFFR_K \gray_sync2_reg[1]  ( .D(gray_sync1[1]), .CLK(clkb), .RN(n5), .Q(
        gray_sync2[1]) );
  DFFR_K \gray_sync2_reg[0]  ( .D(gray_sync1[0]), .CLK(clkb), .RN(n5), .Q(
        gray_sync2[0]) );
  DFFR_K \gray_out_reg[3]  ( .D(gray_sync2[3]), .CLK(clkb), .RN(n5), .QBAR(n1)
         );
  DFFR_K \gray_out_reg[2]  ( .D(gray_sync2[2]), .CLK(clkb), .RN(n6), .Q(
        gray_out[2]) );
  DFFR_K \gray_out_reg[1]  ( .D(gray_sync2[1]), .CLK(clkb), .RN(n6), .Q(
        gray_out[1]) );
  DFFR_K \gray_out_reg[0]  ( .D(gray_sync2[0]), .CLK(clkb), .RN(n6), .Q(
        gray_out[0]) );
  DFFR_E \gray_sync1_reg[2]  ( .D(gray_in[2]), .CLK(clka), .RN(n3), .Q(
        gray_sync1[2]) );
  DFFR_E \gray_sync1_reg[1]  ( .D(gray_in[1]), .CLK(clka), .RN(n3), .Q(
        gray_sync1[1]) );
  DFFR_E \gray_sync1_reg[0]  ( .D(gray_in[0]), .CLK(clka), .RN(n3), .Q(
        gray_sync1[0]) );
  DFFR_E \gray_sync1_reg[3]  ( .D(gray_in[3]), .CLK(clka), .RN(n3), .Q(
        gray_sync1[3]) );
  INVERT_H U3 ( .A(n1), .Z(gray_out[3]) );
  INVERT_I U4 ( .A(clkb_rst), .Z(n7) );
  INVERT_K U5 ( .A(n7), .Z(n5) );
  INVERT_I U6 ( .A(n7), .Z(n6) );
  INVERT_J U7 ( .A(n4), .Z(n3) );
  INVERT_H U8 ( .A(clka_rst), .Z(n4) );
endmodule


module top_module ( write_data, write_clk, write_rst, write_enable, read_rst, 
        read_clk, read_enable, read_data, full, empty );
  input [7:0] write_data;
  output [7:0] read_data;
  input write_clk, write_rst, write_enable, read_rst, read_clk, read_enable;
  output full, empty;
  wire   write_enable_1, read_enable_1, n1, n2, n3, n4, n5, n6;
  wire   [3:0] synced_read_addr_gray;
  wire   [3:0] write_addr;
  wire   [3:0] write_addr_gray_1;
  wire   [3:0] synced_write_addr_gray;
  wire   [3:0] read_addr;
  wire   [3:0] read_addr_gray;

  write_control_logic write_ctrl ( .write_clk(write_clk), .write_enable(
        write_enable), .read_addr_gray(synced_read_addr_gray), .write_rst(n5), 
        .full(full), .write_addr(write_addr), .write_enable_1(write_enable_1), 
        .write_addr_gray(write_addr_gray_1) );
  read_control_logic read_ctrl ( .read_clk(read_clk), .read_rst(n2), 
        .read_enable(read_enable), .write_addr_gray(synced_write_addr_gray), 
        .empty(empty), .read_addr(read_addr), .read_enable_1(read_enable_1), 
        .read_addr_gray(read_addr_gray) );
  fifo_memory memory ( .write_data(write_data), .write_addr(write_addr), 
        .write_enable_1(write_enable_1), .read_addr(read_addr), 
        .read_enable_1(read_enable_1), .write_clk(write_clk), .write_rst(n5), 
        .read_clk(read_clk), .read_rst(n2), .read_data(read_data) );
  gray_code_sync_1 sync_write ( .gray_in(write_addr_gray_1), .clkb(read_clk), 
        .clka(write_clk), .clka_rst(n4), .clkb_rst(n1), .gray_out(
        synced_write_addr_gray) );
  gray_code_sync_0 sync_read ( .gray_in(read_addr_gray), .clkb(write_clk), 
        .clka(read_clk), .clka_rst(n1), .clkb_rst(n4), .gray_out(
        synced_read_addr_gray) );
  INVERT_I U1 ( .A(n3), .Z(n2) );
  INVERT_I U2 ( .A(read_rst), .Z(n3) );
  INVERT_I U3 ( .A(write_rst), .Z(n6) );
  INVERT_I U4 ( .A(n3), .Z(n1) );
  INVERT_I U5 ( .A(n6), .Z(n4) );
  INVERT_I U6 ( .A(n6), .Z(n5) );
endmodule

