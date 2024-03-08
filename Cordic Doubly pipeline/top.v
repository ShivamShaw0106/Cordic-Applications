`timescale 1ns / 1ps


module C_rot #(parameter N = 31,cos=26'b000000010_0110_1101_1101_0100,M=31) (

        input signed [N:0] a,
        input signed [N:0] b,
        input signed [N:0] p,
        input signed [N:0] q,
        //input [15:0] inangle,
        input clk,
        input rst,
        output   signed  [N:0] af,
        output   signed  [N:0] bf,
        output   signed  [N:0] pf,
        output   signed  [N:0] qf,
        //output  signed [N:0] afcal,
        //output  signed [N:0] bfcal,
        output  [M:0]  output_angle
        
    );
   
    
    wire  [3:0] shift;
    wire  [M:0] microangle;
    wire  signed [N:0] a0,ax1,ax2,ax3,ax4,ax5,ax6,ax7,ax8,ax9,ax10,ax11,ax12,ax13,ax14,ax15 ;
    wire  signed [N:0] b0,by1,by2,by3,by4,by5,by6,by7,by8,by9,by10,by11,by12,by13,by14,by15 ;
    wire  signed [N:0] p0,px1,px2,px3,px4,px5,px6,px7,px8,px9,px10,px11,px12,px13,px14,px15 ;
    wire  signed [N:0] q0,qy1,qy2,qy3,qy4,qy5,qy6,qy7,qy8,qy9,qy10,qy11,qy12,qy13,qy14,qy15 ;
    wire  [M:0] outangle0 ,outangle1 ,outangle2 ,outangle3 ,outangle4 ,outangle5 ,outangle6 ,outangle7, outangle8,outangle9,outangle10,outangle11;
    wire  [M:0] outangle12,outangle13,outangle14,outangle15 ;
    wire  [M:0] dec_angle;
   // reg  [15:0] output_angle_it=0;
    reg signed  [N:0] af1=0;
    reg signed  [N:0] bf1=0;
    reg signed  [N:0] pf1=0;
    reg signed  [N:0] qf1=0;
    reg [M:0]  output_angle1=0;

    
    
    iteration Rot0( .a(a) , .b(b) , .p(p) , .q(q)      ,.shift(4'd0),  .dec_angle(32'h0)     , .microangle(32'h02D_00000),   .clk(clk), .ax(a0),.by(b0), .px(p0),.qy(q0), .outangle(outangle0) );
    
    
   
    iteration Rot1( .a(a0), .b(b0),   .p(p0) , .q(q0) , .shift(4'd1),  .dec_angle(outangle0) ,  .microangle( 32'h01A_90A30 ), .clk(clk), .ax(ax1),.by(by1), .px(px1),.qy(qy1), .outangle(outangle1));
    
    iteration Rot2( .a(ax1), .b(by1), .p(px1) , .q(qy1) , .shift(4'd2),  .dec_angle(outangle1) ,.microangle( 32'h00E_09470 ), .clk(clk), .ax(ax2),.by(by2),.px(px2),.qy(qy2), .outangle(outangle2));
     
    iteration Rot3( .a(ax2) ,.b(by2), .p(px2) , .q(qy2) , .shift(4'd3),  .dec_angle(outangle2) ,.microangle( 32'h007_2000A ),  .clk(clk), .ax(ax3),.by(by3),.px(px3),.qy(qy3), .outangle(outangle3));
    
    iteration Rot4( .a(ax3), .b(by3), .p(px3) , .q(qy3) , .shift(4'd4),  .dec_angle(outangle3) , .microangle( 32'h003_938AA ), .clk(clk), .ax(ax4),.by(by4),.px(px4),.qy(qy4), .outangle(outangle4));
    
    iteration Rot5( .a(ax4), .b(by4), .p(px4) , .q(qy4) , .shift(4'd5),   .dec_angle(outangle4) ,.microangle( 32'h001_CA379 ),.clk(clk), .ax(ax5),.by(by5),.px(px5),.qy(qy5), .outangle(outangle5));
    
    iteration Rot6( .a(ax5), .b(by5), .p(px5) , .q(qy5) , .shift(4'd6),  .dec_angle(outangle5) ,  .microangle( 32'h000_E52A1 ), .clk(clk), .ax(ax6),.by(by6),.px(px6),.qy(qy6), .outangle(outangle6));
    
    iteration Rot7( .a(ax6), .b(by6), .p(px6) , .q(qy6) ,.shift(4'd7),   .dec_angle(outangle6) ,  .microangle( 32'h000_7296D ), .clk(clk), .ax(ax7),.by(by7),.px(px7),.qy(qy7),.outangle(outangle7));
    
    
    
  
    iteration Rot8 ( .a(ax7),  .b(by7),  .p(px7) , .q(qy7) , .shift(4'd8),    .dec_angle(outangle7)  ,.microangle( 32'h000_394BA ), .clk(clk), .ax(ax8), .by(by8), .px(px8),.qy(qy8),  .outangle(outangle8));
     
    iteration Rot9 ( .a(ax8),  .b(by8),  .p(px8) , .q(qy8) , .shift(4'd9),    .dec_angle(outangle8)  , .microangle( 32'h000_1CA5D ), .clk(clk), .ax(ax9), .by(by9), .px(px9),.qy(qy9),  .outangle(outangle9));
     
    iteration Rot10( .a(ax9),  .b(by9),  .p(px9) , .q(qy9) , .shift(4'd10),   .dec_angle(outangle9)  , .microangle( 32'h000_0E52E ), .clk(clk), .ax(ax10), .by(by10), .px(px10),.qy(qy10), .outangle(outangle10));
    
   iteration Rot11( .a(ax10), .b(by10), .p(px10) , .q(qy10) , .shift(4'd11),  .dec_angle(outangle10) , .microangle(  32'h000_07297 ), .clk(clk), .ax(ax11), .by(by11), .px(px11),.qy(qy11), .outangle(outangle11));
    
   iteration Rot12( .a(ax11), .b(by11), .p(px11) , .q(qy11) , .shift(4'd12),  .dec_angle(outangle11) , .microangle(  32'h000_0394B ), .clk(clk), .ax(ax12), .by(by12), .px(px12),.qy(qy12), .outangle(outangle12));
    
    
    
    iteration Rot13( .a(ax12), .b(by12), .p(px12) , .q(qy12) , .shift(4'd13),  .dec_angle(outangle12) ,.microangle( 32'h000_01CA5 ), .clk(clk),  .ax(ax13),.by(by13),  .px(px13),.qy(qy13), .outangle(outangle13));
    
    iteration Rot14( .a(ax13), .b(by13), .p(px13) , .q(qy13) , .shift(4'd14),  .dec_angle(outangle13) , .microangle( 32'h000_00E52 ), .clk(clk), .ax(ax14),.by(by14),  .px(px14),.qy(qy14), .outangle(outangle14));
    
        
    iteration Rot15( .a(ax14), .b(by14), .p(px14) , .q(qy14) , .shift(4'd15),  .dec_angle(outangle14) ,.microangle( 32'h000_00729 ),  .clk(clk), .ax(ax15),.by(by15),  .px(px15),.qy(qy15), .outangle(outangle15));
    
    
    
//   assign output_angle = outangle12;
    
    
//   assign af = (0.607)*ax12;
//   assign bf = (0.607)*by12;

       
//   assign pf = (0.607)*px12;
//   assign qf = (0.607)*qy12;

    
always @(posedge clk) begin
    if (!rst)
     begin // Reset outputs to zero until ready
        af1 <= 0;
        bf1 <= 0;
        pf1 <= 0;
        qf1 <= 0;
        output_angle1 <= 0;
    end 
    
    else if (b==0)
    begin
        af1 <= a;
        bf1 <= 0;
        pf1 <= p;
        qf1 <= q;
        output_angle1 <= 0;

    end
    
    else if ((p==0)&&(q==0))
    begin

        pf1 <= 0;
        qf1 <= 0;
        
        af1 <= (ax15 >>> 1) + (ax15 >>> 3) + (ax15 >>> 6) - (ax15 >>> 5) - (ax15 >>> 9);
        bf1 <= (by15 >>>1) +  (by15 >>> 3) +  (by15 >>> 6) -  (by15 >>> 5) - (by15 >>>9);
        
        
        output_angle1 <= outangle15;

    
    
    
    end

    else 
    begin // Output valid results when ready
        af1 <= (ax15 >>> 1) + (ax15 >>> 3) + (ax15 >>> 6) - (ax15 >>> 5) - (ax15 >>> 9);
        bf1 <= (by15 >>>1) +  (by15 >>> 3) +  (by15 >>> 6) -  (by15 >>> 5) - (by15 >>>9);
        pf1 <= (px15 >>> 1) + (px15 >>> 3) +  (px15 >>> 6) - (px15 >>> 5) - (px15 >>> 9);
        qf1 <= (qy15 >>>1) +  (qy15 >>> 3) +  (qy15 >>> 6) -  (qy15 >>> 5) - (qy15 >>>9);
        output_angle1 <= outangle15;
    end
end


assign af = af1;
assign bf = bf1;
assign pf = pf1;
assign qf = qf1;



assign output_angle = output_angle1;









//   assign af = (ax15 >>> 1) + (ax15 >>> 3) + (ax15 >>> 6) - (ax15 >>> 5) - (ax15 >>> 9);
   
    
//   assign bf = (by15 >>>1) +  (by15 >>>3) +  (by15 >>>6) -  (by15 >>> 5) - (by15 >>>9);

//assign af = afr;
//assign bf = bfr;
//assign output_angle = outangle15;
    
    
    
    
endmodule
