
//----------------------------------------------------------------
// Declare
//----------------------------------------------------------------

// Using UTF-8.
// System Verilog
// ALL RIGHTS RESERVED BY ClARK.

module traffic_light

//----------------------------------------------------------------
// Inherited Module Params
//----------------------------------------------------------------

//----------------------------------------------------------------
// Ports
//----------------------------------------------------------------
(
     clk_i
    ,n_rst_i
    ,en_i
    ,car_i
    ,timed_i
    ,counter_o
);

    // Inputs
    input logic clk_i;
    input logic n_rst_i;
    input logic en_i;
    input logic car_i;
    input logic timed_i;

    // Outputs
    output logic counter_o;

//----------------------------------------------------------------
// Registers
//----------------------------------------------------------------

enum {G, R} state;

//----------------------------------------------------------------
// Circuits
//----------------------------------------------------------------

always_ff @(posedge clk_i, negedge n_rst_i) begin: SEQ
    if (!n_rst_i)
        state <= G;
    else
    unique case (state)
        G: if (car_i)
            state <= R;
        R: if (timed)
            state <= G;
        endcase
end
always_comb begin: OP
    start_timer = '0;
    minor_green = '0;
    major_green = '0;
    unique case (state)
        G: begin
            major_green = '1;
            if (car_i)
                start_timer = '1;
        end
        R: minor_green = '1; 
    endcase
end
endmodule