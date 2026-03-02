`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.03.2026 09:20:19
// Design Name: 
// Module Name: my_mux
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


module my_mux(
    input wire X,
    input wire Y,
    output wire Z,
    input wire S
    );
    
    assign Z = (X & S) | (Y & (-S));
endmodule


