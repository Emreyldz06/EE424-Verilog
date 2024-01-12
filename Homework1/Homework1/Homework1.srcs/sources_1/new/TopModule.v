`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.10.2023 11:49:26
// Design Name: 
// Module Name: TopModule
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module decoder3x8 (
    input [2:0]D_in ,
    output  [7:0] D_out
);

assign D_out[0] = (D_in == 3'b000) ? 1'b1 : 1'b0;
assign D_out[1] = (D_in == 3'b001) ? 1'b1 : 1'b0;
assign D_out[2] = (D_in == 3'b010) ? 1'b1 : 1'b0;
assign D_out[3] = (D_in == 3'b011) ? 1'b1 : 1'b0;
assign D_out[4] = (D_in == 3'b100) ? 1'b1 : 1'b0;
assign D_out[5] = (D_in == 3'b101) ? 1'b1 : 1'b0;
assign D_out[6] = (D_in == 3'b110) ? 1'b1 : 1'b0;
assign D_out[7] = (D_in == 3'b111) ? 1'b1 : 1'b0;

endmodule
