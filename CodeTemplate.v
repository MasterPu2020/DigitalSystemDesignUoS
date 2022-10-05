// `timescale  1ns / 1ns

//----------------------------------------------------------------
// Declare
//----------------------------------------------------------------

// This Template is written by Clark Pu, which you can adjusted depending on your own style.
// Declare your information here.
// You may wanna use UTF-8. Delcare it here.
// You may wanna declare copyrights here. ALL RIGHTS RESERVED BY ClARK.

module code

//----------------------------------------------------------------
// Inherited Module Params
//----------------------------------------------------------------

#(
    parameter PARAM = 0
)

//----------------------------------------------------------------
// Ports
//----------------------------------------------------------------

(
     clk_i
    ,rst_i
    ,out_o
);

    // Inputs
    input clk_i;
    input rst_i;

    // Outputs
    output reg [31:0] out_o;

//----------------------------------------------------------------
// Registers / Wires / Params / Includes
//----------------------------------------------------------------

// `include "defs.v"
localparam
    PARAM1 = 1,
    PARAM2 = 2;

reg [31:0] ROM[255:0]; //31x256
reg [31:0] state;
reg [31:0] state_cnt;

wire state_pulse;

integer row;

genvar gen_row;

//----------------------------------------------------------------
// Modules
//----------------------------------------------------------------

ModuleImport #(PARAM) 
ModuleImport
(
     .clk_i(clk_i)
    ,.rst_i(rst_i)
);

//----------------------------------------------------------------
// Test Bench
//----------------------------------------------------------------

// // Uncommenting This Part First

// // code Parameters
// parameter PERIOD = 10;

// // code Inputs
// reg   clk_i = 0;
// reg   rst_i = 0;

// // code Outputs
// wire  [31:0]  out_o;    

// initial begin
//     forever #(PERIOD/2)  clk_i = ~ clk_i;
// end

// initial begin
//     #(PERIOD*2) rst_i  =  1;
// end

// initial begin
//     // Write Test Bench Here
//     $finish;
// end

//----------------------------------------------------------------
// Circuits
//----------------------------------------------------------------

// Initialization
initial begin
    for(row = 0; row <= 255; row = row + 1)
        row = row + 1;
end

// State Machine
always @(posedge clk_i) begin
    if (rst_i == 1) begin
        row = 0;
    end
    else begin
        row = row + 1;
    end
end

endmodule
