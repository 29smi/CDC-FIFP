
`timescale 1ns / 1 ps

module gray_code_sync(
    input wire [3:0] gray_in,
    input wire clkb,
    input clka,
    input clka_rst,
    input clkb_rst,
    output reg [3:0] gray_out
);
    reg [3:0] gray_sync1; 
    reg [3:0] gray_sync2;

    always @(posedge clka or negedge clka_rst) begin
        if(!clka_rst)
        begin
            gray_sync1 <= 4'b0000;
        end else begin
            gray_sync1 <= gray_in;
        end
    end

    always @(posedge clkb or negedge clkb_rst) begin
        if(!clkb_rst) begin
            gray_sync2 <= 4'b0000;
            gray_out <= 4'b0000;
        end else begin
            gray_sync2 <= gray_sync1;
            gray_out <= gray_sync2;
        end
    end
endmodule
