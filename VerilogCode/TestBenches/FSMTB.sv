`timescale 1ns/1ps

module FSMtb;
    //Inputs
    reg i_operation;
    reg i_select;
    reg i_clock;
    
    //Outputs
    wire w_operation;
    wire w_select;
    
    MemoryFSM uut (
        .operation(i_operation),
        .select(i_select),
        .i_clock(i_clock),
        .operationOut(w_operation),
        .selectOut(w_select)
    );
    
    
    integer i;

    initial begin //Making a clock
        i_clock = 1;

        forever begin
            i_clock = !i_clock;
            #1;
        end
        
    end

    initial begin
        $dumpfile("dump_FSM");
        $dumpvars(0,FSMtb);
            

        //Initialize vars
        i_operation = 0;
        i_select = 0;
        #10;

        i_operation = 1;
        i_select = 1;
        #10;

        i_operation = 1;
        i_select = 0;
        #10;

        i_operation = 0;
        i_select = 1;
        #10;

        i_operation = 0;
        i_select = 0;
        #10;

        i_operation = 1;
        i_select = 1;
        #10;

    $finish;
    end
endmodule