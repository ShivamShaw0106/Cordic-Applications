`timescale 1ns / 1ps

module Cordic_rotation_tb;
 parameter N =31;  
 parameter M =31; 
  reg  signed [N :0] a,p;
  reg  signed [N :0] b,q;
  reg clk;
  reg rst,rst1;
  wire signed [N:0] af,pf;
  
  wire signed [N:0] bf,qf;
  
  wire [M:0] output_angle_rot,output_angle_vec;

  // Instantiate the Cordic_rotation module
  top_module top(
    .a(a),
    .b(b),
    .p(p),
    .q(q),
    
    .clk(clk),
    .rst(rst),
    .rst1(rst1),
    .af(af),
    .bf(bf),
    .pf(pf),
    .qf(qf),

    .output_angle_rot(output_angle_rot),
    .output_angle_vec(output_angle_vec)
    
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  // Apply stimulus
  initial begin
  rst =0 ;
  rst1=0 ;
    // Initialize inputs
    a = 32'sh003_00000;
    b = 32'sh004_00000;
    
    p = 32'sh000_00000;
    q = 32'sh001_00000;
    //inangle = 16'd70_95;
   #165      // set clock
    
   rst =1;
   
   #170
   
   rst1 =1;
    
    #500;
    $finish;
  end


endmodule
