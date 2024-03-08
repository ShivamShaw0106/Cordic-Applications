`timescale 1ns / 1ps

 module iteration #(parameter N = 31,M=31) (
input signed [N:0] a,p,
input signed [N:0] b,q,

input  [3:0]shift,
//input [15:0] inangle,
input [M:0] microangle,
input [M:0] dec_angle ,
input clk,
output  reg signed [N:0] ax,px,
output  reg signed [N:0] by,qy,
output reg [M:0] outangle
) ;
// reg  signed [N:0] ox_shift;
// reg  signed [N:0] oy_shift;

always @ (posedge clk)

 begin

  if ( b  > 0  )
   begin
    ax <= a + (b >>> shift);
    by <= b - (a >>> shift);
    
    outangle <= dec_angle + microangle;
    
    px <= p + (q >>> shift);
    qy <= q - (p >>> shift);
    
   
  end 
  else begin
    ax <= a - (b >>> shift);
    by <= b + (a >>> shift);
    
    outangle <= dec_angle - microangle;
    
    px <= p - (q >>> shift);
    qy <= q + (p >>> shift);
    
   
  end

end

//assign ox= (ox_shift >>>(0*(shift)));
//assign oy= (oy_shift >>>(0*(shift)));


endmodule
