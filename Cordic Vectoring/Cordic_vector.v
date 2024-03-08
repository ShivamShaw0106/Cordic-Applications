`timescale 1ns / 1ps



module C_rot #(parameter N = 31,cos=26'b000000010_0110_1101_1101_0100,M=31) (
        input signed [N:0] x0,
        input signed [N:0] y0,
      
        input clk,
        input rst,
        output   signed  [N:0] xf,
        output   signed  [N:0] yf,
     
        output   [M:0]  output_angle
    );
   
   // wire signed [N:0] y_dec1,y_dec2,y_dec3,y_dec4,y_dec5,y_dec6,y_dec7,y_dec8,y_dec9,y_dec10,y_dec11,y_dec12;
    wire  [3:0] shift;
    wire  [M:0] microangle;
    wire  signed [N:0] ox0,ox1,ox2,ox3,ox4,ox5,ox6,ox7,ox8,ox9,ox10,ox11,ox12,ox13,ox14,ox15 ;
    wire  signed [N:0] oy0,oy1,oy2,oy3,oy4,oy5,oy6,oy7,oy8,oy9,oy10,oy11,oy12,oy13,oy14,oy15 ;
    wire  [M:0] outangle0 ,outangle1 ,outangle2 ,outangle3 ,outangle4 ,outangle5 ,outangle6 ,outangle7, outangle8,outangle9,outangle10,outangle11;
    wire  [M:0] outangle12,outangle13,outangle14,outangle15 ;
    wire  [M:0] dec_angle;
    reg signed  [N:0] xf1=0;
    reg signed  [N:0] yf1=0;
    reg [M:0]  output_angle1=0;
    
    
    iteration Rot0( .a(x0) , .b(y0) , .shift(4'd0),  .dec_angle(32'h0)     , .microangle(32'h02D_00000), .clk(clk), .ox(ox0),.oy(oy0), .outangle(outangle0) );
    
    
   
    iteration Rot1( .a(ox0), .b(oy0), .shift(4'd1),  .dec_angle(outangle0) , .microangle(32'h01A_90A30), .clk(clk), .ox(ox1),.oy(oy1), .outangle(outangle1));
    
    iteration Rot2( .a(ox1), .b(oy1), .shift(4'd2),  .dec_angle(outangle1) , .microangle(32'h00E_09470), .clk(clk), .ox(ox2),.oy(oy2), .outangle(outangle2));
     
    iteration Rot3( .a(ox2) ,.b(oy2), .shift(4'd3),  .dec_angle(outangle2) ,.microangle( 32'h007_2000A ), .clk(clk), .ox(ox3),.oy(oy3), .outangle(outangle3));
    
    iteration Rot4( .a(ox3), .b(oy3), .shift(4'd4),  .dec_angle(outangle3) , .microangle( 32'h003_938AA ),.clk(clk), .ox(ox4),.oy(oy4), .outangle(outangle4));
    
    iteration Rot5( .a(ox4), .b(oy4), .shift(4'd5),  .dec_angle(outangle4) , .microangle( 32'h001_CA379 ),.clk(clk), .ox(ox5),.oy(oy5), .outangle(outangle5));
    
    iteration Rot6( .a(ox5), .b(oy5), .shift(4'd6),  .dec_angle(outangle5) , .microangle( 32'h000_E52A1 ), .clk(clk), .ox(ox6),.oy(oy6), .outangle(outangle6));
    
    iteration Rot7( .a(ox6), .b(oy6), .shift(4'd7), .dec_angle(outangle6) , .microangle( 32'h000_7296D ),.clk(clk), .ox(ox7),.oy(oy7), .outangle(outangle7));
    
    
    
  
    iteration Rot8 ( .a(ox7),  .b(oy7),   .shift(4'd8),  .dec_angle(outangle7)  , .microangle( 32'h000_394BA ), .clk(clk), .ox(ox8), .oy(oy8),   .outangle(outangle8));
     
    iteration Rot9 ( .a(ox8),  .b(oy8),   .shift(4'd9),  .dec_angle(outangle8)  , .microangle( 32'h000_1CA5D ), .clk(clk), .ox(ox9), .oy(oy9),   .outangle(outangle9));
     
    iteration Rot10( .a(ox9),  .b(oy9),   .shift(4'd10), .dec_angle(outangle9)  , .microangle( 32'h000_0E52E ), .clk(clk), .ox(ox10), .oy(oy10), .outangle(outangle10));
    
    iteration Rot11( .a(ox10), .b(oy10),  .shift(4'd11),  .dec_angle(outangle10) , .microangle(  32'h000_07297 ), .clk(clk), .ox(ox11), .oy(oy11), .outangle(outangle11));
    
    iteration Rot12( .a(ox11), .b(oy11),  .shift(4'd12),  .dec_angle(outangle11) , .microangle(  32'h000_0394B ), .clk(clk), .ox(ox12), .oy(oy12), .outangle(outangle12));
    
    
    iteration Rot13( .a(ox12), .b(oy12), .shift(4'd13),  .dec_angle(outangle12) , .microangle( 32'h000_01CA5 ), .clk(clk), .ox(ox13),.oy(oy13), .outangle(outangle13));
    
    iteration Rot14( .a(ox13), .b(oy13), .shift(4'd14),  .dec_angle(outangle13) , .microangle( 32'h000_00E52 ), .clk(clk), .ox(ox14),.oy(oy14), .outangle(outangle14));
    
        
    iteration Rot15( .a(ox14), .b(oy14), .shift(4'd15),  .dec_angle(outangle14) , .microangle( 32'h000_00729 ), .clk(clk), .ox(ox15),.oy(oy15), .outangle(outangle15));
    
    
    
//   assign output_angle = outangle15;
    
    
//   assign xf = (0.607)*ox15;
//   assign yf = (0.607)*oy15;


    
always @(posedge clk) begin
    if ((!rst) ||  ((x0==0)&&(y0==0))   )
     begin // Reset outputs to zero until ready
        xf1 <= 0;
        yf1 <= 0;
        output_angle1 <= 0;
    end 
    
    
    else if (y0==0)  
     begin // Reset outputs to zero until ready
        xf1 <= x0;
        yf1 <= 0;
        output_angle1 <= 0;
    end 
    
    
    
    
    else 
    begin // Output valid results when ready
        xf1 <= (ox15 >>> 1) + (ox15 >>> 3) + (ox15 >>> 6) - (ox15 >>> 5) - (ox15 >>> 9);
        yf1 <= (oy15 >>> 1) + (oy15 >>>3) +  (oy15 >>>6) -  (oy15 >>> 5) - (oy15 >>>9);
        output_angle1 <= outangle15;
    end
end

    
   assign xf = xf1;
   assign yf = yf1;
  assign output_angle = output_angle1;





//   assign xf = (ox15 >>> 1) + (ox15 >>> 3) + (ox15 >>> 6) - (ox15 >>> 5) - (ox15 >>> 9);
   
    
//   assign yf = (oy15 >>>1) +  (oy15 >>>3) +  (oy15 >>>6) -  (oy15 >>> 5) - (oy15 >>>9);

//assign xf = xfr;
//assign yf = yfr;
//assign output_angle = outangle15;
    
    
    
    
endmodule
