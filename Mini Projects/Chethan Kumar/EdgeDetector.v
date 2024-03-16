// Design
module pos_edge_det ( input sig,            
                      input clk,            
                      output pe);           
 
    reg   sig_dly;                          
 
   
  always @ (posedge clk) begin
    sig_dly <= sig;
  end
 
    
  assign pe = sig & ~sig_dly;            
endmodule 

//Testbench


module tb;
	reg sig;                                 
	reg clk;                                  
	
	
	pos_edge_det ped0 (  .sig(sig),           
    					 .clk(clk),
 			      		 .pe(pe));

	
	always #5 clk = ~clk;           
	
	
	initial begin
		clk <= 0;
		sig <= 0;
		#15 sig <= 1;
		#20 sig <= 0;
		#15 sig <= 1;
		#10 sig <= 0;
		#20 $finish;
	end	
  
  	initial begin
      
      $dumpfile("dump.vcd");
      	$dumpvars;
    end
endmodule
