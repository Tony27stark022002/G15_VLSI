module neg_pos_edge(clk,neg_count,pos_count);
output reg clk;
output reg [15:0]pos_count;
output reg [15:0]neg_count;
always #5 clk=~clk;
initial 
begin
clk=1;
pos_count=16'b0;
neg_count=16'b0;
end
always@(posedge clk)
begin
pos_count=pos_count+1'b1;
end
always@(negedge clk)
begin
neg_count=neg_count+1'b1;
end
endmodule