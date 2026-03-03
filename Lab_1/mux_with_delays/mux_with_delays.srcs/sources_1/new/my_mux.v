`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.03.2026 10:31:25
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
    
    wire A, B, C, D;
    assign #5 C = (~S);
    assign #5 A = X & S;
    assign #5 B = Y & C;
    assign #5 D = X & Y;
    assign #5 Z = A | B | D;
endmodule
