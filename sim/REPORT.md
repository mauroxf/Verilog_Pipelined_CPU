# Project Report: 3-Stage Pipelined RISC-V CPU

This report summarizes the design and simulation of a simple 3-stage pipelined RISC-V CPU implemented in Verilog. The CPU supports basic R-type instructions and showcases instruction fetch, decode, and execution phases in a pipelined fashion.

---

## Overview

This CPU consists of three main stages:

- **Fetch Stage**: Retrieves the instruction from memory and increments the program counter.
- **Decode Stage**: Extracts instruction fields, selects registers, and sets control signals.
- **Execute Stage**: Performs ALU operations based on `funct3` bits (used as ALU op).

### Key Modules

- `fetch.v`: Supplies instructions from a fixed ROM and updates the PC.
- `decode.v`: Handles register access and ALU control signal generation.
- `register_file.v`: Implements a 32-register bank with async read, sync write.
- `alu.v`: Parameterized ALU with support for 8 operations:
  - ADD, SUB, AND, OR, XOR, SLL, SRL, SLT
- `execute.v`: Instantiates the ALU and produces the result.
- `top_module.v`: Integrates all modules into a single datapath.
- `top_tb.v`: Drives the CPU and captures its behavior in waveform.

---

## Design Notes

- **Instruction Format**: Uses only R-type instructions (`funct3` used as ALU opcode).
- **Pipelining**: While there’s no hazard resolution (no stalls/forwarding), instructions flow from fetch to execute every cycle.
- **Register Initialization**: Registers x1–x7 are initialized on reset to specific values to test early instructions.
- **Testbench**: Drives `clk` and `rst`, observes instruction progress and ALU results.
- **Reg Write**: Set to always enabled to simplify writeback for testing purposes.
- **Verilog Portability**: Design uses only synthesizable constructs.

---

## Sample Output

Here's an example of early execution results:

- **Instruction**: `ADD x3, x1, x2`
- **Inputs**: `x1 = 10`, `x2 = 5`
- **Result**: `x3 = 15` (0x0000000F)

Each following instruction produces expected results which can be traced in the waveform file.

---

## Future Improvements

- Add pipeline registers for real pipelining
- Add hazard detection (stalling or forwarding)
- Support more instruction types (e.g., I-type, branching)
- Parameterize instruction memory initialization
- Add memory stage (for future load/store support)

---
