`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/25 08:52:38
// Design Name: 
// Module Name: fulladder
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


module fulladder(
    input logic A,
    input logic B,
    input logic Cin,
    output logic S,
    output logic Cout
    );    
    always_comb begin
        if((A==1&&B==1&&Cin==1)||(A==1&&B==0&&Cin==0)||(A==0&&B==1&&Cin==0)||(A==0&&B==0&&Cin==1)) begin
            S = 1;
        end
        else begin S = 0; end
        if((A==1&&B==1&&Cin==1)||(A==1&&B==1&&Cin==0)||(A==0&&B==1&&Cin==1)||(A==1&&B==0&&Cin==1)) begin
            Cout = 1;
        end
        else begin Cout = 0; end
    end
endmodule
