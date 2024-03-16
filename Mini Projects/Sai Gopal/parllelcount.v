`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.01.2024 12:24:50
// Design Name: 
// Module Name: parllelcount
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


module parllelcount(count,count2,led,clk,rst);
output [3:0]count;
output [3:0]count2;
output reg led;
input clk,rst;
reg [3:0]count;
reg [3:0]count2;
always@(negedge clk)
if(rst==1)
begin
  count<=4'b0000;
  count2<=4'b1111;
  end
  else if(count==4'b1100)
  begin
  count<=4'b0000;
  count2<=count2-1;
  led<=1'b1;
  #2
  led<=1'b0;
  
  end
 else
  count<=count+1;
endmodule
