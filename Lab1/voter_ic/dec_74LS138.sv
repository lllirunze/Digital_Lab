`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/14 22:27:28
// Design Name: 
// Module Name: dec_74LS138
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


module dec_74LS138(
    input  [2:0] D,
    [2:0] G,
    output logic [7:0] Y
    );
    always_comb begin
        if( G == 3'b100)begin
            case(D)
            3'b000 :  Y = 8'b11111110 ;
            3'b001 :  Y = 8'b11111101 ;
            3'b010 :  Y = 8'b11111011 ;
            3'b011 :  Y = 8'b11110111 ;
            3'b100 :  Y = 8'b11101111 ;
            3'b101 :  Y = 8'b11011111 ;
            3'b110 :  Y = 8'b10111111 ;
            3'b111 :  Y = 8'b01111111 ;
        endcase
       end
      else  begin  Y = 8'b11111111 ; end
    end
    
endmodule
