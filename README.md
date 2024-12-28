# ⚙️ Simulation of Dynamic Systems Project

## 📖 Overview
This repository contains two assignments completed as part of the Simulation and Modeling of Dynamic Systems course at Aristotle University of Thessaloniki. The assignments focus on the application of simulation techniques to analyze and estimate parameters in dynamic systems using MATLAB.

---

## 🧩 Assignment 1: Mass-Spring-Damper System Parameter Estimation

### 🎯 Goals
- Estimate the unknown parameters of a mass-spring-damper system using the **Least Squares Method**.
- Simulate the system’s response to an external force and compare actual vs. estimated outputs.

### ✨ Features
- **System Description**:
  - A second-order differential equation representing the dynamics of the mass-spring-damper system.
  - Parameters: Mass (`m`), Damping Coefficient (`b`), Spring Constant (`k`).
- **Parameter Estimation**:
  - Conversion to a linearly parameterized form.
  - Use of a Laplace transform and filtering techniques to simplify equations.
  - Application of the Least Squares Method to compute parameter estimates.
- **Simulation**:
  - System response simulated for `u(t) = 15 sin(3t) + 8`.
  - Visualization of estimated vs. actual outputs and error analysis.

### 🏆 Results
- **Parameter Accuracy**:
  - Accurate parameter estimation within the expected range of errors.
- **Output Alignment**:
  - Estimated system output closely matches the actual output, with minimal error.

---

## 🔌 Assignment 2: Electrical Circuit System Identification

### 🎯 Goals
- Analyze and simulate a multi-component electrical circuit to determine its transfer functions.
- Evaluate the impact of random noise and artificial errors on parameter estimation.

### ✨ Features
- **Circuit Description**:
  - Components: Inductor (`L`), Capacitor (`C`), Resistor (`R`).
  - Governing differential equations derived from Kirchhoff's laws.
- **Transfer Function Estimation**:
  - Use of Laplace transforms and filtering techniques.
  - Derivation of transfer functions for voltage responses (`Vc` and `Vr`).
  - Application of the Least Squares Method for parameter estimation.
- **Simulation**:
  - Noise-injected simulations to evaluate the robustness of estimation methods.
  - Visualizations of voltage estimates (`Vc` and `Vr`) with and without artificial noise.

### 🏆 Results
- **Accurate Transfer Functions**:
  - Reliable estimation of `Vc` and `Vr` in noise-free conditions.
- **Impact of Noise**:
  - Noise introduced discrepancies in parameter estimates but overall trends remained intact.

---

## 📂 Repository Contents
- **Assignment Reports**:
  - [📄 Assignment 1 Report](./Simulation_of_Dynamic_System_project_1.pdf)
  - [📄 Assignment 2 Report](./Simulation_of_Dynamic_System_project_2.pdf)
- **Code**: MATLAB scripts for system modeling, parameter estimation, and simulations.

---


Thank you for exploring this project! 🚀 Feel free to raise issues or contribute to improve the repository. 😊
