module OneBitFullAdder(
    input a,
    input b,
    input c_in,
    output sum,
    output c_out
);

    wire x1;
    wire a1, a2, a3;

    xor(x1, a, b);
    xor(sum, x1, c_in);

    and(a1, a, b);
    and(a2, a, c_in);
    and(a3, b, c_in);
    or(c_out, a1, a2, a3);

endmodule