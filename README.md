# ECE593 Homework 1: ALU Design and Verification

SystemVerilog design and functional verification of an Arithmetic Logic Unit (ALU) for ECE 593 — Advanced Verification.

## Repository Structure

```
ece_593_hw1/
├── rtl/
│   └── ece593_alu.sv          # ALU RTL design (DUT)
├── tb/
│   └── ece593_alu_tb.sv       # ALU testbench with stimulus
├── logs/
│   ├── transcript             # QuestaSim simulation transcript
│   ├── stimulus_transcript    # Stimulus-driven simulation output
│   ├── transcript_alu.txt     # ALU-specific simulation log
│   └── transcript_alu_tb.txt  # Testbench simulation log
├── Transcripts/
│   ├── Output_Img1.png        # Simulation waveform screenshot 1
│   └── Output_Img2.png        # Simulation waveform screenshot 2
├── ECE 593 Assignment 1.pdf   # Original assignment specification
└── README.md
```

## ALU Operations

The `ece593_alu` module implements the following operations:

| Operation  | Description          |
|------------|----------------------|
| ADD        | Signed addition      |
| SUB        | Signed subtraction   |
| AND        | Bitwise AND          |
| OR         | Bitwise OR           |
| XOR        | Bitwise XOR          |
| SHL        | Logical shift left   |
| SHR        | Logical shift right  |

## Simulation

```bash
# Compile and simulate with QuestaSim
vlog rtl/ece593_alu.sv tb/ece593_alu_tb.sv
vsim -do "run -all" ece593_alu_tb
```

## Course Information

Portland State University — ECE 593: Advanced Hardware Verification
