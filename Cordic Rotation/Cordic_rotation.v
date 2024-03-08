`timescale 1ns / 1ps

//#(parameter N = M)

module C_rot #(parameter N = 31,cos=26'b000000010_0110_1101_1101_0100,M=31) (

        input signed [N:0] x0,
        input signed [N:0] y0,
        input [M:0] inanglei,
        input clk,
        input rst,
        output  signed  [N:0] xf,
        output  signed  [N:0] yf,
        //output  signed [N:0] xfcal,
        //output  signed [N:0] yfcal,
        output   [M:0]  output_angle
        
    );
  // parameter  cosm=26'b0_1001_1011_0111_0101_00;

    reg signed [N:0] xfr,yfr;
    wire  [3:0] shift;
    wire  [M:0] microangle;
    wire  signed [N:0] ox0,ox1,ox2,ox3,ox4,ox5,ox6,ox7,ox8,ox9,ox10,ox11,ox12,ox13,ox14,ox15 ;
    wire  signed [N:0] oy0,oy1,oy2,oy3,oy4,oy5,oy6,oy7,oy8,oy9,oy10,oy11,oy12,oy13,oy14,oy15 ;
    wire  [M:0] outangle0 ,outangle1 ,outangle2 ,outangle3 ,outangle4 ,outangle5 ,outangle6 ,outangle7, outangle8,outangle9,outangle10,outangle11;
    wire  [M:0] outangle12,outangle13,outangle14,outangle15 ;
    wire  [M:0] dec_angle;
    reg  [M:0] output_angle_it=0;
    
    reg signed  [N:0] xf1=0;
    reg signed  [N:0] yf1=0;
    reg [M:0]  output_angle1=0;
    reg sel ;
    reg [N:0] xi=0,yi=0;
    reg [M:0] inangle=0;
    
    
   always @ (posedge clk)
    begin
    
        if (inanglei < 32'h05A_00000)
        begin
        
        xi <= x0;
        yi <= y0;
        inangle <= inanglei;
        
        end
        
        else if ((inanglei >= 32'h05A_00000) && (inanglei < 32'h0B4_00000))
        begin
        
        xi <= y0;
        yi <=(32'hfff_fffff-x0+1);
        inangle <= (inanglei-32'h05A_00000);
        
        end
        
       else if ((inanglei >= 32'h0B4_00000) && (inanglei < 32'h10E_00000))
       
            begin
                xi <= (32'hfff_fffff - x0 + 1);
                yi <= (32'hfff_fffff - y0 + 1);
                inangle <= (inanglei - 32'h0B4_00000);
            end
          //  else if ((inanglei >= 32'h10E_00000) && (inanglei < 32'h168_00000))
          else
            begin
                xi <= (32'hfff_fffff - y0 + 1);
                yi <= x0;
                inangle <= (inanglei - 32'h10E_00000);
            end
        
        
        
    
    end

    
    
    iteration Rot0( .a(xi) , .b(yi) , .shift(4'd0), .inangle(inangle), .dec_angle(32'h0),     .microangle(32'h02D_00000), .clk(clk), .ox(ox0),.oy(oy0), .outangle(outangle0) );
    
    
   
    iteration Rot1( .a(ox0), .b(oy0), .shift(4'd1), .inangle(inangle), .dec_angle(outangle0) , .microangle( 32'h01A_90A30 ), .clk(clk), .ox(ox1),.oy(oy1), .outangle(outangle1));
    
    iteration Rot2( .a(ox1), .b(oy1), .shift(4'd2), .inangle(inangle), .dec_angle(outangle1) , .microangle( 32'h00E_09470 ), .clk(clk), .ox(ox2),.oy(oy2), .outangle(outangle2));
     
    iteration Rot3( .a(ox2) ,.b(oy2), .shift(4'd3), .inangle(inangle), .dec_angle(outangle2) , .microangle( 32'h007_2000A ), .clk(clk), .ox(ox3),.oy(oy3), .outangle(outangle3));
    
    iteration Rot4( .a(ox3), .b(oy3), .shift(4'd4), .inangle(inangle), .dec_angle(outangle3) , .microangle( 32'h003_938AA ), .clk(clk), .ox(ox4),.oy(oy4), .outangle(outangle4));
    
    iteration Rot5( .a(ox4), .b(oy4), .shift(4'd5), .inangle(inangle), .dec_angle(outangle4) , .microangle( 32'h001_CA379 ), .clk(clk), .ox(ox5),.oy(oy5), .outangle(outangle5));
    
    iteration Rot6( .a(ox5), .b(oy5), .shift(4'd6), .inangle(inangle), .dec_angle(outangle5) , .microangle( 32'h000_E52A1 ), .clk(clk), .ox(ox6),.oy(oy6), .outangle(outangle6));
    
    iteration Rot7( .a(ox6), .b(oy6), .shift(4'd7), .inangle(inangle), .dec_angle(outangle6) , .microangle( 32'h000_7296D ), .clk(clk), .ox(ox7),.oy(oy7), .outangle(outangle7));
    
    
    
  
    iteration Rot8 ( .a(ox7),  .b(oy7),   .shift(4'd8),  .inangle(inangle), .dec_angle(outangle7)  , .microangle( 32'h000_394BA ), .clk(clk), .ox(ox8), .oy(oy8),   .outangle(outangle8));
     
    iteration Rot9 ( .a(ox8),  .b(oy8),   .shift(4'd9),  .inangle(inangle), .dec_angle(outangle8)  , .microangle( 32'h000_1CA5D ), .clk(clk), .ox(ox9), .oy(oy9),   .outangle(outangle9));
     
    iteration Rot10( .a(ox9),  .b(oy9),   .shift(4'd10), .inangle(inangle), .dec_angle(outangle9)  , .microangle( 32'h000_0E52E ), .clk(clk), .ox(ox10), .oy(oy10), .outangle(outangle10));
    
   iteration Rot11( .a(ox10), .b(oy10),  .shift(4'd11), .inangle(inangle), .dec_angle(outangle10) , .microangle(  32'h000_07297 ), .clk(clk), .ox(ox11), .oy(oy11), .outangle(outangle11));
    
   iteration Rot12( .a(ox11), .b(oy11),  .shift(4'd12), .inangle(inangle), .dec_angle(outangle11) , .microangle(  32'h000_0394B ), .clk(clk), .ox(ox12), .oy(oy12), .outangle(outangle12));
    
    
    iteration Rot13( .a(ox12), .b(oy12), .shift(4'd13), .inangle(inangle), .dec_angle(outangle12) , .microangle( 32'h000_01CA5 ), .clk(clk), .ox(ox13),.oy(oy13), .outangle(outangle13));
    
    iteration Rot14( .a(ox13), .b(oy13), .shift(4'd14), .inangle(inangle), .dec_angle(outangle13) , .microangle( 32'h000_00E52 ), .clk(clk), .ox(ox14),.oy(oy14), .outangle(outangle14));
    
        
    iteration Rot15( .a(ox14), .b(oy14), .shift(4'd15), .inangle(inangle), .dec_angle(outangle14) , .microangle( 32'h000_00729 ), .clk(clk), .ox(ox15),.oy(oy15), .outangle(outangle15));
    
    
    
//assign output_angle = outangle15;
//assign xf=ox15*(cos*2.0**-18);
//assign yf=oy15*(cos*2.0**-18);




    
    
always @(posedge clk ) begin
  if ((!rst) ||  ((x0==0)&&(y0==0))) 
    
     begin // Reset outputs to zero until ready
        xf1 <= 0;
        yf1 <= 0;
        output_angle1 <= 0;
    end 
    
    else if  (inangle==0)
      begin         // Reset outputs to zero until ready
        xf1 <= x0;
        yf1 <= y0;
        output_angle1 <= 0;
    end 
    
   
    else 
    begin // Output valid results when ready
        xf1 <= (ox15 >>> 1) + (ox15 >>> 3) + (ox15 >>> 6) - (ox15 >>> 5) - (ox15 >>> 9);
        yf1 <= (oy15 >>> 1) + (oy15 >>> 3) + (oy15 >>> 6) - (oy15 >>> 5) - (oy15 >>> 9);
        output_angle1 <= outangle15;
    end
end

assign xf = xf1;
assign yf = yf1;
assign output_angle = output_angle1;

    
    
    
    
endmodule
