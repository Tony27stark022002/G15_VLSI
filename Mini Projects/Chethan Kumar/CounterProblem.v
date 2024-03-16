//Design
module counter(clk1,rst1,A,clk2,rst2,B);
  input clk1,clk2,rst1,rst2;
  output reg [3:0]A,B;
  
  counterA dut1(clk1,rst1,A);
  
  and a1(clk2,A[3],A[2]);
  
  counterB dut2(clk2,rst2,B);
  
endmodule

//counter A

module counterA (
  input wire clk,
  input wire reset,
  output reg [3:0] count
);

  always @(posedge clk or posedge reset) begin
    if (reset)
      count <= 4'b0000;
    else
      count <= count + 1;
  end

endmodule

//counter B

module counterB (
  input wire clk,
  input wire reset,
  output reg [3:0] count
);

  always @(posedge clk or posedge reset) begin
    if (reset)
      count <= 4'b1111;
    else
      count <= count - 1;
  end

endmodule


//TestBEnch



module tb_counter;

  reg clk1, rst1, clk2, rst2;
  wire [3:0] A, B;

  
  counter dut(
    .clk1(clk1),
    .rst1(rst1),
    .A(A),
    .clk2(clk2),
    .rst2(rst2),
    .B(B)
  );

  
  initial begin
    clk1 = 0;
    clk2=0;
    forever #5 clk1 = ~clk1; 
  end

  

 
  initial begin
    rst1 = 1; rst2 = 1; 
    #15 rst1 = 0; rst2 = 0;   

    
    $monitor("Time=%0d: A=%b, B=%b", $time, A, B);
    $dumpfile("dump.vcd");
    $dumpvars();

   
    #1000 $finish;
  end

endmodule
