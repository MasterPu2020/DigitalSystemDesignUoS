
//----------------------------------------------------------------
// Declare
//----------------------------------------------------------------

// Using UTF-8.
// System Verilog
// ALL RIGHTS RESERVED BY ClARK.

module MUX_4input

//----------------------------------------------------------------
// Ports
//----------------------------------------------------------------

(
     signal_i
    ,sel_i
    ,signal_o
);

    // Inputs
    input logic [3:0] signal_i;
    input logic [1:0] sel_i;

    // Outputs
    output logic signal_o;

//----------------------------------------------------------------
// Circuits
//----------------------------------------------------------------

always_comb begin 
    signal_o = signal_i[sel_i];
end

// Same to the statement: 'assign signal_o = signal_i[sel_i];'.

endmodule
