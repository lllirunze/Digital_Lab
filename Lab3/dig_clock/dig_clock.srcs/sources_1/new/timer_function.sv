`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/27 10:44:23
// Design Name: 
// Module Name: timer_function
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


module timer_function(
    input logic sys_clk,
    input logic sys_rst_n,
    input logic pos_edge,
    input logic i_start,
    output logic[7:0] sec,
    output logic[7:0] min
    );
    
    logic [24:0]temp;
    logic temp2;
    localparam temp_MAX = 25'b1011111010111100000111111;
    
    always_ff@(posedge sys_clk) begin
        if(!sys_rst_n) temp2 <= 0;
        else if(pos_edge) temp2 <= temp2+1'b1;
        else temp2 <= temp2;
    end
    always_ff@(posedge sys_clk) begin
        if(!sys_rst_n) temp <= 0;
        else if(temp2 == 1) begin
            if(temp != temp_MAX) temp <= temp+1;
            else temp <= 0;
        end
        else temp <= temp;
    end
    
    always_ff@(posedge sys_clk) begin
        if(!sys_rst_n) sec <= 0;
        else if(temp == temp_MAX) begin
            if(sec != 59) sec <= sec+1'b1;
            else sec <= 0;
        end
    end
    always_ff@(posedge sys_clk) begin
        if(!sys_rst_n) min <= 0;
        else if(sec == 59 & temp == temp_MAX) min <= min+1'b1;
        else min <= min;
    end
    
endmodule
