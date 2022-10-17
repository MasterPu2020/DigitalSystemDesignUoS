
//----------------------------------------------------------------
// Declare
//----------------------------------------------------------------

// Using UTF-8.
// System Verilog
// ALL RIGHTS RESERVED BY ClARK.

module n_bit_reg

//----------------------------------------------------------------
// Inherited Module Params
//----------------------------------------------------------------

#(
    parameter BIT_WIDTH = 8
)

//----------------------------------------------------------------
// Ports
//----------------------------------------------------------------

(
     clk_i
    ,n_rst_i
    ,en_i
    ,reg_o
);

    // Inputs
    input clk_i;
    input n_rst_i;
    input en_i;

    // Outputs
    output logic [BIT_WIDTH - 1:0] reg_o;

//----------------------------------------------------------------
// Circuits
//----------------------------------------------------------------

always @(posedge clk_i, negedge n_rst_i) begin
    if (!n_rst_i)
        reg_o <= '0;
    else if (en_i)
        reg_o <= reg_o + 1;
    // else do nothing
end

endmodule
