## 3-Stage Pipelined RISC-V CPU (Verilog)

This project implements a 3-stage pipelined RISC-V CPU in Verilog with fetch, decode, and execute stages.

## File Structure

- `src/`
  
  → `alu.v`
    - ALU module with 8 parameterized operation codes

  → `decode.v`  
    - Instruction decode logic and register file interface

  → `execute.v`  
    - ALU instantiation and execution logic

  → `fetch.v`  
    - Instruction fetch unit with 32 bits simple PC logic

  → `register_file.v`  
    - 32-register memory with async read / sync write

  → `top_module.v`  
    - Top-level pipeline integration

- `tb/`

  → `top_tb.v`  
    - Testbench to simulate and observe CPU behavior

- `sim/`

  → `waveform_cpu.png`  
    - Screenshot of signal waveforms from simulation
      
  → `REPORT.md`
    - Project report page with notes

## Features

- 3-stage pipeline: Fetch → Decode → Execute
- 32 general-purpose registers
- Preloaded register values for simulation
- Hardcoded instruction memory (32 R-type instructions)
- Supports: `ADD`, `SUB`, `AND`, `OR`, `XOR`, `SLL`, `SRL`, `SLT`
- Synchronous writeback, asynchronous read
- Simulation testbench with waveform output

## How to Run

Use Icarus Verilog and GTKWave:

```bash
iverilog -o cpu.vvp *.v
vvp cpu.vvp
gtkwave top_tb.vcd
```

**OR**

Use Siemens Questa via EDA Playground and EPWave

