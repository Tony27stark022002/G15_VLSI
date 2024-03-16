`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.01.2024 15:25:13
// Design Name: 
// Module Name: edge_detector
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module edge_detector(clk,neg_count,pos_count);
input clk;
output reg [15:0]pos_count;
output reg [15:0]neg_count;
initial
begin
pos_count=16'b0;
neg_count=16'b0;
end
always@(posedge clk)
begin
pos_count<=pos_count+1;
end
always@(negedge clk)
begin
neg_count<=neg_count+1;
end
endmodule

