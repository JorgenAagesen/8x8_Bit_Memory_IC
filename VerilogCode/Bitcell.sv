module SRLatch(
    input inp1,
    input inp2,
    output SROut
);


wire w_NAND2;

nand(SROut, inp1, w_NAND2);
nand(w_NAND2, SROut, inp2);

endmodule

module Bitcell (
    input data,
    input sel,
    input rw,

    output cellOut
);
    wire w_NAND1;
    wire w_NAND2;

    wire w_NOTrw;
    wire w_AND1;

    wire w_SRout;

    nand(w_NAND1, data, sel, rw);
    nand(w_NAND2, w_NAND1, sel, rw);
    not(w_NOTrw, rw);

    SRLatch Latch1(.inp1(w_NAND1), .inp2(w_NAND2), .SROut(w_SRout));

    and(cellOut, w_NOTrw, sel, w_SRout);
endmodule