module dooraccess(input wire btn_X0, 
input wire sysclk,
input wire btn_X1,
input wire btn_reset,
input wire closed_sw,
output wire [3:0] LEDs);


// connecting wires. Most should be provided here, 
// but you should check fitness-for-purpose for your design. 

wire ready, done, closed, found, start, fsm_reset, acc_gran, reset_synced;

wire X0_debounced, X1_debounced;
wire [3:0] count;
wire [7:0] pin_no;

wire [3:0] rom_addr;
wire [7:0] rom_data;


//below is a list of modules. You will need to write up the connections. 
// Refer to the diagram in the manual for guidance


fsm_controller fsm(
	.sysclk(),
	.ready(),
	.done(),
	.closed(),
	.found(),
	.reset_btn(),
	.start(),
	.reset(),
	.acc_gran());
	
doorshut door(
	.reset(),
	.closed_sw(),
	.sysclk(),
	.closed_fsm());
	
doubledebounce ddb(
	.X0(), //X0 represents the input for the "0" key, X1 for the "1" key
	.X1(),
	.sysclk(),
	.reset(),
	.X0_deb(), //X0_deb represents the output for the debounced "0" key, X1_deb for the "1" key
	.X1_deb());		

reset_sync rs(
	.sysclk(),
	.btn_in(),
	.reset_out(reset_synced));

keyproc key(
	.X0(),
	.X1(),
	.reset(),
	.sysclk(),
	.ready(),
	.count(),
	.pin_no());

LEDproc led(
	.count(),
	.acc_grant(),
	.LEDs());

PIN_rom pinrom(.addr(),
	.data());

pincomp comparator(
	.start(),
	.pin_no(),
	.data(),
	.sysclk(),
	.reset(),
	.addr(),
	.done(),
	.found());
	
endmodule