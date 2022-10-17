
//----------------------------------------------------------------
// Declare
//----------------------------------------------------------------

// Using UTF-8.
// System Verilog
// ALL RIGHTS RESERVED BY ClARK.

module shift

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
    ,mode_i
    ,parallel_i
    ,parallel_o
    ,serial_i
    ,serial_o
);

    // Inputs
    input clk_i;
    input n_rst_i;
    input en_i;
    input logic [1:0] mode_i;
    input logic [BIT_WIDTH - 1:0] parallel_i;
    input logic serial_i;

    // Outputs
    output logic [BIT_WIDTH - 1:0] parallel_o;
    output logic serial_o;

//----------------------------------------------------------------
// Registers / Wires / Params / Includes
//----------------------------------------------------------------
    
    logic [BIT_WIDTH - 1:0] parallel_saved = 0;
    logic [BIT_WIDTH - 1:0] counter = 0;
    localparam 
        NORMAL = 2'b00,
        SL = 2'b01,
        SR = 2'b10;

//----------------------------------------------------------------
// Circuits
//----------------------------------------------------------------

always @(posedge clk_i, negedge n_rst_i) begin
    if (!n_rst_i) begin
        parallel_o <= '0;
        serial_o <= '0;
        parallel_saved <= '0;
        counter <= 0;
    end
    else if (en_i) begin
        case (mode_i)
            NORMAL: begin
                parallel_o <= parallel_i;
                parallel_saved <= parallel_i;
                serial_o <= serial_i;
                counter <= 0;
            end
            SL: begin
                parallel_o <= {parallel_o[BIT_WIDTH-2:0],serial_i};
                serial_o <= parallel_i[BIT_WIDTH - 1];
                parallel_saved <= parallel_saved << 1;
            end
            SR: begin
                parallel_o <= {serial_i,parallel_o[BIT_WIDTH-1:1]};
                serial_o <= parallel_i[0];
                parallel_saved <= parallel_saved >> 1;
            end
            default:;  // do nothing
        endcase
        if (counter == 7 && mode_i != NORMAL) begin
            parallel_saved <= parallel_i;
            counter <= 0;
        end
        else
            counter <= counter + 1;
    end
    // else do nothing
end

endmodule