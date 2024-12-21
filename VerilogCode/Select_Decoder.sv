module Sel_Decode (
    input wire i_adr2, i_adr1, i_adr0,
    input wire valid,
    output wire o_adr7, o_adr6, o_adr5, o_adr4, o_adr3, o_adr2, o_adr1, o_adr0
);

wire w_NOT2;
wire w_NOT1;
wire w_NOT0;

not(w_NOT2, i_adr2);
not(w_NOT1, i_adr1);
not(w_NOT0, i_adr0);

and(o_adr7, i_adr2, i_adr1, i_adr0, valid);
and(o_adr6, i_adr2, i_adr1, w_NOT0, valid);
and(o_adr5, i_adr2, w_NOT1, i_adr0, valid);
and(o_adr4, i_adr2, w_NOT1, w_NOT0, valid);
and(o_adr3, w_NOT2, i_adr1, i_adr0, valid);
and(o_adr2, w_NOT2, i_adr1, w_NOT0, valid);
and(o_adr1, w_NOT2, w_NOT1, i_adr0, valid);
and(o_adr0, w_NOT2, w_NOT1, w_NOT0, valid);
endmodule