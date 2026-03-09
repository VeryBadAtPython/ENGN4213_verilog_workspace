`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.03.2026 09:58:22
// Design Name: 
// Module Name: my_adder
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


module full_adder(
    input wire X,
    input wire Y,
    input wire Cin,
    output wire Z,
    output wire Cout
    );
    
    assign Z = X ^ Y ^ Cin;
    assign Cout = (X & Y) | (Y & Cin) | (X & Cin);
endmodule
