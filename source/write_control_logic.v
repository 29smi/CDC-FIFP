`timescale 1ns / 1ps

/////////////////////////////
//
// write logic module
//
////////////////////////////


module write_control_logic(
    input wire write_clk,
    input wire write_enable,
    input wire [3:0] read_addr_gray,
    input wire write_rst,
    output reg full,
    output reg [3:0] write_addr,
    output reg write_enable_1,
    output reg [3:0] write_addr_gray
);
    // internal sequential variables
    reg [3:0] write_addr_next;
    reg full_next;
    
    reg [3:0] read_binary;

    always @(posedge write_clk or negedge write_rst) begin
        if (!write_rst) begin
            write_addr <= 4'b0000;
            full <= 1'b0;
        end else begin
            write_addr <= write_addr_next;
            full <= full_next;       
        end
    end


    always @(*) begin

        write_addr_next = write_addr;
        full_next = full;

        // binary to gray
        write_addr_gray = {write_addr_next[3], write_addr_next[3] ^ write_addr_next[2], write_addr_next[2] ^ write_addr_next[1], write_addr_next[1] ^ write_addr_next[0]};
        
        // gray to binary
        read_binary = {read_addr_gray[3], read_addr_gray[3] ^ read_addr_gray[2], read_addr_gray[3] ^ read_addr_gray[2] ^ read_addr_gray[1], read_addr_gray[3] ^ read_addr_gray[2] ^ read_addr_gray[1] ^ read_addr_gray[0]};

        
        if (write_enable && !full) begin
                write_addr_next = write_addr + 1;
                write_enable_1 = 1'b1;
        end else begin
            write_enable_1 = 1'b0;
        end
        // full 
        if((write_addr_next[3] != read_binary[3]) && (write_addr_next[2:0] == read_binary[2:0])) begin
            full_next = 1'b1;
        end else begin
            full_next = 1'b0;
        end
    end
endmodule
