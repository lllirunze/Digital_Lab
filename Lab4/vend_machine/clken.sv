`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/01 10:30:17
// Design Name: 
// Module Name: clken
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


module clken #(parameter SYS_CLK_FREQ = 25_000_000, TARGET_CLK_FREQ = 1000, N = 15)(
    input           sys_clk,
    input           sys_rst_n,
    output logic    clk_flag
    );
    
    localparam CNT_MAX = SYS_CLK_FREQ/TARGET_CLK_FREQ;
    logic [N-1:0]r_cnt;
    
    always_ff @(posedge sys_clk) begin
        if(!sys_rst_n) r_cnt <= 0;
        else if(r_cnt == CNT_MAX-1) r_cnt <= 0;
        else r_cnt <= r_cnt+1;
    end
    always_ff @(posedge sys_clk) begin
        if(!sys_rst_n) clk_flag = 1'b0;
        else if(r_cnt == CNT_MAX-1) clk_flag <= 1'b1;
        else clk_flag <= 1'b0;
    end
    
endmodule
