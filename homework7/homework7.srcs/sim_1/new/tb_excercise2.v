`timescale 1ns / 1ps

module tb_excercise2;

  // Inputs
  reg clk;
  reg [7:0] a, b, c, x;

  // Outputs
  wire [10:0] y;

  // Instantiate the excercise2 module
  excercise2 uut (
    .clk(clk),
    .a(a),
    .b(b),
    .c(c),
    .x(x),
    .y(y)
  );

  // Clock generation
  initial begin
    clk = 0;
    
  end
always #5 clk = ~clk;
  // Test stimulus
  initial begin
    // Initialize inputs
    a = 8'h00; // You can change these values as needed
    b = 8'h00;
    c = 8'h00;
    x = 8'hF1;

    // Apply inputs and observe outputs
    #10; // Initial delay

    // Apply new inputs
    a = 8'h0F;
    b = 8'h00;
    c = 8'h00;
    x = 8'h0A;
    #10;
    a = 8'h0D;
    b = 8'h04;
    c = 8'h00;
    x = 8'h11;
    #10;
    a = 8'hDD;
    b = 8'h14;
    c = 8'h08;
    x = 8'h15;
    // Wait for some time
    #20;

    // You can add more test scenarios as needed

    // End simulation
    
  end

endmodule
