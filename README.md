<h1 align="center">Digital Signal Processing Filters on FPGA</h1>

<p align="center">
  <b>Implementation and Performance Analysis of FIR and IIR Architectures</b>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Verilog-005288?style=for-the-badge&logo=verilog&logoColor=white" alt="Verilog"/>
  <img src="https://img.shields.io/badge/FPGA-Artix_7-purple?style=for-the-badge&logo=xilinx&logoColor=white" alt="Xilinx Artix-7"/>
  <img src="https://img.shields.io/badge/Vivado-DSP-orange?style=for-the-badge&logo=amd&logoColor=white" alt="Vivado"/>
</p>

---

## 🚀 Project Overview
This repository contains the Verilog HDL implementation and FPGA performance analysis of various digital filter architectures, conducted as part of the **VLSI Signal Processing** course at MNNIT Allahabad. 

## 🏗️ Architectures Implemented
* [cite_start]**FIR Filter (Direct Form):** Standard 4-tap implementation for baseline comparison[cite: 2619].
* [cite_start]**Pipelined FIR Filter:** A 4-stage pipeline design to improve throughput and maximum operating frequency[cite: 3033, 3041].
* [cite_start]**IIR Filter (Direct Form I):** Recursive implementation demonstrating feedback mechanisms[cite: 3477, 3487].
* [cite_start]**Retimed IIR Filter:** Optimized design using register retiming to enhance critical path timing[cite: 3895].

## 📊 Performance Comparison Highlights

| Architecture | Critical Path Delay | Max Frequency |
| :--- | :--- | :--- |
| **Normal FIR** | [cite_start]8.52 ns [cite: 2743] | [cite_start]117.37 MHz [cite: 2745] |
| **Pipelined FIR** | [cite_start]5.824 ns [cite: 3169] | [cite_start]171.70 MHz [cite: 3171] |
| **Normal IIR** | [cite_start]6.255 ns [cite: 3594] | [cite_start]159.87 MHz [cite: 3598] |
| **Retimed IIR** | [cite_start]4.615 ns [cite: 3981] | [cite_start]216.68 MHz [cite: 3983] |

## 🛠️ Tools Used
* **Synthesis & Implementation:** Xilinx Vivado 2025.1
* [cite_start]**Hardware Target:** Basys 3 FPGA Board (Xilinx Artix-7 XC7A35T) [cite: 2717, 3574]
* [cite_start]**Verification:** HDL Simulation (Impulse Response Analysis) [cite: 2701, 3556]

---
*For full mathematical derivations, timing summaries, and power analysis, please refer to the [Report.pdf](./Report.pdf).*
