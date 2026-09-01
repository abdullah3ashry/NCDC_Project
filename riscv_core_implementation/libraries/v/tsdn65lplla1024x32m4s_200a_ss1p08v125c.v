//****************************************************************************** */
//*                                                                              */
//*STATEMENT OF USE                                                              */
//*                                                                              */
//*This information contains confidential and proprietary information of TSMC.   */
//*No part of this information may be reproduced, transmitted, transcribed,      */
//*stored in a retrieval system, or translated into any human or computer        */
//*language, in any form or by any means, electronic, mechanical, magnetic,      */
//*optical, chemical, manual, or otherwise, without the prior written permission */
//*of TSMC. This information was prepared for informational purpose and is for   */
//*use by TSMC's customers only. TSMC reserves the right to make changes in the  */
//*information at any time and without notice.                                   */
//*                                                                              */
//****************************************************************************** */
//*                                                                              */
//*      Usage Limitation: PLEASE READ CAREFULLY FOR CORRECT USAGE               */
//*                                                                              */
//* The model doesn't support the control enable, data and address signals       */
//* transition at positive clock edge.                                           */
//* Please have some timing delays between control/data/address and clock signals*/
//* to ensure the correct behavior.                                              */
//*                                                                              */
//* Please be careful when using non 2^n  memory.                                */
//* In a non-fully decoded array, a write cycle to a nonexistent address location*/
//* does not change the memory array contents and output remains the same.       */
//* In a non-fully decoded array, a read cycle to a nonexistent address location */
//* does not change the memory array contents but the output becomes unknown.    */
//*                                                                              */
//* In the verilog model, the behavior of unknown clock will corrupt the         */
//* memory data and make output unknown regardless of CEB signal.  But in the    */
//* silicon, the unknown clock at CEB high, the memory and output data will be   */
//* held. The verilog model behavior is more conservative in this condition.     */
//*                                                                              */
//* The model doesn't identify physical column and row address                   */
//*                                                                              */
//* The verilog model provides UNIT_DELAY mode for the fast function simulation. */
//* All timing values in the specification are not checked in the UNIT_DELAY mode*/
//* simulation.                                                                  */
//*                                                                              */
//* The critical contention timings, tcc, is not checked in the UNIT_DELAY mode  */
//* simulation.  If addresses of read and write operations are the same and the  */
//* real time of the positive edge of CLKA and CLKB are identical the same,      */
//* it will be treated as a read/write port contention.                          */ 
//*                                                                              */
//* Please use the verilog simulator version with $recrem timing check support.  */
//* Some earlier simulator versions might support $recovery only, not $recrem.   */
//*                                                                              */
//****************************************************************************** */
//*      Macro Usage       : (+define[MACRO] for Verilog compiliers)             */
//* +UNIT_DELAY : Enable fast function simulation.                              */
//* +no_warning : Disable all runtime warnings message from this model.          */
//* +TSMC_INITIALIZE_MEM : Initialize the memory data in verilog format.         */
//* +TSMC_INITIALIZE_FAULT : Initialize the memory fault data in verilog format. */
//****************************************************************************** */
//*        Compiler Version : TSMC MEMORY COMPILER tsn65lplldpsram_2006.09.01.d.200a */
//*        Memory Type      : TSMC 65nm Low Power Low Leakage Dual Port SRAM Memory */
//*        Library Name     : tsdn65lplla1024x32m4s (user specify : TSDN65LPLLA1024X32M4S) */
//*        Library Version  : 200a */
//*        Generated Time   : 2025/07/22, 15:52:48 */
//*************************************************************************** ** */


`resetall
`celldefine

`timescale 1ns/1ps
`delay_mode_path
`suppress_faults
`enable_portfaults

`ifdef UNIT_DELAY
`define SRAM_DELAY 0.010
`endif

module TSDN65LPLLA1024X32M4S
  (AA,
  DA,
  BWEBA,
  WEBA,CEBA,CLKA,
  AB,
  DB,
  BWEBB,
  WEBB,CEBB,CLKB,
  QA,
  QB);


// Parameter declarations
parameter  N = 32;
parameter  W = 1024;
parameter  M = 10;

// Input-Output declarations
   input [M-1:0] AA;
   input [N-1:0] DA;                
   input [N-1:0] BWEBA;             
   input WEBA;                     
   input CEBA;                    
   input CLKA;                   
   input [M-1:0] AB;            
   input [N-1:0] DB;           
   input [N-1:0] BWEBB;       
   input WEBB;               
   input CEBB;              
   input CLKB;  
   output [N-1:0] QA;         
   output [N-1:0] QB;        

`ifdef no_warning
parameter MES_ALL = "OFF";
`else
parameter MES_ALL = "ON";
`endif

`ifdef TSMC_INITIALIZE_MEM
  parameter cdeFileInit  = "TSDN65LPLLA1024X32M4S_initial.cde";
`endif
`ifdef TSMC_INITIALIZE_FAULT
   parameter cdeFileFault = "TSDN65LPLLA1024X32M4S_fault.cde";
`endif

// Registers
reg [N-1:0] DAL;
reg [N-1:0] DBL;
 
reg [N-1:0] BWEBAL;
reg [N-1:0] BWEBBL;
reg [N-1:0] bBWEBAL;
reg [N-1:0] bBWEBBL;
 
reg [M-1:0] AAL;
reg [M-1:0] ABL;
 
reg WEBAL,CEBAL;
reg WEBBL,CEBBL;
 
wire [N-1:0] QAL;
wire [N-1:0] QBL;
 
reg valid_cka, valid_ckb, valid_ckm;
reg valid_cea;
reg valid_ceb;
reg valid_wea;
reg valid_web;
reg valid_aa;
reg valid_ab;
reg valid_contentiona,valid_contentionb,valid_contentionc;
reg valid_da31, valid_da30, valid_da29, valid_da28, valid_da27, valid_da26, valid_da25, valid_da24, valid_da23, valid_da22, valid_da21, valid_da20, valid_da19, valid_da18, valid_da17, valid_da16, valid_da15, valid_da14, valid_da13, valid_da12, valid_da11, valid_da10, valid_da9, valid_da8, valid_da7, valid_da6, valid_da5, valid_da4, valid_da3, valid_da2, valid_da1, valid_da0;
reg valid_db31, valid_db30, valid_db29, valid_db28, valid_db27, valid_db26, valid_db25, valid_db24, valid_db23, valid_db22, valid_db21, valid_db20, valid_db19, valid_db18, valid_db17, valid_db16, valid_db15, valid_db14, valid_db13, valid_db12, valid_db11, valid_db10, valid_db9, valid_db8, valid_db7, valid_db6, valid_db5, valid_db4, valid_db3, valid_db2, valid_db1, valid_db0;
reg valid_bwa31, valid_bwa30, valid_bwa29, valid_bwa28, valid_bwa27, valid_bwa26, valid_bwa25, valid_bwa24, valid_bwa23, valid_bwa22, valid_bwa21, valid_bwa20, valid_bwa19, valid_bwa18, valid_bwa17, valid_bwa16, valid_bwa15, valid_bwa14, valid_bwa13, valid_bwa12, valid_bwa11, valid_bwa10, valid_bwa9, valid_bwa8, valid_bwa7, valid_bwa6, valid_bwa5, valid_bwa4, valid_bwa3, valid_bwa2, valid_bwa1, valid_bwa0;
reg valid_bwb31, valid_bwb30, valid_bwb29, valid_bwb28, valid_bwb27, valid_bwb26, valid_bwb25, valid_bwb24, valid_bwb23, valid_bwb22, valid_bwb21, valid_bwb20, valid_bwb19, valid_bwb18, valid_bwb17, valid_bwb16, valid_bwb15, valid_bwb14, valid_bwb13, valid_bwb12, valid_bwb11, valid_bwb10, valid_bwb9, valid_bwb8, valid_bwb7, valid_bwb6, valid_bwb5, valid_bwb4, valid_bwb3, valid_bwb2, valid_bwb1, valid_bwb0;

 
reg EN;
reg RDA, RDB;

reg RCLKA,RCLKB;

wire [N-1:0] bBWEBA;
wire [N-1:0] bBWEBB;
 
wire [N-1:0] bDA;
wire [N-1:0] bDB;
 
wire [M-1:0] bAA;
wire [M-1:0] bAB;
 
wire bWEBA,bWEBB;
wire bCEBA,bCEBB;
wire bCLKA,bCLKB;
 
reg [N-1:0] bQA;
reg [N-1:0] bQB;


wire [N-1:0] bbQA;
wire [N-1:0] bbQB;
 
integer i;
 
// Address Inputs
buf sAA0 (bAA[0], AA[0]);
buf sAB0 (bAB[0], AB[0]);
buf sAA1 (bAA[1], AA[1]);
buf sAB1 (bAB[1], AB[1]);
buf sAA2 (bAA[2], AA[2]);
buf sAB2 (bAB[2], AB[2]);
buf sAA3 (bAA[3], AA[3]);
buf sAB3 (bAB[3], AB[3]);
buf sAA4 (bAA[4], AA[4]);
buf sAB4 (bAB[4], AB[4]);
buf sAA5 (bAA[5], AA[5]);
buf sAB5 (bAB[5], AB[5]);
buf sAA6 (bAA[6], AA[6]);
buf sAB6 (bAB[6], AB[6]);
buf sAA7 (bAA[7], AA[7]);
buf sAB7 (bAB[7], AB[7]);
buf sAA8 (bAA[8], AA[8]);
buf sAB8 (bAB[8], AB[8]);
buf sAA9 (bAA[9], AA[9]);
buf sAB9 (bAB[9], AB[9]);


// Bit Write/Data Inputs 
buf sDA0 (bDA[0], DA[0]);
buf sDB0 (bDB[0], DB[0]);
buf sDA1 (bDA[1], DA[1]);
buf sDB1 (bDB[1], DB[1]);
buf sDA2 (bDA[2], DA[2]);
buf sDB2 (bDB[2], DB[2]);
buf sDA3 (bDA[3], DA[3]);
buf sDB3 (bDB[3], DB[3]);
buf sDA4 (bDA[4], DA[4]);
buf sDB4 (bDB[4], DB[4]);
buf sDA5 (bDA[5], DA[5]);
buf sDB5 (bDB[5], DB[5]);
buf sDA6 (bDA[6], DA[6]);
buf sDB6 (bDB[6], DB[6]);
buf sDA7 (bDA[7], DA[7]);
buf sDB7 (bDB[7], DB[7]);
buf sDA8 (bDA[8], DA[8]);
buf sDB8 (bDB[8], DB[8]);
buf sDA9 (bDA[9], DA[9]);
buf sDB9 (bDB[9], DB[9]);
buf sDA10 (bDA[10], DA[10]);
buf sDB10 (bDB[10], DB[10]);
buf sDA11 (bDA[11], DA[11]);
buf sDB11 (bDB[11], DB[11]);
buf sDA12 (bDA[12], DA[12]);
buf sDB12 (bDB[12], DB[12]);
buf sDA13 (bDA[13], DA[13]);
buf sDB13 (bDB[13], DB[13]);
buf sDA14 (bDA[14], DA[14]);
buf sDB14 (bDB[14], DB[14]);
buf sDA15 (bDA[15], DA[15]);
buf sDB15 (bDB[15], DB[15]);
buf sDA16 (bDA[16], DA[16]);
buf sDB16 (bDB[16], DB[16]);
buf sDA17 (bDA[17], DA[17]);
buf sDB17 (bDB[17], DB[17]);
buf sDA18 (bDA[18], DA[18]);
buf sDB18 (bDB[18], DB[18]);
buf sDA19 (bDA[19], DA[19]);
buf sDB19 (bDB[19], DB[19]);
buf sDA20 (bDA[20], DA[20]);
buf sDB20 (bDB[20], DB[20]);
buf sDA21 (bDA[21], DA[21]);
buf sDB21 (bDB[21], DB[21]);
buf sDA22 (bDA[22], DA[22]);
buf sDB22 (bDB[22], DB[22]);
buf sDA23 (bDA[23], DA[23]);
buf sDB23 (bDB[23], DB[23]);
buf sDA24 (bDA[24], DA[24]);
buf sDB24 (bDB[24], DB[24]);
buf sDA25 (bDA[25], DA[25]);
buf sDB25 (bDB[25], DB[25]);
buf sDA26 (bDA[26], DA[26]);
buf sDB26 (bDB[26], DB[26]);
buf sDA27 (bDA[27], DA[27]);
buf sDB27 (bDB[27], DB[27]);
buf sDA28 (bDA[28], DA[28]);
buf sDB28 (bDB[28], DB[28]);
buf sDA29 (bDA[29], DA[29]);
buf sDB29 (bDB[29], DB[29]);
buf sDA30 (bDA[30], DA[30]);
buf sDB30 (bDB[30], DB[30]);
buf sDA31 (bDA[31], DA[31]);
buf sDB31 (bDB[31], DB[31]);


buf sBWEBA0 (bBWEBA[0], BWEBA[0]);
buf sBWEBB0 (bBWEBB[0], BWEBB[0]);
buf sBWEBA1 (bBWEBA[1], BWEBA[1]);
buf sBWEBB1 (bBWEBB[1], BWEBB[1]);
buf sBWEBA2 (bBWEBA[2], BWEBA[2]);
buf sBWEBB2 (bBWEBB[2], BWEBB[2]);
buf sBWEBA3 (bBWEBA[3], BWEBA[3]);
buf sBWEBB3 (bBWEBB[3], BWEBB[3]);
buf sBWEBA4 (bBWEBA[4], BWEBA[4]);
buf sBWEBB4 (bBWEBB[4], BWEBB[4]);
buf sBWEBA5 (bBWEBA[5], BWEBA[5]);
buf sBWEBB5 (bBWEBB[5], BWEBB[5]);
buf sBWEBA6 (bBWEBA[6], BWEBA[6]);
buf sBWEBB6 (bBWEBB[6], BWEBB[6]);
buf sBWEBA7 (bBWEBA[7], BWEBA[7]);
buf sBWEBB7 (bBWEBB[7], BWEBB[7]);
buf sBWEBA8 (bBWEBA[8], BWEBA[8]);
buf sBWEBB8 (bBWEBB[8], BWEBB[8]);
buf sBWEBA9 (bBWEBA[9], BWEBA[9]);
buf sBWEBB9 (bBWEBB[9], BWEBB[9]);
buf sBWEBA10 (bBWEBA[10], BWEBA[10]);
buf sBWEBB10 (bBWEBB[10], BWEBB[10]);
buf sBWEBA11 (bBWEBA[11], BWEBA[11]);
buf sBWEBB11 (bBWEBB[11], BWEBB[11]);
buf sBWEBA12 (bBWEBA[12], BWEBA[12]);
buf sBWEBB12 (bBWEBB[12], BWEBB[12]);
buf sBWEBA13 (bBWEBA[13], BWEBA[13]);
buf sBWEBB13 (bBWEBB[13], BWEBB[13]);
buf sBWEBA14 (bBWEBA[14], BWEBA[14]);
buf sBWEBB14 (bBWEBB[14], BWEBB[14]);
buf sBWEBA15 (bBWEBA[15], BWEBA[15]);
buf sBWEBB15 (bBWEBB[15], BWEBB[15]);
buf sBWEBA16 (bBWEBA[16], BWEBA[16]);
buf sBWEBB16 (bBWEBB[16], BWEBB[16]);
buf sBWEBA17 (bBWEBA[17], BWEBA[17]);
buf sBWEBB17 (bBWEBB[17], BWEBB[17]);
buf sBWEBA18 (bBWEBA[18], BWEBA[18]);
buf sBWEBB18 (bBWEBB[18], BWEBB[18]);
buf sBWEBA19 (bBWEBA[19], BWEBA[19]);
buf sBWEBB19 (bBWEBB[19], BWEBB[19]);
buf sBWEBA20 (bBWEBA[20], BWEBA[20]);
buf sBWEBB20 (bBWEBB[20], BWEBB[20]);
buf sBWEBA21 (bBWEBA[21], BWEBA[21]);
buf sBWEBB21 (bBWEBB[21], BWEBB[21]);
buf sBWEBA22 (bBWEBA[22], BWEBA[22]);
buf sBWEBB22 (bBWEBB[22], BWEBB[22]);
buf sBWEBA23 (bBWEBA[23], BWEBA[23]);
buf sBWEBB23 (bBWEBB[23], BWEBB[23]);
buf sBWEBA24 (bBWEBA[24], BWEBA[24]);
buf sBWEBB24 (bBWEBB[24], BWEBB[24]);
buf sBWEBA25 (bBWEBA[25], BWEBA[25]);
buf sBWEBB25 (bBWEBB[25], BWEBB[25]);
buf sBWEBA26 (bBWEBA[26], BWEBA[26]);
buf sBWEBB26 (bBWEBB[26], BWEBB[26]);
buf sBWEBA27 (bBWEBA[27], BWEBA[27]);
buf sBWEBB27 (bBWEBB[27], BWEBB[27]);
buf sBWEBA28 (bBWEBA[28], BWEBA[28]);
buf sBWEBB28 (bBWEBB[28], BWEBB[28]);
buf sBWEBA29 (bBWEBA[29], BWEBA[29]);
buf sBWEBB29 (bBWEBB[29], BWEBB[29]);
buf sBWEBA30 (bBWEBA[30], BWEBA[30]);
buf sBWEBB30 (bBWEBB[30], BWEBB[30]);
buf sBWEBA31 (bBWEBA[31], BWEBA[31]);
buf sBWEBB31 (bBWEBB[31], BWEBB[31]);


// Input Controls
buf sWEBA (bWEBA, WEBA);
buf sWEBB (bWEBB, WEBB);
 
buf sCEBA (bCEBA, CEBA);
buf sCEBB (bCEBB, CEBB);
 
buf sCLKA (bCLKA, CLKA);
buf sCLKB (bCLKB, CLKB);


// Output Data
buf sQA0 (QA[0], bbQA[0]);
buf sQA1 (QA[1], bbQA[1]);
buf sQA2 (QA[2], bbQA[2]);
buf sQA3 (QA[3], bbQA[3]);
buf sQA4 (QA[4], bbQA[4]);
buf sQA5 (QA[5], bbQA[5]);
buf sQA6 (QA[6], bbQA[6]);
buf sQA7 (QA[7], bbQA[7]);
buf sQA8 (QA[8], bbQA[8]);
buf sQA9 (QA[9], bbQA[9]);
buf sQA10 (QA[10], bbQA[10]);
buf sQA11 (QA[11], bbQA[11]);
buf sQA12 (QA[12], bbQA[12]);
buf sQA13 (QA[13], bbQA[13]);
buf sQA14 (QA[14], bbQA[14]);
buf sQA15 (QA[15], bbQA[15]);
buf sQA16 (QA[16], bbQA[16]);
buf sQA17 (QA[17], bbQA[17]);
buf sQA18 (QA[18], bbQA[18]);
buf sQA19 (QA[19], bbQA[19]);
buf sQA20 (QA[20], bbQA[20]);
buf sQA21 (QA[21], bbQA[21]);
buf sQA22 (QA[22], bbQA[22]);
buf sQA23 (QA[23], bbQA[23]);
buf sQA24 (QA[24], bbQA[24]);
buf sQA25 (QA[25], bbQA[25]);
buf sQA26 (QA[26], bbQA[26]);
buf sQA27 (QA[27], bbQA[27]);
buf sQA28 (QA[28], bbQA[28]);
buf sQA29 (QA[29], bbQA[29]);
buf sQA30 (QA[30], bbQA[30]);
buf sQA31 (QA[31], bbQA[31]);

buf sQB0 (QB[0], bbQB[0]);
buf sQB1 (QB[1], bbQB[1]);
buf sQB2 (QB[2], bbQB[2]);
buf sQB3 (QB[3], bbQB[3]);
buf sQB4 (QB[4], bbQB[4]);
buf sQB5 (QB[5], bbQB[5]);
buf sQB6 (QB[6], bbQB[6]);
buf sQB7 (QB[7], bbQB[7]);
buf sQB8 (QB[8], bbQB[8]);
buf sQB9 (QB[9], bbQB[9]);
buf sQB10 (QB[10], bbQB[10]);
buf sQB11 (QB[11], bbQB[11]);
buf sQB12 (QB[12], bbQB[12]);
buf sQB13 (QB[13], bbQB[13]);
buf sQB14 (QB[14], bbQB[14]);
buf sQB15 (QB[15], bbQB[15]);
buf sQB16 (QB[16], bbQB[16]);
buf sQB17 (QB[17], bbQB[17]);
buf sQB18 (QB[18], bbQB[18]);
buf sQB19 (QB[19], bbQB[19]);
buf sQB20 (QB[20], bbQB[20]);
buf sQB21 (QB[21], bbQB[21]);
buf sQB22 (QB[22], bbQB[22]);
buf sQB23 (QB[23], bbQB[23]);
buf sQB24 (QB[24], bbQB[24]);
buf sQB25 (QB[25], bbQB[25]);
buf sQB26 (QB[26], bbQB[26]);
buf sQB27 (QB[27], bbQB[27]);
buf sQB28 (QB[28], bbQB[28]);
buf sQB29 (QB[29], bbQB[29]);
buf sQB30 (QB[30], bbQB[30]);
buf sQB31 (QB[31], bbQB[31]);

assign bbQA=bQA;
assign bbQB=bQB;

and sWEA (WEA, !bWEBA, !bCEBA);
and sWEB (WEB, !bWEBB, !bCEBB);

buf sCSA (CSA, !bCEBA);
buf sCSB (CSB, !bCEBB);

wire AeqB, BeqA;
wire AbeforeB, BbeforeA;

real CLKA_time, CLKB_time;

wire CLK_same;   
assign CLK_same = ((CLKA_time == CLKB_time)?1'b1:1'b0);

assign AeqB = (((bAA == bAB) && CLK_same) || ((AAL == bAB) && !CLK_same)) ? 1'b1:1'b0;
assign BeqA = (((bAB == bAA) && CLK_same) || ((ABL == bAA) && !CLK_same)) ? 1'b1:1'b0;

assign AbeforeB = ((((!bCEBA && !bCEBB && (!bWEBA || !bWEBB)) && CLK_same) || ((!CEBAL && !bCEBB) && (!WEBAL || !bWEBB) && !CLK_same)) && AeqB) ? 1'b1:1'b0;
assign BbeforeA = ((((!bCEBB && !bCEBA && (!bWEBB || !bWEBA)) && CLK_same) || ((!CEBBL && !bCEBA) && (!WEBBL || !bWEBA) && !CLK_same)) && BeqA) ? 1'b1:1'b0;


`ifdef UNIT_DELAY
`else
specify

   specparam PATHPULSE$CLKA$QA = ( 0, 0.001 );
   specparam PATHPULSE$CLKB$QB = ( 0, 0.001 );

specparam
ckpl = 0.5831361,
ckph = 0.5531837,
ckp = 2.7659180,
cksep = 2.597,

as = 0.2207136,
ah = 0.0721031,
ds = 0.4845522,
dh = 0.1029876,
css = 0.3092472,
csh = 0.0000000,
wes = 0.2512469,
weh = 0.0721031,
bws = 0.5112209,
bwh = 0.1029876,

ckq = 2.7225410,
ckqh = 1.9212930,
dq = 0.8087561,
dqh = 0.6853390,
bwq = 0.8019324,
bwqh = 0.6880543;

  $recrem (posedge CLKA, posedge CLKB &&& AbeforeB, cksep, 0, valid_contentiona);
  $recrem (posedge CLKB, posedge CLKA &&& BbeforeA, cksep, 0, valid_contentionb);

  $setuphold (posedge CLKA &&& CSA, posedge AA[0], as, ah, valid_aa);
  $setuphold (posedge CLKA &&& CSA, negedge AA[0], as, ah, valid_aa);
  $setuphold (posedge CLKB &&& CSB, posedge AB[0], as, ah, valid_ab);
  $setuphold (posedge CLKB &&& CSB, negedge AB[0], as, ah, valid_ab);
  $setuphold (posedge CLKA &&& CSA, posedge AA[1], as, ah, valid_aa);
  $setuphold (posedge CLKA &&& CSA, negedge AA[1], as, ah, valid_aa);
  $setuphold (posedge CLKB &&& CSB, posedge AB[1], as, ah, valid_ab);
  $setuphold (posedge CLKB &&& CSB, negedge AB[1], as, ah, valid_ab);
  $setuphold (posedge CLKA &&& CSA, posedge AA[2], as, ah, valid_aa);
  $setuphold (posedge CLKA &&& CSA, negedge AA[2], as, ah, valid_aa);
  $setuphold (posedge CLKB &&& CSB, posedge AB[2], as, ah, valid_ab);
  $setuphold (posedge CLKB &&& CSB, negedge AB[2], as, ah, valid_ab);
  $setuphold (posedge CLKA &&& CSA, posedge AA[3], as, ah, valid_aa);
  $setuphold (posedge CLKA &&& CSA, negedge AA[3], as, ah, valid_aa);
  $setuphold (posedge CLKB &&& CSB, posedge AB[3], as, ah, valid_ab);
  $setuphold (posedge CLKB &&& CSB, negedge AB[3], as, ah, valid_ab);
  $setuphold (posedge CLKA &&& CSA, posedge AA[4], as, ah, valid_aa);
  $setuphold (posedge CLKA &&& CSA, negedge AA[4], as, ah, valid_aa);
  $setuphold (posedge CLKB &&& CSB, posedge AB[4], as, ah, valid_ab);
  $setuphold (posedge CLKB &&& CSB, negedge AB[4], as, ah, valid_ab);
  $setuphold (posedge CLKA &&& CSA, posedge AA[5], as, ah, valid_aa);
  $setuphold (posedge CLKA &&& CSA, negedge AA[5], as, ah, valid_aa);
  $setuphold (posedge CLKB &&& CSB, posedge AB[5], as, ah, valid_ab);
  $setuphold (posedge CLKB &&& CSB, negedge AB[5], as, ah, valid_ab);
  $setuphold (posedge CLKA &&& CSA, posedge AA[6], as, ah, valid_aa);
  $setuphold (posedge CLKA &&& CSA, negedge AA[6], as, ah, valid_aa);
  $setuphold (posedge CLKB &&& CSB, posedge AB[6], as, ah, valid_ab);
  $setuphold (posedge CLKB &&& CSB, negedge AB[6], as, ah, valid_ab);
  $setuphold (posedge CLKA &&& CSA, posedge AA[7], as, ah, valid_aa);
  $setuphold (posedge CLKA &&& CSA, negedge AA[7], as, ah, valid_aa);
  $setuphold (posedge CLKB &&& CSB, posedge AB[7], as, ah, valid_ab);
  $setuphold (posedge CLKB &&& CSB, negedge AB[7], as, ah, valid_ab);
  $setuphold (posedge CLKA &&& CSA, posedge AA[8], as, ah, valid_aa);
  $setuphold (posedge CLKA &&& CSA, negedge AA[8], as, ah, valid_aa);
  $setuphold (posedge CLKB &&& CSB, posedge AB[8], as, ah, valid_ab);
  $setuphold (posedge CLKB &&& CSB, negedge AB[8], as, ah, valid_ab);
  $setuphold (posedge CLKA &&& CSA, posedge AA[9], as, ah, valid_aa);
  $setuphold (posedge CLKA &&& CSA, negedge AA[9], as, ah, valid_aa);
  $setuphold (posedge CLKB &&& CSB, posedge AB[9], as, ah, valid_ab);
  $setuphold (posedge CLKB &&& CSB, negedge AB[9], as, ah, valid_ab);

  $setuphold (posedge CLKA &&& WEA, posedge DA[0], ds, dh, valid_da0);
  $setuphold (posedge CLKA &&& WEA, negedge DA[0], ds, dh, valid_da0);
  $setuphold (posedge CLKB &&& WEB, posedge DB[0], ds, dh, valid_db0);
  $setuphold (posedge CLKB &&& WEB, negedge DB[0], ds, dh, valid_db0);
 
  $setuphold (posedge CLKA &&& WEA, posedge BWEBA[0], bws, bwh, valid_bwa0);
  $setuphold (posedge CLKA &&& WEA, negedge BWEBA[0], bws, bwh, valid_bwa0);
  $setuphold (posedge CLKB &&& WEB, posedge BWEBB[0], bws, bwh, valid_bwb0);
  $setuphold (posedge CLKB &&& WEB, negedge BWEBB[0], bws, bwh, valid_bwb0);
  $setuphold (posedge CLKA &&& WEA, posedge DA[1], ds, dh, valid_da1);
  $setuphold (posedge CLKA &&& WEA, negedge DA[1], ds, dh, valid_da1);
  $setuphold (posedge CLKB &&& WEB, posedge DB[1], ds, dh, valid_db1);
  $setuphold (posedge CLKB &&& WEB, negedge DB[1], ds, dh, valid_db1);
 
  $setuphold (posedge CLKA &&& WEA, posedge BWEBA[1], bws, bwh, valid_bwa1);
  $setuphold (posedge CLKA &&& WEA, negedge BWEBA[1], bws, bwh, valid_bwa1);
  $setuphold (posedge CLKB &&& WEB, posedge BWEBB[1], bws, bwh, valid_bwb1);
  $setuphold (posedge CLKB &&& WEB, negedge BWEBB[1], bws, bwh, valid_bwb1);
  $setuphold (posedge CLKA &&& WEA, posedge DA[2], ds, dh, valid_da2);
  $setuphold (posedge CLKA &&& WEA, negedge DA[2], ds, dh, valid_da2);
  $setuphold (posedge CLKB &&& WEB, posedge DB[2], ds, dh, valid_db2);
  $setuphold (posedge CLKB &&& WEB, negedge DB[2], ds, dh, valid_db2);
 
  $setuphold (posedge CLKA &&& WEA, posedge BWEBA[2], bws, bwh, valid_bwa2);
  $setuphold (posedge CLKA &&& WEA, negedge BWEBA[2], bws, bwh, valid_bwa2);
  $setuphold (posedge CLKB &&& WEB, posedge BWEBB[2], bws, bwh, valid_bwb2);
  $setuphold (posedge CLKB &&& WEB, negedge BWEBB[2], bws, bwh, valid_bwb2);
  $setuphold (posedge CLKA &&& WEA, posedge DA[3], ds, dh, valid_da3);
  $setuphold (posedge CLKA &&& WEA, negedge DA[3], ds, dh, valid_da3);
  $setuphold (posedge CLKB &&& WEB, posedge DB[3], ds, dh, valid_db3);
  $setuphold (posedge CLKB &&& WEB, negedge DB[3], ds, dh, valid_db3);
 
  $setuphold (posedge CLKA &&& WEA, posedge BWEBA[3], bws, bwh, valid_bwa3);
  $setuphold (posedge CLKA &&& WEA, negedge BWEBA[3], bws, bwh, valid_bwa3);
  $setuphold (posedge CLKB &&& WEB, posedge BWEBB[3], bws, bwh, valid_bwb3);
  $setuphold (posedge CLKB &&& WEB, negedge BWEBB[3], bws, bwh, valid_bwb3);
  $setuphold (posedge CLKA &&& WEA, posedge DA[4], ds, dh, valid_da4);
  $setuphold (posedge CLKA &&& WEA, negedge DA[4], ds, dh, valid_da4);
  $setuphold (posedge CLKB &&& WEB, posedge DB[4], ds, dh, valid_db4);
  $setuphold (posedge CLKB &&& WEB, negedge DB[4], ds, dh, valid_db4);
 
  $setuphold (posedge CLKA &&& WEA, posedge BWEBA[4], bws, bwh, valid_bwa4);
  $setuphold (posedge CLKA &&& WEA, negedge BWEBA[4], bws, bwh, valid_bwa4);
  $setuphold (posedge CLKB &&& WEB, posedge BWEBB[4], bws, bwh, valid_bwb4);
  $setuphold (posedge CLKB &&& WEB, negedge BWEBB[4], bws, bwh, valid_bwb4);
  $setuphold (posedge CLKA &&& WEA, posedge DA[5], ds, dh, valid_da5);
  $setuphold (posedge CLKA &&& WEA, negedge DA[5], ds, dh, valid_da5);
  $setuphold (posedge CLKB &&& WEB, posedge DB[5], ds, dh, valid_db5);
  $setuphold (posedge CLKB &&& WEB, negedge DB[5], ds, dh, valid_db5);
 
  $setuphold (posedge CLKA &&& WEA, posedge BWEBA[5], bws, bwh, valid_bwa5);
  $setuphold (posedge CLKA &&& WEA, negedge BWEBA[5], bws, bwh, valid_bwa5);
  $setuphold (posedge CLKB &&& WEB, posedge BWEBB[5], bws, bwh, valid_bwb5);
  $setuphold (posedge CLKB &&& WEB, negedge BWEBB[5], bws, bwh, valid_bwb5);
  $setuphold (posedge CLKA &&& WEA, posedge DA[6], ds, dh, valid_da6);
  $setuphold (posedge CLKA &&& WEA, negedge DA[6], ds, dh, valid_da6);
  $setuphold (posedge CLKB &&& WEB, posedge DB[6], ds, dh, valid_db6);
  $setuphold (posedge CLKB &&& WEB, negedge DB[6], ds, dh, valid_db6);
 
  $setuphold (posedge CLKA &&& WEA, posedge BWEBA[6], bws, bwh, valid_bwa6);
  $setuphold (posedge CLKA &&& WEA, negedge BWEBA[6], bws, bwh, valid_bwa6);
  $setuphold (posedge CLKB &&& WEB, posedge BWEBB[6], bws, bwh, valid_bwb6);
  $setuphold (posedge CLKB &&& WEB, negedge BWEBB[6], bws, bwh, valid_bwb6);
  $setuphold (posedge CLKA &&& WEA, posedge DA[7], ds, dh, valid_da7);
  $setuphold (posedge CLKA &&& WEA, negedge DA[7], ds, dh, valid_da7);
  $setuphold (posedge CLKB &&& WEB, posedge DB[7], ds, dh, valid_db7);
  $setuphold (posedge CLKB &&& WEB, negedge DB[7], ds, dh, valid_db7);
 
  $setuphold (posedge CLKA &&& WEA, posedge BWEBA[7], bws, bwh, valid_bwa7);
  $setuphold (posedge CLKA &&& WEA, negedge BWEBA[7], bws, bwh, valid_bwa7);
  $setuphold (posedge CLKB &&& WEB, posedge BWEBB[7], bws, bwh, valid_bwb7);
  $setuphold (posedge CLKB &&& WEB, negedge BWEBB[7], bws, bwh, valid_bwb7);
  $setuphold (posedge CLKA &&& WEA, posedge DA[8], ds, dh, valid_da8);
  $setuphold (posedge CLKA &&& WEA, negedge DA[8], ds, dh, valid_da8);
  $setuphold (posedge CLKB &&& WEB, posedge DB[8], ds, dh, valid_db8);
  $setuphold (posedge CLKB &&& WEB, negedge DB[8], ds, dh, valid_db8);
 
  $setuphold (posedge CLKA &&& WEA, posedge BWEBA[8], bws, bwh, valid_bwa8);
  $setuphold (posedge CLKA &&& WEA, negedge BWEBA[8], bws, bwh, valid_bwa8);
  $setuphold (posedge CLKB &&& WEB, posedge BWEBB[8], bws, bwh, valid_bwb8);
  $setuphold (posedge CLKB &&& WEB, negedge BWEBB[8], bws, bwh, valid_bwb8);
  $setuphold (posedge CLKA &&& WEA, posedge DA[9], ds, dh, valid_da9);
  $setuphold (posedge CLKA &&& WEA, negedge DA[9], ds, dh, valid_da9);
  $setuphold (posedge CLKB &&& WEB, posedge DB[9], ds, dh, valid_db9);
  $setuphold (posedge CLKB &&& WEB, negedge DB[9], ds, dh, valid_db9);
 
  $setuphold (posedge CLKA &&& WEA, posedge BWEBA[9], bws, bwh, valid_bwa9);
  $setuphold (posedge CLKA &&& WEA, negedge BWEBA[9], bws, bwh, valid_bwa9);
  $setuphold (posedge CLKB &&& WEB, posedge BWEBB[9], bws, bwh, valid_bwb9);
  $setuphold (posedge CLKB &&& WEB, negedge BWEBB[9], bws, bwh, valid_bwb9);
  $setuphold (posedge CLKA &&& WEA, posedge DA[10], ds, dh, valid_da10);
  $setuphold (posedge CLKA &&& WEA, negedge DA[10], ds, dh, valid_da10);
  $setuphold (posedge CLKB &&& WEB, posedge DB[10], ds, dh, valid_db10);
  $setuphold (posedge CLKB &&& WEB, negedge DB[10], ds, dh, valid_db10);
 
  $setuphold (posedge CLKA &&& WEA, posedge BWEBA[10], bws, bwh, valid_bwa10);
  $setuphold (posedge CLKA &&& WEA, negedge BWEBA[10], bws, bwh, valid_bwa10);
  $setuphold (posedge CLKB &&& WEB, posedge BWEBB[10], bws, bwh, valid_bwb10);
  $setuphold (posedge CLKB &&& WEB, negedge BWEBB[10], bws, bwh, valid_bwb10);
  $setuphold (posedge CLKA &&& WEA, posedge DA[11], ds, dh, valid_da11);
  $setuphold (posedge CLKA &&& WEA, negedge DA[11], ds, dh, valid_da11);
  $setuphold (posedge CLKB &&& WEB, posedge DB[11], ds, dh, valid_db11);
  $setuphold (posedge CLKB &&& WEB, negedge DB[11], ds, dh, valid_db11);
 
  $setuphold (posedge CLKA &&& WEA, posedge BWEBA[11], bws, bwh, valid_bwa11);
  $setuphold (posedge CLKA &&& WEA, negedge BWEBA[11], bws, bwh, valid_bwa11);
  $setuphold (posedge CLKB &&& WEB, posedge BWEBB[11], bws, bwh, valid_bwb11);
  $setuphold (posedge CLKB &&& WEB, negedge BWEBB[11], bws, bwh, valid_bwb11);
  $setuphold (posedge CLKA &&& WEA, posedge DA[12], ds, dh, valid_da12);
  $setuphold (posedge CLKA &&& WEA, negedge DA[12], ds, dh, valid_da12);
  $setuphold (posedge CLKB &&& WEB, posedge DB[12], ds, dh, valid_db12);
  $setuphold (posedge CLKB &&& WEB, negedge DB[12], ds, dh, valid_db12);
 
  $setuphold (posedge CLKA &&& WEA, posedge BWEBA[12], bws, bwh, valid_bwa12);
  $setuphold (posedge CLKA &&& WEA, negedge BWEBA[12], bws, bwh, valid_bwa12);
  $setuphold (posedge CLKB &&& WEB, posedge BWEBB[12], bws, bwh, valid_bwb12);
  $setuphold (posedge CLKB &&& WEB, negedge BWEBB[12], bws, bwh, valid_bwb12);
  $setuphold (posedge CLKA &&& WEA, posedge DA[13], ds, dh, valid_da13);
  $setuphold (posedge CLKA &&& WEA, negedge DA[13], ds, dh, valid_da13);
  $setuphold (posedge CLKB &&& WEB, posedge DB[13], ds, dh, valid_db13);
  $setuphold (posedge CLKB &&& WEB, negedge DB[13], ds, dh, valid_db13);
 
  $setuphold (posedge CLKA &&& WEA, posedge BWEBA[13], bws, bwh, valid_bwa13);
  $setuphold (posedge CLKA &&& WEA, negedge BWEBA[13], bws, bwh, valid_bwa13);
  $setuphold (posedge CLKB &&& WEB, posedge BWEBB[13], bws, bwh, valid_bwb13);
  $setuphold (posedge CLKB &&& WEB, negedge BWEBB[13], bws, bwh, valid_bwb13);
  $setuphold (posedge CLKA &&& WEA, posedge DA[14], ds, dh, valid_da14);
  $setuphold (posedge CLKA &&& WEA, negedge DA[14], ds, dh, valid_da14);
  $setuphold (posedge CLKB &&& WEB, posedge DB[14], ds, dh, valid_db14);
  $setuphold (posedge CLKB &&& WEB, negedge DB[14], ds, dh, valid_db14);
 
  $setuphold (posedge CLKA &&& WEA, posedge BWEBA[14], bws, bwh, valid_bwa14);
  $setuphold (posedge CLKA &&& WEA, negedge BWEBA[14], bws, bwh, valid_bwa14);
  $setuphold (posedge CLKB &&& WEB, posedge BWEBB[14], bws, bwh, valid_bwb14);
  $setuphold (posedge CLKB &&& WEB, negedge BWEBB[14], bws, bwh, valid_bwb14);
  $setuphold (posedge CLKA &&& WEA, posedge DA[15], ds, dh, valid_da15);
  $setuphold (posedge CLKA &&& WEA, negedge DA[15], ds, dh, valid_da15);
  $setuphold (posedge CLKB &&& WEB, posedge DB[15], ds, dh, valid_db15);
  $setuphold (posedge CLKB &&& WEB, negedge DB[15], ds, dh, valid_db15);
 
  $setuphold (posedge CLKA &&& WEA, posedge BWEBA[15], bws, bwh, valid_bwa15);
  $setuphold (posedge CLKA &&& WEA, negedge BWEBA[15], bws, bwh, valid_bwa15);
  $setuphold (posedge CLKB &&& WEB, posedge BWEBB[15], bws, bwh, valid_bwb15);
  $setuphold (posedge CLKB &&& WEB, negedge BWEBB[15], bws, bwh, valid_bwb15);
  $setuphold (posedge CLKA &&& WEA, posedge DA[16], ds, dh, valid_da16);
  $setuphold (posedge CLKA &&& WEA, negedge DA[16], ds, dh, valid_da16);
  $setuphold (posedge CLKB &&& WEB, posedge DB[16], ds, dh, valid_db16);
  $setuphold (posedge CLKB &&& WEB, negedge DB[16], ds, dh, valid_db16);
 
  $setuphold (posedge CLKA &&& WEA, posedge BWEBA[16], bws, bwh, valid_bwa16);
  $setuphold (posedge CLKA &&& WEA, negedge BWEBA[16], bws, bwh, valid_bwa16);
  $setuphold (posedge CLKB &&& WEB, posedge BWEBB[16], bws, bwh, valid_bwb16);
  $setuphold (posedge CLKB &&& WEB, negedge BWEBB[16], bws, bwh, valid_bwb16);
  $setuphold (posedge CLKA &&& WEA, posedge DA[17], ds, dh, valid_da17);
  $setuphold (posedge CLKA &&& WEA, negedge DA[17], ds, dh, valid_da17);
  $setuphold (posedge CLKB &&& WEB, posedge DB[17], ds, dh, valid_db17);
  $setuphold (posedge CLKB &&& WEB, negedge DB[17], ds, dh, valid_db17);
 
  $setuphold (posedge CLKA &&& WEA, posedge BWEBA[17], bws, bwh, valid_bwa17);
  $setuphold (posedge CLKA &&& WEA, negedge BWEBA[17], bws, bwh, valid_bwa17);
  $setuphold (posedge CLKB &&& WEB, posedge BWEBB[17], bws, bwh, valid_bwb17);
  $setuphold (posedge CLKB &&& WEB, negedge BWEBB[17], bws, bwh, valid_bwb17);
  $setuphold (posedge CLKA &&& WEA, posedge DA[18], ds, dh, valid_da18);
  $setuphold (posedge CLKA &&& WEA, negedge DA[18], ds, dh, valid_da18);
  $setuphold (posedge CLKB &&& WEB, posedge DB[18], ds, dh, valid_db18);
  $setuphold (posedge CLKB &&& WEB, negedge DB[18], ds, dh, valid_db18);
 
  $setuphold (posedge CLKA &&& WEA, posedge BWEBA[18], bws, bwh, valid_bwa18);
  $setuphold (posedge CLKA &&& WEA, negedge BWEBA[18], bws, bwh, valid_bwa18);
  $setuphold (posedge CLKB &&& WEB, posedge BWEBB[18], bws, bwh, valid_bwb18);
  $setuphold (posedge CLKB &&& WEB, negedge BWEBB[18], bws, bwh, valid_bwb18);
  $setuphold (posedge CLKA &&& WEA, posedge DA[19], ds, dh, valid_da19);
  $setuphold (posedge CLKA &&& WEA, negedge DA[19], ds, dh, valid_da19);
  $setuphold (posedge CLKB &&& WEB, posedge DB[19], ds, dh, valid_db19);
  $setuphold (posedge CLKB &&& WEB, negedge DB[19], ds, dh, valid_db19);
 
  $setuphold (posedge CLKA &&& WEA, posedge BWEBA[19], bws, bwh, valid_bwa19);
  $setuphold (posedge CLKA &&& WEA, negedge BWEBA[19], bws, bwh, valid_bwa19);
  $setuphold (posedge CLKB &&& WEB, posedge BWEBB[19], bws, bwh, valid_bwb19);
  $setuphold (posedge CLKB &&& WEB, negedge BWEBB[19], bws, bwh, valid_bwb19);
  $setuphold (posedge CLKA &&& WEA, posedge DA[20], ds, dh, valid_da20);
  $setuphold (posedge CLKA &&& WEA, negedge DA[20], ds, dh, valid_da20);
  $setuphold (posedge CLKB &&& WEB, posedge DB[20], ds, dh, valid_db20);
  $setuphold (posedge CLKB &&& WEB, negedge DB[20], ds, dh, valid_db20);
 
  $setuphold (posedge CLKA &&& WEA, posedge BWEBA[20], bws, bwh, valid_bwa20);
  $setuphold (posedge CLKA &&& WEA, negedge BWEBA[20], bws, bwh, valid_bwa20);
  $setuphold (posedge CLKB &&& WEB, posedge BWEBB[20], bws, bwh, valid_bwb20);
  $setuphold (posedge CLKB &&& WEB, negedge BWEBB[20], bws, bwh, valid_bwb20);
  $setuphold (posedge CLKA &&& WEA, posedge DA[21], ds, dh, valid_da21);
  $setuphold (posedge CLKA &&& WEA, negedge DA[21], ds, dh, valid_da21);
  $setuphold (posedge CLKB &&& WEB, posedge DB[21], ds, dh, valid_db21);
  $setuphold (posedge CLKB &&& WEB, negedge DB[21], ds, dh, valid_db21);
 
  $setuphold (posedge CLKA &&& WEA, posedge BWEBA[21], bws, bwh, valid_bwa21);
  $setuphold (posedge CLKA &&& WEA, negedge BWEBA[21], bws, bwh, valid_bwa21);
  $setuphold (posedge CLKB &&& WEB, posedge BWEBB[21], bws, bwh, valid_bwb21);
  $setuphold (posedge CLKB &&& WEB, negedge BWEBB[21], bws, bwh, valid_bwb21);
  $setuphold (posedge CLKA &&& WEA, posedge DA[22], ds, dh, valid_da22);
  $setuphold (posedge CLKA &&& WEA, negedge DA[22], ds, dh, valid_da22);
  $setuphold (posedge CLKB &&& WEB, posedge DB[22], ds, dh, valid_db22);
  $setuphold (posedge CLKB &&& WEB, negedge DB[22], ds, dh, valid_db22);
 
  $setuphold (posedge CLKA &&& WEA, posedge BWEBA[22], bws, bwh, valid_bwa22);
  $setuphold (posedge CLKA &&& WEA, negedge BWEBA[22], bws, bwh, valid_bwa22);
  $setuphold (posedge CLKB &&& WEB, posedge BWEBB[22], bws, bwh, valid_bwb22);
  $setuphold (posedge CLKB &&& WEB, negedge BWEBB[22], bws, bwh, valid_bwb22);
  $setuphold (posedge CLKA &&& WEA, posedge DA[23], ds, dh, valid_da23);
  $setuphold (posedge CLKA &&& WEA, negedge DA[23], ds, dh, valid_da23);
  $setuphold (posedge CLKB &&& WEB, posedge DB[23], ds, dh, valid_db23);
  $setuphold (posedge CLKB &&& WEB, negedge DB[23], ds, dh, valid_db23);
 
  $setuphold (posedge CLKA &&& WEA, posedge BWEBA[23], bws, bwh, valid_bwa23);
  $setuphold (posedge CLKA &&& WEA, negedge BWEBA[23], bws, bwh, valid_bwa23);
  $setuphold (posedge CLKB &&& WEB, posedge BWEBB[23], bws, bwh, valid_bwb23);
  $setuphold (posedge CLKB &&& WEB, negedge BWEBB[23], bws, bwh, valid_bwb23);
  $setuphold (posedge CLKA &&& WEA, posedge DA[24], ds, dh, valid_da24);
  $setuphold (posedge CLKA &&& WEA, negedge DA[24], ds, dh, valid_da24);
  $setuphold (posedge CLKB &&& WEB, posedge DB[24], ds, dh, valid_db24);
  $setuphold (posedge CLKB &&& WEB, negedge DB[24], ds, dh, valid_db24);
 
  $setuphold (posedge CLKA &&& WEA, posedge BWEBA[24], bws, bwh, valid_bwa24);
  $setuphold (posedge CLKA &&& WEA, negedge BWEBA[24], bws, bwh, valid_bwa24);
  $setuphold (posedge CLKB &&& WEB, posedge BWEBB[24], bws, bwh, valid_bwb24);
  $setuphold (posedge CLKB &&& WEB, negedge BWEBB[24], bws, bwh, valid_bwb24);
  $setuphold (posedge CLKA &&& WEA, posedge DA[25], ds, dh, valid_da25);
  $setuphold (posedge CLKA &&& WEA, negedge DA[25], ds, dh, valid_da25);
  $setuphold (posedge CLKB &&& WEB, posedge DB[25], ds, dh, valid_db25);
  $setuphold (posedge CLKB &&& WEB, negedge DB[25], ds, dh, valid_db25);
 
  $setuphold (posedge CLKA &&& WEA, posedge BWEBA[25], bws, bwh, valid_bwa25);
  $setuphold (posedge CLKA &&& WEA, negedge BWEBA[25], bws, bwh, valid_bwa25);
  $setuphold (posedge CLKB &&& WEB, posedge BWEBB[25], bws, bwh, valid_bwb25);
  $setuphold (posedge CLKB &&& WEB, negedge BWEBB[25], bws, bwh, valid_bwb25);
  $setuphold (posedge CLKA &&& WEA, posedge DA[26], ds, dh, valid_da26);
  $setuphold (posedge CLKA &&& WEA, negedge DA[26], ds, dh, valid_da26);
  $setuphold (posedge CLKB &&& WEB, posedge DB[26], ds, dh, valid_db26);
  $setuphold (posedge CLKB &&& WEB, negedge DB[26], ds, dh, valid_db26);
 
  $setuphold (posedge CLKA &&& WEA, posedge BWEBA[26], bws, bwh, valid_bwa26);
  $setuphold (posedge CLKA &&& WEA, negedge BWEBA[26], bws, bwh, valid_bwa26);
  $setuphold (posedge CLKB &&& WEB, posedge BWEBB[26], bws, bwh, valid_bwb26);
  $setuphold (posedge CLKB &&& WEB, negedge BWEBB[26], bws, bwh, valid_bwb26);
  $setuphold (posedge CLKA &&& WEA, posedge DA[27], ds, dh, valid_da27);
  $setuphold (posedge CLKA &&& WEA, negedge DA[27], ds, dh, valid_da27);
  $setuphold (posedge CLKB &&& WEB, posedge DB[27], ds, dh, valid_db27);
  $setuphold (posedge CLKB &&& WEB, negedge DB[27], ds, dh, valid_db27);
 
  $setuphold (posedge CLKA &&& WEA, posedge BWEBA[27], bws, bwh, valid_bwa27);
  $setuphold (posedge CLKA &&& WEA, negedge BWEBA[27], bws, bwh, valid_bwa27);
  $setuphold (posedge CLKB &&& WEB, posedge BWEBB[27], bws, bwh, valid_bwb27);
  $setuphold (posedge CLKB &&& WEB, negedge BWEBB[27], bws, bwh, valid_bwb27);
  $setuphold (posedge CLKA &&& WEA, posedge DA[28], ds, dh, valid_da28);
  $setuphold (posedge CLKA &&& WEA, negedge DA[28], ds, dh, valid_da28);
  $setuphold (posedge CLKB &&& WEB, posedge DB[28], ds, dh, valid_db28);
  $setuphold (posedge CLKB &&& WEB, negedge DB[28], ds, dh, valid_db28);
 
  $setuphold (posedge CLKA &&& WEA, posedge BWEBA[28], bws, bwh, valid_bwa28);
  $setuphold (posedge CLKA &&& WEA, negedge BWEBA[28], bws, bwh, valid_bwa28);
  $setuphold (posedge CLKB &&& WEB, posedge BWEBB[28], bws, bwh, valid_bwb28);
  $setuphold (posedge CLKB &&& WEB, negedge BWEBB[28], bws, bwh, valid_bwb28);
  $setuphold (posedge CLKA &&& WEA, posedge DA[29], ds, dh, valid_da29);
  $setuphold (posedge CLKA &&& WEA, negedge DA[29], ds, dh, valid_da29);
  $setuphold (posedge CLKB &&& WEB, posedge DB[29], ds, dh, valid_db29);
  $setuphold (posedge CLKB &&& WEB, negedge DB[29], ds, dh, valid_db29);
 
  $setuphold (posedge CLKA &&& WEA, posedge BWEBA[29], bws, bwh, valid_bwa29);
  $setuphold (posedge CLKA &&& WEA, negedge BWEBA[29], bws, bwh, valid_bwa29);
  $setuphold (posedge CLKB &&& WEB, posedge BWEBB[29], bws, bwh, valid_bwb29);
  $setuphold (posedge CLKB &&& WEB, negedge BWEBB[29], bws, bwh, valid_bwb29);
  $setuphold (posedge CLKA &&& WEA, posedge DA[30], ds, dh, valid_da30);
  $setuphold (posedge CLKA &&& WEA, negedge DA[30], ds, dh, valid_da30);
  $setuphold (posedge CLKB &&& WEB, posedge DB[30], ds, dh, valid_db30);
  $setuphold (posedge CLKB &&& WEB, negedge DB[30], ds, dh, valid_db30);
 
  $setuphold (posedge CLKA &&& WEA, posedge BWEBA[30], bws, bwh, valid_bwa30);
  $setuphold (posedge CLKA &&& WEA, negedge BWEBA[30], bws, bwh, valid_bwa30);
  $setuphold (posedge CLKB &&& WEB, posedge BWEBB[30], bws, bwh, valid_bwb30);
  $setuphold (posedge CLKB &&& WEB, negedge BWEBB[30], bws, bwh, valid_bwb30);
  $setuphold (posedge CLKA &&& WEA, posedge DA[31], ds, dh, valid_da31);
  $setuphold (posedge CLKA &&& WEA, negedge DA[31], ds, dh, valid_da31);
  $setuphold (posedge CLKB &&& WEB, posedge DB[31], ds, dh, valid_db31);
  $setuphold (posedge CLKB &&& WEB, negedge DB[31], ds, dh, valid_db31);
 
  $setuphold (posedge CLKA &&& WEA, posedge BWEBA[31], bws, bwh, valid_bwa31);
  $setuphold (posedge CLKA &&& WEA, negedge BWEBA[31], bws, bwh, valid_bwa31);
  $setuphold (posedge CLKB &&& WEB, posedge BWEBB[31], bws, bwh, valid_bwb31);
  $setuphold (posedge CLKB &&& WEB, negedge BWEBB[31], bws, bwh, valid_bwb31);
  $setuphold (posedge CLKA &&& CSA, posedge WEBA, wes, weh, valid_wea);
  $setuphold (posedge CLKA &&& CSA, negedge WEBA, wes, weh, valid_wea);
  $setuphold (posedge CLKB &&& CSB, posedge WEBB, wes, weh, valid_web);
  $setuphold (posedge CLKB &&& CSB, negedge WEBB, wes, weh, valid_web);

  $setuphold (posedge CLKA, posedge CEBA, css, csh, valid_cea);
  $setuphold (posedge CLKA, negedge CEBA, css, csh, valid_cea);
  $setuphold (posedge CLKB, posedge CEBB, css, csh, valid_ceb);
  $setuphold (posedge CLKB, negedge CEBB, css, csh, valid_ceb);

  $width (negedge CLKA, ckpl, 0, valid_cka);
  $width (posedge CLKA, ckph, 0, valid_cka);
  $width (negedge CLKB, ckpl, 0, valid_ckb);
  $width (posedge CLKB, ckph, 0, valid_ckb);
  $period (posedge CLKA, ckp, valid_cka);
  $period (negedge CLKA, ckp, valid_cka);
  $period (posedge CLKB, ckp, valid_ckb);
  $period (negedge CLKB, ckp, valid_ckb);

if (!CEBA & WEBA) (posedge CLKA => (QA[0] : 1'bx)) = (ckq,ckq,ckqh,ckq,ckqh,ckq);
if (!CEBB & WEBB) (posedge CLKB => (QB[0] : 1'bx)) = (ckq,ckq,ckqh,ckq,ckqh,ckq);
if (!CEBA & WEBA) (posedge CLKA => (QA[1] : 1'bx)) = (ckq,ckq,ckqh,ckq,ckqh,ckq);
if (!CEBB & WEBB) (posedge CLKB => (QB[1] : 1'bx)) = (ckq,ckq,ckqh,ckq,ckqh,ckq);
if (!CEBA & WEBA) (posedge CLKA => (QA[2] : 1'bx)) = (ckq,ckq,ckqh,ckq,ckqh,ckq);
if (!CEBB & WEBB) (posedge CLKB => (QB[2] : 1'bx)) = (ckq,ckq,ckqh,ckq,ckqh,ckq);
if (!CEBA & WEBA) (posedge CLKA => (QA[3] : 1'bx)) = (ckq,ckq,ckqh,ckq,ckqh,ckq);
if (!CEBB & WEBB) (posedge CLKB => (QB[3] : 1'bx)) = (ckq,ckq,ckqh,ckq,ckqh,ckq);
if (!CEBA & WEBA) (posedge CLKA => (QA[4] : 1'bx)) = (ckq,ckq,ckqh,ckq,ckqh,ckq);
if (!CEBB & WEBB) (posedge CLKB => (QB[4] : 1'bx)) = (ckq,ckq,ckqh,ckq,ckqh,ckq);
if (!CEBA & WEBA) (posedge CLKA => (QA[5] : 1'bx)) = (ckq,ckq,ckqh,ckq,ckqh,ckq);
if (!CEBB & WEBB) (posedge CLKB => (QB[5] : 1'bx)) = (ckq,ckq,ckqh,ckq,ckqh,ckq);
if (!CEBA & WEBA) (posedge CLKA => (QA[6] : 1'bx)) = (ckq,ckq,ckqh,ckq,ckqh,ckq);
if (!CEBB & WEBB) (posedge CLKB => (QB[6] : 1'bx)) = (ckq,ckq,ckqh,ckq,ckqh,ckq);
if (!CEBA & WEBA) (posedge CLKA => (QA[7] : 1'bx)) = (ckq,ckq,ckqh,ckq,ckqh,ckq);
if (!CEBB & WEBB) (posedge CLKB => (QB[7] : 1'bx)) = (ckq,ckq,ckqh,ckq,ckqh,ckq);
if (!CEBA & WEBA) (posedge CLKA => (QA[8] : 1'bx)) = (ckq,ckq,ckqh,ckq,ckqh,ckq);
if (!CEBB & WEBB) (posedge CLKB => (QB[8] : 1'bx)) = (ckq,ckq,ckqh,ckq,ckqh,ckq);
if (!CEBA & WEBA) (posedge CLKA => (QA[9] : 1'bx)) = (ckq,ckq,ckqh,ckq,ckqh,ckq);
if (!CEBB & WEBB) (posedge CLKB => (QB[9] : 1'bx)) = (ckq,ckq,ckqh,ckq,ckqh,ckq);
if (!CEBA & WEBA) (posedge CLKA => (QA[10] : 1'bx)) = (ckq,ckq,ckqh,ckq,ckqh,ckq);
if (!CEBB & WEBB) (posedge CLKB => (QB[10] : 1'bx)) = (ckq,ckq,ckqh,ckq,ckqh,ckq);
if (!CEBA & WEBA) (posedge CLKA => (QA[11] : 1'bx)) = (ckq,ckq,ckqh,ckq,ckqh,ckq);
if (!CEBB & WEBB) (posedge CLKB => (QB[11] : 1'bx)) = (ckq,ckq,ckqh,ckq,ckqh,ckq);
if (!CEBA & WEBA) (posedge CLKA => (QA[12] : 1'bx)) = (ckq,ckq,ckqh,ckq,ckqh,ckq);
if (!CEBB & WEBB) (posedge CLKB => (QB[12] : 1'bx)) = (ckq,ckq,ckqh,ckq,ckqh,ckq);
if (!CEBA & WEBA) (posedge CLKA => (QA[13] : 1'bx)) = (ckq,ckq,ckqh,ckq,ckqh,ckq);
if (!CEBB & WEBB) (posedge CLKB => (QB[13] : 1'bx)) = (ckq,ckq,ckqh,ckq,ckqh,ckq);
if (!CEBA & WEBA) (posedge CLKA => (QA[14] : 1'bx)) = (ckq,ckq,ckqh,ckq,ckqh,ckq);
if (!CEBB & WEBB) (posedge CLKB => (QB[14] : 1'bx)) = (ckq,ckq,ckqh,ckq,ckqh,ckq);
if (!CEBA & WEBA) (posedge CLKA => (QA[15] : 1'bx)) = (ckq,ckq,ckqh,ckq,ckqh,ckq);
if (!CEBB & WEBB) (posedge CLKB => (QB[15] : 1'bx)) = (ckq,ckq,ckqh,ckq,ckqh,ckq);
if (!CEBA & WEBA) (posedge CLKA => (QA[16] : 1'bx)) = (ckq,ckq,ckqh,ckq,ckqh,ckq);
if (!CEBB & WEBB) (posedge CLKB => (QB[16] : 1'bx)) = (ckq,ckq,ckqh,ckq,ckqh,ckq);
if (!CEBA & WEBA) (posedge CLKA => (QA[17] : 1'bx)) = (ckq,ckq,ckqh,ckq,ckqh,ckq);
if (!CEBB & WEBB) (posedge CLKB => (QB[17] : 1'bx)) = (ckq,ckq,ckqh,ckq,ckqh,ckq);
if (!CEBA & WEBA) (posedge CLKA => (QA[18] : 1'bx)) = (ckq,ckq,ckqh,ckq,ckqh,ckq);
if (!CEBB & WEBB) (posedge CLKB => (QB[18] : 1'bx)) = (ckq,ckq,ckqh,ckq,ckqh,ckq);
if (!CEBA & WEBA) (posedge CLKA => (QA[19] : 1'bx)) = (ckq,ckq,ckqh,ckq,ckqh,ckq);
if (!CEBB & WEBB) (posedge CLKB => (QB[19] : 1'bx)) = (ckq,ckq,ckqh,ckq,ckqh,ckq);
if (!CEBA & WEBA) (posedge CLKA => (QA[20] : 1'bx)) = (ckq,ckq,ckqh,ckq,ckqh,ckq);
if (!CEBB & WEBB) (posedge CLKB => (QB[20] : 1'bx)) = (ckq,ckq,ckqh,ckq,ckqh,ckq);
if (!CEBA & WEBA) (posedge CLKA => (QA[21] : 1'bx)) = (ckq,ckq,ckqh,ckq,ckqh,ckq);
if (!CEBB & WEBB) (posedge CLKB => (QB[21] : 1'bx)) = (ckq,ckq,ckqh,ckq,ckqh,ckq);
if (!CEBA & WEBA) (posedge CLKA => (QA[22] : 1'bx)) = (ckq,ckq,ckqh,ckq,ckqh,ckq);
if (!CEBB & WEBB) (posedge CLKB => (QB[22] : 1'bx)) = (ckq,ckq,ckqh,ckq,ckqh,ckq);
if (!CEBA & WEBA) (posedge CLKA => (QA[23] : 1'bx)) = (ckq,ckq,ckqh,ckq,ckqh,ckq);
if (!CEBB & WEBB) (posedge CLKB => (QB[23] : 1'bx)) = (ckq,ckq,ckqh,ckq,ckqh,ckq);
if (!CEBA & WEBA) (posedge CLKA => (QA[24] : 1'bx)) = (ckq,ckq,ckqh,ckq,ckqh,ckq);
if (!CEBB & WEBB) (posedge CLKB => (QB[24] : 1'bx)) = (ckq,ckq,ckqh,ckq,ckqh,ckq);
if (!CEBA & WEBA) (posedge CLKA => (QA[25] : 1'bx)) = (ckq,ckq,ckqh,ckq,ckqh,ckq);
if (!CEBB & WEBB) (posedge CLKB => (QB[25] : 1'bx)) = (ckq,ckq,ckqh,ckq,ckqh,ckq);
if (!CEBA & WEBA) (posedge CLKA => (QA[26] : 1'bx)) = (ckq,ckq,ckqh,ckq,ckqh,ckq);
if (!CEBB & WEBB) (posedge CLKB => (QB[26] : 1'bx)) = (ckq,ckq,ckqh,ckq,ckqh,ckq);
if (!CEBA & WEBA) (posedge CLKA => (QA[27] : 1'bx)) = (ckq,ckq,ckqh,ckq,ckqh,ckq);
if (!CEBB & WEBB) (posedge CLKB => (QB[27] : 1'bx)) = (ckq,ckq,ckqh,ckq,ckqh,ckq);
if (!CEBA & WEBA) (posedge CLKA => (QA[28] : 1'bx)) = (ckq,ckq,ckqh,ckq,ckqh,ckq);
if (!CEBB & WEBB) (posedge CLKB => (QB[28] : 1'bx)) = (ckq,ckq,ckqh,ckq,ckqh,ckq);
if (!CEBA & WEBA) (posedge CLKA => (QA[29] : 1'bx)) = (ckq,ckq,ckqh,ckq,ckqh,ckq);
if (!CEBB & WEBB) (posedge CLKB => (QB[29] : 1'bx)) = (ckq,ckq,ckqh,ckq,ckqh,ckq);
if (!CEBA & WEBA) (posedge CLKA => (QA[30] : 1'bx)) = (ckq,ckq,ckqh,ckq,ckqh,ckq);
if (!CEBB & WEBB) (posedge CLKB => (QB[30] : 1'bx)) = (ckq,ckq,ckqh,ckq,ckqh,ckq);
if (!CEBA & WEBA) (posedge CLKA => (QA[31] : 1'bx)) = (ckq,ckq,ckqh,ckq,ckqh,ckq);
if (!CEBB & WEBB) (posedge CLKB => (QB[31] : 1'bx)) = (ckq,ckq,ckqh,ckq,ckqh,ckq);
endspecify
`endif

initial
begin
  assign EN = 1;
  RDA = 1;
  RDB = 1;
  ABL = 1'b1;
  AAL = {M{1'b0}};
  BWEBAL = {N{1'b1}};
  BWEBBL = {N{1'b1}};
end

`ifdef TSMC_INITIALIZE_MEM
initial
   begin 
     #0.01  $readmemh(cdeFileInit, MX.mem, 0, W-1);
   end
`endif //  `ifdef TSMC_INITIALIZE_MEM
   
`ifdef TSMC_INITIALIZE_FAULT
initial
   begin
     $readmemh(cdeFileFault, MX.mem_fault, 0, W-1);
   end
`endif //  `ifdef TSMC_INITIALIZE_FAULT

always @(posedge bCLKA) CLKA_time = $realtime;
always @(posedge bCLKB) CLKB_time = $realtime;

always @(bCLKA)
begin
  if (bCLKA === 1'bx)
  begin
     if( MES_ALL=="ON" && $realtime != 0) $display("\nWarning %m : CLKA Unknown at %t. >>", $realtime);
     #0;
     AAL <= {M{1'bx}};
     BWEBAL <= {N{1'b0}};
`ifdef UNIT_DELAY
     bQA <= #(`SRAM_DELAY + 0.001) {N{1'bx}};
`else
     bQA <= # 0.001 {N{1'bx}}; 
`endif
  end
  else if (bCLKA === 1'b1 && RCLKA === 1'b0)
  begin
     if (bCEBA === 1'bx)
       begin
	  if( MES_ALL=="ON" && $realtime != 0) $display("\nWarning %m CEBA Unknown at %t. >>", $realtime);
          #0;
	  AAL <= {M{1'bx}};
	  BWEBAL <= {N{1'b0}};
          bQA <= #0.001 {N{1'bx}};
       end
     else if (bWEBA === 1'bx && bCEBA === 1'b0)
       begin
	  if( MES_ALL=="ON" && $realtime != 0) $display("\nWarning %m WEBA Unknown at %t. >>", $realtime);
	  #0;
          AAL <= {M{1'bx}};
	  BWEBAL <= {N{1'b0}};
	  bQA <= #0.001 {N{1'bx}};
`ifdef UNIT_DELAY
          bQB <= #(`SRAM_DELAY + 0.001) {N{1'bx}};
`else
          bQB <= # 0.001 {N{1'bx}}; 
`endif
       end
     else 
   begin                                
      WEBAL = bWEBA;
      CEBAL = bCEBA;
     if (^bAA === 1'bx && bWEBA === 1'b0 && bCEBA === 1'b0)
       begin
	  if( MES_ALL=="ON" && $realtime != 0) $display("\nWarning %m WRITE AA Unknown at %t. >>", $realtime);
	  #0;
	  AAL <= {M{1'bx}};
	  BWEBAL <= {N{1'b0}};
       end
     else if (^bAA === 1'bx && bWEBA === 1'b1 && bCEBA === 1'b0)
       begin
	  if( MES_ALL=="ON" && $realtime != 0) $display("\nWarning %m READ AA Unknown at %t. >>", $realtime);
	  #0;
	  AAL <= {M{1'bx}};
	  BWEBAL <= {N{1'b0}};
	  bQA <= #0.001 {N{1'bx}};
       end
      else
      begin
      if (!bCEBA)
      begin
         AAL = bAA;
         DAL = bDA;
         if (bWEBA === 1'b1) RDA = #0 ~RDA;
         if (bWEBA !== 1'b1)
         begin
            for (i = 0; i < N; i = i + 1)
            begin
               if (!bBWEBA[i] && !bWEBA)
               begin
                  bBWEBAL[i] = 1'b0;
                  BWEBAL[i] = 1'b0;
               end
               if (bBWEBA[i] && !bWEBA)
               begin
                  bBWEBAL[i] = 1'b1;
               end
               if (((bBWEBA[i] || bBWEBA[i]===1'bx) && bWEBA===1'bx) || (!bWEBA && bBWEBA[i] ===1'bx))
               begin
                  bBWEBAL[i] = 1'bx;
                  BWEBAL[i] = 1'b0;
                  DAL[i] = 1'bx;
               end
            end
         end
`ifdef UNIT_DELAY
	 #0;
	 if ((bAA == bAB) && (WEA && WEB) && CLK_same) // A-write and B-write ,same-addr
	   begin
              if( MES_ALL=="ON" && $realtime != 0)
		 $display("\nWarning %m WRITE/WRITE contention. If BWEB enables, Write data set to unknown at %t. >>", $realtime);
	      for (i=0; i<N; i=i+1)
		begin
                   if(!bBWEBAL[i] && !bBWEBBL[i])       DAL[i] = 1'bx;
		end
	   end
`endif
      end
    end
   end
end// end always @(posedge bCLKA)
  RCLKA = bCLKA;
end

always @(bCLKB)
begin
 if (bCLKB === 1'bx)
 begin
     if( MES_ALL=="ON" && $realtime != 0) $display("\nWarning %m CLKB Unknown at %t. >>", $realtime);
     #0;
     ABL <= {M{1'bx}};
     BWEBBL <= {N{1'b0}};
`ifdef UNIT_DELAY
     bQB <= #(`SRAM_DELAY + 0.001) {N{1'bx}};
`else
     bQB <= #0.001 {N{1'bx}}; 
`endif
 end
 else if (bCLKB === 1'b1 && RCLKB === 1'b0)
 begin
     if (bCEBB === 1'bx)
       begin
	  if( MES_ALL=="ON" && $realtime != 0) $display("\nWarning %m CEBB Unknown at %t. >>", $realtime);
	  #0;
	  ABL <= {M{1'bx}};
	  BWEBBL <= {N{1'b0}};
	  bQB <= #0.001 {N{1'bx}};
       end
     else if (bWEBB === 1'bx && bCEBB === 1'b0)
       begin
	  if( MES_ALL=="ON" && $realtime != 0) $display("\nWarning %m WEBB Unknown at %t. >>", $realtime);
	  #0;
	  ABL <= {M{1'bx}};
	  BWEBBL <= {N{1'b0}};
`ifdef UNIT_DELAY
          bQA <= #(`SRAM_DELAY + 0.001) {N{1'bx}};
`else
          bQA <= # 0.001 {N{1'bx}}; 
`endif
	  bQB <= #0.001 {N{1'bx}};
       end
     else
   begin                               
      WEBBL = bWEBB;
      CEBBL = bCEBB;

     if (^bAB === 1'bx && bWEBB === 1'b0 && bCEBB === 1'b0)
       begin
	  if( MES_ALL=="ON" && $realtime != 0) $display("\nWarning %m WRITE AB Unknown at %t. >>", $realtime);
	  #0;
	  ABL <= {M{1'bx}};
	  BWEBBL <= {N{1'b0}};
       end

     else if (^bAB === 1'bx && bWEBB === 1'b1 && bCEBB === 1'b0)
       begin
	  if( MES_ALL=="ON" && $realtime != 0) $display("\nWarning %m READ AB Unknown at %t. >>", $realtime);
	  #0;
	  ABL <= {M{1'bx}};
	  BWEBBL <= {N{1'b0}};
	  bQB <= #0.001 {N{1'bx}};
       end
       else
       begin
      if (!bCEBB)
      begin
         ABL = bAB;
         DBL = bDB;
         if (bWEBB === 1'b1) RDB = #0 ~RDB;
         if (bWEBB !== 1'b1)
         begin
            for (i = 0; i < N; i = i + 1)
            begin
               if (!bBWEBB[i] && !bWEBB) 
               begin
                  bBWEBBL[i] = 1'b0;
                  BWEBBL[i] = 1'b0;
               end
               if (bBWEBB[i] && !bWEBB)
               begin
                  bBWEBBL[i] = 1'b1;
               end
               if (((bBWEBB[i] || bBWEBB[i]===1'bx) && bWEBB===1'bx) || (!bWEBB && bBWEBB[i] ===1'bx))
               begin
                  bBWEBBL[i] = 1'bx;
                  BWEBBL[i] = 1'b0;
                  DBL[i] = 1'bx;
               end
            end
         end
`ifdef UNIT_DELAY
	 #0;
	 if ((bAB == bAA) && (WEA && WEB) && CLK_same) // A-write and B-write ,same-addr
	   begin
              if( MES_ALL=="ON" && $realtime != 0)
		 $display("\nWarning %m WRITE/WRITE contention. If BWEB enables, Write data set to unknown at %t. >>", $realtime);
	      for (i=0; i<N; i=i+1)
		begin
		   if(!bBWEBA[i] && !bBWEBB[i])       DBL[i] = 1'bx;
		end
	   end
`endif
      end
    end
   end                       
 end
 RCLKB = bCLKB;
end



`ifdef UNIT_DELAY
always @(RDA or QAL)
  begin
     if (!CEBAL && WEBAL)
       begin
	  if ((bAA == bAB) && (!WEA && WEB) && CLK_same) // A-read and B-write ,same-addr
	    begin
             if( MES_ALL=="ON" && $realtime != 0)
	       $display("\nWarning %m READ/WRITE contention. If BWEB enables, Port A outputs set to unknown at %t. >>", $realtime);
               #(`SRAM_DELAY);
	       for (i=0; i<N; i=i+1)
		 begin
		    if(!bBWEBBL[i] || bBWEBBL[i] === 1'bx) 
                      begin
                         bQA[i] <= 1'bx;
                      end
		    else 
		      begin
			 bQA[i] <= QAL[i];
		      end
		 end
	    end
	  else 
	    begin
               #(`SRAM_DELAY);
	       bQA <= QAL;
	    end
       end
  end // always @ (RDA or QAL)
`else
always @(RDA or QAL)
  begin
     if (!CEBAL && WEBAL)
       begin
	  bQA = {N{1'bx}};
	  #0.001 bQA = QAL;
       end
  end
`endif

`ifdef UNIT_DELAY
always @(RDB or QBL)
  begin
     if (!CEBBL && WEBBL)
       begin
	  if ((bAA == bAB) && (WEA && !WEB) && CLK_same) // A-write and B-read ,same-addr
	    begin
             if( MES_ALL=="ON" && $realtime != 0)
	       $display("\nWarning %m READ/WRITE contention. If BWEB enables, Port B outputs set to unknown at %t. >>", $realtime);
               #(`SRAM_DELAY);
	       for (i=0; i<N; i=i+1)
		 begin
		    if(!bBWEBAL[i] || bBWEBAL[i] === 1'bx) 
                      begin
                         bQB[i] <= 1'bx;
                      end
		    else 
		      begin
			 bQB[i] <= QBL[i];
		      end
		 end
	    end
	  else
	    begin
               #(`SRAM_DELAY);
	       bQB <= QBL;
	    end
       end
  end // always @ (RDB or QBL)
`else
always @(RDB or QBL)
  begin
     if (!CEBBL && WEBBL)
       begin
	  bQB = {N{1'bx}};
	  #0.001 bQB = QBL;
       end
  end
`endif


always @(BWEBAL)
   begin
      BWEBAL = #0.01 {N{1'b1}};
   end

always @(BWEBBL)
   begin
      BWEBBL = #0.01 {N{1'b1}};
   end
 
`ifdef UNIT_DELAY
`else
always @(valid_contentiona)
begin
  if ((!bWEBA && bWEBB && CLK_same) || (!WEBAL && bWEBB && !CLK_same))
    begin
       #0.003;
       for (i=0; i<N; i=i+1)
         begin
           if((bBWEBA[i] ===1'bx)||(BWEBAL[i]===1'bx))
             begin
                  BWEBAL[i] = 1'b0;
                  DAL[i] = 1'bx;
                  bQB[i] =  1'bx;
               end
          end
       for (i=0; i<N; i=i+1)
	 begin
	   if((!bBWEBA[i]) || (!BWEBAL[i] ))
             bQB[i] =  1'bx;
         end
    end  

  if ((bWEBA && !bWEBB && CLK_same) || (WEBAL && !bWEBB && !CLK_same))
    begin
       #0.003;
       for (i=0; i<N; i=i+1)
         begin
           if((bBWEBB[i] ===1'bx)||(BWEBBL[i]===1'bx))
             begin
                  BWEBBL[i] = 1'b0;
                  DBL[i] = 1'bx;
                  bQA[i] =  1'bx;
               end
          end
       for (i=0; i<N; i=i+1)
	 begin
	   if((!bBWEBB[i]) || (!BWEBBL[i] ))
             bQA[i] =  1'bx;
         end   
    end  

  if ((!bWEBA && !bWEBB && CLK_same) || (!WEBAL && !bWEBB && !CLK_same))
     begin
       #0.003;
       for (i=0; i<N; i=i+1)
         begin
           if((bBWEBA[i] ===1'bx)||(BWEBAL[i]===1'bx))
             begin
                  BWEBAL[i] = 1'b0;
                  DAL[i] = 1'bx;
                 end
           if((bBWEBB[i] ===1'bx)||(BWEBBL[i]===1'bx))
             begin
                  BWEBBL[i] = 1'b0;
                  DBL[i] = 1'bx;
               end
          end

       for (i=0; i<N; i=i+1)
         begin
	   if((!bBWEBB[i]) || (!BWEBBL[i] ))
              DAL[i] = 1'bx;
	   if((!bBWEBA[i]) || (!BWEBAL[i] ))
              DBL[i] = 1'bx;
         end 
     end
end
 
always @(valid_contentionb)
begin
  if ((!bWEBB && bWEBA && CLK_same) || (!WEBBL && bWEBA && !CLK_same))
     begin
       #0.003;
       for (i=0; i<N; i=i+1)
         begin
           if((bBWEBB[i] ===1'bx)||(BWEBBL[i]===1'bx))
             begin
                  BWEBBL[i] = 1'b0;
                  DBL[i] = 1'bx;
                  bQA[i] =  1'bx;
               end
          end
       for (i=0; i<N; i=i+1)
	 begin
	   if((!bBWEBB[i]) || (!BWEBBL[i] ))
             bQA[i] =  1'bx;
         end
     end 

  if ((bWEBB && !bWEBA && CLK_same) || (WEBBL && !bWEBA && !CLK_same))
    begin
       #0.003;
       for (i=0; i<N; i=i+1)
         begin
           if((bBWEBA[i] ===1'bx)||(BWEBAL[i]===1'bx))
             begin
                  BWEBAL[i] = 1'b0;
                  DAL[i] = 1'bx;
                  bQB[i] =  1'bx;
               end
          end
       for (i=0; i<N; i=i+1)
	 begin
	   if((!bBWEBA[i]) || (!BWEBAL[i] ))
             bQB[i] =  1'bx;
         end   
    end  

  if ((!bWEBB && !bWEBA && CLK_same) || (!WEBBL && !bWEBA && !CLK_same))
     begin
       #0.003;
       for (i=0; i<N; i=i+1)
         begin
           if((bBWEBA[i] ===1'bx)||(BWEBAL[i]===1'bx))
             begin
                  BWEBAL[i] = 1'b0;
                  DAL[i] = 1'bx;
                end
           if((bBWEBB[i] ===1'bx)||(BWEBBL[i]===1'bx))
             begin
                  BWEBBL[i] = 1'b0;
                  DBL[i] = 1'bx;
               end
          end

       for (i=0; i<N; i=i+1)
         begin
	   if((!bBWEBB[i]) || (!BWEBBL[i] ))
              DAL[i] = 1'bx;
	   if((!bBWEBA[i]) || (!BWEBAL[i] ))
              DBL[i] = 1'bx;
         end 
     end
end

 
always @(valid_cka)
   begin
   #0;
   AAL = {M{1'bx}};
   BWEBAL = {N{1'bx}};
   bQA = #0.001 {N{1'bx}};
   end

always @(valid_ckb)
   begin
      #0;
      ABL = {M{1'bx}};
      BWEBBL = {N{1'b0}};
      bQB = #0.001 {N{1'bx}};
   end


always @(valid_aa)
   begin
      #0;
      if (!WEBAL)
        begin
          BWEBAL = {N{1'b0}};
          AAL = {M{1'bx}};
        end
      else
        begin
          BWEBAL = {N{1'b0}};
          AAL = {M{1'bx}};
          bQA = #0.001 {N{1'bx}};
        end
   end

always @(valid_ab)
   begin
      #0;
      if (!WEBBL)
        begin
          BWEBBL = {N{1'b0}};
          ABL = {M{1'bx}};
        end
      else
        begin
          BWEBBL = {N{1'b0}};
          ABL = {M{1'bx}};
          bQB = #0.001 {N{1'bx}};
        end
   end

always @(valid_da0)
   begin
      #0;
      DAL[0] = 1'bx;
      BWEBAL[0] = 1'b0;
   end

always @(valid_db0)
   begin
      #0;
      DBL[0] = 1'bx;
      BWEBBL[0] = 1'b0;
   end

always @(valid_bwa0)
   begin
      #0;
      DAL[0] = 1'bx;
      BWEBAL[0] = 1'b0;
   end

always @(valid_bwb0)
   begin
      #0;
      DBL[0] = 1'bx;
      BWEBBL[0] = 1'b0;
   end
always @(valid_da1)
   begin
      #0;
      DAL[1] = 1'bx;
      BWEBAL[1] = 1'b0;
   end

always @(valid_db1)
   begin
      #0;
      DBL[1] = 1'bx;
      BWEBBL[1] = 1'b0;
   end

always @(valid_bwa1)
   begin
      #0;
      DAL[1] = 1'bx;
      BWEBAL[1] = 1'b0;
   end

always @(valid_bwb1)
   begin
      #0;
      DBL[1] = 1'bx;
      BWEBBL[1] = 1'b0;
   end
always @(valid_da2)
   begin
      #0;
      DAL[2] = 1'bx;
      BWEBAL[2] = 1'b0;
   end

always @(valid_db2)
   begin
      #0;
      DBL[2] = 1'bx;
      BWEBBL[2] = 1'b0;
   end

always @(valid_bwa2)
   begin
      #0;
      DAL[2] = 1'bx;
      BWEBAL[2] = 1'b0;
   end

always @(valid_bwb2)
   begin
      #0;
      DBL[2] = 1'bx;
      BWEBBL[2] = 1'b0;
   end
always @(valid_da3)
   begin
      #0;
      DAL[3] = 1'bx;
      BWEBAL[3] = 1'b0;
   end

always @(valid_db3)
   begin
      #0;
      DBL[3] = 1'bx;
      BWEBBL[3] = 1'b0;
   end

always @(valid_bwa3)
   begin
      #0;
      DAL[3] = 1'bx;
      BWEBAL[3] = 1'b0;
   end

always @(valid_bwb3)
   begin
      #0;
      DBL[3] = 1'bx;
      BWEBBL[3] = 1'b0;
   end
always @(valid_da4)
   begin
      #0;
      DAL[4] = 1'bx;
      BWEBAL[4] = 1'b0;
   end

always @(valid_db4)
   begin
      #0;
      DBL[4] = 1'bx;
      BWEBBL[4] = 1'b0;
   end

always @(valid_bwa4)
   begin
      #0;
      DAL[4] = 1'bx;
      BWEBAL[4] = 1'b0;
   end

always @(valid_bwb4)
   begin
      #0;
      DBL[4] = 1'bx;
      BWEBBL[4] = 1'b0;
   end
always @(valid_da5)
   begin
      #0;
      DAL[5] = 1'bx;
      BWEBAL[5] = 1'b0;
   end

always @(valid_db5)
   begin
      #0;
      DBL[5] = 1'bx;
      BWEBBL[5] = 1'b0;
   end

always @(valid_bwa5)
   begin
      #0;
      DAL[5] = 1'bx;
      BWEBAL[5] = 1'b0;
   end

always @(valid_bwb5)
   begin
      #0;
      DBL[5] = 1'bx;
      BWEBBL[5] = 1'b0;
   end
always @(valid_da6)
   begin
      #0;
      DAL[6] = 1'bx;
      BWEBAL[6] = 1'b0;
   end

always @(valid_db6)
   begin
      #0;
      DBL[6] = 1'bx;
      BWEBBL[6] = 1'b0;
   end

always @(valid_bwa6)
   begin
      #0;
      DAL[6] = 1'bx;
      BWEBAL[6] = 1'b0;
   end

always @(valid_bwb6)
   begin
      #0;
      DBL[6] = 1'bx;
      BWEBBL[6] = 1'b0;
   end
always @(valid_da7)
   begin
      #0;
      DAL[7] = 1'bx;
      BWEBAL[7] = 1'b0;
   end

always @(valid_db7)
   begin
      #0;
      DBL[7] = 1'bx;
      BWEBBL[7] = 1'b0;
   end

always @(valid_bwa7)
   begin
      #0;
      DAL[7] = 1'bx;
      BWEBAL[7] = 1'b0;
   end

always @(valid_bwb7)
   begin
      #0;
      DBL[7] = 1'bx;
      BWEBBL[7] = 1'b0;
   end
always @(valid_da8)
   begin
      #0;
      DAL[8] = 1'bx;
      BWEBAL[8] = 1'b0;
   end

always @(valid_db8)
   begin
      #0;
      DBL[8] = 1'bx;
      BWEBBL[8] = 1'b0;
   end

always @(valid_bwa8)
   begin
      #0;
      DAL[8] = 1'bx;
      BWEBAL[8] = 1'b0;
   end

always @(valid_bwb8)
   begin
      #0;
      DBL[8] = 1'bx;
      BWEBBL[8] = 1'b0;
   end
always @(valid_da9)
   begin
      #0;
      DAL[9] = 1'bx;
      BWEBAL[9] = 1'b0;
   end

always @(valid_db9)
   begin
      #0;
      DBL[9] = 1'bx;
      BWEBBL[9] = 1'b0;
   end

always @(valid_bwa9)
   begin
      #0;
      DAL[9] = 1'bx;
      BWEBAL[9] = 1'b0;
   end

always @(valid_bwb9)
   begin
      #0;
      DBL[9] = 1'bx;
      BWEBBL[9] = 1'b0;
   end
always @(valid_da10)
   begin
      #0;
      DAL[10] = 1'bx;
      BWEBAL[10] = 1'b0;
   end

always @(valid_db10)
   begin
      #0;
      DBL[10] = 1'bx;
      BWEBBL[10] = 1'b0;
   end

always @(valid_bwa10)
   begin
      #0;
      DAL[10] = 1'bx;
      BWEBAL[10] = 1'b0;
   end

always @(valid_bwb10)
   begin
      #0;
      DBL[10] = 1'bx;
      BWEBBL[10] = 1'b0;
   end
always @(valid_da11)
   begin
      #0;
      DAL[11] = 1'bx;
      BWEBAL[11] = 1'b0;
   end

always @(valid_db11)
   begin
      #0;
      DBL[11] = 1'bx;
      BWEBBL[11] = 1'b0;
   end

always @(valid_bwa11)
   begin
      #0;
      DAL[11] = 1'bx;
      BWEBAL[11] = 1'b0;
   end

always @(valid_bwb11)
   begin
      #0;
      DBL[11] = 1'bx;
      BWEBBL[11] = 1'b0;
   end
always @(valid_da12)
   begin
      #0;
      DAL[12] = 1'bx;
      BWEBAL[12] = 1'b0;
   end

always @(valid_db12)
   begin
      #0;
      DBL[12] = 1'bx;
      BWEBBL[12] = 1'b0;
   end

always @(valid_bwa12)
   begin
      #0;
      DAL[12] = 1'bx;
      BWEBAL[12] = 1'b0;
   end

always @(valid_bwb12)
   begin
      #0;
      DBL[12] = 1'bx;
      BWEBBL[12] = 1'b0;
   end
always @(valid_da13)
   begin
      #0;
      DAL[13] = 1'bx;
      BWEBAL[13] = 1'b0;
   end

always @(valid_db13)
   begin
      #0;
      DBL[13] = 1'bx;
      BWEBBL[13] = 1'b0;
   end

always @(valid_bwa13)
   begin
      #0;
      DAL[13] = 1'bx;
      BWEBAL[13] = 1'b0;
   end

always @(valid_bwb13)
   begin
      #0;
      DBL[13] = 1'bx;
      BWEBBL[13] = 1'b0;
   end
always @(valid_da14)
   begin
      #0;
      DAL[14] = 1'bx;
      BWEBAL[14] = 1'b0;
   end

always @(valid_db14)
   begin
      #0;
      DBL[14] = 1'bx;
      BWEBBL[14] = 1'b0;
   end

always @(valid_bwa14)
   begin
      #0;
      DAL[14] = 1'bx;
      BWEBAL[14] = 1'b0;
   end

always @(valid_bwb14)
   begin
      #0;
      DBL[14] = 1'bx;
      BWEBBL[14] = 1'b0;
   end
always @(valid_da15)
   begin
      #0;
      DAL[15] = 1'bx;
      BWEBAL[15] = 1'b0;
   end

always @(valid_db15)
   begin
      #0;
      DBL[15] = 1'bx;
      BWEBBL[15] = 1'b0;
   end

always @(valid_bwa15)
   begin
      #0;
      DAL[15] = 1'bx;
      BWEBAL[15] = 1'b0;
   end

always @(valid_bwb15)
   begin
      #0;
      DBL[15] = 1'bx;
      BWEBBL[15] = 1'b0;
   end
always @(valid_da16)
   begin
      #0;
      DAL[16] = 1'bx;
      BWEBAL[16] = 1'b0;
   end

always @(valid_db16)
   begin
      #0;
      DBL[16] = 1'bx;
      BWEBBL[16] = 1'b0;
   end

always @(valid_bwa16)
   begin
      #0;
      DAL[16] = 1'bx;
      BWEBAL[16] = 1'b0;
   end

always @(valid_bwb16)
   begin
      #0;
      DBL[16] = 1'bx;
      BWEBBL[16] = 1'b0;
   end
always @(valid_da17)
   begin
      #0;
      DAL[17] = 1'bx;
      BWEBAL[17] = 1'b0;
   end

always @(valid_db17)
   begin
      #0;
      DBL[17] = 1'bx;
      BWEBBL[17] = 1'b0;
   end

always @(valid_bwa17)
   begin
      #0;
      DAL[17] = 1'bx;
      BWEBAL[17] = 1'b0;
   end

always @(valid_bwb17)
   begin
      #0;
      DBL[17] = 1'bx;
      BWEBBL[17] = 1'b0;
   end
always @(valid_da18)
   begin
      #0;
      DAL[18] = 1'bx;
      BWEBAL[18] = 1'b0;
   end

always @(valid_db18)
   begin
      #0;
      DBL[18] = 1'bx;
      BWEBBL[18] = 1'b0;
   end

always @(valid_bwa18)
   begin
      #0;
      DAL[18] = 1'bx;
      BWEBAL[18] = 1'b0;
   end

always @(valid_bwb18)
   begin
      #0;
      DBL[18] = 1'bx;
      BWEBBL[18] = 1'b0;
   end
always @(valid_da19)
   begin
      #0;
      DAL[19] = 1'bx;
      BWEBAL[19] = 1'b0;
   end

always @(valid_db19)
   begin
      #0;
      DBL[19] = 1'bx;
      BWEBBL[19] = 1'b0;
   end

always @(valid_bwa19)
   begin
      #0;
      DAL[19] = 1'bx;
      BWEBAL[19] = 1'b0;
   end

always @(valid_bwb19)
   begin
      #0;
      DBL[19] = 1'bx;
      BWEBBL[19] = 1'b0;
   end
always @(valid_da20)
   begin
      #0;
      DAL[20] = 1'bx;
      BWEBAL[20] = 1'b0;
   end

always @(valid_db20)
   begin
      #0;
      DBL[20] = 1'bx;
      BWEBBL[20] = 1'b0;
   end

always @(valid_bwa20)
   begin
      #0;
      DAL[20] = 1'bx;
      BWEBAL[20] = 1'b0;
   end

always @(valid_bwb20)
   begin
      #0;
      DBL[20] = 1'bx;
      BWEBBL[20] = 1'b0;
   end
always @(valid_da21)
   begin
      #0;
      DAL[21] = 1'bx;
      BWEBAL[21] = 1'b0;
   end

always @(valid_db21)
   begin
      #0;
      DBL[21] = 1'bx;
      BWEBBL[21] = 1'b0;
   end

always @(valid_bwa21)
   begin
      #0;
      DAL[21] = 1'bx;
      BWEBAL[21] = 1'b0;
   end

always @(valid_bwb21)
   begin
      #0;
      DBL[21] = 1'bx;
      BWEBBL[21] = 1'b0;
   end
always @(valid_da22)
   begin
      #0;
      DAL[22] = 1'bx;
      BWEBAL[22] = 1'b0;
   end

always @(valid_db22)
   begin
      #0;
      DBL[22] = 1'bx;
      BWEBBL[22] = 1'b0;
   end

always @(valid_bwa22)
   begin
      #0;
      DAL[22] = 1'bx;
      BWEBAL[22] = 1'b0;
   end

always @(valid_bwb22)
   begin
      #0;
      DBL[22] = 1'bx;
      BWEBBL[22] = 1'b0;
   end
always @(valid_da23)
   begin
      #0;
      DAL[23] = 1'bx;
      BWEBAL[23] = 1'b0;
   end

always @(valid_db23)
   begin
      #0;
      DBL[23] = 1'bx;
      BWEBBL[23] = 1'b0;
   end

always @(valid_bwa23)
   begin
      #0;
      DAL[23] = 1'bx;
      BWEBAL[23] = 1'b0;
   end

always @(valid_bwb23)
   begin
      #0;
      DBL[23] = 1'bx;
      BWEBBL[23] = 1'b0;
   end
always @(valid_da24)
   begin
      #0;
      DAL[24] = 1'bx;
      BWEBAL[24] = 1'b0;
   end

always @(valid_db24)
   begin
      #0;
      DBL[24] = 1'bx;
      BWEBBL[24] = 1'b0;
   end

always @(valid_bwa24)
   begin
      #0;
      DAL[24] = 1'bx;
      BWEBAL[24] = 1'b0;
   end

always @(valid_bwb24)
   begin
      #0;
      DBL[24] = 1'bx;
      BWEBBL[24] = 1'b0;
   end
always @(valid_da25)
   begin
      #0;
      DAL[25] = 1'bx;
      BWEBAL[25] = 1'b0;
   end

always @(valid_db25)
   begin
      #0;
      DBL[25] = 1'bx;
      BWEBBL[25] = 1'b0;
   end

always @(valid_bwa25)
   begin
      #0;
      DAL[25] = 1'bx;
      BWEBAL[25] = 1'b0;
   end

always @(valid_bwb25)
   begin
      #0;
      DBL[25] = 1'bx;
      BWEBBL[25] = 1'b0;
   end
always @(valid_da26)
   begin
      #0;
      DAL[26] = 1'bx;
      BWEBAL[26] = 1'b0;
   end

always @(valid_db26)
   begin
      #0;
      DBL[26] = 1'bx;
      BWEBBL[26] = 1'b0;
   end

always @(valid_bwa26)
   begin
      #0;
      DAL[26] = 1'bx;
      BWEBAL[26] = 1'b0;
   end

always @(valid_bwb26)
   begin
      #0;
      DBL[26] = 1'bx;
      BWEBBL[26] = 1'b0;
   end
always @(valid_da27)
   begin
      #0;
      DAL[27] = 1'bx;
      BWEBAL[27] = 1'b0;
   end

always @(valid_db27)
   begin
      #0;
      DBL[27] = 1'bx;
      BWEBBL[27] = 1'b0;
   end

always @(valid_bwa27)
   begin
      #0;
      DAL[27] = 1'bx;
      BWEBAL[27] = 1'b0;
   end

always @(valid_bwb27)
   begin
      #0;
      DBL[27] = 1'bx;
      BWEBBL[27] = 1'b0;
   end
always @(valid_da28)
   begin
      #0;
      DAL[28] = 1'bx;
      BWEBAL[28] = 1'b0;
   end

always @(valid_db28)
   begin
      #0;
      DBL[28] = 1'bx;
      BWEBBL[28] = 1'b0;
   end

always @(valid_bwa28)
   begin
      #0;
      DAL[28] = 1'bx;
      BWEBAL[28] = 1'b0;
   end

always @(valid_bwb28)
   begin
      #0;
      DBL[28] = 1'bx;
      BWEBBL[28] = 1'b0;
   end
always @(valid_da29)
   begin
      #0;
      DAL[29] = 1'bx;
      BWEBAL[29] = 1'b0;
   end

always @(valid_db29)
   begin
      #0;
      DBL[29] = 1'bx;
      BWEBBL[29] = 1'b0;
   end

always @(valid_bwa29)
   begin
      #0;
      DAL[29] = 1'bx;
      BWEBAL[29] = 1'b0;
   end

always @(valid_bwb29)
   begin
      #0;
      DBL[29] = 1'bx;
      BWEBBL[29] = 1'b0;
   end
always @(valid_da30)
   begin
      #0;
      DAL[30] = 1'bx;
      BWEBAL[30] = 1'b0;
   end

always @(valid_db30)
   begin
      #0;
      DBL[30] = 1'bx;
      BWEBBL[30] = 1'b0;
   end

always @(valid_bwa30)
   begin
      #0;
      DAL[30] = 1'bx;
      BWEBAL[30] = 1'b0;
   end

always @(valid_bwb30)
   begin
      #0;
      DBL[30] = 1'bx;
      BWEBBL[30] = 1'b0;
   end
always @(valid_da31)
   begin
      #0;
      DAL[31] = 1'bx;
      BWEBAL[31] = 1'b0;
   end

always @(valid_db31)
   begin
      #0;
      DBL[31] = 1'bx;
      BWEBBL[31] = 1'b0;
   end

always @(valid_bwa31)
   begin
      #0;
      DAL[31] = 1'bx;
      BWEBAL[31] = 1'b0;
   end

always @(valid_bwb31)
   begin
      #0;
      DBL[31] = 1'bx;
      BWEBBL[31] = 1'b0;
   end

always @(valid_cea)
   begin
      #0;
      BWEBAL = {N{1'b0}};
      AAL = {M{1'bx}};
      bQA = #0.001 {N{1'bx}};
   end

always @(valid_ceb)
   begin
      #0;
      BWEBBL = {N{1'b0}};
      ABL = {M{1'bx}};
      bQB = #0.001 {N{1'bx}};
   end

always @(valid_wea)
   begin
      #0;
      BWEBAL = {N{1'b0}};
      AAL = {M{1'bx}};
      bQA = #0.001 {N{1'bx}};
      bQB = #0.001 {N{1'bx}};
   end
 
always @(valid_web)
   begin
      #0;
      BWEBBL = {N{1'b0}};
      ABL = {M{1'bx}};
      bQA = #0.001 {N{1'bx}};
      bQB = #0.001 {N{1'bx}};
   end

`endif

TSDN65LPLLA1024X32M4S_Int_Array #(2,2,W,N,M,MES_ALL) MX (.D({DAL,DBL}),.BW({BWEBAL,BWEBBL}),
         .AW({AAL,ABL}),.EN(EN),.AAR(AAL),.ABR(ABL),.RDA(RDA),.RDB(RDB),.QA(QAL),.QB(QBL));
 
endmodule

`disable_portfaults
`nosuppress_faults
`endcelldefine

/*
   The module ports are parameterizable vectors.
*/

module TSDN65LPLLA1024X32M4S_Int_Array (D, BW, AW, EN, AAR, ABR, RDA, RDB, QA, QB);
parameter Nread = 2;   // Number of Read Ports
parameter Nwrite = 2;  // Number of Write Ports
parameter Nword = 2;   // Number of Words
parameter Ndata = 1;   // Number of Data Bits / Word
parameter Naddr = 1;   // Number of Address Bits / Word
parameter MES_ALL = "ON";
parameter dly = 0.000;
// Cannot define inputs/outputs as memories
input  [Ndata*Nwrite-1:0] D;  // Data Word(s)
input  [Ndata*Nwrite-1:0] BW; // Negative Bit Write Enable
input  [Naddr*Nwrite-1:0] AW; // Write Address(es)
input  EN;                    // Positive Write Enable
input  RDA;                    // Positive Write Enable
input  RDB;                    // Positive Write Enable
input  [Naddr-1:0] AAR;  // Read Address(es)
input  [Naddr-1:0] ABR;  // Read Address(es)
output [Ndata-1:0] QA;   // Output Data Word(s)
output [Ndata-1:0] QB;   // Output Data Word(s)
reg    [Ndata-1:0] QA;
reg    [Ndata-1:0] QB;
reg [Ndata-1:0] mem [Nword-1:0];
reg [Ndata-1:0] mem_fault [Nword-1:0];
reg chgmem;            // Toggled when write to mem
reg [Nwrite-1:0] wwe;  // Positive Word Write Enable for each Port
reg we;                // Positive Write Enable for all Ports
integer waddr[Nwrite-1:0]; // Write Address for each Enabled Port
integer address;       // Current address
reg [Naddr-1:0] abuf;  // Address of current port
reg [Ndata-1:0] dbuf;  // Data for current port
reg [Ndata-1:0] bwbuf; // Bit Write enable for current port
reg dup;               // Is the address a duplicate?
integer log;           // Log file descriptor
integer ip, ip2, ib, iw, iwb; // Vector indices


initial
   begin
   $timeformat (-9, 3, " ns", 9);
   if (log[0] === 1'bx)
      log = 1;
   chgmem = 1'b0;
   end


always @(D or BW or AW or EN)
   begin: WRITE //{
   if (EN !== 1'b0)
      begin //{ Possible write
      we = 1'b0;
      // Mark any write enabled ports & get write addresses
      for (ip = 0 ; ip < Nwrite ; ip = ip + 1)
         begin //{
         ib = ip * Ndata;
         iw = ib + Ndata;
         while (ib < iw && BW[ib] === 1'b1)
            ib = ib + 1;
         if (ib == iw)
            wwe[ip] = 1'b0;
         else
            begin //{ ip write enabled
            iw = ip * Naddr;
            for (ib = 0 ; ib < Naddr ; ib = ib + 1)
               begin //{
               abuf[ib] = AW[iw+ib];
               if (abuf[ib] !== 1'b0 && abuf[ib] !== 1'b1)
                  ib = Naddr;
               end //}
            if (ib == Naddr)
               begin //{
               if (abuf < Nword)
                  begin //{ Valid address
                  waddr[ip] = abuf;
                  wwe[ip] = 1'b1;
                  if (we == 1'b0)
                     begin
                     chgmem = ~chgmem;
                     we = EN;
                     end
                  end //}
               else
                  begin //{ Out of range address
                  wwe[ip] = 1'b0;
                  if( MES_ALL=="ON" && $realtime != 0)
                       $fdisplay (log,
                             "\nWarning! Int_Array instance, %m:",
                             "\n\t Port %0d", ip,
                             " write address x'%0h'", abuf,
                             " out of range at time %t.", $realtime,
                             "\n\t Port %0d data not written to memory.", ip);
                  end //}
               end //}
            else
               begin //{ Unknown write address
               if( MES_ALL=="ON" && $realtime != 0)
                    $fdisplay (log,
                          "\nWarning! Int_Array instance, %m:",
                          "\n\t Port %0d", ip,
                          " write address unknown at time %t.", $realtime,
                          "\n\t Entire memory set to unknown.");
               for (ib = 0 ; ib < Ndata ; ib = ib + 1)
                  dbuf[ib] = 1'bx;
               for (iw = 0 ; iw < Nword ; iw = iw + 1)
                  mem[iw] = dbuf;
               chgmem = ~chgmem;
               disable WRITE;
               end //}
            end //} ip write enabled
         end //} for ip
      if (we === 1'b1)
         begin //{ active write enable
         for (ip = 0 ; ip < Nwrite ; ip = ip + 1)
            begin //{
            if (wwe[ip])
               begin //{ write enabled bits of write port ip
               address = waddr[ip];
               dbuf = mem[address];
               iw = ip * Ndata;
               for (ib = 0 ; ib < Ndata ; ib = ib + 1)
                  begin //{
                  iwb = iw + ib;
                  if (BW[iwb] === 1'b0)
                     dbuf[ib] = D[iwb];
                  else if (BW[iwb] !== 1'b1)
                     dbuf[ib] = 1'bx;
                  end //}
               // Check other ports for same address &
               // common write enable bits active
               dup = 0;
               for (ip2 = ip + 1 ; ip2 < Nwrite ; ip2 = ip2 + 1)
                  begin //{
                  if (wwe[ip2] && address == waddr[ip2])
                     begin //{
                     // initialize bwbuf if first dup
                     if (!dup)
                        begin
                        for (ib = 0 ; ib < Ndata ; ib = ib + 1)
                           bwbuf[ib] = BW[iw+ib];
                        dup = 1;
                        end
                     iw = ip2 * Ndata;
                     for (ib = 0 ; ib < Ndata ; ib = ib + 1)
                        begin //{
                        iwb = iw + ib;
                        // New: Always set X if BW X
                        if (BW[iwb] === 1'b0)
                           begin //{
                           if (bwbuf[ib] !== 1'b1)
                              begin
                              if (D[iwb] !== dbuf[ib])
                                 dbuf[ib] = 1'bx;
                              end
                           else
                              begin
                              dbuf[ib] = D[iwb];
                              bwbuf[ib] = 1'b0;
                              end
                           end //}
                        else if (BW[iwb] !== 1'b1)
                           begin
                           dbuf[ib] = 1'bx;
                           bwbuf[ib] = 1'bx;
                           end
                        end //} for each bit
                        wwe[ip2] = 1'b0;
                     end //} Port ip2 address matches port ip
                  end //} for each port beyond ip (ip2=ip+1)
               // Write dbuf to memory
               mem[address] = dbuf;
               end //} wwe[ip] - write port ip enabled
            end //} for each write port ip
         end //} active write enable
      else if (we !== 1'b0)
         begin //{ unknown write enable
         for (ip = 0 ; ip < Nwrite ; ip = ip + 1)
            begin //{
            if (wwe[ip])
               begin //{ write X to enabled bits of write port ip
               address = waddr[ip];
               dbuf = mem[address];
               iw = ip * Ndata;
               for (ib = 0 ; ib < Ndata ; ib = ib + 1)
                  begin //{ 
                 if (BW[iw+ib] !== 1'b1)
                     dbuf[ib] = 1'bx;
                  end //} 
               mem[address] = dbuf;
               if( MES_ALL=="ON" && $realtime != 0)
                    $fdisplay (log,
                          "\nWarning! Int_Array instance, %m:",
                          "\n\t Enable pin unknown at time %t.", $realtime,
                          "\n\t Enabled bits at port %0d", ip,
                          " write address x'%0h' set unknown.", address);
               end //} wwe[ip] - write port ip enabled
            end //} for each write port ip
         end //} unknown write enable
      end //} possible write (EN != 0)
   end //} always @(D or BW or AW or EN)


// Read memory
always @(AAR or RDA)
   begin //{
      for (ib = 0 ; ib < Naddr ; ib = ib + 1)
         begin
         abuf[ib] = AAR[ib];
         if (abuf[ib] !== 0 && abuf[ib] !== 1)
            ib = Naddr;
         end
      if (ib == Naddr && abuf < Nword)
         begin //{ Read valid address
`ifdef TSMC_INITIALIZE_FAULT
         dbuf = mem[abuf] ^ mem_fault[abuf];
`else
         dbuf = mem[abuf];
`endif
         for (ib = 0 ; ib < Ndata ; ib = ib + 1)
            begin
            if (QA[ib] == dbuf[ib])
                QA[ib] <= #(dly) dbuf[ib];
            else
                begin
                QA[ib] <= #(dly) dbuf[ib];
                end // else
            end // for
         end //} valid address
      else
         begin //{ Invalid address
         if( MES_ALL=="ON" && $realtime != 0)
               $fwrite (log, "\nWarning! Int_Array instance, %m:",
                       "\n\t Port A read address");
         if (ib > Naddr)
         begin
         if( MES_ALL=="ON" && $realtime != 0)
            $fwrite (log, " unknown");
         end   
         else
         begin
         if( MES_ALL=="ON" && $realtime != 0)
            $fwrite (log, " x'%0h' out of range", abuf);
         end   
         if( MES_ALL=="ON" && $realtime != 0)
            $fdisplay (log,
                    " at time %t.", $realtime,
                    "\n\t Port A outputs set to unknown.");
         for (ib = 0 ; ib < Ndata ; ib = ib + 1)
            QA[ib] <= #(dly) 1'bx;
         end //} invalid address
   end //} always @(chgmem or AR)

// Read memory
always @(ABR or RDB)
   begin //{
      for (ib = 0 ; ib < Naddr ; ib = ib + 1)
         begin
         abuf[ib] = ABR[ib];
         if (abuf[ib] !== 0 && abuf[ib] !== 1)
            ib = Naddr;
         end
      if (ib == Naddr && abuf < Nword)
         begin //{ Read valid address
`ifdef TSMC_INITIALIZE_FAULT
         dbuf = mem[abuf] ^ mem_fault[abuf];
`else
         dbuf = mem[abuf];
`endif
         for (ib = 0 ; ib < Ndata ; ib = ib + 1)
            begin
            if (QB[ib] == dbuf[ib])
                QB[ib] <= #(dly) dbuf[ib];
            else
                begin
                QB[ib] <= #(dly) dbuf[ib];
                end // else
            end // for
         end //} valid address
      else
         begin //{ Invalid address
         if( MES_ALL=="ON" && $realtime != 0)
               $fwrite (log, "\nWarning! Int_Array instance, %m:",
                       "\n\t Port B read address");
         if (ib > Naddr)
         begin
         if( MES_ALL=="ON" && $realtime != 0)
            $fwrite (log, " unknown");
         end   
         else
         begin
         if( MES_ALL=="ON" && $realtime != 0)
            $fwrite (log, " x'%0h' out of range", abuf);
         end   
         if( MES_ALL=="ON" && $realtime != 0)
            $fdisplay (log,
                    " at time %t.", $realtime,
                    "\n\t Port B outputs set to unknown.");
         for (ib = 0 ; ib < Ndata ; ib = ib + 1)
            QB[ib] <= #(dly) 1'bx;
         end //} invalid address
   end //} always @(chgmem or AR)


// Task for loading contents of a memory
task load;   //{ USAGE: initial inst.load ("file_name");
   input [256*8:1] file;  // Max 256 character File Name
   begin
   $display ("\n%m: Reading file, %0s, into memory", file);
   $readmemb (file, mem, 0, Nword-1);
   end
endtask //}


// Task for displaying contents of a memory
task show;   //{ USAGE: inst.show (low, high);
   input [31:0] low, high;
   integer i;
   begin //{
   $display ("\n%m: Memory content dump");
   if (low < 0 || low > high || high >= Nword)
      $display ("Error! Invalid address range (%0d, %0d).", low, high,
                "\nUsage: %m (low, high);",
                "\n       where low >= 0 and high <= %0d.", Nword-1);
   else
      begin
      $display ("\n    Address\tValue");
      for (i = low ; i <= high ; i = i + 1)
         $display ("%d\t%b", i, mem[i]);
      end
   end //}
endtask //}

endmodule

