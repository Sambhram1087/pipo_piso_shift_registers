module PIPO_Shift_Register(
    input wire clk,
    input wire load,
    input wire [3:0]data_in,
    output reg [3:0]data_out
);

    always @(posedge clk) begin 
        if (load)
            data_out <= data_in;
    end

endmodule