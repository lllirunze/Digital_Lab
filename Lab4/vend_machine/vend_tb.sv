`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/01 11:22:55
// Design Name: 
// Module Name: vend_tb
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


module vend_tb();

    logic sys_clk,sys_rst_n,coin5,coin10,open;
    logic [3:0]an;
    logic [7:0]a_to_g;
    
    vend test(
        .sys_clk    (sys_clk),
        .sys_rst_n  (sys_rst_n),
        .coin5      (coin5),
        .coin10     (coin10),
        .an         (an),
        .a_to_g     (a_to_g),
        .open       (open)
    );
    
    initial begin
        sys_clk <= 1'b0;
        sys_rst_n <= 1'b0;
        coin5 <= 1'b0;
        coin10 <= 1'b0;
        
        #100;   sys_rst_n <= 1'b1;
        #200; coin5 <= 1'b1;
        #200; coin10 <= 1'b1;
    end
    
    always #5 sys_clk = ~sys_clk;
    
    initial begin
        $timeformat(-9,0,"ns",5);
        $monitor("At time %t: sys_rst_n = %b, a_to_g = %d, open = %d", $time,sys_rst_n,a_to_g,open);
    end

endmodule
