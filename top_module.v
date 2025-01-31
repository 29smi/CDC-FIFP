
`timescale 1ns / 1ps

module top_module(
    input wire [7:0] write_data,
    input wire write_clk,
    input wire write_rst,
    input wire write_enable,
    input wire read_rst,
    input wire read_clk,
    input wire read_enable,
    output wire [7:0] read_data,
    output wire full,
    output wire empty
);
    wire [3:0] write_addr_gray_1, read_addr_gray, synced_read_addr_gray, synced_write_addr_gray;
    wire [3:0] write_addr, read_addr;
    wire write_enable_1, read_enable_1;

    // Instantiate Write Control Logic
    write_control_logic write_ctrl(
        .write_clk(write_clk),
        .write_enable(write_enable),
        .read_addr_gray(synced_read_addr_gray),
        .write_rst(write_rst),
        .full(full),
        .write_addr(write_addr),
        .write_enable_1(write_enable_1),
        .write_addr_gray(write_addr_gray_1)
    );

    // Instantiate Read Control Logic
    read_control_logic read_ctrl(
        .read_clk(read_clk),
        .read_rst(read_rst),
        .read_enable(read_enable),
        .write_addr_gray(synced_write_addr_gray),
        .empty(empty),
        .read_addr(read_addr),
        .read_enable_1(read_enable_1),
        .read_addr_gray(read_addr_gray)
    );

    // Instantiate FIFO Memory
    fifo_memory memory(
        .write_data(write_data),
        .write_addr(write_addr),
        .write_enable_1(write_enable_1),
        .read_addr(read_addr),
        .read_enable_1(read_enable_1),
        .read_data(read_data),
        .read_clk(read_clk),
        .write_clk(write_clk),
        .read_rst(read_rst),
        .write_rst(write_rst)
    );

    // Instantiate Gray Code Synchronizers for Write and Read Control Logic
    gray_code_sync sync_write(
        .gray_in(write_addr_gray_1),
        .clka(write_clk),
        .clka_rst(write_rst),
        .clkb_rst(read_rst),
        .clkb(read_clk),
        .gray_out(synced_write_addr_gray)
    );

    gray_code_sync sync_read(
        .gray_in(read_addr_gray),
        .clka(read_clk),
        .clka_rst(read_rst),
        .clkb(write_clk),
        .clkb_rst(write_rst),
        .gray_out(synced_read_addr_gray)
    );
endmodule
