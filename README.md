# RISC-V MYTH Workshop: RV32I Core

Lab submissions by **Abdulrahman AlAhmed** for the RISC-V based *Microprocessor for You in Thirty Hours* (MYTH) workshop.

This repo holds a pipelined RV32I CPU core written in TL-Verilog for [Makerchip](https://myth.makerchip.com). Its test program adds 1 to 9, stores the result in memory, and loads 45 into `x17`.

## Files

| Path                              | Contents                                          |
| --------------------------------- | ------------------------------------------------- |
| `Images`                          | screenshots                                       |
| `Day3_5/calculator_solutions.tlv` | Final calculator (slide 43)                       |
| `Day3_5/risc-v_solutions.tlv`     | Final RISC-V core (slide 53)                      |
| `labs/intro/`                     | Day 3 intro labs                                  |
| `labs/calculator/`                | Each calculator lab, including the slide 49 bonus |
| `labs/risc-v/`                    | Each RISC-V lab, in slide order                   |

File names use the slide numbers from the workshop PDFs. The commit history adds one lab at a time.

## Run a lab

1. Open [myth.makerchip.com](https://myth.makerchip.com).
2. Paste in a `.tlv` file.
3. Compile, then check the log, waveform and diagram.

The final RISC-V core reports a pass in the log when `x17` equals 45.

## Core summary

- 4-stage pipeline with fetch and decode, register read, execute, and memory stages
- RV32I instructions, except FENCE, ECALL and EBREAK
- All loads and stores work as whole words, as the workshop slides specify
- Register bypass, plus invalid cycles after taken branches, loads and jumps

## Credits

- Workshop and starter code: [stevehoover/RISC-V_MYTH_Workshop](https://github.com/stevehoover/RISC-V_MYTH_Workshop)
- Workshop providers: [Redwood EDA](https://www.redwoodeda.com/), with training partners [VLSI System Design](https://www.vlsisystemdesign.com/) and [The EEView](https://theeeview.com)
