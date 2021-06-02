`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/27 10:25:08
// Design Name: 
// Module Name: timer
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


module timer(
    input logic sys_clk,
    input logic sys_rst_n,
    input logic i_start,
    output logic[7:0] sec,
    output logic[7:0] min,
    output logic clk_flag
    );
    
    logic pos_edge;
    logic min_temp;
    
    enable_clock enable(sys_clk,sys_rst_n,clk_flag);
    edge_detection detect(
        .sys_clk(sys_clk),
        .sys_rst_n(sys_rst_n),
        .i_btn(i_start),
        .pos_edge(pos_edge)
    );
    timer_function clock(sys_clk,sys_rst_n,pos_edge,i_start,sec,min);
    
endmodule
