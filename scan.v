`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/31 20:14:07
// Design Name: 
// Module Name: scan
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


module scan(
scan, clk_1khz, rst, seg_code, scan1, seg_code1
    ); //split it!!! separate the scan to differ the signal
    
    input clk_1khz, rst;
    input seg_code;
    output scan;
    reg scan;
    input seg_code1;
    output scan1;
    reg scan1;
    reg temp;
    
    always@ (posedge clk_1khz)
        begin
            if(rst)
                temp <= 1'b0;
            else
                temp <= ~temp;
        end
        
    always@ (*)
        begin
        if (temp)
            begin
                scan1 = 1'b1;
                scan = 1'b0;
            end
        else
             begin
                scan = 1'b1;
                scan1 = 1'b0;
            end 
       end
endmodule
