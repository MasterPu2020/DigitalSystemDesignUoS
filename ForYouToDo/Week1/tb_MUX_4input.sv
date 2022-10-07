`timescale  1ns / 1ns

//----------------------------------------------------------------
// Declare
//----------------------------------------------------------------

// Using UTF-8.
// System Verilog
// ALL RIGHTS RESERVED BY ClARK.

//----------------------------------------------------------------
// Testbench
//----------------------------------------------------------------

module tb_MUX_4input;

logic [3:0] signal_i = 0;
logic [1:0] sel_i = 0;
logic signal_o;

integer row;
integer col;

MUX_4input u_MUX_4input(
     .signal_i(signal_i)
    ,.sel_i(sel_i)
    ,.signal_o(signal_o)
);

// Check every states

initial begin
    for (row = 0; row <= 4'b1111; row = row + 1) begin
        signal_i = row;
        for (col = 0; col <= 2'b11; col = col + 1) begin
            #(10) sel_i = col;
        end
    end
end

endmodule