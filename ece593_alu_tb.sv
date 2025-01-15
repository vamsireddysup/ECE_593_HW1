//`include ece593_alu.sv

module ece593_alu_tb;

parameter N=16;


logic signed [N-1:0]A,B;
logic clk,rst,start_op,end_op;
logic [2:0]op_sel;
logic signed [2*N-1:0]result;

ece593_alu DUT (.A(A),
		.B(B),
		.clk(clk),
		.rst(rst),
		.start_op(start_op),
		.end_op(end_op),
		.op_sel(op_sel),
		.result(result)
		);


initial begin
	clk=1;
	forever #5 clk=~clk;
end
initial begin
  $monitor("[%0t]\t rst=%b\t op_sel=%b\t start_op=%b\t A=%0d\t B=%0d\t result=%0d\t end_op=%d\t",$time, rst, op_sel, start_op, A, B, result, end_op); 
end

// Task to check results
  task check_result(input signed [2*N-1:0] expected_result, input expected_end_op);
    if (result !== expected_result || end_op !== expected_end_op) begin
      $error("Test failed: Expected result = %0d, Got = %0d; Expected end_op = %b, Got = %b",
             expected_result, result, expected_end_op, end_op);
    end else begin
      $display("Test passed: result = %0d, end_op = %b", result, end_op);
    end
  endtask

// Randomized test sequence
  initial begin
    // Initialize signals
    A = 0; B = 0; op_sel = 3'b000; rst = 1; start_op = 0;
    #10 rst = 0;

    repeat (10) begin // Run 50 random test cases
      // Generate random inputs
      A = $random;
      B = $random;
      op_sel = $urandom_range(0, 7);
      start_op = 1;
      #10;

      // Compute expected result
      case (op_sel)
        3'b000: check_result(0, 1);
        3'b001: check_result(A + B, 1);
        3'b010: check_result(A - B, 1);
        3'b011: check_result(A ^ B, 1);
        3'b100: #30 check_result(A * B, 1);
        3'b101: check_result(A & B, 1);
        3'b110: check_result(0, 1);
	3'b111: check_result(0, 1);
        default: check_result(0, 0);
      endcase

      start_op = 0;
      //#10;
    end

    $display("All random tests completed.");
    $stop;
  end

endmodule
