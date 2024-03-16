`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.01.2024 18:44:28
// Design Name: 
// Module Name: parityencoder
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


module parityencoder(
input wire [3:0] data_in,  // 4-bit data input
  output reg parity_out      // Parity bit output
);

  always @* begin
    // Calculate even parity
    parity_out = (data_in[0] ^ data_in[1] ^ data_in[2] ^ data_in[3]) ? 1'b1 : 1'b0;
  end

endmodule
