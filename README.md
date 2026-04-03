# Divider

## 4-bit Divider (Verilog)

This project implements a **basic 4-bit binary divider** using the **restoring division algorithm**. It divides a 4-bit dividend by a 4-bit divisor and produces both **quotient** and **remainder**.

---

## Working Principle

The division is performed using the **restoring division method**:

* The dividend is processed **bit-by-bit (MSB to LSB)**
* At each step:

  * The partial remainder is **shifted left**
  * The divisor is **subtracted**
* If subtraction is successful (**no borrow**):

  * Quotient bit = 1
  * Keep the result
* If subtraction fails (**borrow occurs**):

  * Quotient bit = 0
  * Restore the previous value
* The final partial remainder becomes the **remainder**

---

## Module Description

### `divider`

* Top-level module for 4-bit division
* Implements **restoring division algorithm**
* Performs iterative subtract-and-restore operations
* Outputs both quotient and remainder

---

### `add_sub`

* Performs **addition and subtraction**
* Controlled using `ctrl` signal:

  * `0` → Addition
  * `1` → Subtraction
* Used internally for divisor subtraction

---

## Inputs & Outputs

| Signal | Width | Description      |
| ------ | ----- | ---------------- |
| A      | 4-bit | Dividend         |
| B      | 4-bit | Divisor          |
| Q      | 4-bit | Quotient output  |
| R      | 4-bit | Remainder output |

---

## Key Concepts Used

* Binary Division
* Restoring Division Algorithm
* Shift-and-Subtract Method
* Combinational Logic Design
* Conditional Restoration

---

## Special Case Handling

* If **divisor = 0**:

  * Quotient is set to `0000`
  * Prevents undefined division behavior

---

## Applications

* Arithmetic Logic Units (ALU)
* Digital Signal Processing
* FPGA-based Arithmetic Systems
* Embedded Systems
* Computer Architecture Design

