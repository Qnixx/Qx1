//////////////////////////////////////////////////////////
//
// Author: Ian Marco Moffett
// Description: QX1 memory.
//
//////////////////////////////////////////////////////////

module Memory
  (
    input clk,
    input [15:0] mem_access_addr,
    input [15:0] mem_write_data,
    input mem_write_en,
    output [15:0] mem_read_data
  );

  reg [15:0] memory [65535];

  always @ (posedge clk)
  begin
    if (mem_write_en)
    begin
      memory[mem_access_addr] <= mem_write_data;
    end
  end

  assign mem_read_data = memory[mem_access_addr];
endmodule
