module PISO_Shift_Register_tb;

    reg clk;
    reg shift;
    reg [3:0] parallel_in;
    wire serial_out;

    PISO_Shift_Register test (
        .clk(clk),
        .shift(shift),
        .parallel_in(parallel_in),
        .serial_out(serial_out)
    );

    always begin 
       #10 clk = ~clk;
    end

    initial begin

        $dumpfile("piso_wave.vcd");
        $dumpvars(0, PISO_Shift_Register_tb);

        clk = 0;
        shift = 0;
        parallel_in = 4'b0000;

        $display("==== PISO Shift Register Simulation ====");
        $display("Initial: Time=%0t | clk=%b | shift=%b | parallel_in=%b | serial_out=%b", $time, clk, shift, parallel_in, serial_out);

        // Parallel loading
        @(negedge clk);
        parallel_in = 4'b1010;
        shift = 0;
        $display("Test Case 1 (Load 1010)    : Time=%0t | clk=%b | shift=%b | parallel_in=%b | serial_out=%b", $time, clk, shift, parallel_in, serial_out);

        @(posedge clk);
        #1;
        $display("Parallel Loaded: %b", test.temp);
        $display("Result of Test Case 1      : Time=%0t | clk=%b | shift=%b | parallel_in=%b | temp=%b | serial_out=%b", $time, clk, shift, parallel_in, test.temp, serial_out);

        // First shift
        @(negedge clk);
        shift = 1;
        $display("Test Case 2 (Shift enabled): Time=%0t | clk=%b | shift=%b | parallel_in=%b | serial_out=%b", $time, clk, shift, parallel_in, serial_out);

        @(posedge clk);
        #1;
        $display("After 1st shift: %b | Serial: %b",
                 test.temp, serial_out);
        $display("Result of 1st shift        : Time=%0t | clk=%b | shift=%b | parallel_in=%b | temp=%b | serial_out=%b", $time, clk, shift, parallel_in, test.temp, serial_out);

        // Second shift
        @(posedge clk);
        #1;
        $display("After 2nd shift: %b | Serial: %b",
                 test.temp, serial_out);
        $display("Result of 2nd shift        : Time=%0t | clk=%b | shift=%b | parallel_in=%b | temp=%b | serial_out=%b", $time, clk, shift, parallel_in, test.temp, serial_out);

        // Third shift
        @(posedge clk);
        #1;
        $display("After 3rd shift: %b | Serial: %b",
                 test.temp, serial_out);
        $display("Result of 3rd shift        : Time=%0t | clk=%b | shift=%b | parallel_in=%b | temp=%b | serial_out=%b", $time, clk, shift, parallel_in, test.temp, serial_out);

        // Fourth shift
        @(posedge clk);
        #1;
        $display("After 4th shift: %b | Serial: %b",
                 test.temp, serial_out);
        $display("Result of 4th shift        : Time=%0t | clk=%b | shift=%b | parallel_in=%b | temp=%b | serial_out=%b", $time, clk, shift, parallel_in, test.temp, serial_out);

        #10;
        $display("==== Simulation Finished ====");
        $finish;

    end

endmodule