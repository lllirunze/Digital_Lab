`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/01 11:15:03
// Design Name: 
// Module Name: x7seg_scan
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


module x7seg_scan(
    input           sys_clk,
    input           sys_rst_n,
    input           clk_flag,
    input logic     [7:0]change,
    input logic     [7:0]price,
    output logic    [3:0]x7seg_data,
    output logic    [3:0]an
    );
    
    logic [3:0]cnt;
    
    always_ff @(posedge sys_clk) begin
        if(!sys_rst_n) cnt <= 0;
        else if(clk_flag) begin
            if(cnt == 4) cnt <= 1;
            else cnt <= cnt+1;
        end
    end
    always_ff @(posedge sys_clk) begin
        if(!sys_rst_n) x7seg_data <= 4'b0000;
        else if(cnt == 1) x7seg_data <= price[3:0];
        else if(cnt == 2) x7seg_data <= price[7:4];
        else if(cnt == 3) x7seg_data <= change[3:0];
        else if(cnt == 4) x7seg_data <= change[7:4];
    end
    always_ff @(posedge sys_clk) begin
        if(!sys_rst_n) an <= 4'b0000;
        else if(cnt == 1) an <= 4'b0001;
        else if(cnt == 2) an <= 4'b0010;
        else if(cnt == 3) an <= 4'b0100;
        else if(cnt == 4) an <= 4'b1000;
    end
    
endmodule
