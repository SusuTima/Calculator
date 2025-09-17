`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/01 01:22:33
// Design Name: 
// Module Name: flow
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


module flow(clk,rstn,led);
input clk,rstn;
output led;
reg[15:0]led;
reg[31:0]count;
always@(posedge clk)
begin
    if(~rstn)
        begin
            led <= 16'b1000000000000000;
            count <= 0;
        end
     else
        begin
            if(count == 10000000)
            begin
                count <= 0;
                if(led == 16'b1)
                    led <= 16'b1000000000000000;
                else
                    led <= led>>1;
            end
            else
                begin   
                    count <= count+1;
                    led <= led;
                end
          end
 end
endmodule
