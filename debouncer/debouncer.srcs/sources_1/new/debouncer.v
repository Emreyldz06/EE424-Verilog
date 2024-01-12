`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.11.2023 22:40:10
// Design Name: 
// Module Name: debouncer
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


module debouncer(clk,rst,dein,deout);

input clk,rst,dein;
output reg deout;

reg wait_done,wait_start;
reg [2:0] wait_count;
reg [1:0] current_debounce_state,next_debounce_state;
parameter [1:0] s0=2'b00,s1=2'b01,s2=2'b10;

always@(posedge clk)begin 

    current_debounce_state<=rst?s0:next_debounce_state;

end

always@(*)begin 

    case(current_debounce_state)
    s0: begin
        wait_start=0;
        next_debounce_state=dein?s1:s0;end
    s1: begin wait_start=1;
        
        next_debounce_state=(~wait_done)? s1: dein?s2:s0;end
    s2:begin wait_start=0;
        next_debounce_state=dein?s2:s1;end
    default: next_debounce_state=s0;     
    endcase 

end
always@(posedge clk)begin 

    wait_count=wait_start?(wait_count+1):0;
    wait_done= (wait_count==3);
end

always@(posedge clk) begin 

    deout=((current_debounce_state==s1)&dein&wait_done);

end

endmodule
