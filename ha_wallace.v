module ha_wallace(a,b,sum,cout);
input a,b;
output sum,cout;

assign sum=a^b;
assign cout=a&b;

endmodule
