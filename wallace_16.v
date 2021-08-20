module wallace_16 (clk,mpd_in,mpr_in,out_out);
input [15:0] mpd_in,mpr_in;
input clk;
output reg [32:0] out_out;
reg [15:0] mpd,mpr;
wire [32:0] out;
wire [23:0] cout;


wire [31:0] partial_prod [15:0];
wire [31:0] l1 [12:0];
wire [31:0] l2 [8:0];
wire [31:0] l3 [5:0];
wire [31:0] l4 [3:0];
wire [31:0] l5 [2:0];
wire [31:0] l6 [1:0];

genvar i,j;

always @(posedge clk) begin
mpd<=mpd_in;
mpr<=mpr_in;
out_out<=out;
end

generate
	for(i=0;i<16;i=i+1) begin:loop1
		for(j=0;j<16;j=j+1) begin:loop2
			assign partial_prod[i][j+i]=mpd[i] & mpr[j];
		end
		end
endgenerate

// layer1
assign l1[0][0]=partial_prod[0][0];
ha_wallace ha1(partial_prod[0][1],partial_prod[1][1],l1[0][1],l1[1][2]);
fa_wallace fa1(partial_prod[0][2],partial_prod[1][2],partial_prod[2][2],l1[0][2],l1[1][3]);
fa_wallace fa2(partial_prod[0][3],partial_prod[1][3],partial_prod[2][3],l1[0][3],l1[1][4]);
assign l1[2][3]=partial_prod[3][3];
fa_wallace fa3(partial_prod[0][4],partial_prod[1][4],partial_prod[2][4],l1[0][4],l1[1][5]);
assign l1[2][4]=partial_prod[3][4];
assign l1[3][4]=partial_prod[4][4];
fa_wallace fa4(partial_prod[0][5],partial_prod[1][5],partial_prod[2][5],l1[0][5],l1[1][6]);
fa_wallace fa5(partial_prod[3][5],partial_prod[4][5],partial_prod[5][5],l1[2][5],l1[3][6]);

fa_wallace fa6(partial_prod[0][6],partial_prod[1][6],partial_prod[2][6],l1[0][6],l1[1][7]);
fa_wallace fa7(partial_prod[3][6],partial_prod[4][6],partial_prod[5][6],l1[2][6],l1[3][7]);
assign l1[4][6]=partial_prod[6][6];

fa_wallace fa8(partial_prod[0][7],partial_prod[1][7],partial_prod[2][7],l1[0][7],l1[1][8]);
fa_wallace fa9(partial_prod[3][7],partial_prod[4][7],partial_prod[5][7],l1[2][7],l1[3][8]);
assign l1[4][7]=partial_prod[6][7];
assign l1[5][7]=partial_prod[7][7];

fa_wallace fa10(partial_prod[0][8],partial_prod[1][8],partial_prod[2][8],l1[0][8],l1[1][9]);
fa_wallace fa11(partial_prod[3][8],partial_prod[4][8],partial_prod[5][8],l1[2][8],l1[3][9]);
fa_wallace fa12(partial_prod[6][8],partial_prod[7][8],partial_prod[8][8],l1[4][8],l1[5][9]);

fa_wallace fa13(partial_prod[0][9],partial_prod[1][9],partial_prod[2][9],l1[0][9],l1[1][10]);
fa_wallace fa14(partial_prod[3][9],partial_prod[4][9],partial_prod[5][9],l1[2][9],l1[3][10]);
fa_wallace fa15(partial_prod[6][9],partial_prod[7][9],partial_prod[8][9],l1[4][9],l1[5][10]);
assign l1[6][9]=partial_prod[9][9];

fa_wallace fa16(partial_prod[0][10],partial_prod[1][10],partial_prod[2][10],l1[0][10],l1[1][11]);
fa_wallace fa17(partial_prod[3][10],partial_prod[4][10],partial_prod[5][10],l1[2][10],l1[3][11]);
fa_wallace fa18(partial_prod[6][10],partial_prod[7][10],partial_prod[8][10],l1[4][10],l1[5][11]);
assign l1[6][10]=partial_prod[9][10];
assign l1[7][10]=partial_prod[10][10];

fa_wallace fa19(partial_prod[0][11],partial_prod[1][11],partial_prod[2][11],l1[0][11],l1[1][12]);
fa_wallace fa20(partial_prod[3][11],partial_prod[4][11],partial_prod[5][11],l1[2][11],l1[3][12]);
fa_wallace fa21(partial_prod[6][11],partial_prod[7][11],partial_prod[8][11],l1[4][11],l1[5][12]);
fa_wallace fa22(partial_prod[9][11],partial_prod[10][11],partial_prod[11][11],l1[6][11],l1[7][12]);

fa_wallace fa23(partial_prod[0][12],partial_prod[1][12],partial_prod[2][12],l1[0][12],l1[1][13]);
fa_wallace fa24(partial_prod[3][12],partial_prod[4][12],partial_prod[5][12],l1[2][12],l1[3][13]);
fa_wallace fa25(partial_prod[6][12],partial_prod[7][12],partial_prod[8][12],l1[4][12],l1[5][13]);
fa_wallace fa26(partial_prod[9][12],partial_prod[10][12],partial_prod[11][12],l1[6][12],l1[7][13]);
assign l1[8][12]=partial_prod[12][12];

fa_wallace fa27(partial_prod[0][13],partial_prod[1][13],partial_prod[2][13],l1[0][13],l1[1][14]);
fa_wallace fa28(partial_prod[3][13],partial_prod[4][13],partial_prod[5][13],l1[2][13],l1[3][14]);
fa_wallace fa29(partial_prod[6][13],partial_prod[7][13],partial_prod[8][13],l1[4][13],l1[5][14]);
fa_wallace fa30(partial_prod[9][13],partial_prod[10][13],partial_prod[11][13],l1[6][13],l1[7][14]);
assign l1[8][13]= partial_prod[12][13];
assign l1[9][13]=partial_prod[13][13];

fa_wallace fa31(partial_prod[0][14],partial_prod[1][14],partial_prod[2][14],l1[0][14],l1[1][15]);
fa_wallace fa32(partial_prod[3][14],partial_prod[4][14],partial_prod[5][14],l1[2][14],l1[3][15]);
fa_wallace fa33(partial_prod[6][14],partial_prod[7][14],partial_prod[8][14],l1[4][14],l1[5][15]);
fa_wallace fa34(partial_prod[9][14],partial_prod[10][14],partial_prod[11][14],l1[6][14],l1[7][15]);
fa_wallace fa35(partial_prod[12][14],partial_prod[13][14],partial_prod[14][14],l1[8][14],l1[9][15]);

fa_wallace fa36(partial_prod[0][15],partial_prod[1][15],partial_prod[2][15],l1[0][15],l1[1][16]);
fa_wallace fa37(partial_prod[3][15],partial_prod[4][15],partial_prod[5][15],l1[2][15],l1[3][16]);
fa_wallace fa38(partial_prod[6][15],partial_prod[7][15],partial_prod[8][15],l1[4][15],l1[5][16]);
fa_wallace fa39(partial_prod[9][15],partial_prod[10][15],partial_prod[11][15],l1[6][15],l1[7][16]);
fa_wallace fa40(partial_prod[12][15],partial_prod[13][15],partial_prod[14][15],l1[8][15],l1[9][16]);
assign l1[10][15]=partial_prod[15][15];

fa_wallace fa41(partial_prod[1][16],partial_prod[2][16],partial_prod[3][16],l1[0][16],l1[1][17]);
fa_wallace fa42(partial_prod[4][16],partial_prod[5][16],partial_prod[6][16],l1[2][16],l1[3][17]);
fa_wallace fa43(partial_prod[7][16],partial_prod[8][16],partial_prod[9][16],l1[4][16],l1[5][17]);
fa_wallace fa44(partial_prod[10][16],partial_prod[11][16],partial_prod[12][16],l1[6][16],l1[7][17]);
fa_wallace fa45(partial_prod[13][16],partial_prod[14][16],partial_prod[15][16],l1[8][16],l1[9][17]);

fa_wallace fa46(partial_prod[2][17],partial_prod[3][17],partial_prod[4][17],l1[0][17],l1[1][18]);
fa_wallace fa47(partial_prod[5][17],partial_prod[6][17],partial_prod[7][17],l1[2][17],l1[3][18]);
fa_wallace fa48(partial_prod[8][17],partial_prod[9][17],partial_prod[10][17],l1[4][17],l1[5][18]);
fa_wallace fa49(partial_prod[11][17],partial_prod[12][17],partial_prod[13][17],l1[6][17],l1[7][18]);
assign l1[8][17]=partial_prod[14][17];
assign l1[10][17]=partial_prod[15][17];

fa_wallace fa50(partial_prod[3][18],partial_prod[4][18],partial_prod[5][18],l1[0][18],l1[1][19]);
fa_wallace fa51(partial_prod[6][18],partial_prod[7][18],partial_prod[8][18],l1[2][18],l1[3][19]);
fa_wallace fa52(partial_prod[9][18],partial_prod[10][18],partial_prod[11][18],l1[4][18],l1[5][19]);
fa_wallace fa53(partial_prod[12][18],partial_prod[13][18],partial_prod[14][18],l1[6][18],l1[7][19]);
assign l1[8][18]=partial_prod[15][18];

fa_wallace fa54(partial_prod[4][19],partial_prod[5][19],partial_prod[6][19],l1[0][19],l1[1][20]);
fa_wallace fa55(partial_prod[7][19],partial_prod[8][19],partial_prod[9][19],l1[2][19],l1[3][20]);
fa_wallace fa56(partial_prod[10][19],partial_prod[11][19],partial_prod[12][19],l1[4][19],l1[5][20]);
fa_wallace fa57(partial_prod[13][19],partial_prod[14][19],partial_prod[15][19],l1[6][19],l1[7][20]);

fa_wallace fa58(partial_prod[5][20],partial_prod[6][20],partial_prod[7][20],l1[0][20],l1[1][21]);
fa_wallace fa59(partial_prod[8][20],partial_prod[9][20],partial_prod[10][20],l1[2][20],l1[3][21]);
fa_wallace fa60(partial_prod[11][20],partial_prod[12][20],partial_prod[13][20],l1[4][20],l1[5][21]);
assign l1[6][20]=partial_prod[14][20];
assign l1[8][20]=partial_prod[15][20];

fa_wallace fa61(partial_prod[6][21],partial_prod[7][21],partial_prod[8][21],l1[0][21],l1[1][22]);
fa_wallace fa62(partial_prod[9][21],partial_prod[10][21],partial_prod[11][21],l1[2][21],l1[3][22]);
fa_wallace fa63(partial_prod[12][21],partial_prod[13][21],partial_prod[14][21],l1[4][21],l1[5][22]);
assign l1[6][21]=partial_prod[15][21];

fa_wallace fa64(partial_prod[7][22],partial_prod[8][22],partial_prod[9][22],l1[0][22],l1[1][23]);
fa_wallace fa65(partial_prod[10][22],partial_prod[11][22],partial_prod[12][22],l1[2][22],l1[3][23]);
fa_wallace fa66(partial_prod[13][22],partial_prod[14][22],partial_prod[15][22],l1[4][22],l1[5][23]);

fa_wallace fa67(partial_prod[8][23],partial_prod[9][23],partial_prod[10][23],l1[0][23],l1[1][24]);
fa_wallace fa68(partial_prod[11][23],partial_prod[12][23],partial_prod[13][23],l1[2][23],l1[3][24]);
assign l1[4][23]=partial_prod[14][23];
assign l1[6][23]=partial_prod[15][23];

fa_wallace fa69(partial_prod[9][24],partial_prod[10][24],partial_prod[11][24],l1[0][24],l1[1][25]);
fa_wallace fa70(partial_prod[12][24],partial_prod[13][24],partial_prod[14][24],l1[2][24],l1[3][25]);
assign l1[4][24]=partial_prod[15][24];

fa_wallace fa71(partial_prod[10][25],partial_prod[11][25],partial_prod[12][25],l1[0][25],l1[1][26]);
fa_wallace fa72(partial_prod[13][25],partial_prod[14][25],partial_prod[15][25],l1[2][25],l1[3][26]);

fa_wallace fa73(partial_prod[11][26],partial_prod[12][26],partial_prod[13][26],l1[0][26],l1[1][27]);
assign l1[2][26]=partial_prod[14][26];
assign l1[4][26]=partial_prod[15][26];


fa_wallace fa74(partial_prod[12][27],partial_prod[13][27],partial_prod[14][27],l1[0][27],l1[1][28]);
assign l1[2][27]=partial_prod[15][27];

fa_wallace fa75(partial_prod[13][28],partial_prod[14][28],partial_prod[15][28],l1[0][28],l1[1][29]);

assign l1[0][29]=partial_prod[14][29];
assign l1[2][29]=partial_prod[15][29];

assign l1[0][30]=partial_prod[15][30];

//layer 2

assign l2[0][0]=l1[0][0];

assign l2[0][1]=l1[0][1];

ha_wallace ha2(l1[0][2],l1[1][2],l2[0][2],l2[1][3]);

fa_wallace fa76(l1[0][3],l1[1][3],l1[2][3],l2[0][3],l2[1][4]);

fa_wallace fa77(l1[0][4],l1[1][4],l1[2][4],l2[0][4],l2[1][5]);
assign l2[2][4]=l1[3][4];

fa_wallace fa78(l1[0][5],l1[1][5],l1[2][5],l2[0][5],l2[1][6]);

fa_wallace fa79(l1[0][6],l1[1][6],l1[2][6],l2[0][6],l2[1][7]);
assign l2[2][6]=l1[3][6];
assign l2[3][6]=l1[4][6];

fa_wallace fa80(l1[0][7],l1[1][7],l1[2][7],l2[0][7],l2[1][8]);
fa_wallace fa81(l1[3][7],l1[4][7],l1[5][7],l2[2][7],l2[3][8]);

fa_wallace fa82(l1[0][8],l1[1][8],l1[2][8],l2[0][8],l2[1][9]);
assign l2[2][8] = l1[3][8];
assign l2[4][8]=l1[4][8];

fa_wallace fa83(l1[0][9],l1[1][9],l1[2][9],l2[0][9],l2[1][10]);
fa_wallace fa84(l1[3][9],l1[4][9],l1[5][9],l2[2][9],l2[3][10]);
assign l2[3][9]= l1[6][9];

fa_wallace fa84a(l1[0][10],l1[1][10],l1[2][10],l2[0][10],l2[1][11]);
fa_wallace fa85(l1[3][10],l1[4][10],l1[5][10],l2[2][10],l2[3][11]);
assign l2[4][10]=l1[6][10];
assign l2[5][10]=l1[7][10];


fa_wallace fa86(l1[0][11],l1[1][11],l1[2][11],l2[0][11],l2[1][12]);
fa_wallace fa87(l1[3][11],l1[4][11],l1[5][11],l2[2][11],l2[3][12]);
assign l2[4][11]=l1[6][11];


fa_wallace fa88(l1[0][12],l1[1][12],l1[2][12],l2[0][12],l2[1][13]);
fa_wallace fa89(l1[3][12],l1[4][12],l1[5][12],l2[2][12],l2[3][13]);
fa_wallace fa90(l1[6][12],l1[7][12],l1[8][12],l2[4][12],l2[5][13]);

fa_wallace fa91(l1[0][13],l1[1][13],l1[2][13],l2[0][13],l2[1][14]);
fa_wallace fa92(l1[3][13],l1[4][13],l1[5][13],l2[2][13],l2[3][14]);
fa_wallace fa93(l1[6][13],l1[7][13],l1[8][13],l2[4][13],l2[5][14]);
assign l2[6][13]=l1[9][13];

fa_wallace fa94(l1[0][14],l1[1][14],l1[2][14],l2[0][14],l2[1][15]);
fa_wallace fa95(l1[3][14],l1[4][14],l1[5][14],l2[2][14],l2[3][15]);
fa_wallace fa96(l1[6][14],l1[7][14],l1[8][14],l2[4][14],l2[5][15]);

fa_wallace fa97(l1[0][15],l1[1][15],l1[2][15],l2[0][15],l2[1][16]);
fa_wallace fa98(l1[3][15],l1[4][15],l1[5][15],l2[2][15],l2[3][16]);
fa_wallace fa99(l1[6][15],l1[7][15],l1[8][15],l2[4][15],l2[5][16]);
assign l2[6][15]=l1[9][15];
assign l2[7][15]=l1[10][15];

fa_wallace fa100(l1[0][16],l1[1][16],l1[2][16],l2[0][16],l2[1][17]);
fa_wallace fa101(l1[3][16],l1[4][16],l1[5][16],l2[2][16],l2[3][17]);
fa_wallace fa102(l1[6][16],l1[7][16],l1[8][16],l2[4][16],l2[5][17]);
assign l2[6][16]=l1[9][16];

fa_wallace fa103(l1[0][17],l1[1][17],l1[2][17],l2[0][17],l2[1][18]);
fa_wallace fa104(l1[3][17],l1[4][17],l1[5][17],l2[2][17],l2[3][18]);
fa_wallace fa105(l1[6][17],l1[7][17],l1[8][17],l2[4][17],l2[5][18]);
assign l2[6][17]=l1[9][17];
assign l2[7][17]=l1[10][17];

fa_wallace fa105a(l1[0][18],l1[1][18],l1[2][18],l2[0][18],l2[1][19]);
fa_wallace fa106(l1[3][18],l1[4][18],l1[5][18],l2[2][18],l2[3][19]);
fa_wallace fa107(l1[6][18],l1[7][18],l1[8][18],l2[4][18],l2[5][19]);

fa_wallace fa108(l1[0][19],l1[1][19],l1[2][19],l2[0][19],l2[1][20]);
fa_wallace fa109(l1[3][19],l1[4][19],l1[5][19],l2[2][19],l2[3][20]);
assign l2[4][19]=l1[6][19];
assign l2[6][19]=l1[7][19];

fa_wallace fa110(l1[0][20],l1[1][20],l1[2][20],l2[0][20],l2[1][21]);
fa_wallace fa111(l1[3][20],l1[4][20],l1[5][20],l2[2][20],l2[3][21]);
fa_wallace fa112(l1[6][20],l1[7][20],l1[8][20],l2[4][20],l2[5][21]);

fa_wallace fa113(l1[0][21],l1[1][21],l1[2][21],l2[0][21],l2[1][22]);
fa_wallace fa114(l1[3][21],l1[4][21],l1[5][21],l2[2][21],l2[3][22]);
assign l2[4][21]=l1[6][21];

fa_wallace fa115(l1[0][22],l1[1][22],l1[2][22],l2[0][22],l2[1][23]);
fa_wallace fa116(l1[3][22],l1[4][22],l1[5][22],l2[2][22],l2[3][23]);

fa_wallace fa117(l1[0][23],l1[1][23],l1[2][23],l2[0][23],l2[1][24]);
fa_wallace fa118(l1[3][23],l1[4][23],l1[5][23],l2[2][23],l2[3][24]);
assign l2[4][23]=l1[6][23];

fa_wallace fa119(l1[0][24],l1[1][24],l1[2][24],l2[0][24],l2[1][25]);
assign l2[2][24]=l1[3][24];
assign l2[4][24]=l1[4][24];

fa_wallace fa120(l1[0][25],l1[1][25],l1[2][25],l2[0][25],l2[1][26]);
assign l2[2][25]=l1[3][25];

fa_wallace fa121(l1[0][26],l1[1][26],l1[2][26],l2[0][26],l2[1][27]);
assign l2[2][26]=l1[3][26];
assign l2[3][26]=l1[4][26];

fa_wallace fa122(l1[0][27],l1[1][27],l1[2][27],l2[0][27],l2[1][28]);

assign l2[0][28]=l1[0][28];
assign l2[2][28]=l1[1][28];


fa_wallace fa123(l1[0][29],l1[1][29],l1[2][29],l2[0][29],l2[1][30]);

assign l2[0][30]=l1[0][30];

//layer 3

assign l3[0][0]=l2[0][0];
assign l3[0][1]=l2[0][1];
assign l3[0][2]=l2[0][2];
ha_wallace ha3(l2[0][3],l2[1][3],l3[0][3],l3[1][4]);

fa_wallace fa124(l2[0][4],l2[1][4],l2[2][4],l3[0][4],l3[1][5]);

assign l3[0][5]=l2[0][5];
assign l3[2][5]=l2[1][5];

fa_wallace fa125(l2[0][6],l2[1][6],l2[2][6],l3[0][6],l3[1][7]);
assign l3[1][6]=l2[3][6];


fa_wallace fa126(l2[0][7],l2[1][7],l2[2][7],l3[0][7],l3[1][8]);


fa_wallace fa127(l2[0][8],l2[1][8],l2[2][8],l3[0][8],l3[1][9]);
assign l3[2][8]=l2[3][8];
assign l3[3][8]=l2[4][8];

fa_wallace fa128(l2[0][9],l2[1][9],l2[2][9],l3[0][9],l3[1][10]);
assign l3[2][9]=l2[3][9];


fa_wallace fa129(l2[0][10],l2[1][10],l2[2][10],l3[0][10],l3[1][11]);
fa_wallace fa130(l2[3][10],l2[4][10],l2[5][10],l3[2][10],l3[3][11]);

fa_wallace fa131(l2[0][11],l2[1][11],l2[2][11],l3[0][11],l3[1][12]);
assign l3[2][11]=l2[3][11];
assign l3[4][11]=l2[4][11];


fa_wallace fa132(l2[0][12],l2[1][12],l2[2][12],l3[0][12],l3[1][13]);
assign l3[2][12]=l2[3][12];
assign l3[3][12]=l2[4][12];

fa_wallace fa133(l2[0][13],l2[1][13],l2[2][13],l3[0][13],l3[1][14]);
fa_wallace fa134(l2[3][13],l2[4][13],l2[5][13],l3[2][13],l3[3][14]);
assign l3[3][13]=l2[6][13];

fa_wallace fa135(l2[0][14],l2[1][14],l2[2][14],l3[0][14],l3[1][15]);
fa_wallace fa136(l2[3][14],l2[4][14],l2[5][14],l3[2][14],l3[3][15]);

fa_wallace fa137(l2[0][15],l2[1][15],l2[2][15],l3[0][15],l3[1][16]);
fa_wallace fa138(l2[3][15],l2[4][15],l2[5][15],l3[2][15],l3[3][16]);
assign l3[4][15]=l2[6][15];
assign l3[5][15]=l2[7][15];

fa_wallace fa139(l2[0][16],l2[1][16],l2[2][16],l3[0][16],l3[1][17]);
fa_wallace fa140(l2[3][16],l2[4][16],l2[5][16],l3[2][16],l3[3][17]);
assign l3[4][16]=l2[6][16];

fa_wallace fa141(l2[0][17],l2[1][17],l2[2][17],l3[0][17],l3[1][18]);
fa_wallace fa142(l2[3][17],l2[4][17],l2[5][17],l3[2][17],l3[3][18]);
assign l3[4][17]=l2[6][17];
assign l3[5][17]=l2[7][17];

fa_wallace fa143(l2[0][18],l2[1][18],l2[2][18],l3[0][18],l3[1][19]);
fa_wallace fa144(l2[3][18],l2[4][18],l2[5][18],l3[2][18],l3[3][19]);

fa_wallace fa145(l2[0][19],l2[1][19],l2[2][19],l3[0][19],l3[1][20]);
fa_wallace fa146(l2[3][19],l2[4][19],l2[5][19],l3[2][19],l3[3][20]);
assign l3[4][19]=l2[6][19];

fa_wallace fa147(l2[0][20],l2[1][20],l2[2][20],l3[0][20],l3[1][21]);
assign l3[2][20]=l2[3][20];
assign l3[4][20]=l2[4][20];

fa_wallace fa148(l2[0][21],l2[1][21],l2[2][21],l3[0][21],l3[1][22]);
fa_wallace fa149(l2[3][21],l2[4][21],l2[5][21],l3[2][21],l3[3][22]);

fa_wallace fa150(l2[0][22],l2[1][22],l2[2][22],l3[0][22],l3[1][23]);
assign l3[2][22]=l2[3][22];

fa_wallace fa151(l2[0][23],l2[1][23],l2[2][23],l3[0][23],l3[1][24]);
assign l3[2][23]=l2[3][23];
assign l3[3][23]=l2[4][23];

fa_wallace fa152(l2[0][24],l2[1][24],l2[2][24],l3[0][24],l3[1][25]);
assign l3[2][24]=l2[3][24];
assign l3[3][24]=l2[4][24];

fa_wallace fa153(l2[0][25],l2[1][25],l2[2][25],l3[0][25],l3[1][26]);

fa_wallace fa154(l2[0][26],l2[1][26],l2[2][26],l3[0][26],l3[1][27]);
assign l3[2][26]=l2[3][26];

assign l3[0][27]=l2[0][27];
assign l3[2][27]=l2[1][27];

fa_wallace fa155(l2[0][28],l2[1][28],l2[2][28],l3[0][28],l3[1][29]);

assign l3[0][29]=l2[0][29];
assign l3[0][30]=l2[0][30];
assign l3[1][30]=l2[1][30];

//layer 4

assign l4[0][0]=l3[0][0];

assign l4[0][1]=l3[0][1];

assign l4[0][2]=l3[0][2];

assign l4[0][3]=l3[0][3];

ha_wallace ha4(l3[0][4],l3[1][4],l4[0][4],l4[1][5]);

fa_wallace fa156(l3[0][5],l3[1][5],l3[2][5],l4[0][5],l4[1][6]);

assign l4[0][6]=l3[0][6];
assign l4[2][6]=l3[1][6];

assign l4[0][7]=l3[0][7];
assign l4[1][7]=l3[1][7];

fa_wallace fa157(l3[0][8],l3[1][8],l3[2][8],l4[0][8],l4[1][9]);
assign l4[1][8]=l3[3][8];

fa_wallace fa158(l3[0][9],l3[1][9],l3[2][9],l4[0][9],l4[1][10]);

fa_wallace fa159(l3[0][10],l3[1][10],l3[2][10],l4[0][10],l4[1][11]);

fa_wallace fa160(l3[0][11],l3[1][11],l3[2][11],l4[0][11],l4[1][12]);
assign l4[2][11]=l3[3][11];
assign l4[3][11]=l3[4][11];

fa_wallace fa161(l3[0][12],l3[1][12],l3[2][12],l4[0][12],l4[1][13]);
assign l4[2][12]=l3[3][12];

fa_wallace fa162(l3[0][13],l3[1][13],l3[2][13],l4[0][13],l4[1][14]);
assign l4[2][13]=l3[3][13];

fa_wallace fa163(l3[0][14],l3[1][14],l3[2][14],l4[0][14],l4[1][15]);
assign l4[2][14]=l3[3][14];

fa_wallace fa164(l3[0][15],l3[1][15],l3[2][15],l4[0][15],l4[1][16]);
fa_wallace fa165(l3[3][15],l3[4][15],l3[5][15],l4[2][15],l4[3][16]);

fa_wallace fa166(l3[0][16],l3[1][16],l3[2][16],l4[0][16],l4[1][17]);
ha_wallace ha5(l3[3][16],l3[4][16],l4[2][16],l4[3][17]);

fa_wallace fa167(l3[0][17],l3[1][17],l3[2][17],l4[0][17],l4[1][18]);
fa_wallace fa168(l3[3][17],l3[4][17],l3[5][17],l4[2][17],l4[3][18]);

fa_wallace fa169(l3[0][18],l3[1][18],l3[2][18],l4[0][18],l4[1][19]);
assign l4[2][18]=l3[3][18];

fa_wallace fa170(l3[0][19],l3[1][19],l3[2][19],l4[0][19],l4[1][20]);
assign l4[2][19]=l3[3][19];
assign l4[3][19]=l3[4][19];

fa_wallace fa171(l3[0][20],l3[1][20],l3[2][20],l4[0][20],l4[1][21]);
assign l4[2][20]=l3[3][20];
assign l4[3][20]=l3[4][20];

fa_wallace fa172(l3[0][21],l3[1][21],l3[2][21],l4[0][21],l4[1][22]);

fa_wallace fa173(l3[0][22],l3[1][22],l3[2][22],l4[0][22],l4[1][23]);
assign l4[2][22]=l3[3][22];

fa_wallace fa174(l3[0][23],l3[1][23],l3[2][23],l4[0][23],l4[1][24]);
assign l4[2][23]=l3[3][23];

fa_wallace fa175(l3[0][24],l3[1][24],l3[2][24],l4[0][24],l4[1][25]);
assign l4[2][24]=l3[3][24];

assign l4[0][25]=l3[0][25];
assign l4[2][25]=l3[1][25];

fa_wallace fa176(l3[0][26],l3[1][26],l3[2][26],l4[0][26],l4[1][27]);

fa_wallace fa177(l3[0][27],l3[1][27],l3[2][27],l4[0][27],l4[1][28]);

assign l4[0][28]=l3[0][28];

assign l4[0][29]=l3[0][29];
assign l4[1][29]=l3[1][29];


assign l4[0][30]=l3[0][30];
assign l4[1][30]=l3[1][30];

//layer 5

assign l5[0][0]=l4[0][0];
assign l5[0][1]=l4[0][1];
assign l5[0][2]=l4[0][2];
assign l5[0][3]=l4[0][3];
assign l5[0][4]=l4[0][4];

ha_wallace ha6(l4[0][5],l4[1][5],l5[0][5],l5[1][6]);

fa_wallace fa178(l4[0][6],l4[1][6],l4[2][6],l5[0][6],l5[1][7]);

assign l5[0][7]=l4[0][7];
assign l5[2][7]=l4[1][7];

assign l5[0][8]=l4[0][8];
assign l5[1][8]=l4[1][8];

assign l5[0][9]=l4[0][9];
assign l5[1][9]=l4[1][9];

assign l5[0][10]=l4[0][10];
assign l5[1][10]=l4[1][10];

fa_wallace fa179(l4[0][11],l4[1][11],l4[2][11],l5[0][11],l5[1][12]);
assign l5[1][11]=l4[3][11];

fa_wallace fa180(l4[0][12],l4[1][12],l4[2][12],l5[0][12],l5[1][13]);

fa_wallace fa181(l4[0][13],l4[1][13],l4[2][13],l5[0][13],l5[1][14]);

fa_wallace fa182(l4[0][14],l4[1][14],l4[2][14],l5[0][14],l5[1][15]);

fa_wallace fa183(l4[0][15],l4[1][15],l4[2][15],l5[0][15],l5[1][16]);

fa_wallace fa184(l4[0][16],l4[1][16],l4[2][16],l5[0][16],l5[1][17]);
assign l5[2][16]=l4[3][16];

fa_wallace fa185(l4[0][17],l4[1][17],l4[2][17],l5[0][17],l5[1][18]);
assign l5[2][17]=l4[3][17];

fa_wallace fa186(l4[0][18],l4[1][18],l4[2][18],l5[0][18],l5[1][19]);
assign l5[2][18]=l4[3][18];

fa_wallace fa187(l4[0][19],l4[1][19],l4[2][19],l5[0][19],l5[1][20]);
assign l5[2][19]=l4[3][19];

fa_wallace fa188(l4[0][20],l4[1][20],l4[2][20],l5[0][20],l5[1][21]);
assign l5[2][20]=l4[3][20];

assign l5[0][21]=l4[0][21];
assign l5[2][21]=l4[1][21];

fa_wallace fa189(l4[0][22],l4[1][22],l4[2][22],l5[0][22],l5[1][23]);

fa_wallace fa190(l4[0][23],l4[1][23],l4[2][23],l5[0][23],l5[1][24]);

fa_wallace fa191(l4[0][24],l4[1][24],l4[2][24],l5[0][24],l5[1][25]);

fa_wallace fa192(l4[0][25],l4[1][25],l4[2][25],l5[0][25],l5[1][26]);

assign l5[0][26]=l4[0][26];

assign l5[0][27]=l4[0][27];
assign l5[1][27]=l4[1][27];

assign l5[0][28]=l4[0][28];
assign l5[1][28]=l4[1][28];

assign l5[0][29]=l4[0][29];
assign l5[1][29]=l4[1][29];

assign l5[0][30]=l4[0][30];
assign l5[1][30]=l4[1][30];

//layer 6

assign l6[0][0]=l5[0][0];

assign l6[0][1]=l5[0][1];

assign l6[0][2]=l5[0][2];

assign l6[0][3]=l5[0][3];

assign l6[0][4]=l5[0][4];

assign l6[0][5]=l5[0][5];

ha_wallace ha7(l5[0][6],l5[1][6],l6[0][6],l6[1][7]);

fa_wallace fa193(l5[0][7],l5[1][7],l5[2][7],l6[0][7],l6[1][8]);

ha_wallace ha8(l5[0][8],l5[1][8],l6[0][8],l6[1][9]);

ha_wallace ha9(l5[0][9],l5[1][9],l6[0][9],l6[1][10]);

ha_wallace ha10(l5[0][10],l5[1][10],l6[0][10],l6[1][11]);

ha_wallace ha11(l5[0][11],l5[1][11],l6[0][11],l6[1][12]);

ha_wallace ha12(l5[0][12],l5[1][12],l6[0][12],l6[1][13]);

ha_wallace ha13(l5[0][13],l5[1][13],l6[0][13],l6[1][14]);

ha_wallace ha14(l5[0][14],l5[1][14],l6[0][14],l6[1][15]);

ha_wallace ha15(l5[0][15],l5[1][15],l6[0][15],l6[1][16]);

fa_wallace fa194(l5[0][16],l5[1][16],l5[2][16],l6[0][16],l6[1][17]);

fa_wallace fa195(l5[0][17],l5[1][17],l5[2][17],l6[0][17],l6[1][18]);

fa_wallace fa196(l5[0][18],l5[1][18],l5[2][18],l6[0][18],l6[1][19]);

fa_wallace fa197(l5[0][19],l5[1][19],l5[2][19],l6[0][19],l6[1][20]);

fa_wallace fa198(l5[0][20],l5[1][20],l5[2][20],l6[0][20],l6[1][21]);

fa_wallace fa199(l5[0][21],l5[1][21],l5[2][21],l6[0][21],l6[1][22]);

assign l6[0][22]=l5[0][22];

assign l6[0][23]=l5[0][23];
assign l6[1][23]=l5[1][23];

assign l6[0][24]=l5[0][24];
assign l6[1][24]=l5[1][24];

assign l6[0][25]=l5[0][25];
assign l6[1][25]=l5[1][25];

assign l6[0][26]=l5[0][26];
assign l6[1][26]=l5[1][26];

assign l6[0][27]=l5[0][27];
assign l6[1][27]=l5[1][27];

assign l6[0][28]=l5[0][28];
assign l6[1][28]=l5[1][28];

assign l6[0][29]=l5[0][29];
assign l6[1][29]=l5[1][29];

assign l6[0][30]=l5[0][30];
assign l6[1][30]=l5[1][30];

assign l6[1][0]=1'b0;
assign l6[1][1]=1'b0;
assign l6[1][2]=1'b0;
assign l6[1][6]=1'b0;
assign l6[1][3]=1'b0;
assign l6[1][4]=1'b0;
assign l6[1][5]=1'b0;

generate
for(i=0;i<16;i=i+1) begin: loop4
assign partial_prod[i][31]=1'b0;
end
endgenerate

generate
for(i=0;i<13;i=i+1) begin: loop5
assign l1[i][31]=1'b0;
end
endgenerate

generate
for(i=0;i<9;i=i+1) begin: loop6
assign l2[i][31]=1'b0;
end
endgenerate

generate
for(i=0;i<6;i=i+1) begin: loop7
assign l3[i][31]=1'b0;
end
endgenerate

generate
for(i=0;i<4;i=i+1) begin: loop8
assign l4[i][31]=1'b0;
end
endgenerate

generate
for(i=0;i<3;i=i+1) begin: loop9
assign l5[i][31]=1'b0;
end
endgenerate

generate
for(i=0;i<2;i=i+1) begin: loop10
assign l6[i][31]=1'b0;
end
endgenerate

bk_adder bk(l6[0],l6[1],out,1'b0);
/////////ripple carry adder/////////////////////
//assign out[0]=l6[0][0];
//assign out[1]=l6[0][1];
//assign out[2]=l6[0][2];
//assign out[3]=l6[0][3];
//assign out[4]=l6[0][4];
//assign out[5]=l6[0][5];
//assign out[6]=l6[0][6];
//ha_wallace hax16(l6[0][7],l6[1][7],out[7],cout[0]);
//fa_wallace far1(l6[0][8],l6[1][8],cout[0],out[8],cout[1]);
//fa_wallace far2(l6[0][9],l6[1][9],cout[1],out[9],cout[2]);
//fa_wallace far3(l6[0][10],l6[1][10],cout[2],out[10],cout[3]);
//fa_wallace far4(l6[0][11],l6[1][11],cout[3],out[11],cout[4]);
//fa_wallace far5(l6[0][12],l6[1][12],cout[4],out[12],cout[5]);
//fa_wallace far6(l6[0][13],l6[1][13],cout[5],out[13],cout[6]);
//fa_wallace far7(l6[0][14],l6[1][14],cout[6],out[14],cout[7]);
//fa_wallace far8(l6[0][15],l6[1][15],cout[7],out[15],cout[8]);
//
// 
//
//fa_wallace far9(l6[0][16],l6[1][16],cout[8],out[16],cout[9]);
//fa_wallace far10(l6[0][17],l6[1][17],cout[9],out[17],cout[10]);
//fa_wallace far11(l6[0][18],l6[1][18],cout[10],out[18],cout[11]);
//fa_wallace far12(l6[0][19],l6[1][19],cout[11],out[19],cout[12]);
//fa_wallace far13(l6[0][20],l6[1][20],cout[12],out[20],cout[13]);
//fa_wallace far14(l6[0][21],l6[1][21],cout[13],out[21],cout[14]);
//fa_wallace far15(l6[0][22],l6[1][22],cout[14],out[22],cout[15]);
//fa_wallace far16(l6[0][23],l6[1][23],cout[15],out[23],cout[16]);
//fa_wallace far17(l6[0][24],l6[1][24],cout[16],out[24],cout[17]);
//
// 
//
//fa_wallace far18(l6[0][25],l6[1][25],cout[17],out[25],cout[18]);
//fa_wallace far19(l6[0][26],l6[1][26],cout[18],out[26],cout[19]);
//fa_wallace far20(l6[0][27],l6[1][27],cout[19],out[27],cout[20]);
//fa_wallace far21(l6[0][28],l6[1][28],cout[20],out[28],cout[21]);
//fa_wallace far22(l6[0][29],l6[1][29],cout[21],out[29],cout[22]);
//fa_wallace far23(l6[0][30],l6[1][30],cout[22],out[30],cout[23]);
//
// 
//
//assign out[31]=cout[23];


endmodule












































	