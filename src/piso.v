module PISO_Shift_Register (
    input wire clk,
    input wire shift,
    input wire [3:0] parallel_in,
    output wire serial_out
);
    reg [3:0] temp;

    always @(posedge clk) begin 
        if (!shift)
            temp <= parallel_in; // Parallel Loading
        else 
            temp <= {1'b0, temp[3:1]}; // Shift Towards Right 
    end

    assign serial_out = temp[0];

endmodule 