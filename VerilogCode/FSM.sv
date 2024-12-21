module MemoryFSM (
    input operation,
    input select,
    input i_clock,
    output operationOut,
    output selectOut
);

wire[1:0] state; //Current state of the FSM

wire[1:0] nextState;

OUT1 out1(
    .state1(state[1]),
    .state2(state[0]),
    .input1(operation),
    .input2(select),
    .Output1(nextState[1])
);

OUT0 out0(
    .state1(state[1]),
    .state2(state[0]),
    .input1(operation),
    .input2(select),
    .Output0(nextState[0])
);

stateReg reg1(
    .nextState(nextState), //This is what the next state will be based on current state and input
    .i_regclock(i_clock),
    .stateUpdate(state), //Updates the state of the FSM
    .opOut(operationOut),
    .selOut(selectOut)

);


endmodule

module OUT1 (
    input state1,
    input state2,
    input input1,
    input input2,
    output Output1
);

wire node1;
wire node2;

wire w_notState1;
wire w_notState2;


not(w_notState1, state1);
not(w_notState2, state2);


and(node1, w_notState1, input2);
and(node2, w_notState2, input2);

or(Output1, node1, node2);
endmodule

module OUT0 (
    input state1,
    input state2,
    input input1,
    input input2,
    output Output0
);
wire node1;
wire node2;


and(node1, state1, state2);
and(node2, input1, input2);

or(Output0, node1, node2);
endmodule

module stateReg (
    input wire[1:0] nextState,
    input i_regclock,

    output wire[1:0] stateUpdate,
    output opOut,
    output selOut
);

wire data0 = nextState[0];
wire n_data0;
not(n_data0,data0);

wire data1 = nextState[1];
wire n_data1;
not(n_data1,data1);

wire n_clock; //I Need a not-clock
not(n_clock,i_regclock);

wire w_nand1;
wire w_nand2;
wire w_nand3;
wire w_nand4;

nand(w_nand1, data0, n_clock);
nand(w_nand2, n_data0, n_clock);
nand(w_nand3, data1, n_clock);
nand(w_nand4, n_data1, n_clock);

wire w_SR1out;
wire w_SR2out;

//------------For Master Latch

Latch Sr1(
    .inp1(w_nand1),
    .inp2(w_nand2),
    .SROut(w_SR1out)
);

Latch Sr2(
    .inp1(w_nand3),
    .inp2(w_nand4),
    .SROut(w_SR2out)
);


//-------------For Slave Latch

wire w_clockAgain;
not(w_clockAgain,n_clock);

wire n_SR1out;
wire n_SR2out;
not(n_SR1out, w_SR1out);
not(n_SR2out, w_SR2out);

wire w_nand5;
wire w_nand6;
wire w_nand7;
wire w_nand8;

nand(w_nand5, w_SR1out, w_clockAgain);
nand(w_nand6, n_SR1out, w_clockAgain);
nand(w_nand7, w_SR2out, w_clockAgain);
nand(w_nand8, n_SR2out, w_clockAgain);

wire w_SR3Out;
wire w_SR4Out;

Latch Sr3(
    .inp1(w_nand5),
    .inp2(w_nand6),
    .SROut(w_SR3out)
);

Latch Sr4(
    .inp1(w_nand7),
    .inp2(w_nand8),
    .SROut(w_SR4out)
);

assign stateUpdate[0] = w_SR3out;
assign stateUpdate[1] = w_SR4out;
assign opOut = w_SR3out;
assign selOut = w_SR4out;

endmodule

module Latch(
    input inp1,
    input inp2,
    output SROut
);


wire w_NAND2;

nand(SROut, inp1, w_NAND2);
nand(w_NAND2, SROut, inp2);

endmodule