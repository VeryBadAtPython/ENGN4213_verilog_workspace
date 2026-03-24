`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.03.2026 09:15:06
// Design Name: 
// Module Name: FSM
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


module FSM(
    input wire clk, enter, reset,
    input wire [3:0] SW,
    output reg [3:0] LED
);
    // Declare state parameters
    parameter IDLE=2'd0, COOK=2'd1, SET_TIMER=2'd2, ALARM=2'd3;
    
    // Setup state registers
    reg [1:0] state, nextstate;
    
    // Next state logic
    always @(posedge clk) begin
        // Reset logic
        if (reset) state <= IDLE;
        else state <= nextstate;
    end
    
    // Heartbeat instatiation
    // On entry to cook state reset -> 0 and enable -> 1
    wire beat;
    reg divided_clk_reset, divided_clk_enable;
    
    always @(*) begin
        divided_clk_reset  = (state != COOK);
        divided_clk_enable = (state == COOK);
    end
    
    hb_slow hb_inst (
        .clk(clk),
        .reset(divided_clk_reset),
        .enable(divided_clk_enable),
        .dividedClk(),
        .beat(beat)
    );
    
    // LED count logic
    reg [3:0] ledcount;
    always @(posedge clk) begin
        if (state==SET_TIMER) ledcount <= SW;
        else if ((state==COOK) && beat) ledcount <= ledcount >> 1;
    end
    
    
    // FSM transition logic
    always @(*) begin
        case(state)
            // If IDLE we stay idle inless moved to set timer
            IDLE: begin
                if(enter) nextstate= SET_TIMER;
                else nextstate=IDLE;
            end
            // If set time we stay unless directed to cook
            SET_TIMER: begin
                if(enter) nextstate= COOK;
                else nextstate=SET_TIMER;
            end
            // If Alarm we stay alarm unless enetered to idle
            ALARM: begin
                if(enter) nextstate= IDLE;
                else nextstate=ALARM;
            end
            // If COOK and timer ends we exit to ALARM
            COOK: begin
                if(ledcount == 4'b0000) nextstate=ALARM;
                else nextstate= COOK;
            end
        endcase
    end
    
    // Flashing LED logic
    reg [3:0] ledtoggle;
    always @(posedge clk) begin
        if (reset) ledtoggle <= 4'b1111;
        else if (beat) ledtoggle <= ~ledtoggle;
    end
    
    // Output logic
    always @(*) begin
        case(state)
            IDLE: LED = 4'b0000;
            SET_TIMER: LED = SW;
            COOK: LED = ledcount;
            ALARM: LED = ledtoggle;
            default: LED = 4'b1111;
        endcase
    end
    
endmodule
