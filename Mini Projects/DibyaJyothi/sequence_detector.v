module sequence_detector(output reg y,input x,clk,rst);
parameter s0=0,s1=1,s2=2,s3=3;
reg [2:0]state,next_state;
always@(posedge clk)
begin
 if(rst)
   state<=3'b000;
 else
  state<=next_state;
  end
 always@(*)
 begin
 next_state=state;
 case(state)
    s0:next_state<=x?s0:s1;
    s1:next_state<=x?s2:s1;
    s2:next_state<=x?s3:s1;
    s3:next_state<=x?s0:s1;
    //s3:next_state<=x?s2:s0;
endcase
end
always@(posedge clk)
begin
if(rst)
 y<=1'b0;
 else begin
 if(x&(state==s3))
  y<=1'b1;
 else
  y<=1'b0;
  end
end
endmodule

TEST_BENCH:
`timescale 1ns / 1ps
module sequence_detector_tb;
wire y;
reg x,clk,rst;
always
#5 clk=~clk;
initial begin
clk=0;
rst=1;
x=0;
#25 rst=0;
#20 x=0;
#20 x=1;
#20 x=0;
#20 x=0;
#20 x=1;
#20 x=0;
#20 x=0;
#20 x=0;
#20 x=1;
#20 x=1;
#20 x=0;
#20 x=0;
end
sequence_detector s2(.x(x),.clk(clk),.rst(rst),.y(y));
endmodule
 
 