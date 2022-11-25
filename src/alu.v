//////////////////////////////////////////////////////////
//  
// Author: Ian Marco Moffett
// Description: QX1 ALU.
//
//////////////////////////////////////////////////////////

module alu
  (
    input [15:0] src1,
    input [15:0] src2,
    input [2:0] alu_ctrl,

    output reg [15:0] result,
    output zero
  );

  always @(*)
  begin
    case (alu_ctrl)
      3'b000:                         // ADD.
        result = src1 + src2;
      3'b001:                         // SUB.
        result = src1 - src2;
      3'b010:                         // NOT.
        result = ~src1;
      3'b011:                         // SHL.
        result = src1 << src2;
      3'b100:                         // SHR.
        result = src1 >> src2;
      3'b101:                         // AND.
        result = src1 & src2;
      3'b110:                         // OR.
        result = src1 | src2;
      3'b111:
        begin if (src1 < src2)
          result = 16'd1;
        else
          result = 16'd0;
        end
      default:
        result = src1 + src2;
    endcase
  end

  assign zero = (result == 16'd0) ? 1'b1 : 1'b0;

endmodule
