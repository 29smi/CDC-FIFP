`timescale 1ns / 1ps


module read_control_logic(
    input wire read_clk,
    input wire read_rst,
    input wire read_enable,
    input wire [3:0] write_addr_gray,
    output reg empty,
    output reg [3:0] read_addr,
    output reg read_enable_1,
    output reg [3:0] read_addr_gray
);

    reg [3:0] read_addr_next;
    reg empty_next;

    reg [3:0] write_binary;


    // Sequential block for updating the read pointer and status flags
    always @(posedge read_clk or negedge read_rst) begin
        if (!read_rst) begin
            read_addr <= 4'b0000;
            empty <= 1'b1;  
            
        end else begin
            // Update read pointer and address values
            read_addr <= read_addr_next;
            empty <= empty_next;
        end
    end

    // Combinational block 
    always @(*) begin
        // Default assignments to avoid latches
        read_addr_next = read_addr;
        empty_next = empty;

        // binary to gray
        read_addr_gray = {read_addr[3], read_addr[2] ^ read_addr[3], read_addr[1] ^ read_addr[2], read_addr[0] ^ read_addr[1]};


        // gray to binary
        write_binary = {write_addr_gray[3], write_addr_gray[3] ^ write_addr_gray[2], write_addr_gray[3] ^ write_addr_gray[2] ^ write_addr_gray[1], write_addr_gray[3] ^ write_addr_gray[2] ^ write_addr_gray[1] ^ write_addr_gray[0]};
        

        // reading
        if (read_enable == 1'b1 && empty == 1'b0) begin
            read_addr_next = read_addr + 1; // Increment pointer
            read_enable_1 = 1'b1;
        end else begin
            read_enable_1 = 1'b0;
        end

        // Update empty flag to ensure it's correctly set
        if (read_addr_next == write_binary) begin
            empty_next = 1'b1;   // FIFO is empty if read pointer equals write pointer
        end else begin
            empty_next = 1'b0;   // FIFO is not empty
        end 
    end
endmodule
