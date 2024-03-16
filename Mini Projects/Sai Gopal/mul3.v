`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.01.2024 11:17:05
// Design Name: 
// Module Name: mul3
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


module mul3(a,b,p);
input [2:0] a ;
input [2:0] b ;
output [3:0] p;
wire pp1,pp2,pp3,pp4,pp5,pp6,pp7,pp8,c0,pa1,pca1,c1,c2;
assign p[0]=a[0]&b[0];
assign pp1=a[1]&b[0];
assign pp2=a[2]&b[0];
assign pp3=a[0]&b[1];
assign pp4=a[1]&b[1];
assign pp5=a[2]&b[1];
assign pp6=a[0]&b[2];
assign pp7=a[1]&b[2];
assign pp8=a[2]&b[2];

halfadder h1(pp1,pp3,p[1],c0);
fulladder f1(pp2,pp4,c0,pa1,pca1);
fulladder f2(pp6,pa1,pca1,p[2],c1);
fulladder f3(pp5,pp7,c1,p[3],c2);
halfadder h2(pp8,c2,p[4],p[5]);

endmodule

module halfadder(x,y,s,c);
input x,y;
output s,c;
assign s=x^y;
assign c=x&y;
endmodule

module fulladder(e,f,g,su,ca);
input e,f,g;
output su,ca;
assign su=e^f^g;
assign ca=((e^f)&g)|(e&f);
endmodule