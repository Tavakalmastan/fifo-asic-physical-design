# FIFO ASIC Physical Design using Cadence Innovus

## 📌 Overview

This project demonstrates the complete Physical Design (PD) flow of a FIFO (First-In First-Out) design using Cadence Innovus.

---

## 🔧 Tools Used

* Cadence Innovus
* Verilog HDL
* TCL scripting

---

## 🚀 Physical Design Flow

1. Floorplanning
2. Power Planning
3. Placement
4. Clock Tree Synthesis (CTS)
5. Routing
6. Timing Analysis

---

## 📸 Design Snapshots

### Floorplan

![Floorplan](screenshots/floorplan.png)

### Placement

![Placement](screenshots/placement.png)

### CTS

![CTS](screenshots/cts.png)

### Routing

![Routing](screenshots/routing.png)

### Final Layout

![Final](screenshots/final_layout.png)

---

## 📊 Results

| Parameter                | Value                               |
| ------------------------ | ----------------------------------- |
| Setup Slack (Post-CTS)   | +0.069 ns                           |
| Setup Slack (Post-Route) | -0.032 ns                           |
| Status                   | Minor violation (due to parasitics) |

---

## ⚠️ Observations

* Timing met after CTS
* Slight setup violation after routing due to interconnect parasitics
* Can be fixed using post-route optimization

---

## 📁 Project Structure

* `rtl/` → Verilog design
* `scripts/` → TCL scripts
* `reports/` → Timing, power, area reports
* `screenshots/` → Design visuals

---

## 🎯 Conclusion

Successfully implemented full ASIC Physical Design flow for FIFO.
Demonstrated understanding of CTS, routing, and timing closure challenges.

---

## 👨‍💻 Author

Tavakalmastan
