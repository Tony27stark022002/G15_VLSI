`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.01.2024 15:44:52
// Design Name: 
// Module Name: seq_det
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


module seq_det(output reg y,input x,clk);
parameter s0=0,s1=1,s2=2,s3=3;
reg [0:1]state;
initial
begin
  state=s0;
  end
always@(posedge clk)
case(state)
 s0:begin
    state<=x?s0:s1;
    y<=1'b0;
    end
 s1:begin
    state<=x?s2:s1;
    y<=1'b0;
    end
 s2:begin
    state<=x?s3:s1;
    y<=1'b0;
    end
 s3:begin
   state<=x?s0:s1;
   y<=x?0:1;
   end
endcase
endmodule


