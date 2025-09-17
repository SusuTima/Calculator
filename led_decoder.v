`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/24 18:32:31
// Design Name: 
// Module Name: led_decoder
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


module led_decoder(seg_code1, seg_code, state, clk, rst);

    input   clk, rst;
    input   [4:0] state;
    output  [7:0] seg_code;
    output  [7:0] seg_code1;
    reg     [7:0] seg_code;
    reg     [7:0] seg_code1;
    
    always@ (posedge clk)
    begin
        if (rst)
            seg_code <= 8'h00;
        else
        begin
        if (state[4] == 0)
        begin
            seg_code1 = 8'h00;
            case (state)
                5'b00000: seg_code = 8'h3f;//0
                5'b00001: seg_code = 8'h06;//1
                5'b00010: seg_code = 8'h5b;//2
                5'b00011: seg_code = 8'h4f;//3
                5'b00100: seg_code = 8'h66;//4
                5'b00101: seg_code = 8'h6d;//5
                5'b00110: seg_code = 8'h7d;//6
                5'b00111: seg_code = 8'h07;//7
                5'b01000: seg_code = 8'h7f;//8
                5'b01001: seg_code = 8'h6f;//9
                5'b01010: seg_code = 8'h77;//A
                5'b01011: seg_code = 8'h7c;//b
                5'b01100: seg_code = 8'h39;//C
                5'b01101: seg_code = 8'h5e;//d
                5'b01110: seg_code = 8'h79;//E
                5'b01111: seg_code = 8'h71;//F
                default: seg_code = seg_code;
            endcase
        end
        else if (state == 5'b10000)
        begin
            seg_code = 8'h06;
            seg_code1 = 8'h7d;
        end
        else
        begin
            seg_code = 8'h40;//-
            case (state)
                5'b11111: seg_code1 = 8'h06;//1
                5'b11110: seg_code1 = 8'h5b;//2
                5'b11101: seg_code1 = 8'h4f;//3
                5'b11100: seg_code1 = 8'h66;//4
                5'b11011: seg_code1 = 8'h6d;//5
                5'b11010: seg_code1 = 8'h7d;//6
                5'b11001: seg_code1 = 8'h07;//7
                5'b11000: seg_code1 = 8'h7f;//8
                5'b10111: seg_code1 = 8'h6f;//9
                5'b10110: seg_code1 = 8'h77;//A
                5'b10101: seg_code1 = 8'h7c;//b
                5'b10100: seg_code1 = 8'h39;//C
                5'b10011: seg_code1 = 8'h5e;//d
                5'b10010: seg_code1 = 8'h79;//E
                5'b10001: seg_code1 = 8'h71;//F
                default: seg_code1 = 8'h00;//none
            endcase
        end
        end
     end
endmodule