`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.01.2024 15:23:43
// Design Name: 
// Module Name: counter
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


module counter(clk,rst,count1,count2);
  input clk;
  input rst;
  output reg [3:0]count1;
  output reg [3:0]count2;

  
  always@(posedge clk)
    begin

  if (rst==1) begin
    count1=4'b0000;
    count2=4'b1111;
  end
  else if(count1==4'b1100)
    begin
      count2<=count2-1;
      count1<=4'b0000;
      end
      else
        count1<=count1+1;
    end
    
endmodule

