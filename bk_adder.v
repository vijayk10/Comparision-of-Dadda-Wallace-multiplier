module bk_adder(inp_a,inp_b,out,inp_carry);
parameter nLayer=5;
parameter N=2**(nLayer-1);
input [N-1:0] inp_a,inp_b;
input inp_carry;
output [N:0] out;


wire [N-1:0] P [N-1:0];// 0 - first and so on
wire [N-1:0] G [N-1:0];
wire [N-1:0] carry_intermediate;

// first stage

assign carry_intermediate[0] = inp_carry;
assign P[0] = inp_a ^ inp_b;
assign G[0] = inp_a & inp_b;

// further stage
genvar i,j;

generate
	for(i=1;i<nLayer;i=i+1) begin : outer
		for(j=0;j<(N/(2**i));j=j+1) begin : inner
			assign P[i][j]=P[i-1][2*j] & P[i-1][(2*j)+1];
			assign G[i][j]=G[i-1][(2*j)+1] | (P[i-1][(2*j)+1] & G[i-1][2*j]);
		end
	end
endgenerate



assign out[N]= G[nLayer-1][0] | (P[nLayer-1][0] & inp_carry);	

genvar l;

generate
	for(l=1;l<N;l=l+2) begin : odd_carry
		assign carry_intermediate[l] = G[0][l-1] | (P[0][l-1] & carry_intermediate[l-1]);
	end
endgenerate

generate
	for(l=2;l<N;l=l+2) begin : even_carry
		assign carry_intermediate[l] = G[1][(l/2)-1] | (P[1][(l/2)-1] & carry_intermediate[l-2]);
	end
endgenerate

assign out[N-1:0] = P[0] ^ carry_intermediate;

endmodule
		
		
		


