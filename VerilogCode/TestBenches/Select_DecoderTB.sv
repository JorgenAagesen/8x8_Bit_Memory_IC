`timescale 1ns/1ps

module Select_Decodertb;
    //Inputs
    reg [2:0] i_adrIn;
    reg i_valid;
    //Output
    wire [7:0] o_adrOut;

    Sel_Decode uut (
        .i_adr0(i_adrIn[0]),
        .i_adr1(i_adrIn[1]),
        .i_adr2(i_adrIn[2]),
        .valid(i_valid),
        .o_adr0(o_adrOut[0]),
        .o_adr1(o_adrOut[1]),
        .o_adr2(o_adrOut[2]),
        .o_adr3(o_adrOut[3]),
        .o_adr4(o_adrOut[4]),
        .o_adr5(o_adrOut[5]),
        .o_adr6(o_adrOut[6]),
        .o_adr7(o_adrOut[7])
    );
    initial begin
        $dumpfile("Sel_test");
        $dumpvars(0,Select_Decodertb);

        i_valid = 1;

        i_adrIn[0] = 0;
        i_adrIn[1] = 0;
        i_adrIn[2] = 0;
        #10;

        i_adrIn[0] = 1;
        i_adrIn[1] = 0;
        i_adrIn[2] = 0;
        #10;

        i_adrIn[0] = 0;
        i_adrIn[1] = 1;
        i_adrIn[2] = 0;
        #10;

        i_adrIn[0] = 1;
        i_adrIn[1] = 1;
        i_adrIn[2] = 0;
        #10;

        i_adrIn[0] = 0;
        i_adrIn[1] = 0;
        i_adrIn[2] = 1;
        #10;

        i_adrIn[0] = 1;
        i_adrIn[1] = 0;
        i_adrIn[2] = 1;
        #10;

        i_adrIn[0] = 0;
        i_adrIn[1] = 1;
        i_adrIn[2] = 1;
        #10;

        i_adrIn[0] = 1;
        i_adrIn[1] = 1;
        i_adrIn[2] = 1;
        #10;

        $finish;
    end
endmodule