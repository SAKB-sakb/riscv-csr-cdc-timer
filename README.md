# riscv-csr-cdc-timer
RISC-V CSR-mapped timer with cross-clock-domain synchronization — CDC-focused RTL design, verification, and closure using open-source and Vivado tooling

## Repository Structure

```
riscv-csr-cdc-timer/
├── .github/
│   └── workflows/
│       └── ci.yml
│
├── rtl/
│   ├── pkg/
│   │   ├── sakb_apb_pkg.sv          # SakbApbPkg
│   │   ├── sakb_reg_pkg.sv          # SakbRegPkg
│   │   └── sakb_pkg.sv              # SakbPkg (imports the two above)
│   ├── macros/
│   │   └── sakb_macros.svh
│   ├── common/
│   │   └── sakb_vdr.sv              # SakbVdr — generic register cell
│   ├── sync/
│   │   ├── sakb_sync2ff.sv          # SakbSync2ff — single-bit/control crossing
│   │   └── sakb_gray_sync.sv        # SakbGraySync — multi-bit counter crossing
│   ├── bus/
│   │   └── sakb_csr_bus_if.sv       # SakbCsrBusIf — APB slave FSM, bus-domain regs
│   ├── core/
│   │   └── sakb_timer_core.sv       # SakbTimerCore — peripheral-domain counter
│   └── sakb_top.sv                  # SakbTop — top-level integration
│
├── tb/
│   ├── tb_top.sv                    # directed testbench (Icarus)
│   └── cocotb_tests/
│       ├── test_sakb_timer.py
│       └── Makefile
│
├── formal/
│   └── sakb_gray_sync.sby           # SymbiYosys proof for the Gray-code sync
│
├── docs/
│   ├── block_diagram.svg
│   ├── clock_domain_diagram.svg
│   ├── register_map.md
│   └── cdc_writeup.md
│
├── reports/
│   ├── vivado_cdc_report.txt
│   └── verilator_lint.log
│
├── filelists/
│   └── rtl.f                        # ordered file list, see note below
│
├── vivado/
│   └── (Vivado project/constraints, gitignored except .xdc/.tcl)
│
├── .gitignore
├── LICENSE
└── README.md
```
