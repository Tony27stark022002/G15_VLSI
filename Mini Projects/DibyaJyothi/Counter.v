module counter_a_b(counta,countb,clk);
input clk;
//output reg clk;
output reg [3:0] counta,countb;
//always #5 clk=~clk;
initial begin
//clk=1;
counta<=4'b0000;
countb<=4'b1111;
end
always @(posedge clk)
begin
counta<=counta+1;
if(counta==4'b1100)
begin
counta<=4'b0000;
countb<=countb-1;
end
end
endmodule
