# 🚀 FIFO ASIC Physical Design using Cadence Innovus

## 📌 Overview

This project demonstrates the complete **ASIC Physical Design (PD) flow** of a synchronous FIFO using **Cadence Innovus**.
It covers all stages from netlist import to final routing and timing closure analysis.

The goal is to understand real-world PD challenges such as **clock tree design, timing closure, power optimization, and routing effects**.

---

## 🔧 Tools & Technologies

* **Cadence Innovus** – Physical Design Implementation
* **Verilog HDL** – RTL Design
* **TCL Scripting** – Flow automation
* **MMMC (Multi-Mode Multi-Corner)** – Timing analysis

---

## 🚀 Physical Design Flow

1. **Floorplanning**

   * Core utilization and aspect ratio setup
   * IO placement and row generation

2. **Power Planning**

   * Power rings and stripes creation
   * VDD/VSS connectivity

3. **Placement**

   * Standard cell placement
   * Optimization for congestion and timing

4. **Clock Tree Synthesis (CTS)**

   * Clock buffering and balancing
   * Skew and latency control

5. **Routing**

   * Global and detailed routing
   * RC parasitic extraction

6. **Timing & Power Analysis**

   * Setup and Hold checks
   * Power estimation and breakdown

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

![Final Layout](screenshots/final_layout.png)

---

## 📊 Final Results & Analysis

### ⏱ Timing Summary

* **Post-CTS Setup Slack:** +0.069 ns ✅ (Met)
* **Post-CTS Hold Slack:** -0.046 ns ❌ (Expected violation)
* **Post-Route Setup Slack:** -0.032 ns ⚠️ (Minor violation ~32 ps)

> The small setup violation after routing is due to interconnect parasitics and can be fixed using post-route optimization.

---

### ⚡ Power Analysis

* **Total Power:** 0.3496 mW

  * Internal: 74.8%
  * Switching: 25.0%
  * Leakage: ~0%

* **Clock Network Power:** ~38.95%

> Clock network dominates power consumption, which is typical in synchronous digital designs.

---

### 📐 Area Summary

* **Total Cells:** 634
* **Total Area:** 1852.27 µm²

---

## 🔍 Key Insights

* Hold violations after CTS are **expected** due to fast data paths
* Routing introduces **parasitic delays**, impacting setup timing
* Clock network consumes a **significant portion of power**
* Design demonstrates **real ASIC challenges like timing closure and optimization**

---

## 📁 Project Structure

```bash
fifo-asic-physical-design/
│── rtl/            # Verilog design
│── scripts/        # TCL scripts for PD flow
│── inputs/         # Netlist, constraints
│── outputs/        # Generated design files
│── reports/        # Timing, power, area reports
│── screenshots/    # Design snapshots
```

---

## 🎯 Conclusion

Successfully implemented a complete **ASIC Physical Design flow** for a FIFO design.
The project highlights real-world PD challenges such as:

* Timing closure (setup & hold)
* Clock tree optimization
* Power distribution
* Routing impact on performance

This project reflects **industry-level PD understanding** and practical tool experience.

---

## 👨‍💻 Author

**Tavakalmastan**

---

## ⭐ If you found this useful

Give this repo a ⭐ and connect with me!
