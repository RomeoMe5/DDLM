module pipeline_stomach
# (
    parameter width = 8
)
(
    input                    clock,
    input                    reset_n,

    input      [width - 1:0] up_data,
    input                    up_valid,
    output                   up_ready,

    output     [width - 1:0] down_data,
    output                   down_valid,
    input                    down_ready
);

    wire stomach_load, dataout_load, dataout_unload;
    reg  mux_select;

    wire [width - 1:0] data_in;
    reg  [width - 1:0] stomach_out, mux_out, data_out;

    reg data_in_dataout, data_in_stomach;

    assign data_in = up_data;

    assign down_valid = data_in_dataout;

    assign dataout_unload = down_valid & down_ready;

    assign dataout_load =
           (up_valid & (! data_in_dataout | dataout_unload))
         | (data_in_stomach & dataout_unload);

    assign stomach_load =
            up_valid
        & ! data_in_stomach
        &   (data_in_dataout & ! dataout_unload);

    assign up_ready = ! data_in_stomach;

    always @ (posedge clock or negedge reset_n)
        if (! reset_n)
        begin
            data_in_stomach <= 1'b0;
            data_in_dataout <= 1'b0;
        end
        else
        begin
            data_in_stomach <=    stomach_load
                               | (data_in_stomach & ! dataout_unload);

            data_in_dataout <=    dataout_load
                               |  data_in_stomach
                               | (data_in_dataout & ! dataout_unload);
        end

    always @ (posedge clock or negedge reset_n)
        if (! reset_n)
            mux_select <= 1'b0;
        else
            mux_select <= stomach_load | (mux_select & ! dataout_load);

    always @ (posedge clock or negedge reset_n)
        if (! reset_n)
            stomach_out <= { width { 1'b0 } };
        else if (stomach_load)
            stomach_out <= data_in;
    
    always @*
        mux_out = mux_select ? stomach_out : data_in;

    always @ (posedge clock or negedge reset_n)
        if (! reset_n)
            data_out <= { width { 1'b0 } };
        else if (dataout_load)
            data_out <= mux_out;

    assign down_data = data_out;

endmodule

//--------------------------------------------------------------------

`ifdef REF_DESIGN

module top
# (
    parameter width = 8
)
(
    input                    clock,
    input                    reset_n,

    input      [width - 1:0] up_data,
    input                    up_valid,
    output                   up_ready,

    output     [width - 1:0] down_data,
    output                   down_valid,
    input                    down_ready
);

    pipeline_stomach      # (.width (width))
    pipeline_stomach_inst (.*);
/*
        clock,
        reset_n,

        up_data,
        up_valid,
        up_ready,

        down_data,
        down_valid,
        down_ready
*/

endmodule

//--------------------------------------------------------------------

`else  // ! REFERENCE_DESIGN

module top
# (
    parameter width = 8
)
(
    input                    clock,
    input                    reset_n,

    input      [width - 1:0] up_data,
    input                    up_valid,
    output                   up_ready,

    output     [width - 1:0] down_data,
    output                   down_valid,
    input                    down_ready
);

    wire       [width - 1:0] i12_data;
    wire                     i12_valid;
    wire                     i12_ready;

    pipeline_stomach # (.width (width))
    pipeline_stomach_inst_1
    (
        .down_data  ( i12_data  ),
        .down_valid ( i12_valid ),
        .down_ready ( i12_ready ),

        .*
    );

    pipeline_stomach # (.width (width))
    pipeline_stomach_inst_2
    (
        .up_data    ( i12_data  ),
        .up_valid   ( i12_valid ),
        .up_ready   ( i12_ready ),

        .*
    );

endmodule

`endif
