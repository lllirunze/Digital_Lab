`timescale 1ns / 1ps

module vend(
    input sys_clk, sys_rst_n,
    input coin5, coin10,
    output [3 : 0] an,
    output [7 : 0] a_to_g,
    output open
    );
    
    logic [7:0]price,change,bcd_0,bcd_1;
    logic clk_1MS;
    logic [3:0]x7seg_data;
    logic have_coin5,have_coin10;
    
    clken U0(
        .sys_clk    (sys_clk),
        .sys_rst_n  (sys_rst_n),
        .clk_flag   (clk_1MS)
    );
    edge_detect U1(
        .sys_clk    (sys_clk),
        .sys_rst_n  (sys_rst_n),
        .coin5      (coin5),
        .coin10     (coin10),
        .have_coin5 (have_coin5),
        .have_coin10(have_coin10)
    );
    state U2(
        .sys_clk    (sys_clk),
        .sys_rst_n  (sys_rst_n),
        .have_coin5 (have_coin5),
        .have_coin10(have_coin10),
        .price      (price),
        .change     (change),
        .open       (open)
    );
    bin2bcd_0 U3(
        .bin        (price),
        .bcd        (bcd_0)
    );
    bin2bcd_0 U4(
        .bin        (change),
        .bcd        (bcd_1)
    );
    x7seg_scan U5(
        .sys_clk    (sys_clk),
        .sys_rst_n  (sys_rst_n),
        .clk_flag   (clk_1MS),
        .price      (bcd_0),
        .change     (bcd_1),
        .x7seg_data (x7seg_data),
        .an         (an)
    );
    x7seg_dec U6(
        .D          (x7seg_data),
        .a_to_g     (a_to_g)
    );
    
    
endmodule