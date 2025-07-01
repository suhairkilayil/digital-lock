# Digital Lock using Verilog HDL

This project implements a **pattern-based digital lock** using a **non-overlapping Moore finite state machine (FSM)** in **Verilog HDL**. The system detects the binary sequence `"1101"` to activate an unlock signal. It is fully simulated and verified using **Xilinx Vivado**.

---

## 🔐 Features

- Moore FSM with 6 states: IDLE, S1, S11, S110, S1101, UNLOCK
- Detects a secure pattern ("1101") in serial input
- Outputs an unlock signal when the correct pattern is received
- Asynchronous reset support
- Simulated with a complete testbench

---

## 📁 Project Structure

```
digital-lock/
├── code/
│   ├── digital_lock.v       # Main FSM module
│   └── digital_lock_tb.v    # Testbench module
├── docs/
│   └── digital_lock_project_report.pdf
├── LICENSE
├── README.md
└── .gitignore
```

---

## 🧰 Tools Used

- Verilog HDL
- Xilinx Vivado (for simulation)
- GTKWave (optional for waveform viewing)

---

## 📄 Project Report

📥 [Download Full Report (PDF)](docs/digital_lock_project_report.pdf)

---

## 👨‍💻 Contributors

- Padmapriya J 
- Suhair K 

  ECE| NSS College of Engineering,palakkad
---

## 📄 License

This project is licensed under the [MIT License](LICENSE).  
Feel free to use or modify with attribution.
