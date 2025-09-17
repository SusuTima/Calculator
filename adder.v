`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/27 18:28:12
// Design Name: 
// Module Name: adder
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


module adder(clk, rst, A, B, Binvert, cout);
	input [3:0] A, B;
	input Binvert, rst, clk;
	output reg [4:0] cout;
	reg[4:0] at, bt;

    always@ (posedge clk)
    begin
        at <= {1'b0, A};
        bt <= {1'b0, B};
    	if (rst)
        begin
            cout <= 5'b0;
        end
        else 
        begin
            if (Binvert) 
            begin
            cout <= at - bt;
            //assign cout = cout + 1;
            end
            else cout <= at + bt;
        end
    end

	
endmodule
