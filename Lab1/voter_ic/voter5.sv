`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/14 22:29:35
// Design Name: 
// Module Name: voter5
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


module voter5(
    input [4:0] I,
    output logic pass
    );
    logic [3:0] Y1;
    logic [7:0] Y2;
    logic [7:0] Y3;
    logic [7:0] Y4;
    logic [7:0] Y5;
    
    dec_74LS139 test(I[4:3],1'b0,Y1);
    dec_74LS138 a(.D(I[2:0]),.G({1'B1,Y1[0],Y1[0]}),.Y(Y2));
    dec_74LS138 b(.D(I[2:0]),.G({1'B1,Y1[1],Y1[1]}),.Y(Y3));
    dec_74LS138 c(.D(I[2:0]),.G({1'B1,Y1[2],Y1[2]}),.Y(Y4));
    dec_74LS138 d(.D(I[2:0]),.G({1'B1,Y1[3],Y1[3]}),.Y(Y5));
    
    always_comb begin
    if(Y5 != 8'b11111111) begin
        if (Y5 == 8'b11111110)begin
            pass = 1'b0;
        end
        else begin pass = 1'b1;end
    
    /*case (Y2)
        8'b11111110:begin pass = 0 ;end  
        8'b11111101:begin pass = 0end
        8'b11111011:begin end
        8'b11110111:begin end
        8'b11101111:begin end
        8'b11011111:begin end
        8'b10111111:begin end
        8'b01111111:begin end*/
    
     end
    
    
    if(Y4 !=8'b11111111) begin
        if (Y4 >= 8'b11111011| Y4==8'b11101111)begin
                pass = 1'b0;
            end
        else begin pass = 1'b1;end
     end
    
        
    if(Y3 !=8'b11111111) begin
         if (Y3 >= 8'b11111011| Y3==8'b11101111)begin
                   pass = 1'b0;
               end
           else begin pass = 1'b1;end    
     end
    
            
    if(Y2 !=8'b11111111) begin 
         if (Y2 == 8'b01111111) begin
              pass = 1'b1;
         end
         else begin pass = 1'b0;end
    
    end 
   
   end
endmodule
