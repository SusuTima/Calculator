`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/24 18:44:14
// Design Name: 
// Module Name: push_button_detect
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


module push_button_detect(
input clk, input rst, input[2:0] control, input [3:0] btn, output reg [3:0] dataA, output reg [3:0] dataB, output reg[2:0] ctrl
);

always@ (posedge clk)
    case (control)
        4'd0:
            begin
                ctrl = ctrl;
            end
        4'd1, 4'd2, 4'd4:
            begin
                ctrl = control;
            end
        default:
            begin
                ctrl = 4'd0;
            end
      endcase

always@(posedge clk)
    if (rst) 
    begin
        dataA <= 4'd0;
        dataB <= 4'd0;
    end
    else
    begin
    case(btn)
        4'd0:
            begin
                if (control == 3'd0) dataA = dataA;
                else dataB = dataB;
            end
        4'd1:
            begin
                if (control == 3'd0) dataA = 4'b1;
                else dataB = 4'b1;
            end
        4'd2:
            begin
                if (control == 3'd0) dataA = 4'd2;
                else dataB = 4'd2;
            end
        4'd4:
            begin
                if (control == 3'd0) dataA = 4'd3;
                else dataB = 4'd3;
            end
        4'd8:
            begin
                if (control == 3'd0) dataA = 4'd4;
                else dataB = 4'd4;
            end
        default:
            begin
                $write("????\n");
            end
        endcase
     end
       
        
    
endmodule
