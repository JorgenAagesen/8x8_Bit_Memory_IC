`timescale 1ns/1ps

module MemoryDriver_tb;
    //Inputs
    reg [7:0] i_dataInput;
    reg [2:0] i_addrIn;
    reg i_operationIn;
    reg i_select;
    reg clock;

    //Outputs
    wire [7:0] o_dataOutput;

    MemoryDriver uut(
            .i0(i_dataInput[0]),
            .i1(i_dataInput[1]),
            .i2(i_dataInput[2]),
            .i3(i_dataInput[3]),
            .i4(i_dataInput[4]),
            .i5(i_dataInput[5]),
            .i6(i_dataInput[6]),
            .i7(i_dataInput[7]),
            .select(i_select),
            .operation(i_operationIn),
            .i_clock(clock),
            .addr0(i_addrIn[0]),
            .addr1(i_addrIn[1]),
            .addr2(i_addrIn[2]),
            .o0(o_dataOutput[0]),
            .o1(o_dataOutput[1]),
            .o2(o_dataOutput[2]),
            .o3(o_dataOutput[3]),
            .o4(o_dataOutput[4]),
            .o5(o_dataOutput[5]),
            .o6(o_dataOutput[6]),
            .o7(o_dataOutput[7])
        );
    

    initial begin //Making a clock
        clock = 1;
        forever begin
            clock = !clock;
            #1;
        end
    end

    initial begin
        $dumpfile("Driver_dumpfile");
        $dumpvars(0,MemoryDriver_tb);
        #10;

        //Cycle through all states to initialize
        i_operationIn = 1;
        i_select = 1;
        i_addrIn = 3'b001;
        i_dataInput = 8'b01010101;
        #2;
        i_operationIn = 1;
        i_select = 0;
        i_addrIn = 3'b001;
        i_dataInput = 8'b01010101;
        #2;
        i_operationIn = 0;
        i_select = 0;
        i_addrIn = 3'b001;
        i_dataInput = 8'b01010101;
        #2;
        i_operationIn = 0;
        i_select = 1;
        i_addrIn = 3'b001;
        i_dataInput = 8'b01010101;
        #2;



        i_operationIn = 1; //Write 0 to all parts of memory to finish initialization
        i_select = 1;
        i_dataInput = 8'b00000000;
        #10;
        i_addrIn = 3'b000;
        #10;
        i_addrIn = 3'b001;
        #10;
        i_addrIn = 3'b010;
        #10;
        i_addrIn = 3'b011;
        #10;
        i_addrIn = 3'b100;
        #10;
        i_addrIn = 3'b101;
        #10;
        i_addrIn = 3'b110;
        #10;
        i_addrIn = 3'b111;
        #10;
        
        

        /*
        //Write a word to adress 1
        i_operationIn = 1;
        i_select = 1;
        i_addrIn = 3'b001;
        i_dataInput = 8'b01010101;
        #10;

        i_operationIn = 0;
        i_select = 0;
        i_addrIn = 3'b001;
        i_dataInput = 8'b01010101;
        #10;
        

        //Read that word
        i_operationIn = 0;
        i_select = 1;
        i_addrIn = 3'b001;
        i_dataInput = 8'b00000001;
        #10;

        //Write to adress 2
        i_operationIn = 1;
        i_select = 1;
        i_addrIn = 3'b010;
        i_dataInput = 8'b00000101;
        #10;


        //Read that word
        i_operationIn = 0;
        i_select = 1;
        i_addrIn = 3'b010;
        i_dataInput = 8'b10000000;
        #10;
        */
        
        //Write E to adress 0
        i_operationIn = 1;
        i_select = 1;
        i_addrIn = 3'b000;
        i_dataInput = 8'b01100101;
        #10;

        //Write L to adress 1
        i_operationIn = 1;
        i_select = 1;
        i_addrIn = 3'b001;
        i_dataInput = 8'b01101100;
        #10;

        //Write I to adress 2
        i_operationIn = 1;
        i_select = 1;
        i_addrIn = 3'b010;
        i_dataInput = 8'b01101001;
        #10

        //Write A to adress 3
        i_operationIn = 1;
        i_select = 1;
        i_addrIn = 3'b011;
        i_dataInput = 8'b01100001;
        #10;

        //Write S to adress 4
        i_operationIn = 1;
        i_select = 1;
        i_addrIn = 3'b100;
        i_dataInput = 8'b01110011;
        #10;

        //IDLE once
        i_operationIn = 0;
        i_select = 0;
        i_addrIn = 3'b001;
        i_dataInput = 8'b00000000;
        #10;

        //Start Reading
        //Adress 0
        i_operationIn = 0;
        i_select = 1;
        i_addrIn = 3'b000;
        i_dataInput = 8'b00000000;
        #10;

        i_operationIn = 0;
        i_select = 1;
        i_addrIn = 3'b001;
        i_dataInput = 8'b00000000;
        #10;

        i_operationIn = 0;
        i_select = 1;
        i_addrIn = 3'b010;
        i_dataInput = 8'b00000000;
        #10;

        i_operationIn = 0;
        i_select = 1;
        i_addrIn = 3'b011;
        i_dataInput = 8'b00000000;
        #10;

        i_operationIn = 0;
        i_select = 1;
        i_addrIn = 3'b100;
        i_dataInput = 8'b00000000;
        #10;
        $finish;
    end

endmodule 