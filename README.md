# SCRAMBLER

# 🔄 8-bit Scrambler in Verilog (LFSR-Based)

This project implements an **8-bit scrambler** in Verilog using a **Linear Feedback Shift Register (LFSR)**. The scrambler adds randomness to input data to reduce patterns or repetitive sequences — often useful in data transmission to avoid long strings of 1s or 0s.

---

## 📘 What is a Scrambler?

A **scrambler** is a digital logic circuit that modifies input data using a pseudo-random sequence (LFSR). It helps:
- Improve signal integrity in serial communication
- Reduce DC bias
- Maintain clock synchronization by ensuring transitions

---

## 📦 Project Contents

| File               | Description                                   |
|--------------------|-----------------------------------------------|
| `scrambler.v`      | Verilog module for scrambler logic using LFSR |
| `tb_scrambler.v`   | Testbench to simulate scrambler functionality |

---

## 🔁 Scrambler Logic Overview

- Uses an **8-bit LFSR** initialized to `8'b11000101`
- Taps at bits 6 and 3: `feedback = lfsr[6] ^ lfsr[3]`
- The scrambled output is `scrambler_out = din ^ lfsr`

### FSM States:

| State       | Description                              |
|-------------|------------------------------------------|
| `DATA`      | Latches the input data                   |
| `LFSR`      | Updates the LFSR with XOR feedback logic |
| `SCRAMBLER` | Performs the XOR between input and LFSR  |
| `IDLE`      | Indicates processing success             |

---

## 🧪 Testbench Behavior

- Input: `din = 8'b10101001`
- Clock toggles every 15ns
- Simulation runs for 10,000 ns

```verilog
initial begin
  din = 8'b10101001;
  #10000;
  $finish;
end
