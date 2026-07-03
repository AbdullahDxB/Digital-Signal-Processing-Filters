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
* **FIR Filter (Direct Form):** Standard 4-tap implementation for baseline comparison.
* **Pipelined FIR Filter:** A 4-stage pipeline design to improve throughput and maximum operating frequency.
* **IIR Filter (Direct Form I):** Recursive implementation demonstrating feedback mechanisms.
* **Retimed IIR Filter:** Optimized design using register retiming to enhance critical path timing.

## 📊 Performance Comparison Highlights

| Architecture | Critical Path Delay | Max Frequency |
| :--- | :--- | :--- |
| **Normal FIR** | 8.52 ns | 117.37 MHz |
| **Pipelined FIR** | 5.824 ns | 171.70 MHz |
| **Normal IIR** | 6.255 ns | 159.87 MHz |
| **Retimed IIR** | 4.615 ns | 216.68 MHz |

## 🛠️ Tools Used
* **Synthesis & Implementation:** Xilinx Vivado 2025.1
* **Hardware Target:** Basys 3 FPGA Board (Xilinx Artix-7 XC7A35T)
* **Verification:** HDL Simulation (Impulse Response Analysis)

---
*For full mathematical derivations, timing summaries, and power analysis, please refer to the [Report.pdf](./Report.pdf).*
