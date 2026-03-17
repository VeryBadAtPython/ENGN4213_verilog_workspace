module counter (
input wire clk, 
input wire enable,
input wire reset,
output reg [3:0] count
);

    always @(posedge clk) begin
        if (reset==1) count <= 4'b0;
        else if (enable==1) count <= count + 4'b1;
    end

endmodule