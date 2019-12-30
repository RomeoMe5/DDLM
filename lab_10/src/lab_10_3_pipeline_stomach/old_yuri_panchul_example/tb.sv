module tb;

    localparam width        = 8,
               clock_period = 100;

    reg                clock;
    reg                reset_n;

    reg  [width - 1:0] up_data;
    reg                up_valid;
    wire               up_ready;

    wire [width - 1:0] down_data;
    wire               down_valid;
    reg                down_ready;

    top
    #(.width (width))
    top_inst (.*);

    initial
    begin
        clock = 1'b1;

        forever
            # (clock_period / 2) clock = ~ clock;
    end

    wire [width - 1:0] up_data_x
        = up_valid & up_ready ? up_data : 8'hx;

    wire [width - 1:0] down_data_x
        = down_valid & down_ready ? down_data : 8'hx;

    int i, n;

    initial
    begin
        // Initial signal values

        up_valid   <= 1'b0;
        down_ready <= 1'b0;

        // Reset sequence

        reset_n <= 1'b0;

        repeat (5) @ (posedge clock);

        reset_n <= 1'b1;

        repeat (5) @ (posedge clock);

        up_data    <= 8'b0;
        up_valid   <= 1'b0;
        down_ready <= 1'b1;

        repeat (5) @ (posedge clock);

        // Pattern 1

        for (i = 0, n = 0; i < 10; i ++)
        begin
            up_valid   <= 1'b1;
            down_ready <= 1'b1;

            up_data    <= n;

            @ (posedge clock);

            if (up_valid & up_ready)
                n ++;
        end

        up_data    <= 8'b0;
        up_valid   <= 1'b0;
        down_ready <= 1'b1;

        repeat (5) @ (posedge clock);

        // Pattern 2

        for (i = 0, n = 0; i < 10; i ++)
        begin
            up_valid   <= 1'b1;
            down_ready <= i & 1;

            up_data    <= n;

            @ (posedge clock);

            if (up_valid & up_ready)
                n ++;
        end

        up_data    <= 8'b0;
        up_valid   <= 1'b0;
        down_ready <= 1'b1;

        repeat (5) @ (posedge clock);

        // Pattern 3

        for (i = 0, n = 0; i < 10; i ++)
        begin
            up_valid   <= i & 1;
            down_ready <= 1'b1;

            up_data    <= n;

            @ (posedge clock);

            if (up_valid & up_ready)
                n ++;
        end

        up_data    <= 8'b0;
        up_valid   <= 1'b0;
        down_ready <= 1'b1;

        repeat (5) @ (posedge clock);

        // Pattern 4

        for (i = 0, n = 0; i < 10; i ++)
        begin
            up_valid   <= i & 1;
            down_ready <= i & 1;

            up_data    <= n;

            @ (posedge clock);

            if (up_valid & up_ready)
                n ++;
        end

        up_data    <= 8'b0;
        up_valid   <= 1'b0;
        down_ready <= 1'b1;

        repeat (5) @ (posedge clock);

        // Pattern 5

        for (i = 0, n = 0; i < 10; i ++)
        begin
            up_valid   <=    i & 1;
            down_ready <= ! (i & 1);

            up_data    <= n;

            @ (posedge clock);

            if (up_valid & up_ready)
                n ++;
        end

        up_data    <= 8'b0;
        up_valid   <= 1'b0;
        down_ready <= 1'b1;

        repeat (5) @ (posedge clock);

        // Pattern 6

        for (i = 0, n = 0; i < 10; i ++)
        begin
            up_valid   <= $urandom_range (1);
            down_ready <= $urandom_range (1);

            up_data    <= n;

            @ (posedge clock);

            if (up_valid & up_ready)
                n ++;
        end

        up_data    <= 8'b0;
        up_valid   <= 1'b0;
        down_ready <= 1'b1;

        repeat (5) @ (posedge clock);

        $finish;
    end

endmodule
