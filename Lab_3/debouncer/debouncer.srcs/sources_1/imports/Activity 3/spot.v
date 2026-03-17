module spot (
input wire clk,
input wire spot_in,
output wire spot_out
);

    reg last_in;
    reg spot_reg;
    
    always @(posedge clk) begin
        last_in <= spot_in;
        spot_reg <= ~last_in && spot_in;
    end
    
    assign spot_out=spot_reg;

endmodule