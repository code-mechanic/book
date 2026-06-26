\newpage

# Zephyr RTOS in Practice: Build Scalable Embedded Application

## Introduction

### What is Zephyr?

- A scalable, open-source RTOS for embedded systems.
- Supports microcontrollers, IoT devices, wearables, and edge systems.
- Backed by a large industry consortium through the Linux Foundation.
- Actively used in real-world commercial products.


|                  | Bare metal                | FreeRTOS                          | Zephyr                                       |
| ---              | ---                       | ---                               | ---                                          |
| **Drivers**      | You write them            | Your code or vendor SDK           | **Built-in ecosystem, unified device model** |
| **Build system** | Your choice               | Project specific, CMake supported | **CMake with west as meta-tool**             |
| **Device Tree**  | No                        | No                                | **Yes**                                      |
| **Subsystems**   | Custom or vendor specific | Optional libraries, vendor stacks | **Built-in: USB, BLE, Net, FS**              |
| **Portability**  | You build the layer       | Broad kernel (40+ archs)          | **Broad board ecosystem (1000+ boards)**     |


>  A modern, industry-backed RTOS for real-world IoT products.

### Where Zephyr Comes From?

- Born from the merger of two RTOS projects: Rocket RTOS and Wind River’s Microkernel.
- Adopted by the Linux Foundation in 2016.
- Designed as a modern alternative to legacy RTOS systems with stronger security, modularity, and tooling.

| Year  | Event                              |
| ----- | ---------------------------------- |
| 2001  | Wind River microkernel introduced  |
| 2015  | Rocket RTOS open-sourced           |
| 2016  | Zephyr adopted by Linux Foundation |
| 2019  | Major modularity improvements      |
| 2021+ | Rapid ecosystem growth             |

>  A modern, unified RTOS built to replace fragmented legacy systems.

### Zephyr's Key Characteristics

- Highly modular kernel (choose only what your application needs).
- Memory-safe design with strong security primitives.
- Unified device driver model with devicetree support.
- Multi-architecture: ARM, RISC-V, Xtensa, x86, ARC, MIPS.
- First-class networking: BLE, Wi‑Fi, Ethernet, Thread, Matter.

>  A scalable, secure RTOS platform with unified APIs and rich networking.

### Why You Should Learn Zephyr

- Industry demand for engineers who understand modern RTOS design.
- Works across many chips and vendors, so your skills transfer easily.
- Excellent documentation, CI-tested code, and long-term stability.
- Powerful abstraction layers reduce vendor lock-in.
- Ideal for commercial IoT products that require security + maintainability.

>  Zephyr gives you portable, in-demand skills for modern IoT products.

### Zephyr from the Arduino Perspective

- Arduino is easy to use and ideal for beginners, but not designed for complex RTOS tasks.
- Arduino “sketches” run a single, long loop with limited concurrency.
- Peripheral handling is simplified, but lacks structured device drivers found in Zephyr.
- Memory management is minimal, making larger systems harder to scale safely.
- No built-in RTOS features like threads, scheduling, IPC, or power-aware execution.
- Zephyr offers a professional-grade environment while still supporting many Arduino-class MCUs.

>  Arduino is great for quick prototyping; Zephyr offers structure.

### Why Arduino Users Should Learn Zephyr

- Move from single-loop programs to real multitasking.
- Learn industry-standard device driver models.
- Gain experience with networking stacks like Wi‑Fi, BLE, Thread, and Matter.
- Understand how commercial IoT firmware is structured.

>  Zephyr upgrades your skills to industry-level embedded engineering.

### Zephyr Architecture Overview

- Modular RTOS built around a small, efficient microkernel.
- Hardware abstraction through drivers and devicetree.
- Subsystems for networking, sensors, storage, Bluetooth, power management, and more.
- Clear separation between kernel, drivers, and user application code.

![Zephyr Architecture Overview](rtos/diagrams/zephyr_architecture_overview.png){ width=75% }

>  Zephyr layers a small kernel with selectable modular services.

### How Zephyr Projects Are Structured

- Standard layout: `src/`, `prj.conf`, `CMakeLists.txt`, and optional Devicetree overlays.
- `prj.conf` controls compile-time configuration through Kconfig.
- Devicetree overlays describe hardware, buses, and device connections.
- Build system uses CMake and `west` to generate the final executable.  

![Zephyr Project Structure](rtos/diagrams/zephyr_project_structure.png){ width=75% }

>  Zephyr projects have clear app directories plus shared modules.

### An Introduction to Kconfig / prj.conf

- `prj.conf` sets Kconfig symbols that shape features, drivers, and build options.
- Kconfig enforces dependencies and provides defaults for each board and module.
- Overlay configs (e.g., `boards/*.conf`) fine-tune per-board tweaks.

>  Kconfig is Zephyr’s feature control system for your app.

### An Introduction to Devicetree

- Devicetree describes what hardware exists and how it is connected.
- Board and SoC definitions live in `.dts` and `.dtsi` files.
- Applications customize hardware using Devicetree overlays.
- Zephyr generates headers and macros from Devicetree at build time.

![Devicetree](rtos/diagrams/zephyr_devicetree.png){ width=75% }

> In Zephyr the devicetree is the single source of truth for your hardware.

### West Fundamentals

![Zephyr build process: Command to Firmware](rtos/diagrams/zephyr_build_process.png)

![West Runners](rtos/diagrams/west_runners.png){ width=75% }

### Zephyr logging

- Zephyr logging provides leveled logs (error to debug) with deferred processing.
- Backends include RTT (Real-Time Transfer), UART, and others. We can choose per board and bandwidth needs.
- Configure levels and formatting via `CONFIG_LOG_*` options in `prj.conf`.

![Zephyr logging](rtos/diagrams/zephyr_logging.png){ width=75% }

## Examples

### Blinky