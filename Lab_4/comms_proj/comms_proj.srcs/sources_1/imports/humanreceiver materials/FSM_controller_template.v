module FSM_controller(
    input wire clk,
    input wire reset,
        // add other inputs and outputs as required
    output reg blink_active  
    );


// this definition of the state register allows for up to 4 states. 
// if more are needed, expand the bit size accordingly   
reg [2:0] state, nextstate; 

// using parameters to define the state names allows me to code more intuitively
parameter IDLE=2'b00; 


// ---
// STATE UPDATE LOGIC: sequential
// it is usually a simple register update step, with a reset override option  
// ---
always @ (posedge clk) begin
    if(reset)
        state<=IDLE; //assuming "idle" is the safe reset state
    else   
        state<=nextstate;
end


// ---
// NEXT STATE LOGIC: combinational
// describes the relationships between inputs and state evolution
// ---
always @ (*) begin
    case(state)
        IDLE: begin
            // TO DO: fill and continue with the other states
        end 
    endcase
end


// ---
// OUTPUT LOGIC: combinational
// describes outputs at each state  
// Moore vs Mealy machines:
//    if a Moore machine is being modelled, outputs will be coded as values
//    if a Mealy machine is being modelled, outputs may also include input signals
// ---
always @ (*) begin
    case(state)
        IDLE: begin
           blink_active = 0;
           // TO DO: fill and continue with the other states
        end
    endcase
end

endmodule
