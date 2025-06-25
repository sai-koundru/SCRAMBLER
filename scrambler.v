module scrambler
(
input clk,
input [7:0]din,

output reg [7:0] scrambler_out
);


parameter                      DATA                      =                    3'd0,
                               LFSR                      =                    3'd1,
                               SCRAMBLER                 =                    3'd2,
                               IDLE                      =                    3'd3;
                               


reg [7:0] lfsr = 8'b1100_0101;
reg [7:0] shift_reg = 0;
reg [2:0] state = DATA;
reg feedback = 0;
reg success = 0;
reg [7:0] lfsr_output = 0;
reg [7:0] scrambler_output = 0;


always @(posedge clk)
  begin
    shift_reg <= din;
  end

  
always @(posedge clk)
  begin
    
    case(state)
    
    
    DATA : begin    
             state <= LFSR;
           end

      
    LFSR : begin                    
             feedback <= lfsr[6] ^ lfsr[3];                              
             lfsr <= {feedback, lfsr[6:1]};
             lfsr_output[7:0] <= {feedback, lfsr[6:1]};
             state <= SCRAMBLER;
           end
    
    
    SCRAMBLER : begin
                  scrambler_output[7:0] <= shift_reg ^ lfsr_output;                                   
                  scrambler_out <= scrambler_output;
                  state <= IDLE;                   
                end
    
    
    IDLE : begin
             success <= 1;
           end
                
                        
                default : state <= IDLE;
      
endcase
end
endmodule
