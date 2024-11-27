`timescale 1ns / 1ps

// Design a one-hot mux in different ways
// Assume that sel_i is a one-hot signal

module mux_one_hot(
  input     wire[3:0] a_i,
  input     wire[3:0] sel_i,
  // Output using ternary operator
  output wire   y_ter_o,
  // Output using case
  output reg   y_case_o,
  // Ouput using if-else
  output reg   y_ifelse_o,
  // Output using for loop
  output reg    y_loop_o,
  // Output using and-or tree
  output wire   y_aor_o
    );
    integer i;
   
    // Output using ternary operator
    assign y_ter_o = sel_i[3] ? a_i[3] : sel_i[2] ? a_i[2] : sel_i[1] ? a_i[1] : a_i[0];
    
    // Output using case
    always @(*) begin
    case(sel_i)
    4'd1:  y_case_o = a_i[0];
    4'd2:  y_case_o = a_i[1];
    4'd4:  y_case_o = a_i[2];
    4'd8:  y_case_o = a_i[3];
    default: y_case_o = 1'b0;
    endcase
    end
    
   // Ouput using if-else
   always @(*) begin
     if (sel_i == 4'd1) begin
        y_ifelse_o = a_i[0];
     end else if (sel_i == 4'd2) begin
        y_ifelse_o = a_i[1];
      end else if (sel_i == 4'd4) begin
        y_ifelse_o = a_i[2];
      end else if (sel_i == 4'd8) begin
        y_ifelse_o = a_i[3];
        end else begin
         y_ifelse_o = 1'b0;
        end
   end
    
   // Output using for loop
   always @(*) begin
    y_loop_o = 1'b0;
    for (i = 0; i < 4; i = i + 1) begin
        if (sel_i[i] == 1) begin
            y_loop_o = a_i[i];
        end 
	 end
	end
    
   // Output using and-or tree
  assign  y_aor_o = (sel_i[3] & a_i[3]) | (sel_i[2] & a_i[2]) | (sel_i[1] & a_i[1]) | (sel_i[0] & a_i[0]);
   
endmodule
