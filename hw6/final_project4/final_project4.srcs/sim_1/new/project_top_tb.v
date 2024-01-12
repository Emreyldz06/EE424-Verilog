`timescale 1ns / 1ps

module project_top_tb( );
reg clk ; 
wire [7:0]data_out ;

initial begin 
clk=0;

end
sorting_imp_top uut (.clk(clk),.data_out(data_out));
always begin clk=~clk; #10; end

endmodule