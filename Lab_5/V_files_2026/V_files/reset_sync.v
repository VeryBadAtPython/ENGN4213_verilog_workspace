// synchroniser for reset button 
module reset_sync(input wire sysclk,
input wire btn_in,
output reg reset_out);

reg [1:0] ffsync;


always @(posedge sysclk) begin
	ffsync[0]<=btn_in; //synchroniser ff chain
	ffsync[1]<=ffsync[0];
	
	reset_out<=ffsync[1]; //ff for single pulse on transition
end

endmodule
