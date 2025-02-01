`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
//
//
// Course - ECE6213
// Name - Siem Mihreteab
// Project - FIFO CDC
// 
// 
//////////////////////////////////////////////////////////////////////////////////

module top_module_syn_tb;

   // Clock and reset signals
    reg         write_clk;
    reg         read_clk;
    reg         write_rst;
    reg         read_rst;

    // Control signals for writing and reading
    reg         write_enable;
    reg         read_enable;	    
    reg  [7:0]  write_data;

    wire [7:0]  read_data;
    wire        full;  
    wire        empty;

    // Instantiate the FIFO module (with separate read and write clocks)
    top_module DUT (
        .write_data(write_data),
        .write_clk(write_clk),
        .write_rst(write_rst),
        .read_enable(read_enable),
        .write_enable(write_enable),
        .read_rst(read_rst),
        .read_clk(read_clk),
        .read_data(read_data),
        .full(full),
        .empty(empty)
    );

    // Generate separate write and read clocks
    always #5 write_clk = ~write_clk;  // 10 ns period for write clock
    always #8.5 read_clk = ~read_clk;    // 17 ns period for read clock

    // initial block for SDF back annotation
   initial begin
      $sdf_annotate("../../synthesis/netlists/top_module_syn.sdf",top_module_syn_tb.DUT, ,"back_annotate_top_module.log");
   end

    initial begin
       // Initial values
       write_clk     = 0;
       read_clk      = 0;
       write_rst     = 0;    
       read_rst      = 0;  
       write_enable  = 0;
       read_enable   = 0;
       write_data    = 8'h00;


       // write tests       
       #23
	$display("Time %0d | Writing data: %h | FIFO Full: %b | FIFO Empty: %b", $time, write_data, full, empty);
       write_rst     = 1;    
       read_rst      = 1;
       #10
	$display("Time %0d | Writing data: %h | FIFO Full: %b | FIFO Empty: %b", $time, write_data, full, empty);
       #10
	   write_enable = 1;
       write_data = 8'h01;
       #10
	$display("Time %0d | Writing data: %h | FIFO Full: %b | FIFO Empty: %b", $time, write_data, full, empty);
	   write_enable = 1;
       write_data = 8'h02;
       #10
    $display("Time %0d | Writing data: %h | FIFO Full: %b | FIFO Empty: %b", $time, write_data, full, empty);
	   write_enable = 1;
       write_data = 8'h03;
       #10
	$display("Time %0d | Writing data: %h | FIFO Full: %b | FIFO Empty: %b", $time, write_data, full, empty);
       write_enable = 1;
       write_data = 8'h04;
       #10
	$display("Time %0d | Writing data: %h | FIFO Full: %b | FIFO Empty: %b", $time, write_data, full, empty);
       write_enable = 1;
       write_data = 8'h05;
       #10
       $display("Time %0d | Writing data: %h | FIFO Full: %b | FIFO Empty: %b", $time, write_data, full, empty);
       write_enable = 1;
       write_data = 8'h06;
       #10
    $display("Time %0d | Writing data: %h | FIFO Full: %b | FIFO Empty: %b", $time, write_data, full, empty);
       write_enable = 1;
       write_data = 8'h07;
       #10
    $display("Time %0d | Writing data: %h | FIFO Full: %b | FIFO Empty: %b", $time, write_data, full, empty);
       write_enable = 0;
       write_data = 8'h08;
       #10
	$display("Time %0d | Writing data: %h | FIFO Full: %b | FIFO Empty: %b", $time, write_data, full, empty);
	 write_enable = 1;
       #10
	$display("Time %0d | Writing data: %h | FIFO Full: %b | FIFO Empty: %b", $time, write_data, full, empty);
      write_enable = 0;
    
     // read tests

       #17
	  read_enable = 1;
      #17
	$display("Time %0d | Reading data: %h | FIFO Full: %b | FIFO Empty: %b", $time, read_data, full, empty);
	  read_enable = 1;
      #17
	$display("Time %0d | Reading data: %h | FIFO Full: %b | FIFO Empty: %b", $time, read_data, full, empty);
	  read_enable = 1;
      #17
    $display("Time %0d | Reading data: %h | FIFO Full: %b | FIFO Empty: %b", $time, read_data, full, empty);
	  read_enable = 1;
      #17
    $display("Time %0d | Reading data: %h | FIFO Full: %b | FIFO Empty: %b", $time, read_data, full, empty);
	  read_enable = 1;
      #17
    $display("Time %0d | Reading data: %h | FIFO Full: %b | FIFO Empty: %b", $time, read_data, full, empty);
	  read_enable = 1;
      #17
    $display("Time %0d | Reading data: %h | FIFO Full: %b | FIFO Empty: %b", $time, read_data, full, empty);
	  read_enable = 1;
      #17
    $display("Time %0d | Reading data: %h | FIFO Full: %b | FIFO Empty: %b", $time, read_data, full, empty);
	  read_enable = 1;
      #17
    $display("Time %0d | Reading data: %h | FIFO Full: %b | FIFO Empty: %b", $time, read_data, full, empty);
	  read_enable = 1;
       #17
    $display("Time %0d | Reading data: %h | FIFO Full: %b | FIFO Empty: %b", $time, read_data, full, empty);
	  read_enable = 1;
     #17
	$display("Time %0d | Reading data: %h | FIFO Full: %b | FIFO Empty: %b", $time, read_data, full, empty);
	 read_enable = 0;

       // End of simulation
       #20;
       $finish;
    end

endmodule
