module dp_ram(clk,data_A,data_B,wr_en_A,wr_en_B,addr_A,addr_B,out_A,out_B);
  input clk;
  input wr_en_A,wr_en_B; // write & read_bar signal
  input [7:0] data_A,data_B; // 8 bit Data Bus
  input [5:0] addr_A,addr_B; // 6 bit address bus
  output reg out_A,out_B; 
  
  reg [7:0] ram[63:0];  // 64*8 bit RAM
  
  always@(posedge clk)
    begin
      if(wr_en_A)   // write is logic high
        begin
          ram[addr_A]<=data_A;
        end
      else
        begin
          out_A<=ram[addr_A];  //read data from RAM
        end
    end
  
  
  always@(posedge clk)
    begin
      if(wr_en_B)  // write is logic high
        begin
          ram[addr_B]<=data_B;
        end
      else
        begin
          out_B<=ram[addr_B];  //read data from RAM
        end
    end
  
endmodule