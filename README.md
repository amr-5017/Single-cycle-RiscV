# Single-Cycle RISC-V Processor

This repository contains the complete implementation of a single-cycle RISC-V processor supporting the RV32IM instruction set.

---

## Features

-   Full support for **RV32I** and **RV32M** instruction sets.
-   Single-cycle architecture for straightforward design and understanding.
-   Open-source project with **no license required** for usage.

---

## RTL Design

You can view the detailed RTL design of the RV32IM core in the following document:
RTL of RV32IM ["(https://github.com/amr-5017/Single-cycle-RiscV/blob/main/RTL_RV32IM.pdf)"]

---

## Feature Status

| Feature      | Completion Status | Testing Status |
| ------------ | ----------------- | -------------- |
| R-type       | ✅                | ❌             |
| I-type       | ✅                | ❌             |
| S-type       | ✅                | ❌             |
| B-type       | ✅                | ❌             |
| J-type       | ✅                | ❌             |
| U-type       | ✅                | ❌             |
| M-type       | ✅                | ❌             |
| Pipeline     | ❌                | ❌             |

---

## Usage and Implementation Notes

1.  Feel free to use, modify, and integrate this code into your projects without restrictions. Contributions and feedback are always welcome!
2.  The uploaded RISC-V card here is the reference used to design the micro-architecture.
3.  The `Program.data` and `memory.data` files contain the values for the instruction and data memory, respectively.
4.  **Important Note:** The provided code for memories and registers is written **combinationally**. This is done purely for the sake of behavioral simulation and is **not the actual sequential hardware implementation**.
 
---

### Contributions

We encourage contributions to improve and expand this project. If you have suggestions, issues, or code enhancements, feel free to open a pull request or issue.

---

### License

This project is open source and provided without any specific licensing requirements.
