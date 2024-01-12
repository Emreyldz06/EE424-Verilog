`timescale 1ns / 1ps

module gcd_sim;

  
  reg clk=0;
  reg [15:0] A, B;
  reg in_valid, rst, result_taken;
  wire [15:0] result_data;
  wire idle, result_valid;
  
  always #5 clk=~clk;

  gcd gcd_inst (
    .A(A),
    .B(B),
    .clk(clk),
    .in_valid(in_valid),
    .idle(idle),
    .rst(rst),
    .result_taken(result_taken),
    .result_data(result_data),
    .result_valid(result_valid)
  );




  initial begin
   
   
    in_valid = 0;
    result_taken = 0;
    A = 48;
    B = 36;

    #10;

    in_valid = 1;
    
    #10;

    in_valid = 0;
   
    #100; 
    
   
    result_taken = 1;
    

  end

endmodule
