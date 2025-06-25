module tb_scrambler;

    reg clk;
    reg [7:0] din;
    
    wire [7:0] scrambler_out;

    scrambler uut ( .clk(clk), .din(din), .scrambler_out(scrambler_out) );

    
    initial clk = 0;
    always #15 clk = ~clk;

    
    initial 
        begin
            
            din = 8'b10101001;
            #10000;
            $finish;
            
        end

endmodule
