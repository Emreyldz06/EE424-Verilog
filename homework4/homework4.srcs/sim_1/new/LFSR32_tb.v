module LFSR32_tb;


reg clk=1;
reg rst;
reg ld_en;
reg shift_en;
reg [31:0] seed32;
wire [31:0] out32 ;
integer i;
integer f;

Rndgnr32bit  dut (
.clk(clk),
.rst(rst),
.ld_en(ld_en),
.shift_en(shift_en),
.seed32(seed32),
.out32(out32)
);


always #5 clk = ~clk; 
initial begin
rst = 0;
ld_en = 1;
shift_en = 0;
seed32 = 12345;
#10;
shift_en = 1;
ld_en = 0;
#10;
shift_en = 1;
f = $fopen("verilog32output.txt", "w+");
for (i = 0; i < 200; i = i + 1) begin
  $fwrite(f, "%b\n", out32);
  #10;
end
$fclose(f);
$finish; 
end
endmodule
