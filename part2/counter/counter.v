module counter (input clk);
    localparam MAX_COUNT = 16'b1000;

    reg [15:0] counter;

    always @(posedge clk)
        if(counter == MAX_COUNT)
            counter <= 0;
        else
            counter <= counter + 1'b1;

`ifdef FORMAL
    always @(*)
        assert(counter <= MAX_COUNT);
`endif
endmodule
