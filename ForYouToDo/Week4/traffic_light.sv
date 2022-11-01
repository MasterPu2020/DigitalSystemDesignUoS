//----------------------------------------------------------------
// Declare
//----------------------------------------------------------------

// Using UTF-8.
// System Verilog
// Different between the one with always_comb:
//     Using state replaced with present and next state
//     Always dectect at clock edge, which means a slightly bad performance

module traffic 

//----------------------------------------------------------------
// Inherited Module Params
//----------------------------------------------------------------

//----------------------------------------------------------------
// Ports
//----------------------------------------------------------------

(
     start_timer
    ,major_green
    ,minor_green
    ,clock
    ,n_reset
    ,timed
    ,car
);

    // Inputs
    input logic clock, n_reset, timed, car;
    
    // Outputs
    output logic start_timer,major_green, minor_green;

//----------------------------------------------------------------
// Registers
//----------------------------------------------------------------

enum {Green, Red} state;

//----------------------------------------------------------------
// Circuits
//----------------------------------------------------------------

always_ff @(posedge clock, negedge n_reset) begin
    start_timer <= '0;
    minor_green <= '0;
    major_green <= '0;
    if (!n_reset)
        state <= Green;
    else begin
        unique case (state)
            Green: begin
                major_green <= '1;
                if (car) begin
                    start_timer <= '1;
                    state <= Red;
                end
            end
            Red: begin
                minor_green <= '1;
                if (timed)
                    state <= Green;
            end
        endcase
    end
end

endmodule