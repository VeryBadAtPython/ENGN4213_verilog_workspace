// implementation of a simple 8-bit serial-in, parallel-out shift register

module SIPO (
    input  wire clk,
    input  wire push,         // shift enable
    input  wire serial_in,    // incoming bit
    output wire [7:0] parallel_out  // continuously readable output
);

reg [7:0] shift_reg;

initial begin // initialisation to 0, for simulation purposes
	shift_reg=8'b0;
end 


always @(posedge clk) begin
    if (push) begin
        // Shift left. New bit enters as LSB
        shift_reg <= {shift_reg[6:0], serial_in};
    end
end

assign parallel_out = shift_reg;

endmodule
