`ifndef _alu
`define _alu

`timescale 1ns/1ps

module alu
  (
    input clk,
    input [3:0] ctl,
    input [63:0] a, b,
    output reg [63:0] out,
    output zero
  );

  always @(posedge clk)
  begin
    case (ctl)
      4'd1: out <= a + b;       // ADD.
      4'd2: out <= a - b;       // SUB.
      4'd3: out <= a * b;       // MUL.
      4'd4: out <= a << b;      // SHL.
      4'd5: out <= a >> b;      // SHR.
      4'd6: out <= a / b;       // DIV.
      4'd7: out <= ~a;          // NOT.
      default: out <= a + b;
    endcase
  end

  assign zero = (out == 0) ? 1'b1 : 1'b0;
endmodule

`endif
