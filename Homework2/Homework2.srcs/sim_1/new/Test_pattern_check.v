`timescale 1ns / 1ps

module tb_MainModule;

reg clk,A,rst;
wire C;

// Instantiate the module under test
MainModule uut (
    .clk(clk),
    .rst(rst),
    .A(A),
    .C(C)
);


always begin
    #5 clk = ~clk; 
end


initial begin
    clk = 0;
    A = 0;
    rst=1;
    #10;
    rst=0;
    #17;
    A = 1;
    #19;
    A = 0;
    #13;
    A = 1;
    #20;
    A = 0;
    #10;
    #17;
    A = 1;
    #19;
    A = 0;
    #13;
    A = 1;
    #20;
    A = 0;
    #10;
   
    
end


endmodule
