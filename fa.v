module fa(input x,y,z,output sum2,cy2);
assign sum2=x^y^z;
assign cy2=(x&y) | (y&z) | (z&x);
endmodule
