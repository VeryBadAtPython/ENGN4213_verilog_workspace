module ascii2ssd (
    input  wire [7:0] ascii_code,   // ASCII input
    output reg  [6:0] ssd_sequence      // {a,b,c,d,e,f,g}
);

// this decoder module translates some characters from ASCII code to their implementation on a seven segment display.
// not all ASCII symbols can be rendered. A subset is included; codes without a match will default to an error symbol  

// Segment encoding for reference (active high)
//  --a--
// |     |
// f     b
// |--g--|
// e     c
// |     |
//  --d--


always @(*) begin
    case (ascii_code)

        // Digits 0-9
        8'b00110000: ssd_sequence = 7'b1111110; // '0'
        8'b00110001: ssd_sequence = 7'b0110000; // '1'
        8'b00110010: ssd_sequence = 7'b1101101; // '2'
        8'b00110011: ssd_sequence = 7'b1111001; // '3'
        8'b00110100: ssd_sequence = 7'b0110011; // '4'
        8'b00110101: ssd_sequence = 7'b1011011; // '5'
        8'b00110110: ssd_sequence = 7'b1011111; // '6'
        8'b00110111: ssd_sequence = 7'b1110000; // '7'
        8'b00111000: ssd_sequence = 7'b1111111; // '8'
        8'b00111001: ssd_sequence = 7'b1111011; // '9'

        // Some uppercase letters 
        8'b01000001: ssd_sequence = 7'b1110111; // 'A'
        8'b01000011: ssd_sequence = 7'b1001110; // 'C'
        8'b01000101: ssd_sequence = 7'b1001111; // 'E'
        8'b01000110: ssd_sequence = 7'b1000111; // 'F'
        8'b01001000: ssd_sequence = 7'b0110111; // 'H'
        8'b01001001: ssd_sequence = 7'b0110000; // 'I' (same as '1')
        8'b01001010: ssd_sequence = 7'b0111100; // 'J'
        8'b01001100: ssd_sequence = 7'b0001110; // 'L'
        8'b01001111: ssd_sequence = 7'b1111110; // 'O' (same as '0')
        8'b01010000: ssd_sequence = 7'b1100111; // 'P'
        8'b01010011: ssd_sequence = 7'b1011011; // 'S' (same as '5')
        8'b01010101: ssd_sequence = 7'b0111110; // 'U'
        8'b01011001: ssd_sequence = 7'b0111011; // 'Y'

        // Symbols
        8'b00101101: ssd_sequence = 7'b0000001; // '-'
        8'b01011111: ssd_sequence = 7'b0001000; // '_'

        8'b00000000: ssd_sequence = 7'b1000001; // '='
        
        default:     ssd_sequence = 7'b1001001; // unsupported, shows top, middle and bottom segment

    endcase
end

endmodule