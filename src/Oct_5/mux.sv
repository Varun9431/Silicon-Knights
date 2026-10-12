`timescale 1ns/1ps
module mux (
    input logic a, b, c, d,
    input logic [1:0] sel,
    output logic e
);

    always_comb begin   //run things sequentially
        if (sel == 2'b00) begin
            e = a;
        end else if (sel == 2'b01) begin
            e = b;
        end else if (sel == 2'b10) begin
            e = c;
        end else if (sel == 2'b11) begin
            e = d;
        end
    end

endmodule

module tb_mux ();
    logic a_tb, b_tb, c_tb, d_tb, e_tb;
    logic [1:0] sel_tb;

    mux dut (
        .a(a_tb),
        .b(b_tb),
        .c(c_tb),
        .d(d_tb),
        .sel(sel_tb),
        .e(e_tb)
    );

    initial begin
        $dumpfile("mux.vcd");       //don't include for vivado
        $dumpvars(0, tb_mux);       //don't include for vivado
        a_tb = 1;
        b_tb = 0;
        c_tb = 1;
        d_tb = 0;
    end

    always begin
        #5 sel_tb = 2'b00;
        #5 sel_tb = 2'b01;
        #5 sel_tb = 2'b10;
        #5 sel_tb = 2'b11;
    end

    always begin
        #100;
        $finish;
    end
endmodule
