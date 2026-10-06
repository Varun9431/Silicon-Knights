`timescale 1ns/1ps

module ex0 (
    input logic a, b,
    output logic c
);

    assign c = a | b;       //OR
endmodule

module tb_ex0 ();

    logic tb_a, tb_b, tb_c;

    ex0 dut (
        .a(tb_a),
        .b(tb_b),
        .c(tb_c)
    )

    initial begin
        $dumpfile("ex0.vcd");
        $dumpvars(0, tb_ex0);
        tb_a = 0;
        tb_b = 0;
    end

    always begin
        #5 tb_a = ~tb_a;
    end

    always begin
        #10 tb_b = ~tb_b;
    end
endmodule