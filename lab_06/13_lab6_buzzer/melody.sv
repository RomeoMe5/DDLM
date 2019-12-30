`define melody3
module melody
(
 input       clk,
 input       rst_n,
 input [7:0] gamma,
 input       en,
 output      tone 
);
  
  localparam C4=3'h0, D4=3'h1, E4=3'h2, F4=3'h3,
             G4=3'h4, A4=3'h5, B4=3'h6, P4=3'h7;
  
  
  
  logic [1:0] dur_cnt;
  logic [2:0] sel;
  logic [1:0] tone_size;
  
   
`ifdef melody1
    
    localparam integer mel_width = 64;
    
    typedef struct packed { logic [mel_width-1:0][1:0] size;
                            logic [mel_width-1:0][2:0] note;} song;
                            
    song s,my_song;
  
  // Melody №1. A4ntoshka
  //------------------------------

  assign my_song.note = {
                         A4, G4, P4, A4,
                         F4, P4, A4, G4,
                         E4, C4, A4, F4,
                         A4, G4, P4, A4,
                         F4, P4, A4, G4,
                         A4, G4, F4, E4,
                         D4, C4, P4, A4,
                         B4, A4, G4, P4,
                         
                         G4, A4, G4, F4,
                         P4, A4, B4, A4,
                         G4, F4, E4, G4, 
                         F4, A4, B4, A4,
                         G4, F4, E4, G4,
                         F4, P4, A4, G4,
                         P4, E4, P4, F4,
                         P4, P4, P4, P4 
                         };
  
  assign my_song.size = {
                         2'h0, 2'h1, 2'h0, 2'h0,
                         2'h1, 2'h0, 2'h0, 2'h1,
                         2'h0, 2'h0, 2'h1, 2'h0,
                         2'h0, 2'h1, 2'h0, 2'h0,
                         2'h1, 2'h0, 2'h0, 2'h0,
                         2'h0, 2'h0, 2'h0, 2'h1,
                         2'h1, 2'h0, 2'h1, 2'h0,
                         2'h0, 2'h0, 2'h0, 2'h1, 
  
                         2'h0, 2'h0, 2'h0, 2'h0,
                         2'h1, 2'h0, 2'h0, 2'h0,
                         2'h0, 2'h0, 2'h0, 2'h0,
                         2'h0, 2'h0, 2'h0, 2'h0,
                         2'h0, 2'h0, 2'h0, 2'h0,
                         2'h0, 2'h0, 2'h0, 2'h0,
                         2'h0, 2'h0, 2'h0, 2'h0,
                         2'h0, 2'h0, 2'h0, 2'h0
                         };
      
  
  //==============================
`endif //  `ifdef melody1
  
   
`ifdef melody2
  
  localparam integer mel_width = 32;
  
  typedef struct packed { logic [mel_width-1:0][1:0] size;
                          logic [mel_width-1:0][2:0] note;} song;
  song s,my_song;

  // Melogy №2. Jingle bells
  //------------------------------
  assign my_song.note = {
                         E4, E4, E4, P4,
                         E4, E4, E4, P4,
                         E4, G4, C4, D4,
                         E4, P4, F4, F4,
                         F4, F4, P4, F4,
                         E4, E4, P4, E4,
                         D4, D4, E4, D4,
                         G4, P4, P4, P4 
                        };
   
  assign my_song.size = {
                         2'h0, 2'h0, 2'h0, 2'h0,
                         2'h0, 2'h0, 2'h0, 2'h0,
                         2'h0, 2'h0, 2'h0, 2'h0,
                         2'h0, 2'h0, 2'h0, 2'h0,
                         2'h0, 2'h0, 2'h0, 2'h0,
                         2'h0, 2'h0, 2'h0, 2'h0,
                         2'h0, 2'h0, 2'h0, 2'h0,
                         2'h0, 2'h1, 2'h1, 2'h0 
                        };
  //==============================

 `endif //  `ifdef melody2
  
 `ifdef melody3
    
    localparam integer mel_width = 32;
    
    typedef struct packed { logic [mel_width-1:0][1:0] size;
                            logic [mel_width-1:0][2:0] note;} song;
    song s,my_song;
  
  // Melody №3. Two_merry_geese
  //------------------------------
  
  assign my_song.note = {
                         F4, E4, D4, C4,
                         G4, P4, G4, P4,
                         F4, E4, D4, C4,
                         G4, P4, G4, P4,
                         F4, A4, A4, F4,
                         E4, G4, G4, E4,
                         D4, E4, F4, D4,
                         C4, P4, C4, P4 
                        };
  
   assign my_song.size= {
                         2'h0, 2'h0, 2'h0, 2'h0,
                         2'h0, 2'h0, 2'h0, 2'h0,
                         2'h0, 2'h0, 2'h0, 2'h0,
                         2'h0, 2'h0, 2'h0, 2'h0,
                         2'h0, 2'h0, 2'h0, 2'h0,
                         2'h0, 2'h0, 2'h0, 2'h0,
                         2'h0, 2'h0, 2'h0, 2'h0,
                         2'h0, 2'h0, 2'h0, 2'h0 
                        };
  
  //==============================                         
 
 `endif //  `ifdef melody3
  
  
  
       
 

  assign sel        = s.note[mel_width-1];
  assign tone_size  = s.size[mel_width-1];
  
  always_comb
    case(sel)
      C4 : tone = gamma[0];
      D4 : tone = gamma[1];
      E4 : tone = gamma[2];
      F4 : tone = gamma[3];
      G4 : tone = gamma[4];
      A4 : tone = gamma[5];
      B4 : tone = gamma[6];
      P4 : tone = gamma[7];
    endcase // case (sel)

   
  always_ff@(posedge clk or negedge rst_n)
    if(!rst_n) begin
      dur_cnt <= '0;
      s.size  <= my_song.size;
      s.note  <= my_song.note;
      end
    else if(en)
     if(dur_cnt == tone_size)
      begin
        s.size  <= {s.size[mel_width-2:0],s.size[mel_width-1]};
        s.note  <= {s.note[mel_width-2:0],s.note[mel_width-1]};
        dur_cnt <= '0;
      end
     else
        dur_cnt <= dur_cnt + 1'b1;
    
endmodule // melody

