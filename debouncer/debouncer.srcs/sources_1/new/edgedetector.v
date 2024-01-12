`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.11.2023 23:10:07
// Design Name: 
// Module Name: edgedetector
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


module edgedetector(clk,rst,edgein,edgeout);

input clk,rst,edgein;
output reg edgeout;

reg [1:0] current_state,next_state;
parameter [1:0] bt0=2'b00,assert1=2'b01,bt1=2'b10;

always@(posedge clk) begin 

    current_state<=rst?bt0:next_state;
end

always@(*)begin 

    case(current_state)
    bt0:begin 
    
            next_state=edgein?assert1:bt0;
    end
    assert1:begin 
            next_state=edgein?bt1:bt0;
    end 
    bt1:begin 
            next_state=edgein?bt1:bt0;
    end 
    endcase

end

always@(*)begin
    
    edgeout=(current_state==assert1);

end

endmodule
