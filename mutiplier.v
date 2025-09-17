`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/27 18:26:10
// Design Name: 
// Module Name: mutiplier
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


module 
(clk, rst, A, B, cout);
	input [2:0] A, B; // 110
	input rst, clk;
	output reg [4:0] cout;
	reg[4:0] at;
	reg[4:0] four;
	reg[4:0] two;
	reg[4:0] one;
	reg[4:0] sum;

    always@ (posedge clk)
    begin
        at = {2'b00, A};
        sum = 5'b00000;
        four = B[2] ? (at << 2) : 0;
        two = B[1] ? (at << 1) : 0;
        one = B[0] ? at : 0;
        sum = sum + one;
        sum = sum + two;
        sum = sum + four;
       
    
    	if (rst)
        begin
            cout <= 5'b00000;
        end
        
        else cout <= sum;
    end

endmodule
