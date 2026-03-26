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


	
	// FSM controller
    wire blink_active, beat_enable, reg_enable;
    FSM_controller fsm1 (
        .clk(clk),
        .reset(reset),
        .beat(beat_1Hz),
        .capture(btn_capture_spot),
        .blink_active(blink_active),
        .fsm_beat_enable(beat_enable),
        .fsm_reg_enable(reg_enable)
    );

    
    // Instantiate a divided 1Hz clock
    wire beat_1Hz;
    clockdividerHB clk_div (
        .clk(clk),       
        .reset(reset),
        .enable(beat_enable), // Enabled in CAPTURE mode
        .dividedClk(),
        .beat(beat_1Hz)  
    );
    
    
    
    
    // Debounce and SPOT the capture button
    wire btn_capture_db, btn_capture_spot;
    debouncer capture_db (
        .switchIn(btn_capture),
        .clk(clk),
        .reset(reset),
        .debounceout(btn_capture_db)
    );
    spot capture_spot (
        .clk(clk),
        .spot_in(btn_capture_db),
        .spot_out(btn_capture_spot)
    );
    
    // Debounce the signal
    wire btn_signal_db, btn_signal_db_int;
    debouncer deb_signal_inst (
        .switchIn(btn_signal),
        .clk(clk),
        .reset(reset),
        .debounceout(btn_signal_db_int)
    );
    holding_register #(.SIZE(1)) hold_signal (
        .clk(clk),
        .reset(beat_1Hz),
        .enable(~btn_signal_db), 
        .data_in(btn_signal_db_int),
        .reg_data(btn_signal_db)
    );
	
	// Optional SPOT and synchronisers
	// spot spot_inst (.clk(), .spot_in(), .spot_out());
	// sync sync_inst (.in(), .clk(), .out());
    
    // SIPO Buffer and holding register and aasci to ssd
    wire [7:0] sipo_value;
    wire [7:0] held_value;
    SIPO sipo_inst (
        .clk(clk),
        .push(beat_1Hz),        // trigger on heartbeat
        .serial_in(btn_signal_db),
        .parallel_out(sipo_value)
    );
    holding_register #(.SIZE(8)) hold_sipo (
        .clk(clk),
        .reset(reset),
        .enable(reg_enable), 
        .data_in(sipo_value),
        .reg_data(held_value)
    );
    ascii2ssd decoder (
        .ascii_code(held_value),
        .ssd_sequence(ssdAnode)
    );


   
    // Blink railway Xing
    // Blink at 1Hz
    LED_driver leds (
        .clk(clk),
        .blink_pulse(beat_1Hz),
        .blink_active(blink_active),
        .LEDs(LEDs)
    );
    
    
    // ------------
    // Constant outputs to allow compilation
    // ------------
    assign ssdCathode   = 1'b1;
    assign led_indicator = 1'b0; 

endmodule