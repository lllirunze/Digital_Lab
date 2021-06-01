`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/25 09:04:18
// Design Name: 
// Module Name: rca
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


module rca(
    input [3:0]A,
    input [3:0]B,
    input Cin,
    output [3:0]S,
    output Cout
    );
    wire [4:0] temp;
    assign temp[0] = Cin; 
    genvar i;
    for(i=0; i<4; i=i+1) begin
        fulladder add(
            .A      (A[i]),
            .B      (B[i]),
            .Cin    (temp[i]),
            .Cout   (temp[i+1]),
            .S      (S[i])
        );
    end
    assign cout = temp[4];
endmodule
