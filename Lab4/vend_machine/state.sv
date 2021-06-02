`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/01 10:46:16
// Design Name: 
// Module Name: state
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


module state(
    input           sys_clk,
    input           sys_rst_n,
    input           have_coin5,
    input           have_coin10,
    output logic    [7:0]price,
    output logic    [7:0]change,
    output logic    open
    );
    
    logic [30:0]cnt;
    logic start_flag;
    logic [1:0]S0,S1,S2,S3;
    logic [1:0]current_state,next_state;
    logic [7:0]cnt5,cnt10;
    logic Is20;
    logic flag;
    
    assign S0=0;
    assign S1=1;
    assign S2=2;
    assign S3=3;
    
    always_ff @(posedge sys_clk) begin
        if(!sys_rst_n) begin
            cnt <= 0;
            flag <= 0;
        end
        else if(next_state == S3) begin
            if(cnt == 249_999_990) begin
                flag <= 1;
                cnt <= 0;
            end
        end
        else flag <= 0;
    end
    always_ff @(posedge sys_clk) begin
        if(!sys_rst_n) Is20 <= 0;
        else if(current_state == S2 && have_coin10) Is20 <= 1;
        else if(next_state == S0) Is20 <= 0;
        else Is20 <= Is20;
    end
    always_ff @(posedge sys_clk) begin
        if(!sys_rst_n) current_state <= S0;
        else current_state <= next_state;
    end
    
    always_comb begin
        case(current_state)
            S0: begin
                if(have_coin5) next_state = S1;
                else if(have_coin10) next_state = S2;
                else next_state = S0;
            end
            S1: begin
                if(have_coin5) next_state = S2;
                else if(have_coin10) next_state = S3;
                else next_state = S1;
            end
            S2: begin
                if(have_coin5) next_state = S3;
                else if(have_coin10) next_state = S3;
                else next_state = S2;
            end
            S3: begin
                if(flag) next_state = S0;
                else next_state = S3;
            end
        endcase
    end
    
    always_ff @(posedge sys_clk) begin
        case(next_state)
            S0: begin
                open <= 0;
                change <= 0;
                price <= 0;
            end
            S1: begin
                open <= 0;
                change <= 0;
                price <= 5;
            end
            S2: begin
                open <= 0;
                change <= 0;
                price <= 10;
            end
            S3: begin
                open <= 1;
                if(Is20) begin
                    change <= 5;
                    price <= 20;
                end
                else begin
                    change <= 0;
                    price <= 15;
                end
            end
        endcase
    end
    
endmodule
