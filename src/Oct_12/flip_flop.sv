module flip_flop (
    input logic in,
    input logic clk,
    output logic out
);

    always_ff @(posedge clk) begin
        out <= in;
    end
endmodule

module tb_flip_flop ();
    logic in, clk;
    logic out;

    flip_flop dut(
        .in(in),
        .clk(clk),
        .out(out)
    );

    initial begin
        $dumpfile("flip_flop.vcd");        //don't include for vivado
        $dumpvars(0, tb_flip_flop);        //don't include for vivado
        in = 0;
        clk = 0;
        #200;
        $finish;
    end

    always begin
        #5 clk = ~clk;
    end

    always begin
        #5 in = ~in;
    end
endmodule