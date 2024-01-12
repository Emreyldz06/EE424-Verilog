`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.12.2023 22:55:14
// Design Name: 
// Module Name: sort_tb
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
`timescale 1ns/1ps



module tb_sortmain;

  // Declare signals
  reg clk,sort,we,en;
  reg  [2:0] addr;
  reg  [3:0] data_in;
  wire [3:0] data_out;
  wire sort_done;
  
  // Instantiate the sortmain module
sel_sort uut (  .clk(clk),.we(we),.en(en),.sort(sort),
                .addr(addr),
                .data_in(data_in),
                .data_out(data_out),
                .sort_done(sort_done)
                );

// Clock generation
initial begin
    clk = 0;
    sort=0;
end
always #5 clk = ~clk;
// Instantiate the module


initial begin 
#10;
sort=1;
#10;
sort=0;




end

endmodule

