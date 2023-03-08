module properties ();
logic A, B, C, clk;
always_ff @(posedge clk) begin
    A <= ~ A;
    if (A == 1) begin
        B <= ~ B;
    end
    C <= A & B;
end
property FunctionOfC;
    (!A ##1 B |=> C);
endproperty

endmodule