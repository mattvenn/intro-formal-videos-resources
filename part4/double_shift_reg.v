// Creator: Dan Gisselquist, Ph.D.
//      Gisselquist Technology, LLC
//
////////////////////////////////////////////////////////////////////////////////
//
// Copyright (C) 2018-2019, Gisselquist Technology, LLC
`default_nettype    none
module double_shift_reg(i_clk, i_ce, i_data, o_data);
    input   wire    i_clk, i_ce;
    input   wire    i_data;
    output  wire    o_data;

    wire    a_data, b_data;

    shift_reg   a(.i_clk(i_clk), .i_reset(1'b0), .i_ce(i_ce), .i_in(i_data), .o_bit(a_data));
    shift_reg   b(.i_clk(i_clk), .i_reset(1'b0), .i_ce(i_ce), .i_in(i_data), .o_bit(b_data));

    assign o_data = a_data ^ b_data;

endmodule
