`timescale 1ns / 1ps

module dig_clock(
    input                   sys_clk,
    input                   sys_rst_n,
    input                   i_start,
    output logic [3 : 0]    an,
    output logic [7 : 0]    a_to_g
    );
    
    logic [7:0]sec,min,sec_bcd,min_bcd;
    logic clk_flag;
    timer timer1(sys_clk, sys_rst_n, i_start, sec, min, clk_flag);
    bin2bcd_0 bcd_sec(sec, sec_bcd);
    bin2bcd_0 bcd_min(min, min_bcd);
    
    bcd_scanner bcd_scanner1(sys_rst_n, clk_flag, sys_clk, min_bcd, sec_bcd, an, a_to_g);
    
endmodule