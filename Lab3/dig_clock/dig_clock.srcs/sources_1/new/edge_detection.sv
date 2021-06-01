`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/27 11:04:20
// Design Name: 
// Module Name: edge_detection
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


module edge_detection(
    input logic sys_clk,
    input logic sys_rst_n,
    input logic i_btn,
    output logic pos_edge
    );
    
    logic [1:0]dff_Q;
    
    always_ff@(posedge sys_clk) begin
        if(!sys_rst_n) dff_Q <= 2'b00;
        else dff_Q <= {dff_Q[0], i_btn};
    end
    
    assign pos_edge = ~dff_Q[1] & dff_Q[0];
    
endmodule
