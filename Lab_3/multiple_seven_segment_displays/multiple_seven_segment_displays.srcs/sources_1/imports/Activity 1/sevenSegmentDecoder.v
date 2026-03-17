module sevenSegmentDecoder (
	input wire [3:0] bcd,
	output reg [6:0] ssd
);

	// This module maps a number (inputted as binary-coded decimal) to its representation as a SSD digit 
	// (outputting the necessary logic levels for the 7 segments on the display to show the desired digit)

	//NOTE: some displays use positive logic ("1" bits represent "ON" segments), while others use negative logic ("0" bits represent "ON" segments).
	
	//Please uncomment the desired positive / negative logic encoding (and comment the other), as required.


 	always @(*) begin
		case(bcd)
			4'd0 : ssd = 7'b1111110;
			4'd1 : ssd = 7'b0110000;
			4'd2 : ssd = 7'b1101101;
			4'd3 : ssd = 7'b1111001;
			4'd4 : ssd = 7'b0110011;
			4'd5 : ssd = 7'b1011011;
			4'd6 : ssd = 7'b1011111;
			4'd7 : ssd = 7'b1110000;
			4'd8 : ssd = 7'b1111111;
			4'd9 : ssd = 7'b1111011;

			default : ssd = 7'b0000000;
		endcase
	end 

/* 	always @(*) begin
		case(bcd)
			4'd0 : ssd = 7'b0000001;
			4'd1 : ssd = 7'b1001111;
			4'd2 : ssd = 7'b0010010;
			4'd3 : ssd = 7'b0000110;
			4'd4 : ssd = 7'b1001100;
			4'd5 : ssd = 7'b0100100;
			4'd6 : ssd = 7'b0100000;
			4'd7 : ssd = 7'b0001111;
			4'd8 : ssd = 7'b0000000;
			4'd9 : ssd = 7'b0000100;

			default : ssd = 7'b1111111;
		endcase
	end
 */	
 
endmodule
