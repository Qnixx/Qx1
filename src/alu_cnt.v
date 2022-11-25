//////////////////////////////////////////////////////////
//
// Author: Ian Marco Moffett
// Description: QX1 ALU Control Unit.
//
//////////////////////////////////////////////////////////

module alu_control
  (
    output reg [2:0] alu_cntl,
    input [3:0] opcode,
    input [1:0] alu_op
  );

  wire [5:0] alu_control_in;
  assign alu_control_in = {alu_op, opcode};

  always @ (alu_control_in)
    casex (alu_control_in)
       6'b10xxxx:
         alu_cntl=3'b000;
       6'b01xxxx:
         alu_cntl=3'b001;
       6'b000010:
         alu_cntl=3'b000;
       6'b000011:
         alu_cntl=3'b001;
       6'b000100:
         alu_cntl=3'b010;
       6'b000101:
         alu_cntl=3'b011;
       6'b000110:
         alu_cntl=3'b100;
       6'b000111:
         alu_cntl=3'b101;
       6'b001000:
         alu_cntl=3'b110;
       6'b001001:
         alu_cntl=3'b111;
      default:
        alu_cntl = 3'b000;
    endcase
endmodule
