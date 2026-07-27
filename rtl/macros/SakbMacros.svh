`ifndef SAKB_MACROS_SVH
`define SAKB_MACROS_SVH

//-----------------------------------------------------------------------
// SAKB_FF_RSTN
// Simple flop with asynchronous active-low reset.
//   Q       : output register (must be declared logic [W-1:0] by caller)
//   D       : next-state value
//   Clk     : clock
//   RstN    : active-low async reset
//   RstVal  : value Q takes while RstN is low
//-----------------------------------------------------------------------
`define SAKB_FF_RSTN(Q, D, Clk, RstN, RstVal)      \
  always_ff @(posedge Clk or negedge RstN) begin   \
    if (!RstN) Q <= RstVal;                        \
    else       Q <= D;                             \
  end

//-----------------------------------------------------------------------
// SAKB_FF_RSTN_EN
// Flop with asynchronous active-low reset and a clock-enable.
//-----------------------------------------------------------------------
`define SAKB_FF_RSTN_EN(Q, D, En, Clk, RstN, RstVal)   \
  always_ff @(posedge Clk or negedge RstN) begin       \
    if (!RstN)   Q <= RstVal;                          \
    else if (En) Q <= D;                               \
  end

`endif // SAKB_MACROS_SVH
