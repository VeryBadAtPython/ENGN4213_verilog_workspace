module FSM_controller(
    input wire clk,
    input wire reset,
    input wire beat,
    input wire capture, // Indicate if capture is to start
    output reg fsm_beat_enable, // Indicate if capture is done
    output reg fsm_reg_enable,
    output reg blink_active  
    );


// Define states
reg [1:0] state, nextstate; 
reg [3:0] sample_count;
parameter IDLE=2'b00, CAPT=2'b01, DONE=2'b10; 


// Sequential state update logic
always @ (posedge clk) begin
    if(reset)
        state<=IDLE; //assuming "idle" is the safe reset state
    else   
        state<=nextstate;
end

// Sequentual counting up to 8
always @(posedge clk) begin
    if (state==CAPT) begin
        if (beat) sample_count <= sample_count + 1;
        else sample_count <= sample_count;
    end
    else sample_count <= 0;
end


// Next state logic
always @ (*) begin
    case(state)
        IDLE: begin
            if (capture) nextstate=CAPT;
            else nextstate=IDLE;
        end
        CAPT: begin
            if (sample_count>=4'd8) begin
                nextstate=IDLE;
            end
            else nextstate=CAPT;
        end
        //DONE: begin
        //    nextstate=DONE; // Reset transition back to IDLE handles sequentially
        //end
        default: nextstate=IDLE;
    endcase
end


// ---
// OUTPUT LOGIC: combinational
// describes outputs at each state  
// Moore vs Mealy machines:
//    if a Moore machine is being modelled, outputs will be coded as values
//    if a Mealy machine is being modelled, outputs may also include input signals
// ---
reg idle_prev;
always @(posedge clk) begin
    if (reset) begin
        idle_prev <= 0;
        fsm_reg_enable <= 0;
    end else begin
        idle_prev <= (state == IDLE);
        fsm_reg_enable <= (state == IDLE) && !idle_prev;
    end
end

//always @ (*) begin
//    case(state)
//        IDLE: begin
//           blink_active=0;
//           fsm_beat_enable=0;
//        end
//        CAPT: begin
//            blink_active=1;
//            fsm_beat_enable=1;
//        end
//        DONE: begin
//            blink_active=0;
//            fsm_beat_enable=0;
//        end
//        default: begin
//            blink_active=0;
//            fsm_beat_enable=0;
//        end
//    endcase
//end

endmodule
