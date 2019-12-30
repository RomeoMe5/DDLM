module group_ripple_carry_adder
# (
    parameter GROUP_COUNT = 2,
    parameter WIDTH       = 2
)
(
    input                                carry_in,
    input  [GROUP_COUNT * WIDTH - 1 : 0] x,
    input  [GROUP_COUNT * WIDTH - 1 : 0] y,
    output [GROUP_COUNT * WIDTH - 1 : 0] z,
    output                               carry_out
);
    wire [GROUP_COUNT : 0] carry;
    
    assign carry[0] = carry_in; 
    
    generate
    
        genvar i;
    
        for (i = 0; i <= GROUP_COUNT - 1; i = i + 1)
        begin : stage
            adder #(.WIDTH(WIDTH)) FA
            (
                .x		   (x    [WIDTH * (i + 1) - 1 : WIDTH * i]),
                .y         (y    [WIDTH * (i + 1) - 1 : WIDTH * i]),
                .z         (z    [WIDTH * (i + 1) - 1 : WIDTH * i]),
                .carry_in  (carry[i]                              ),
                .carry_out (carry[i + 1]                          )
            );
        end
    endgenerate
    
    assign carry_out = carry[GROUP_COUNT];

endmodule
