`timescale 1ns / 1ps

module GCD(input clock ,  input [7:0] in1,in2, output reg [7:0]GCD_out
);
localparam IDLE = 'd0, 
change = 'd1,
subtract= 'd2;
wire sort_flag ; 
reg [3:0]state; 
reg [7:0] D1, D2 ;
sorting B1 (.clock(clock), .sort_flag(sort_flag), .outB(in1) , .outA(in2)) ; 
initial begin state=IDLE; end
always @ (posedge clock)
begin
if(sort_flag ) 
begin
case(state) 
IDLE:
begin
D1 <= in1 ; // take the bigest 2 values coming from sorting module
D2<= in2 ; 
state<=change ; 
end
change:
begin
if(D1<D2) begin   D1 <= D2 ;  D2 <= D1 ;  end   //compare swap
else state <= subtract ; 
end
subtract: 
begin
D1 = D1-D2 ; 
if(D2 ==0) begin  GCD_out <= D1 ; state<=subtract;  end
else if(D2<=D1) state <= subtract ; 
else state <= change;  
end 
endcase
end
end

endmodule
