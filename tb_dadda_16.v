`timescale 1ns/1ps
module tb_dadda_16;
reg [15:0]mpd,mpr;
reg clk;
wire [32:0] op;
reg [32:0] golden_result=33'b0;
integer i,j;
reg success_flag=1'b1;
/*wire l1[12:0][31:0];
wire l2[8:0][31:0];
wire l3[5:0][31:0];
wire l4[3:0][31:0];
wire l5[2:0][31:0];
wire l6[1:0][31:0];
wire [29:0]cout;*/
//wire [31:0] l1;
//wire [31:0] l2;
//wire [31:0] l3;
//wire [31:0] l4;
//wire [31:0] l5;
//wire [31:0] l6;
//wire [29:0] cout;
dadda_16_16 dut(mpd,mpr,op,clk);

initial clk=1'b0;
always #1 clk=~clk;
initial
begin
#6;
	for(i=0;i<2**8;i=i+1) begin
		for(j=0;j<2**8;j=j+1) begin
			mpd=i;
			mpr=j;
			#5 golden_result=i*j;
			if(golden_result!=op) success_flag=1'b0;
			#10;
			end
		end
	end
	
initial 
#1000000 $stop;

			
endmodule
