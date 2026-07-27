`include "sakb_macros.svh"

//---------------------------------------------------------------------------
// SakbCsr
//
// Generic single register cell (Value/Data Register).
//   - Software write path : WrEn / WrData      (e.g. driven by the APB block)
//   - Hardware write path : HwWrEn / HwWrData   (e.g. driven by peripheral logic)
//   - ClrEn               : synchronously clears all bits to 0
//   - SetEn               : synchronously sets all bits to 1
//   - RegQ                : continuous fanout of the register contents
//   - RdData              : RegQ qualified by RdEn (0 when not selected) -
//                            intended to be OR'd onto a shared read-data bus
//
// Simultaneous assertion of {ClrEn, SetEn, HwWrEn, WrEn} is not expected to
// occur and is flagged by an assertion. A fixed internal priority
// (Clr > Set > Hw > Sw) is still applied so synthesis stays fully
// deterministic with no latches / no X propagation, but that ordering is a
// safety net, not a defined semantic - treat any assertion firing as a bug.
//---------------------------------------------------------------------------
module SakbCsr #(
  parameter int                        SAKB_WIDTH     = 32,
  parameter logic [SAKB_WIDTH-1:0]     SAKB_RESET_VAL = '0
) (
  input  logic                     Clk,
  input  logic                     RstN,

  // Software write port (e.g. APB)
  input  logic                     WrEn,
  input  logic [SAKB_WIDTH-1:0]    WrData,

  // Hardware write port (e.g. peripheral-domain logic, same clock as Clk)
  input  logic                     HwWrEn,
  input  logic [SAKB_WIDTH-1:0]    HwWrData,

  // Clear / Set
  input  logic                     ClrEn,
  input  logic                     SetEn,

  // Read port
  input  logic                     RdEn,
  output logic [SAKB_WIDTH-1:0]    RdData,

  // Continuous fanout of the register contents
  output logic [SAKB_WIDTH-1:0]    RegQ
);

  logic [SAKB_WIDTH-1:0] NextQ;

  always_comb begin
    NextQ = RegQ;               // default: hold
    if (ClrEn)         NextQ = '0;
    else if (SetEn)    NextQ = '1;
    else if (HwWrEn)   NextQ = HwWrData;
    else if (WrEn)     NextQ = WrData;
  end

  `SAKB_FF_RSTN(RegQ, NextQ, Clk, RstN, SAKB_RESET_VAL)

  assign RdData = RdEn ? RegQ : '0;

  //-------------------------------------------------------------------
  // Simultaneous-access check - see module header note above.
  //-------------------------------------------------------------------
`ifndef SYNTHESIS
  SakbVdrOverlapCheck: assert property (
    @(posedge Clk) disable iff (!RstN)
    $onehot0({ClrEn, SetEn, HwWrEn, WrEn})
  ) else begin
    $error("SakbVdr: illegal simultaneous ClrEn/SetEn/HwWrEn/WrEn assertion");
  end
`endif

endmodule : SakbVdr
