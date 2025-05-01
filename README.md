# ECE 593 HW1 – ALU Design & Verification

This repository contains the implementation and verification of an Arithmetic Logic Unit (ALU) designed as part of **ECE 593 – Pre-Silicon Verification** at **Portland State University**.

## Project Overview
- **ALU Module (`ece593_alu`)**:  
  Supports operations: No-Op, Add, Subtract, XOR, AND, and 3-cycle Multiply.

- **Testbench (`ece593_alu_tb`)**:  
  Verifies ALU functionality using randomized test inputs and automated result checking.

## Features
- Parameterized 16-bit signed input
- Multi-cycle multiplication logic
- Self-checking testbench with `$monitor` and result validation
- Displays student information on special opcodes

## Files
- `ece593_alu.sv` — ALU RTL design
- `ece593_alu_tb.sv` — Testbench with 30 randomized test scenarios

> All work is original and submitted as part of coursework at Portland State University.
