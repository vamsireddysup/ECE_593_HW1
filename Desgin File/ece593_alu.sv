module ece593_alu #(parameter N = 16)(
	input logic signed [N-1:0]A,B, 
	input logic clk,rst,start_op,
	input logic [2:0]op_sel,
	output logic signed [2*N-1:0]result,
	output logic end_op
	);
	//Internal Signals
	logic [2*N-1:0]temp1,temp2;
  	logic [1:0]count;
  	logic mul_status;
  	//Main Sequential Logic
 	always_ff @(posedge clk or posedge rst) begin
		if(rst) begin
			//Reset Logic
			result<=0;
			end_op<=0;
          	count<=0;
			mul_status=0;
			end
		else begin
			//If Operation Not Started
			if(!start_op)begin
				result<=0;
				end_op<=0;
			end
			else begin
				//Operation Logic
				casez(op_sel)
					3'b000:begin
						//No Operation
						result<=0;
						end_op<=1;
						end
					3'b001:begin
						//Addition
						result<=A+B;
						end_op<=1;
						end
					3'b010:begin
						//Subtraction
						result<=A-B;
						end_op<=1;
						end
					3'b011:begin
						//Bitwise XOR
						result<=A^B;
						end_op<=1;
						end
					3'b100:begin
						//Multiplication with 3 cycle
						//operation
              					if(!mul_status)begin
                					mul_status<=1;
                					count<=2;
                					result<=0;
              						end_op<=0;
              						end
              					else if(count>0)begin
                					count<=count-1;
                					result<=0;
              						end_op<=0;
                					end
              					else begin
                					mul_status<=0;
                					result<=A*B;
              						end_op<=1;
              						end
          					end
					3'b101:begin
						//Bitwise AND
						result<=A&B;
						end_op<=1;
						end
					3'b11?:begin
						//Name and Course
						$display("My Name is Vamsidhar Reddy Eraganen(Id:916643837)");
						$display("-----------------ece593------------------------");
						result<=0;
						end_op<=1;
						end
					default:begin
						//Default Case
						result<=0;
						end_op<=0;
						end
				endcase	
			end
		end
	end



endmodule: ece593_alu
