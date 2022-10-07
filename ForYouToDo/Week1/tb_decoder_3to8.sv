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

module tb_decoder_3to8;

logic [2:0] code_i;
logic [7:0] decode_o;
integer row;

decoder_3to8 u_decoder_3to8 (
     .code_i(code_i)
    ,.decode_o(decode_o)
);

// Check every states

initial
begin
    for (row = 0; row <= 8; row = row + 1) begin
        #(10) code_i = row;
    end
end

endmodule