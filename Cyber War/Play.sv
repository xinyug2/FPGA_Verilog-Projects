// EE 271
// Lab 5
// Xinyu Gu


// This module takes 4 inputs that include a clock 
// for timing the posedge change, a reset for reset
// status and two user inputs. 
// This module outputs and displays a 9-LED pattern
// corresponding to given inputs as well as the score
// between a cyber player and a human player up to 
// the score of 7
module Play(clk, reset, L, R, LEDR, D1, D2);

	input logic clk, reset, L, R;
	output logic [8:0] LEDR;
	output logic [6:0] D1, D2;
	
	parameter C = 1'b1;
	
	logic reset_p;
	
	Counters G1(.clk, .reset, .L, .R, .LE(LEDR[8]), .RE(LEDR[0]), .reset_p, .D1, .D2);
	
	Lights light8 (.clk, .reset, .reset_p, .C(~C), .L, .R, .LL(1'b0), .RL(LEDR[7]), .On(LEDR[8]));
	Lights light7 (.clk, .reset, .reset_p, .C(~C), .L, .R, .LL(LEDR[8]), .RL(LEDR[6]), .On(LEDR[7]));
	Lights light6 (.clk, .reset, .reset_p, .C(~C), .L, .R, .LL(LEDR[7]), .RL(LEDR[5]), .On(LEDR[6]));
	Lights light5 (.clk, .reset, .reset_p, .C(~C), .L, .R, .LL(LEDR[6]), .RL(LEDR[4]), .On(LEDR[5]));
	
	Lights center (.clk, .reset, .reset_p, .C(C), .L, .R, .LL(LEDR[5]), .RL(LEDR[3]), .On(LEDR[4]));
	
	Lights light3 (.clk, .reset, .reset_p, .C(~C), .L, .R, .LL(LEDR[4]), .RL(LEDR[2]), .On(LEDR[3]));
	Lights light2 (.clk, .reset, .reset_p, .C(~C), .L, .R, .LL(LEDR[3]), .RL(LEDR[1]), .On(LEDR[2]));
	Lights light1 (.clk, .reset, .reset_p, .C(~C), .L, .R, .LL(LEDR[2]), .RL(LEDR[0]), .On(LEDR[1]));
	Lights light0 (.clk, .reset, .reset_p, .C(~C), .L, .R, .LL(LEDR[1]), .RL(1'b0), .On(LEDR[0]));
	
	
	
endmodule 


// This module tests the function of module Play 
// through simulation
module Play_testbench();

	logic clk, reset, L, R;
	logic [8:0] LEDR;
	logic [6:0] D1, D2;
	
	Play dut (.clk, .reset, .L, .R, .LEDR, .D1, .D2);
	
	parameter CLOCK_PERIOD = 100;
	initial clk = 1;
	
	always begin 
	
		#(CLOCK_PERIOD / 2)
		clk = ~clk;
		
	end
	
	initial begin
							
											@(posedge clk)
		reset <= 1'b1;					@(posedge clk)
											@(posedge clk)
		reset <= 1'b0;
		
		L <= 0; R <= 0; 				@(posedge clk)
											@(posedge clk)
											@(posedge clk)
											
		L <= 1; 							@(posedge clk)
											@(posedge clk)
											@(posedge clk)
											
		R <= 1; 							@(posedge clk)
											@(posedge clk)
											@(posedge clk)
											
		L <= 0;							@(posedge clk)
											@(posedge clk)
											@(posedge clk)
											
		R <= 0;							@(posedge clk)
											@(posedge clk)
											@(posedge clk)
											
		L <= 1; R <= 1; 				@(posedge clk)
											@(posedge clk)
											@(posedge clk)
											
		R <= 0;							@(posedge clk)
											@(posedge clk)
											@(posedge clk)
											@(posedge clk)
											@(posedge clk)
											@(posedge clk)
											@(posedge clk)
											
		$stop;

	end
	
endmodule 

		
		