`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.11.2023 10:45:39
// Design Name: 
// Module Name: Rndgnr32bit
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


module Rndgnr32bit( clk,rst,ld_en,shift_en,seed32,out32

    );
input clk,rst,ld_en,shift_en;
input [31:0]seed32;
output  [31:0] out32 ;    

generate
genvar j;
for (j = 0; j < 32; j = j + 1) begin

LFSR32 lfsr (.clk(clk),.rst(rst),.ld_en(ld_en),.shift_en(shift_en),.seed(seed32*(j+1)),.out(out32[j]));

end
endgenerate

endmodule