`timescale 1ns / 1ps



module TEST_overflowClockDivider(
    );
    
reg clk; 

initial begin 
    clk = 0;
    forever #4 clk=~clk; //clock generation with period 8ns (125MHz)
end

reg reset, enable;
wire dclk;

overflowClockDivider UUT (.clk(clk),.reset(reset),.enable(enable),.dividedClk(dclk)); //instantiation of module to test

initial begin // simulation inputs to block
    reset=0;
    enable=0;
    #7 reset = 1; //assert reset earlier to reduce the length of unkown in output
    #24 enable = 1;
    #5 reset = 0;
end

endmodule
