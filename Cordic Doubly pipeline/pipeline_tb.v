`timescale 1ns / 1ps

module Cordic_rotation_tb;
 parameter N =31;  
 parameter M =31; 
  reg  signed [N :0] a,p;
  reg  signed [N :0] b,q;
  reg clk;
  reg rst;
  wire signed [N:0] af,pf;
  
  wire signed [N:0] bf,qf;
  
  wire [M:0] output_angle;

  // Instantiate the Cordic_rotation module
  C_rot uut(
    .a(a),
    .b(b),
    .p(p),
    .q(q),
    
    .clk(clk),
    .rst(rst),
    .af(af),
    .bf(bf),
    .pf(pf),
    .qf(qf),

    .output_angle(output_angle)
    
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  // Apply stimulus
  initial begin
  rst =0 ;
    // Initialize inputs
    a = 32'sh003_00000;
    b = 32'sh004_00000;
    
    p = 32'sh003_00000;
    q = 32'sh004_00000;
    //inangle = 16'd70_95;
    #165      // set clock
    
   rst =1;
    
    
    #200;
    $finish;
  end


endmodule
