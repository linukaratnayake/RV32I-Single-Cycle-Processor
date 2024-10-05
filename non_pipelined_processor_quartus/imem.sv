`timescale 1ns / 1ps

module imem
    #(  
      parameter ADDR_BUS_WIDTH = 5,
      parameter DATA_BUS_WIDTH = 32
    )
    (
        input logic [ADDR_BUS_WIDTH - 1:0] a,
        output logic [DATA_BUS_WIDTH - 1:0] rd
    );

    localparam MEM_DEPTH = 2 ** ADDR_BUS_WIDTH;
    localparam MEM_WIDTH = 8;
      
    logic [MEM_WIDTH - 1:0] memory[MEM_DEPTH - 1:0];
    
//    initial
//        $readmemh("memfile.dat", memory);
	initial
	begin
		memory[0] = 8'hFF;
		memory[1] = 8'hC4;
		memory[2] = 8'hA3;
		memory[3] = 8'h03;
	end
        
   assign rd = {memory[a], memory[a + 1], memory[a + 2], memory[a + 3]};

endmodule
