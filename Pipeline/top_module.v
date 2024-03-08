`timescale 1ns / 1ps


module top_module #(parameter N = 31,M=31) (

        input signed [N:0] a,
        input signed [N:0] b,
        input signed [N:0] p,
        input signed [N:0] q,
        
        input clk,
        input rst,rst1,
        output   signed  [N:0] af,
        output   signed  [N:0] bf,
        output   signed  [N:0] pf,
        output   signed  [N:0] qf,
        //output  signed [N:0] afcal,
        //output  signed [N:0] bfcal,
        output  [M:0]  output_angle_vec,
        output  [M:0]  output_angle_rot


    );
    
    vectoring DUT (  .x0(a),.y0(b), .clk(clk), .rst(rst) , .xf(af), .yf(bf),  .output_angle(output_angle_vec) );
    
    Rotation  UUT (  .x0(p),.y0(q), .clk(clk), .rst(rst1) , .xf(pf),.yf(qf), .output_angle(output_angle_rot),.inangle(output_angle_vec) );
    
    
    
endmodule
