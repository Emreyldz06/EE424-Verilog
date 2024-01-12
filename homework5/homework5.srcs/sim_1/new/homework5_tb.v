`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.11.2023 01:33:23
// Design Name: 
// Module Name: homework5_tb
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


module homework5_tb;
reg clk=1;
reg rst;
reg [9:0] n_temp;
wire [8:0] out;
mainmodule uut( .n_temp(n_temp),.clk(clk),.out(out),.rst(rst));


always #5 clk = ~clk; 
initial begin
rst=1;
#10;
rst=0;
n_temp=10'b1010100110;
#10;
n_temp=10'b1010101101;
#10;
n_temp=10'b1010110001;
#10;
n_temp=10'b1011000001;


end

endmodule
