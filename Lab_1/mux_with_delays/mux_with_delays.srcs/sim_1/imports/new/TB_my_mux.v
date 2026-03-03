`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.03.2026 09:27:58
// Design Name: 
// Module Name: TB_my_mux
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

`timescale 1ns / 1ps  // timestep duration and time precision

module TB_my_mux;

    // Inputs to Unit Under Test (UUT)
    reg X;
    reg S;
    reg Y;

    // Output from UUT
    wire Z;

    // Instantiate the design to be tested - ensure module name matches!
    my_mux UUT (   // Instance name ('UUT') can be anything
        .X(X),
        .S(S),
        .Y(Y),
        .Z(Z)
    );

    // Duration of simulation (300 timesteps)
    initial begin : stopat
        #300;
        $finish;
    end

    // Signal stimulus
    initial begin
        X = 1'b0;
        Y = 1'b1;
        S = 1'b1;

        #30 X = 1'b1;
        #30 S = 1'b0;
        #30 Y = 1'b0;

        #30 X = 1'b0;
        #30 Y = 1'b1;
        #30 S = 1'b1;

        #30 X = 1'b1;
        #30 Y = 1'b0;
        #30 S = 1'b0;
    end

endmodule