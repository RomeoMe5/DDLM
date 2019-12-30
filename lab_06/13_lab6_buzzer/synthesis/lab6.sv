module de10_lite
(
 input        CLOCK_50,
 input [0:0]  KEY,
 inout [35:0] GPIO
);
  localparam clk_50 = 50000000;

  // TONE= {C,D,E,F,G,A,Bb}; clear B = 52300; 
  localparam integer tone [0:6] = '{26163,29400,
                                    32963,34900,
                                    39200,44000,
                                    46500};
  logic [8:0]        gamma;
  logic              next_tone;
  logic              to_buzzer;
             
  generate
    genvar           i;
    for(i = 0;i < 7;i = i+1)begin:ga
      tone_gen
      #(
        .ref_clock     (clk_50),
        .out_freq_x100 (tone[i])
       )
      note
      (
       .clk       ( CLOCK_50 ),
       .rst_n     ( ~KEY[0]  ),
       .tone_freq ( gamma[i] )
      );
    end
  endgenerate
  
  assign gamma[7]=1'b0;

  strobe_gen #(.div(24))
  stb
  (
   .clk    ( CLOCK_50  ),
   .rst_n  ( ~KEY[0]   ),
   .strobe ( next_tone )
  );
  

  melody mel
  (
   .clk   ( CLOCK_50  ),
   .rst_n ( ~KEY[0]   ),
   .gamma ( gamma     ),
   .en    ( next_tone ),
   .tone  ( to_buzzer )
  );
  

  assign GPIO[35] = to_buzzer;

endmodule // de10_lite
