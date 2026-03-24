`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.03.2026 09:12:16
// Design Name: 
// Module Name: MicrowaveFSM
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


module MicrowaveFSM(
    input wire clk, enter, reset,
    input wire [3:0] SW,
    output wire [3:0] LED
);
    
    // Debounce enter
    wire enter_db;
    debouncer db (
        .switchIn(enter),
        .clk(clk),
        .reset(reset),
        .debounceout(enter_db)
    );
    reg last_enter;
    always @(posedge clk) begin
        if (reset) last_enter <= 1'b0;
        else last_enter <= enter_db;
    end
    wire enter_SPOT;
    assign enter_SPOT = (~last_enter) && enter_db;
    
    // Instantiate FSM
    FSM mic_fsm (
    .clk(clk),
    .enter(enter_SPOT),
    .reset(reset),
    .SW(SW),
    .LED(LED)
    );
    
endmodule
