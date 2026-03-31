module LEDproc(
input wire [3:0] count,
input wire acc_grant,
output reg [3:0] LEDs //Zybo implementation has 4 LEDs
);

always @(*)begin
			
 	if(acc_grant)
		LEDs=4'b1001;
	else 
		case (count)
		4'd0: LEDs=4'b0000;
		4'd1: LEDs=4'b0001;
		4'd2: LEDs=4'b0011;
		4'd3: LEDs=4'b0111;
		4'd4: LEDs=4'b1111;
		4'd5: LEDs=4'b0111;
		4'd6: LEDs=4'b0011;
		4'd7: LEDs=4'b0001;
		default: LEDs=4'b0000;
		endcase
end


endmodule
