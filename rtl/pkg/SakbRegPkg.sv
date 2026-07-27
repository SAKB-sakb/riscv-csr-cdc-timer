package SakbRegPkg;

  //-----------------------------------------------------------------------
  // Generic SakbVdr defaults
  //-----------------------------------------------------------------------
  parameter int SAKB_VDR_DEFAULT_WIDTH = 32;
  parameter logic [SAKB_VDR_DEFAULT_WIDTH-1:0] SAKB_VDR_DEFAULT_RESET_VAL = '0;

  //-----------------------------------------------------------------------
  // Timer/CSR register offset map
  //-----------------------------------------------------------------------
  parameter logic [11:0] SAKB_TIMER_CTRL_OFFSET      = 12'h000;
  parameter logic [11:0] SAKB_TIMER_STATUS_OFFSET    = 12'h004;
  parameter logic [11:0] SAKB_TIMER_COUNT_OFFSET     = 12'h008;
  parameter logic [11:0] SAKB_TIMER_THRESHOLD_OFFSET = 12'h00C;
  parameter logic [11:0] SAKB_TIMER_ID_OFFSET        = 12'h010;

  parameter logic [31:0] SAKB_TIMER_ID_VALUE = 32'hDEADCAFE;

  //-----------------------------------------------------------------------
  // TIMER_CTRL bit map
  //-----------------------------------------------------------------------
  parameter int SAKB_CTRL_BIT_ENABLE     = 0;
  parameter int SAKB_CTRL_BIT_RESET_CNT  = 1;
  parameter int SAKB_CTRL_BIT_IRQ_EN     = 2;

  //-----------------------------------------------------------------------
  // TIMER_STATUS bit map
  //-----------------------------------------------------------------------
  parameter int SAKB_STATUS_BIT_RUNNING  = 0;
  parameter int SAKB_STATUS_BIT_EVENT    = 1;

endpackage : SakbRegPkg
