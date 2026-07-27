package SakbApbPkg;

  //-----------------------------------------------------------------------
  // Bus geometry
  //-----------------------------------------------------------------------
  parameter int SAKB_APB_ADDR_WIDTH = 12;   // enough for a small peripheral
  parameter int SAKB_APB_DATA_WIDTH = 32;

  //-----------------------------------------------------------------------
  // APB SETUP/ACCESS FSM states (IHI0024E Chapter 3)
  //-----------------------------------------------------------------------
  typedef enum logic [1:0] {
    SAKB_APB_ST_IDLE   = 2'b00,
    SAKB_APB_ST_SETUP  = 2'b01,
    SAKB_APB_ST_ACCESS = 2'b10
  } SakbApbStateE;

endpackage : SakbApbPkg
