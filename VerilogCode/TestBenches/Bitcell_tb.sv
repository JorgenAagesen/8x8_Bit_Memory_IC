`timescale 1ns/1ps

module Bitcell_tb;
  // Inputs
  reg i_sel;
  reg i_data;
  reg i_rw;

  // Output
  wire w_outp;


  //Instantiate the Bitcell module
  Bitcell uut(
    .sel(i_sel),
    .data(i_data),
    .rw(i_rw),
    .cellOut(w_outp)
  );

  initial begin
    $dumpfile("dumpfile_bitcell");
    $dumpvars(0,Bitcell_tb);

    i_sel = 0;
    i_rw = 0;
    i_data = 0;
    #10;

    i_sel = 1;
    i_rw = 1;
    i_data = 1;
    #10;

    i_sel = 1;
    i_rw = 0;
    i_data = 1;
    #10;

    i_sel = 1;
    i_rw = 1;
    i_data = 0;
    #10;

    i_sel = 1;
    i_rw = 0;
    i_data = 1;
    #10;

    $finish;
  end
endmodule