`timescale 1ns / 1ps

module sync(
input wire in,
input wire clk,
output wire out);

reg dff[2:0];

always@(posedge clk) begin
    dff[0]<=in;
    dff[1]<=dff[0];
    dff[2]<=dff[1];
end

assign out=dff[2];

endmodule
