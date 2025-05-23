# Verilog RAM Modules

This repository contains Verilog implementations of both **Single-Port RAM** and **Dual-Port RAM** modules, each with synchronous reset functionality. These modules are suitable for FPGA/ASIC design and educational purposes.

## Files

- `Single_port_RAM.v`  
  Implements a single-port RAM with synchronous reset. Supports one read/write port.

- `Dual_port_RAM.v`  
  Implements a dual-port RAM with independent read/write ports and synchronous reset. Supports simultaneous access from two ports.

## Module Descriptions

### Single-Port RAM

- **Ports:**
  - `clk` : Clock input
  - `address` : 10-bit address input (1024 locations)
  - `write` : Write enable signal
  - `data_in` : 8-bit data input
  - `reset` : Synchronous reset
  - `data_out` : 8-bit data output

- **Features:**
  - Synchronous read and write operations
  - Synchronous reset clears memory and output

### Dual-Port RAM

- **Ports:**
  - `clk` : Clock input
  - `addr_a`, `addr_b` : 10-bit address inputs for ports A and B
  - `data_in_a`, `data_in_b` : 8-bit data inputs for ports A and B
  - `w_a`, `w_b` : Write enable signals for ports A and B
  - `reset` : Synchronous reset
  - `data_out_a`, `data_out_b` : 8-bit data outputs for ports A and B

- **Features:**
  - Independent read/write access for both ports
  - Synchronous reset clears memory and outputs
  - Prevents simultaneous writes to the same address

## Usage

1. Clone the repository.
2. Add the `.v` files to your Verilog project.
3. Instantiate the desired module in your top-level design.

## License

This project is open source. You may use, modify, and distribute it as you wish.

## Author

Nikhil

---
Feel free to contribute or raise issues!
