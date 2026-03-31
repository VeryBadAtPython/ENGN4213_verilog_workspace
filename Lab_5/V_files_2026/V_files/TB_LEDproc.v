`timescale 1ns/1ps

module TB_LEDproc;

  reg [3:0] count;
  reg acc_grant;
  wire [3:0] LEDs;

  // Instantiate the UUT
  LEDproc uut (
    .count(count),
    .acc_grant(acc_grant),
    .LEDs(LEDs)
  );

  // Stimulus
  initial begin
    // Initialise
    count = 0;
    acc_grant = 0;

    // Ramp count while access granted OFF
    repeat (8) begin
      #10 count = count + 1;
    end

    // Ramp count while access granted ON
    #10 acc_grant = 1;
    count = 0;
    repeat (8) begin
      #10 count = count + 1;
    end
	
	#10 count = 0;
	
	#100
	$finish;
  end

endmodule