
`timescale 1ns / 1ps


module fifo_memory(
    input wire [7:0] write_data,
    input wire [3:0] write_addr,
    input wire write_enable_1,
    input wire [3:0] read_addr,
    input wire read_enable_1,
    input wire write_clk,
    input wire write_rst,
    input wire read_clk,
    input wire read_rst,
    output reg [7:0] read_data
);
    reg [7:0] fifo_data_next[0:7];
    reg [7:0] fifo_data[0:7];
    reg [7:0] read_data_next;


    integer i;
    integer j;

    // sequential write
    always @(posedge write_clk or negedge write_rst) begin
            if(!write_rst) begin
                for(i = 0; i <= 7 ; i = i + 1) begin
                    fifo_data[i] <= 8'h00;    
                end 
            end else begin
                for(i = 0; i <= 7; i = i + 1) begin
                    fifo_data[i] <= fifo_data_next[i];
                end
        end
    end


    // sequential read
    always @(posedge read_clk or negedge read_rst) begin
        if(!read_rst) begin
            read_data <= 8'b00;
        end else begin
            read_data <= read_data_next;
        end
    end

    always @(*) begin

        read_data_next = read_data;
        for(j = 0; j <= 7; j = j + 1) begin
            fifo_data_next[j] = fifo_data[j];
        end

        if (write_enable_1) begin
            fifo_data_next[write_addr[2:0]] = write_data;
        end 

        if (read_enable_1) begin
            read_data_next = fifo_data[read_addr[2:0]];
        end
    end

endmodule
