// `timescale  1ns / 1ns

//----------------------------------------------------------------
// Declare
//----------------------------------------------------------------

// This coding may be a simple way.
// Using UTF-8.
// NOT in System Verilog instead of Verilog HDL
// ALL RIGHTS RESERVED BY ClARK.

module decoder_3to8

//----------------------------------------------------------------
// Ports
//----------------------------------------------------------------

(
     code_i
    ,decode_o
);

    // Inputs
    input [2:0] code_i;

    // Outputs
    output reg [7:0] decode_o; // or logic

//----------------------------------------------------------------
// Registers / Wires / Params / Includes
//----------------------------------------------------------------

parameter one_8b = 8'b0000_0001;

//----------------------------------------------------------------
// Test Bench
//----------------------------------------------------------------

// reg [2:0] code_i = 3'bxxx;
// integer row = 0;

// initial begin
//     for (row = 0; row <= 8; row = row + 1) begin
//         #(10) code_i = row;
//     end
// end

//----------------------------------------------------------------
// Circuits
//----------------------------------------------------------------

always @(*) begin // or always_comb
    if (code_i == 0)
        decode_o = 8'b0;
    else if (0< code_i && code_i <= 3'b111) // or '1
        decode_o = one_8b << (code_i - 1);
    else
        decode_o = 8'bxxxx_xxxx; // or 'x
end

endmodule
