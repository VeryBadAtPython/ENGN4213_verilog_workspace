//A simple load-enabled register, with synchronous reset 
//SIZE may be adjusted as needed

module holding_register #(parameter SIZE = 8)(
    input  wire                  clk,
    input  wire                  reset,
    input  wire                  enable,
    input  wire [SIZE-1:0]       data_in,
    output reg  [SIZE-1:0]       reg_data
);

initial begin // initialisation to 0, for simulation purposes
	reg_data = {SIZE{1'b0}};
end 

always @(posedge clk) begin
    if (reset) begin
        reg_data <= {SIZE{1'b0}};
    end
    else if (enable) begin
        reg_data <= data_in;
    end
end

endmodule