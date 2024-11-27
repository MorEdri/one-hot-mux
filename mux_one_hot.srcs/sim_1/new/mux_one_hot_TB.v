`timescale 1ns / 1ps

module mux_one_hot_TB;
reg [3:0] a_i;
reg [3:0] sel_i;
wire y_ter_o;
wire y_case_o;
wire y_ifelse_o;
wire y_loop_o;
wire y_aor_o;

mux_one_hot dut(.a_i(a_i), .sel_i(sel_i), .y_ter_o(y_ter_o), .y_case_o(y_case_o), .y_ifelse_o(y_ifelse_o), .y_loop_o(y_loop_o),.y_aor_o(y_aor_o));

initial begin 
a_i = 4'b1011;
sel_i = 4'b0001; // output = 1
#20;
a_i = 4'b1010;
sel_i = 4'b0000; // output = 0

#100;
$stop;
end


endmodule
