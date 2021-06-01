`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/27 11:30:50
// Design Name: 
// Module Name: dig_clock_tb
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
module dig_clock_tb();
    logic sys_clk,clk_flag;
    logic sys_rst_n;
    logic i_start,pos_edge;
    logic [7:0]sec;
    logic [7:0]min;
    logic [3:0]an;
    logic [7:0]a_to_g;

    dig_clock U0(sys_clk,sys_rst_n,i_start,an,a_to_g);
    timer U1(sys_clk,sys_rst_n,i_start,sec,min,clk_flag);
    edge_detection U3(
        .sys_clk(sys_clk),
        .sys_rst_n(sys_rst_n),
        .i_btn(i_start),
        .pos_edge(pos_edge)
    );

    initial begin
        sys_clk = 'b0;
        i_start = 'b0;
        sys_rst_n = 'b0;
        #200
        i_start = 'b1;
        sys_rst_n = 'b1;
    end
    
    always #20 sys_clk = ~sys_clk;

endmodule