
//----------------------------------------------------------------
// Declare
//----------------------------------------------------------------

// Using UTF-8.
// System Verilog
// ALL RIGHTS RESERVED BY ClARK.

module build_a_timer

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
    ,time_set_i
    ,counter_o
    ,time_up_o
);

    // Inputs
    input logic clk_i;
    input logic n_rst_i;
    input logic en_i;
    input logic [BIT_WIDTH - 1:0] time_set_i;

    // Outputs
    output logic [BIT_WIDTH - 1:0] counter_o;
    output logic time_up_o;

//----------------------------------------------------------------
// Circuits
//----------------------------------------------------------------

always @(posedge clk_i, negedge n_rst_i) begin
    if (!n_rst_i) begin
        counter_o <= '0;
        time_up_o <= '0;
    end     
    else if (en_i)
        if (counter_o == time_set_i) begin
            counter_o <= '0;
            time_up_o <= '1;
        end
        else
            counter_o <= counter_o + 1;
    // else do nothing
end

endmodule
