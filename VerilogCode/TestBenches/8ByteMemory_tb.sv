`timescale 1ns/1ps

module EightByteMemory_tb;
  // Parameters for the testbench
  reg i0, i1, i2, i3, i4, i5, i6, i7;     // Input data signals
  
  reg adr0, adr1, adr2;                   // Address select signals
  reg rw;                                 // Read/Write control signal
  reg i_valid;

  // Outputs from MemoryModule
  wire out0, out1, out2, out3, out4, out5, out6, out7;
  

  // Instantiate the MemoryModule
  EightByteMemory uut (
    .i0(i0), .i1(i1), .i2(i2), .i3(i3), .i4(i4), .i5(i5), .i6(i6), .i7(i7),
    .adr0(adr0), .adr1(adr1), .adr2(adr2),
    .rw(rw),
    .i_valid(i_valid),
    .o0(out0), 
    .o1(out1), 
    .o2(out2), 
    .o3(out3), 
    .o4(out4), 
    .o5(out5), 
    .o6(out6), 
    .o7(out7)
  );

  integer p;
  integer t;
  integer q;



  // Test process
  initial begin
    $dumpfile("dumpfile_8byte");
    $dumpvars(0,EightByteMemory_tb);
    i_valid = 1;
    
    // Initialize inputs to zero
    i0 = 0; i1 = 0; i2 = 0; i3 = 0; i4 = 0; i5 = 0; i6 = 0; i7 = 0;
    
    for (p = 0; p < 2; p = p + 1 ) begin
      for (t = 0; t < 2; t = t + 1) begin
        for (q = 0; q < 2; q = q + 1) begin
          adr2 = p; adr1 = t; adr0 = q;
          rw = 1;
          #1;
        end
      end
    end


    
    #10; // Wait 10 ns before starting tests

  
    // First test: Write operation to address 000
    rw = 1; // Starts write operation
    i0 = 1; i1 = 1; i2 = 1; i3 = 1; i4 = 1; i5 = 1; i6 = 1; i7 = 1;  // Input data
    adr2 = 0; adr1 = 0; adr0 = 0;  // Address 000
    #10;

    rw = 0; // Starts read operation
    i0 = 1; i1 = 0; i2 = 1; i3 = 0; i4 = 1; i5 = 0; i6 = 1; i7 = 0;  // Input data
    adr2 = 0; adr1 = 0; adr0 = 0;  // Address 000
    #10;

    

    rw = 1; // Starts write operation
    i0 = 0; i1 = 0; i2 = 1; i3 = 1; i4 = 1; i5 = 1; i6 = 1; i7 = 1;  // Input data
    adr2 = 0; adr1 = 0; adr0 = 1;  // Address 001
    #10;

    rw = 0; // Starts write operation
    i0 = 1; i1 = 1; i2 = 1; i3 = 1; i4 = 1; i5 = 0; i6 = 0; i7 = 0;  // Input data
    adr2 = 0; adr1 = 0; adr0 = 1;  // Address 001
    #10;

    rw = 1; // Starts read operation
    i0 = 1; i1 = 0; i2 = 1; i3 = 0; i4 = 1; i5 = 0; i6 = 1; i7 = 0;  // Input data
    adr2 = 0; adr1 = 1; adr0 = 0;  // Address 010
    #10;

    rw = 0; // Starts read operation
    i0 = 1; i1 = 0; i2 = 1; i3 = 0; i4 = 1; i5 = 0; i6 = 1; i7 = 0;  // Input data
    adr2 = 0; adr1 = 1; adr0 = 0;  // Address 010
    #10;

    
    
    // End simulation
    $finish;
  end
endmodule