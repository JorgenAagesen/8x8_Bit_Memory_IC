`include "Bitcell.sv"
module MemoryCell (
    input wire sel,
    input wire rw,
    input wire[7:0] wordIn,
    output wire[7:0] wordOut
);

Bitcell b7(
    .sel(sel),
    .data(wordIn[7]),
    .rw(rw),
    .cellOut(wordOut[7])
);
Bitcell b6(
    .sel(sel),
    .data(wordIn[6]),
    .rw(rw),
    .cellOut(wordOut[6])
);
Bitcell b5(
    .sel(sel),
    .data(wordIn[5]),
    .rw(rw),
    .cellOut(wordOut[5])
);
Bitcell b4(
    .sel(sel),
    .data(wordIn[4]),
    .rw(rw),
    .cellOut(wordOut[4])
);
Bitcell b3(
    .sel(sel),
    .data(wordIn[3]),
    .rw(rw),
    .cellOut(wordOut[3])
);
Bitcell b2(
    .sel(sel),
    .data(wordIn[2]),
    .rw(rw),
    .cellOut(wordOut[2])
);
Bitcell b1(
    .sel(sel),
    .data(wordIn[1]),
    .rw(rw),
    .cellOut(wordOut[1])
);
Bitcell b0(
    .sel(sel),
    .data(wordIn[0]),
    .rw(rw),
    .cellOut(wordOut[0])
);
endmodule