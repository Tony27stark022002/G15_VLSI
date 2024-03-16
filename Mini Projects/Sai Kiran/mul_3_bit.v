`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.01.2024 15:27:16
// Design Name: 
// Module Name: mul_3_bit
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


module mul_3_bit(a,b,res);
input [2:0]a;
input [2:0]b;
output [5:0]res;

wire [2:0]pp1;
wire [3:0]pp2;
wire [4:0]pp3;
wire [5:0]s1;
wire [5:0]s2;


//PARTIAL PRODUCT GENERATION

assign pp1={3{a[0]}}&b;
assign pp2={3{a[1]}}&b;
assign pp3={3{a[2]}}&b;


//PARTIAL PRODUCT REDUCTION AND ADDITION

assign s1=pp1+(pp2<<1);
assign s2=s1+(pp3<<2);


//RESULT

assign res=s2;

endmodule

