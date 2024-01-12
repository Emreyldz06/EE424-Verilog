`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.11.2023 22:53:10
// Design Name: 
// Module Name: debouncer_tb
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


module debouncer_tb;

  // Inputs
  reg clk;
  reg rst;
  reg dein;

  // Outputs
  wire deout;

  // Instantiate the debouncer module
  main_module uut (
    .clk(clk),
    .rst(rst),
    .button(dein),
    .led(deout)
  );

  // Clock generation
  initial begin
    clk = 0;
  end
  always #10 clk = ~clk;
  // Initial stimulus
  initial begin
    // Initialize inputs
    rst = 1;
    dein = 0;

    // Apply reset and wait for a few clock cycles
    #20 ;
    rst = 0;
    // Apply some input changes
    #20 dein = 1;
    #20 dein = 0;
    #30 dein = 1;
    #15 dein = 0;
    #10 dein = 1;
    #120 dein =0;
    #20 dein = 1;
    #2 dein = 0;
    #3 dein = 1;
    #6 dein = 0;
    #10 dein = 1;
    
     #20 dein = 0;
    #20 dein = 1;
    #30 dein = 0;
    #15 dein = 1;
    #10 dein = 0;
    #120 dein =1;
    #20 dein = 0;
    #2 dein = 1;
    #3 dein = 0;
    #6 dein = 1;
    #10 dein = 0;
    
    
     #20 dein = 1;
    #20 dein = 0;
    #30 dein = 1;
    #15 dein = 0;
    #10 dein = 1;
    #120 dein =0;
    #20 dein = 1;
    #2 dein = 0;
    #3 dein = 1;
    #6 dein = 0;
    #10 dein = 1;

    // Wait for simulation to finish
    
  end





endmodule
