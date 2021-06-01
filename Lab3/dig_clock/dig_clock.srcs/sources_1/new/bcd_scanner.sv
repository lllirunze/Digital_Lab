`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/27 11:08:14
// Design Name: 
// Module Name: bcd_scanner
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


module bcd_scanner(
    input logic sys_rst_n,
    input logic clk_flag,
    input logic sys_clk,
    input logic[7:0] min,
    input logic[7:0] sec,
    output logic[3:0] an,
    output logic[7:0] a_to_g
    );
    
    logic [1:0]temp;
    logic [3:0]data;
    
    always_ff@(posedge sys_clk) begin
        if(!sys_rst_n) temp <= 0;
        else if(clk_flag) begin
            if(temp == 3) temp <= 2'b00;
            else temp <= temp+1;
        end
    end
    
    always_ff@(posedge clk_flag) begin
        if(!sys_rst_n) begin
            data <= 0;
            a_to_g <= ~8'b00111111;
            an <= 4'b1111;
        end
        else begin
            case(temp)
                0 : begin an<=4'b0001; end
                1 : begin an<=4'b0010; end
                2 : begin an<=4'b0100; end
                3 : begin an<=4'b1000; end
            endcase
            case(an)
                4'b0001 : begin data<= min[3:0]; end
                4'b0010 : begin data<= min[7:4]; end
                4'b0100 : begin data<= sec[3:0]; end
                4'b1000 : begin data<= sec[7:4]; end            
            endcase
            case(data)
                4'b0000: a_to_g<=~8'b00111111;     
                4'b0001: a_to_g<=~8'b00000110;     
                4'b0010: a_to_g<=~8'b01011011;     
                4'b0011: a_to_g<=~8'b01001111;     
                4'b0100: a_to_g<=~8'b01100110;     
                4'b0101: a_to_g<=~8'b01101101;     
                4'b0110: a_to_g<=~8'b01111101;     
                4'b0111: a_to_g<=~8'b00000111;     
                4'b1000: a_to_g<=~8'b01111111;     
                4'b1001: a_to_g<=~8'b01101111;    
                default: a_to_g<=~8'b00111111;
            endcase
        end
    end
    
endmodule
