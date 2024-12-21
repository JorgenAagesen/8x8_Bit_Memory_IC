`include "FSM.sv"
`include "8ByteMemory.sv"

module MemoryDriver (
    //Inputs
    input i0, i1, i2, i3, i4, i5, i6, i7,
    input select,
    input operation,
    input addr2, addr1, addr0,
    input i_clock,

    //Output
    output o0, o1, o2, o3, o4, o5, o6, o7

);
    wire ReadWrite;
    wire activateMemory;
    
    MemoryFSM StateMachine(
        .operation(operation),
        .select(select),
        .i_clock(i_clock),
        .operationOut(ReadWrite),
        .selectOut(activateMemory)
    );

    EightByteMemory Memory(
        .i0(i0),
        .i1(i1),
        .i2(i2),
        .i3(i3),
        .i4(i4),
        .i5(i5),
        .i6(i6),
        .i7(i7),
        .adr0(addr0),
        .adr1(addr1),
        .adr2(addr2),
        .rw(ReadWrite),
        .i_valid(activateMemory),
        .o0(o0),
        .o1(o1),
        .o2(o2),
        .o3(o3),
        .o4(o4),
        .o5(o5),
        .o6(o6),
        .o7(o7)
    );



endmodule