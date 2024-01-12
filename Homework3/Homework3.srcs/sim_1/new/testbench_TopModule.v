`timescale 1ns / 1ps

module testbench_TopModule();

  reg clk=1;
  reg rst;
  reg ld_en;
  reg shift_en;
  reg [31:0] seed;
  wire out;
  integer f;
  integer i;
  // "TopModule" modülünü çaðýrýn
  TopModule uut (
    .rst(rst),
    .clk(clk),
    .ld_en(ld_en),
    .shift_en(shift_en),
    .seed(seed),
    .out(out)
  );

  // Clock sinyali oluþturun
  always #5 clk = ~clk;
  

  // Test senaryosunu oluþturun
  initial begin
   
    rst = 0;
    ld_en = 1;
    shift_en = 0;
    seed = 12345;
  
    // Bekleme süresi
    #10
     
    shift_en = 1;
    ld_en = 0;
    #10

    shift_en = 1;
 
    #10
  
    shift_en = 1;
    f = $fopen("verilogoutput.txt", "ab");


    for (i = 0; i < 200; i = i + 1) begin
      $fwrite(f, "%b\n", out);
      #10;

    end

    $fclose(f);
    $finish; 

  
  end

endmodule
