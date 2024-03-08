`timescale 1ns / 1ps

module Cordic_rotation_tb;
 parameter N =31;
 parameter M =31;
  reg  signed [N :0] x0;
  reg  signed [N :0] y0;
  reg [M:0] inanglei;
  reg clk;
  reg rst;
  wire signed [N:0] xf;
  //xfcal;
  wire signed [N:0] yf;
  //yfcal;
  wire [M:0] output_angle;

  // Instantiate the Cordic_rotation module
  C_rot uut(
    .x0(x0),
    .y0(y0),
    .clk(clk),
    .rst(rst),
    .inanglei(inanglei),
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


//         x0 = 32'sh000_00000;        /*   sin theta            */
//         y0 = 32'sh001_00000;        /*   cos theta           */
//    inangle = 32'h01E_00000;         /*   30 degree        */
    


          /*   1st quadrant       */
          x0 = 32'sh003_00000;
          y0 = 32'sh004_00000;     
        
//          /*   2nd quadrant       */        
//          x0 = 32'shFFD_00000;
//          y0 = 32'sh004_00000; 
          
//          /*   3rd quadrant       */
//          x0 = 32'shFFD_00000;
//          y0 = 32'shFFC_00000; 
          
//          /*   4th quadrant       */
//          x0 = 32'sh003_00000;
//          y0 = 32'shFFC_00000; 
        
    
    
    
    
    
//    inanglei = 32'h035_1EB85;       /*   53.13 degree      */
//    inanglei = 32'h078_00000;       /*   120 degree        */
//    inanglei = 32'h0D2_00000;       /*   210 degree        */
    inanglei = 32'h14A_00000;       /*   330 degree        */
//      inanglei = 32'h168_00000;       /*   360 degree        */
    
//   x0 = 32'sh000_00000;          /*   corner case x=0        */
//   y0 = 32'sh000_00000;         /*   corner case y=0       */
    
    
    //inangle = 32'h000_00000;      /*   corner case inangle =0        */
 
 
 
   #165                           /* set clock          */
   rst =1;
   
    
  
    
//   #45                            /*   2nd set of input       */
    
    
//        rst =0 ;


//    x0 = 32'sh008_00000;
//    y0 = 32'sh006_00000;
    
    
////   x0 = 32'sh000_00000;
////    y0 = 32'sh000_00000;
    
//    inangle = 32'h024_DEB19;
//    inangle = 32'h000_00000;
//   #165      // set clock
    
//    rst =1;
    
    
    
    
    #500;
    $finish;
  end


endmodule
