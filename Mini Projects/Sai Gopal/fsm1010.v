`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.01.2024 10:57:42
// Design Name: 
// Module Name: fsm1010
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


module fsm1010(
output dout,
input clk,
input rst,
input din
);
localparam [2:0] s0=0, s1=1, s2=2, s3=3, s4=4;
reg [2:0] state, next_state;
always@(posedge clk)
begin
 if(rst)
   state <=3'b000;
 else
   state <= next_state;
end
always@(*) begin
next_state = state;
case(state)
s0: next_state <=din ? s1 : s0 ;
s1: next_state <=din ? s1 : s2 ;
s2: next_state <=din ? s3 : s0 ;
s3: next_state <=din ? s1 : s4 ;
s4: next_state <=din ? s1 : s0 ;  //non-overlapping
// s4: next_state <=i_btn ? s3 : s0 ; //overlapping
endcase
end
assign dout = (state == s4);
endmodule
