`timescale 1ns / 1ps

module sorting_imp_top(
input clk,
output  [7:0] data_out

);

GCD C2 (.clock(clk),.GCD_out(data_out));


endmodule


