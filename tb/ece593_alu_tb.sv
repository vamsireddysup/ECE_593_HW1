//`include ece593_alu.sv

module ece593_alu_tb;
//Parameters
parameter N=16;

//Testbench Signals
logic signed [N-1:0]A,B;
logic clk,rst,start_op,end_op;
logic [2:0]op_sel;
logic signed [2*N-1:0]result;
//Instantiation of ALU Module
ece593_alu DUT (.A(A),
		.B(B),
		.clk(clk),
		.rst(rst),
		.start_op(start_op),
		.end_op(end_op),
		.op_sel(op_sel),
		.result(result)
		);

//Clk Generation
initial begin
	clk=1;
	forever #5 clk=~clk;
end
//Monitor Signal for Debugging
initial begin 
	$monitor("[%0t]\t rst=%b\t op_sel=%b\t start_op=%b\t A=%0d\t B=%0d\t result=%0d\t end_op=%d\t",$time, rst, op_sel, start_op, A, B, result, end_op); 
end

// Task to check results
task check_result(input signed [2*N-1:0] expected_result, input expected_end_op);
	if (result !== expected_result || end_op !== expected_end_op) begin
		$error("Test failed: Expected result = %0d, Got = %0d; Expected end_op = %b, Got = %b",expected_result, result, expected_end_op, end_op);
    	end 
	else begin
      		$display("Test passed: result = %0d, end_op = %b", result, end_op);
    	end
endtask

// Randomized test sequence
initial begin
	// Initialize signals
	A = 0; B = 0; op_sel = 3'b000; rst = 1; start_op = 0;
    	#10 rst = 0;

    	repeat (30) begin // Run 30 random test cases
      	// Generate random inputs
      	A = $random;
      	B = $random;
      	op_sel = $urandom_range(0, 7);
      	start_op = 1;
      	#10;

      	// Compute expected result
      	case (op_sel)
        	3'b000: check_result(0, 1);//No Operation
        	3'b001: check_result(A + B, 1);//Addition
        	3'b010: check_result(A - B, 1);//Subtraction
        	3'b011: check_result(A ^ B, 1);//Bitwise XOR
        	3'b100: #30 check_result(A * B, 1);//Multiplication
        	3'b101: check_result(A & B, 1);//Bitwise AND
        	3'b110: check_result(0, 1);//Reserved Case
		3'b111: check_result(0, 1);//Reserved Case
        	default: check_result(0, 0);// Default Case
      	endcase

      	start_op = 0;
      	
end
	//Display Completion
    	$display("All random tests completed.");
    	$stop;
end

endmodule
