module PIPO_Shift_Register_tb;

    reg clk;
    reg load;
    reg [3:0] data_in;
    wire [3:0] data_out;

    // Instantiate the PIPO Shift Register
    PIPO_Shift_Register test (
        .clk(clk),
        .load(load),
        .data_in(data_in),
        .data_out(data_out)
    );

    // Clock generation
    always begin 
        #10 clk = ~clk;
    end

    initial begin

        $dumpfile("pipo_wave.vcd");
        $dumpvars(0, PIPO_Shift_Register_tb);
        // Initialize inputs
        clk = 0;
        load = 0;
        data_in = 4'b0000;

        // Dump waveform
        $dumpfile("pipo_wave.vcd");
        $dumpvars(0, PIPO_Shift_Register_tb);

        $display("==== PIPO Shift Register Simulation ====");
        $display("Initial: Time=%0t | clk=%b | load=%b | data_in=%b | data_out=%b", $time, clk, load, data_in, data_out);

        // Test Case 1: Load 1010
        #10;
        load = 1;
        data_in = 4'b1010;
        $display("Test Case 1 (Load 1010)    : Time=%0t | clk=%b | load=%b | data_in=%b | data_out=%b", $time, clk, load, data_in, data_out);

        // Test Case 2: Load 1100
        #10;
        $display("Result of Test Case 1      : Time=%0t | clk=%b | load=%b | data_in=%b | data_out=%b", $time, clk, load, data_in, data_out);
        data_in = 4'b1100;
        $display("Test Case 2 (Load 1100)    : Time=%0t | clk=%b | load=%b | data_in=%b | data_out=%b", $time, clk, load, data_in, data_out);

        // Test Case 3: Disable loading
        #10;
        $display("Result of Test Case 2      : Time=%0t | clk=%b | load=%b | data_in=%b | data_out=%b", $time, clk, load, data_in, data_out);
        load = 0;
        data_in = 4'b0110;
        $display("Test Case 3 (Hold, load=0) : Time=%0t | clk=%b | load=%b | data_in=%b | data_out=%b", $time, clk, load, data_in, data_out);

        // Test Case 4: Load 1111
        #10;
        $display("Result of Test Case 3      : Time=%0t | clk=%b | load=%b | data_in=%b | data_out=%b", $time, clk, load, data_in, data_out);
        load = 1;
        data_in = 4'b1111;
        $display("Test Case 4 (Load 1111)    : Time=%0t | clk=%b | load=%b | data_in=%b | data_out=%b", $time, clk, load, data_in, data_out);

        // Test Case 5: Disable loading
        #10;
        $display("Result of Test Case 4      : Time=%0t | clk=%b | load=%b | data_in=%b | data_out=%b", $time, clk, load, data_in, data_out);
        load = 0;
        data_in = 4'b0000;
        $display("Test Case 5 (Hold, load=0) : Time=%0t | clk=%b | load=%b | data_in=%b | data_out=%b", $time, clk, load, data_in, data_out);

        #10;
        $display("Result of Test Case 5      : Time=%0t | clk=%b | load=%b | data_in=%b | data_out=%b", $time, clk, load, data_in, data_out);
        $display("==== Simulation Finished ====");
        $finish;

    end

    // Monitor input and output values
    initial begin
        $display("Time=%0t | clk=%b | load=%b | data_in=%b | data_out=%b", $time, clk, load, data_in, data_out);
    end

endmodule