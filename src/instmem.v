//////////////////////////////////////////////////////////
//
// Author: Ian Marco Moffett
// Description: QX1 Instruction memory.
//
//////////////////////////////////////////////////////////


module instruction_memory
  (
    input[15:0] pc,
    output[15:0] instruction
  );

  reg [15:0] memory [65535];
  wire [3:0] rom_addr = pc[4:1];

  initial begin
    $readmemb("tests/test.qx1", memory, 0, 14);
  end

  assign instruction = memory[rom_addr];
endmodule
