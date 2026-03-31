`timescale 1ns/1ps

module tb_doorshut;

  reg reset;
  reg closed_sw;
  reg sysclk;
  wire closed_fsm;

  // Instantiate the system
  // REMEMBER: temporarily adjust your debouncer heartbeat parameter 
  // (within the module) to reduce simulation time
  doorshut uut (
    .reset(reset),
    .closed_sw(closed_sw),
    .sysclk(sysclk),
    .closed_fsm(closed_fsm)
  );

  // Clock generation: 10ns period (100MHz)
  initial sysclk = 0;
  always #5 sysclk = ~sysclk;

  // Stimulus
  initial begin
    // Initialize signals
    reset = 1;
    closed_sw = 0;

    // Apply reset
    #20;
    reset = 0;

    // Toggle closed_sw after some time
    #50;
    closed_sw = 1;  // Door closes
    #200;
    closed_sw = 0;  // Door opens
    #200;
    closed_sw = 1;  // Door closes again

    // Finish simulation
    #500;
    $finish;
  end

endmodule