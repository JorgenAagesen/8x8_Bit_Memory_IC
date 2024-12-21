`include "MemoryCell.sv"
`include "Select_Decoder.sv"

module EightByteMemory (
    input wire i0, i1, i2, i3, i4, i5, i6, i7,
    input wire adr0, adr1, adr2,
    input wire i_valid,
    input wire rw,
    output wire o0, o1, o2, o3, o4, o5, o6, o7
);

wire[7:0] w_selectSignal;
Sel_Decode selectDec(
    .i_adr0(adr0),
    .i_adr1(adr1),
    .i_adr2(adr2),
    .valid(i_valid),
    .o_adr0(w_selectSignal[0]),
    .o_adr1(w_selectSignal[1]),
    .o_adr2(w_selectSignal[2]),
    .o_adr3(w_selectSignal[3]),
    .o_adr4(w_selectSignal[4]),
    .o_adr5(w_selectSignal[5]),
    .o_adr6(w_selectSignal[6]),
    .o_adr7(w_selectSignal[7])
);

wire[7:0] dataIn = {i7,i6,i5,i4,i3,i2,i1,i0};


wire[7:0] dataLine0;
wire[7:0] dataLine1;
wire[7:0] dataLine2;
wire[7:0] dataLine3;
wire[7:0] dataLine4;
wire[7:0] dataLine5;
wire[7:0] dataLine6;
wire[7:0] dataLine7;

wire w_data01;
wire w_data02;

wire w_data11;
wire w_data12;

wire w_data21;
wire w_data22;

wire w_data31;
wire w_data32;

wire w_data41;
wire w_data42;

wire w_data51;
wire w_data52;

wire w_data61;
wire w_data62;

wire w_data71;
wire w_data72;

//Need to OR the output to get stable outputs, might make this a module later
or(w_data01, dataLine0[0], dataLine1[0], dataLine2[0], dataLine3[0]);
or(w_data02, dataLine4[0], dataLine5[0], dataLine6[0], dataLine7[0]);
or(o0, w_data01, w_data02);

or(w_data11, dataLine0[1], dataLine1[1], dataLine2[1], dataLine3[1]);
or(w_data12, dataLine4[1], dataLine5[1], dataLine6[1], dataLine7[1]);
or(o1, w_data11, w_data12);

or(w_data21, dataLine0[2], dataLine1[2], dataLine2[2], dataLine3[2]);
or(w_data22, dataLine4[2], dataLine5[2], dataLine6[2], dataLine7[2]);
or(o2, w_data21, w_data22);

or(w_data31, dataLine0[3], dataLine1[3], dataLine2[3], dataLine3[3]);
or(w_data32, dataLine4[3], dataLine5[3], dataLine6[3], dataLine7[3]);
or(o3, w_data31, w_data32);

or(w_data41, dataLine0[4], dataLine1[4], dataLine2[4], dataLine3[4]);
or(w_data42, dataLine4[4], dataLine5[4], dataLine6[4], dataLine7[4]);
or(o4, w_data41, w_data42);

or(w_data51, dataLine0[5], dataLine1[5], dataLine2[5], dataLine3[5]);
or(w_data52, dataLine4[5], dataLine5[5], dataLine6[5], dataLine7[5]);
or(o5, w_data51, w_data52);

or(w_data61, dataLine0[6], dataLine1[6], dataLine2[6], dataLine3[6]);
or(w_data62, dataLine4[6], dataLine5[6], dataLine6[6], dataLine7[6]);
or(o6, w_data61, w_data62);

or(w_data71, dataLine0[7], dataLine1[7], dataLine2[7], dataLine3[7]);
or(w_data72, dataLine4[7], dataLine5[7], dataLine6[7], dataLine7[7]);
or(o7, w_data71, w_data72);


MemoryCell Byte7(
    .wordIn(dataIn),
    .rw(rw),
    .sel(w_selectSignal[7]),
    .wordOut(dataLine7)
);

MemoryCell Byte6(
    .wordIn(dataIn),
    .rw(rw),
    .sel(w_selectSignal[6]),
    .wordOut(dataLine6)
);

MemoryCell Byte5(
    .wordIn(dataIn),
    .rw(rw),
    .sel(w_selectSignal[5]),
    .wordOut(dataLine5)
);

MemoryCell Byte4(
    .wordIn(dataIn),
    .rw(rw),
    .sel(w_selectSignal[4]),
    .wordOut(dataLine4)
);

MemoryCell Byte3(
    .wordIn(dataIn),
    .rw(rw),
    .sel(w_selectSignal[3]),
    .wordOut(dataLine3)
);

MemoryCell Byte2(
    .wordIn(dataIn),
    .rw(rw),
    .sel(w_selectSignal[2]),
    .wordOut(dataLine2)
);

MemoryCell Byte1(
    .wordIn(dataIn),
    .rw(rw),
    .sel(w_selectSignal[1]),
    .wordOut(dataLine1)
);

MemoryCell Byte0(
    .wordIn(dataIn),
    .rw(rw),
    .sel(w_selectSignal[0]),
    .wordOut(dataLine0)
);

endmodule