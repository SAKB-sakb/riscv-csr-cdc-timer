package SakbPkg;

  import SakbApbPkg::*;
  import SakbRegPkg::*;

  //-----------------------------------------------------------------------
  // Top-level / cross-module parameters
  //-----------------------------------------------------------------------
  parameter int SAKB_BUS_CLK_FREQ_HZ    = 50_000_000;  // PCLK domain
  parameter int SAKB_PERIPH_CLK_FREQ_HZ = 33_000_000;  // async peripheral domain

  parameter int SAKB_SYNC_STAGES = 2;  // 2FF synchronizer depth used project-wide

endpackage : SakbPkg
