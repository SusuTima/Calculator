`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/24 19:09:26
// Design Name: 
// Module Name: show_num
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


module show_num(clk, rst, control, btn, seg_code, seg_code1, scan, scan1, led);
input clk;
input rst;
input [2:0] control;
input [3:0] btn;
output [7:0] seg_code;
output [7:0] seg_code1;
output scan;
output scan1;
output [15:0] led;
wire clk_1khz;
wire scan;
wire scan1;
wire [7:0] seg_code;
wire [7:0] seg_code1;
wire [3:0] dataA;
wire [3:0] dataB;
wire [2:0] ctrl;
wire [4:0] ans1;
wire [4:0] ans2;
wire [15:0] led;
reg [4:0] ans;
reg temp;

always@ (posedge clk)
begin
    if (control[2] == 0) 
    begin
    ans <= ans1;
    end
    else 
    begin
        if (control[2] == 1) ans <= ans2;
        else ans <= 5'b0;
    end
    
end

push_button_detect  m1(.clk(clk), .rst(rst), .control(control), .btn(btn), .dataA(dataA), .dataB(dataB), .ctrl(ctrl));
led_decoder         m2(.clk(clk), .rst(rst), .seg_code(seg_code), .seg_code1(seg_code1), .state(ans));
mutiplier           m3(.clk(clk), .rst(rst), .A(dataA), .B(dataB), .cout(ans2));
adder               m4(.clk(clk), .rst(rst), .A(dataA), .B(dataB), .Binvert(control[1]), .cout(ans1));
scan                m5(.clk_1khz(clk_1khz), .rst(rst), .scan(scan), .seg_code(seg_code), .seg_code1(seg_code1), .scan1(scan1));
flow                m6(.clk(clk), .rstn(rst), .led(led));
clk_1khz            m7(.clk(clk), .rst(rst), .clk_1khz(clk_1khz));


endmodule
