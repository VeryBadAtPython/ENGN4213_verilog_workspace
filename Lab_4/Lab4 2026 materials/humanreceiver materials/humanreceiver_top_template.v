module humanreceiver_top(
    input  wire clk,
    input  wire reset,
    input  wire btn_capture,
    input  wire btn_signal,
    output wire [1:0] LEDs,
    output wire [6:0] ssdAnode,
    output wire ssdCathode,
    output wire led_indicator // this is another LED output, which could be used for debugging (e.g., show input hold activity)
);

    // ---------- 
    // TODO: declare your internal wires here
    // Examples: heartbeat pulse, debounced signals, SIPO output,
    // holding register output, FSM enable signals, LED blink control, etc.
    // --------- 

	wire beat_1Hz;
	// add more wires

    // ----------
    // Instantiate submodules (ports are currently unconnected)
    // ----------

    clockdividerHB clk_div (
        .clk(clk),       
        .reset(),     // TODO
        .enable(),    // TODO
        .dividedClk(), // optional, can be left unconnected
        .beat(beat_1Hz)  
    );

    debouncer deb_capture_inst (
        .switchIn(),   // TODO
        .clk(),        // TODO
        .reset(),      // TODO
        .debounceout() // TODO
    );

    debouncer deb_signal_inst (
        .switchIn(),   // TODO
        .clk(),        // TODO
        .reset(),      // TODO
        .debounceout() // TODO
    );
	
	// Optional SPOT and synchronisers
	// spot spot_inst (.clk(), .spot_in(), .spot_out());
	// sync sync_inst (.in(), .clk(), .out());

    SIPO sipo_inst (
        .clk(),         // TODO
        .push(),        // TODO
        .serial_in(),   // TODO
        .parallel_out() // TODO
    );

    holding_register #(.SIZE(1)) hold_signal (
        .clk(),      // TODO
        .reset(),    // TODO
        .enable(),   // TODO
        .data_in(),  // TODO
        .reg_data()  // TODO
    );

    holding_register #(.SIZE(8)) hold_ascii (
        .clk(),      // TODO
        .reset(),    // TODO
        .enable(),   // TODO
        .data_in(),  // TODO
        .reg_data()  // TODO
    );

    LED_driver leds (
        .clk(),          // TODO
        .blink_pulse(),  // TODO
        .blink_active(), // TODO
        .LEDs(LEDs)
    );

    ascii2ssd decoder (
        .ascii_code(),    // TODO
        .ssd_sequence(ssdAnode)
    );

    FSM_controller fsm1 (
        .clk(),            // TODO
        .reset(),          // TODO
        .beat(),           // TODO
        .capture(),        // TODO
        .blink_active(),   // TODO
        .fsm_beat_enable(),// TODO
        .fsm_reg_enable()  // TODO
    );

    // ------------
    // Constant outputs to allow compilation
    // ------------
    assign ssdCathode   = 1'b1;
    assign led_indicator = 1'b0; 

endmodule