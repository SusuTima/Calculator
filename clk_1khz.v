`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/01 14:56:29
// Design Name: 
// Module Name: clk_1khz
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


module clk_1khz(
clk_1khz, clk, rst
    );
    input clk,rst;
    output clk_1khz;
    
    reg [15:0] count;
    reg clk_1khz;
    
    always@ (posedge clk or posedge rst)
    begin
        if (rst)
        begin
            count <= 16'd0;
            clk_1khz <= 1'b0;
        end
        else if (count == 0)
        begin
            count <= 16'd0;
            clk_1khz <= ~clk_1khz;
        end
        else
        begin
            count <= count + 16'd1;
            clk_1khz <= clk_1khz;
        end
    end
endmodule
