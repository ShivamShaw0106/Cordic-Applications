`timescale 1ns / 1ps

module Cordic_rotation_tb;
 parameter N =31; 
 parameter M =31;  
  reg  signed [N :0] x0;
  reg  signed [N :0] y0;
  reg clk;
  reg rst;
  wire signed [N:0] xf;
  
  wire signed [N:0] yf;
  
  wire [M:0] output_angle;

  // Instantiate the Cordic_rotation module
  C_rot uut(
    .x0(x0),
    .y0(y0),
    .clk(clk),
    .rst(rst),
    .xf(xf),
    .yf(yf),
  //  .xfcal(xfcal),
//    .yfcal(yfcal),
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
//        x0 = 32'sb000000000011_0000_0000_0000_0000_0000;
//        y0 = 32'sb000000000100_0000_0000_0000_0000_0000;


    x0 = 32'sh003_00000;
    y0 = 32'sh004_00000;
    
    
//    x0 = 32'sh005_00000;
//    y0 = 32'sh000_00000;
   
   #165     // set clock
    
    rst =1;
    
    #45
    
        rst =0 ;
    // Initialize inputs
//        x0 = 32'sb000000000011_0000_0000_0000_0000_0000;
//        y0 = 32'sb000000000100_0000_0000_0000_0000_0000;


    x0 = 32'sh005_00000;
    y0 = 32'sh000_00000;
    
    
//    x0 = 32'sh005_00000;
//    y0 = 32'sh000_00000;
   
   #165     // set clock
    
    rst =1;
    
    
    
    #500;
    $finish;
  end
endmodule
