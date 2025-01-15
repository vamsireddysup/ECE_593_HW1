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
	clk=0;
	forever #5 clk=~clk;
end
initial begin
  $monitor("[%0t]\t clk=%b\t rst=%b\t op_sel=%b\t start_op=%b\t A=%0d\t B=%0d\t result=%0d\t end_op=%d\t",$time, clk, rst, op_sel, start_op, A, B, result, end_op); 
end

initial begin
rst=1;
start_op=0;
op_sel=3'b000;
A=16'h0000;
B=16'h0000;
#10;
rst=0;
start_op=1;
op_sel=3'b100;
A=16'h0010;
B=16'h0110;
#10;
start_op=1;
#50;
$stop;

end
endmodule
