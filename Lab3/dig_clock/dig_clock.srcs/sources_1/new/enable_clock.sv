`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/27 10:36:05
// Design Name: 
// Module Name: enable_clock
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


module enable_clock #(parameter SYS_CLK_FREQ=100_000_000, TARGET_CLK_PREQ=10_000_000, N=3) (
    input logic sys_clk,
    input logic sys_rst_n,
    output logic clk_flag
    );
    localparam CNT_MAX = 24999;
    
    logic [14:0]r_cnt;
    
    always_ff@(posedge sys_clk) begin
        if(!sys_rst_n) r_cnt <= 0;
        else if(r_cnt == CNT_MAX) r_cnt <= 0;
        else r_cnt <= r_cnt+1;
    end
    always_ff@(posedge sys_clk) begin
        if(!sys_rst_n) clk_flag <= 0;
        else if(r_cnt == CNT_MAX) clk_flag <= 1;
        else clk_flag <= 0;
    end
    
endmodule
