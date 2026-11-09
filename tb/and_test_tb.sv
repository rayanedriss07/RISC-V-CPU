`timescale 1ns/1ps

module and_test_tb;

    logic a, b, y;

    and_test dut (.a(a), .b(b), .y(y));

    task check(input logic expected);
        #1;
        if (y !== expected)
            $display("FAIL: a=%b b=%b y=%b expected=%b", a, b, y, expected);
        else
            $display("PASS: a=%b b=%b y=%b", a, b, y);
    endtask

    initial begin
        $dumpfile("sim/and_test.vcd");
        $dumpvars(0, and_test_tb);

        a = 0; b = 0; check(0);
        a = 0; b = 1; check(0);
        a = 1; b = 0; check(0);
        a = 1; b = 1; check(1);

        $finish;
    end

endmodule

module and_test (
    input  logic a,
    input  logic b,
    output logic y
);
    assign y = a & b;
endmodule
