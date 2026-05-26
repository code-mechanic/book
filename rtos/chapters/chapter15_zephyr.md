\newpage

# Mastering Zephyr RTOS with DeviceTree and Board Bring Up

## Zephyr workspace and toolchain

### Why Zephyr?

|                  | Bare metal                | FreeRTOS                          | Zephyr                                       |
| ---              | ---                       | ---                               | ---                                          |
| **Drivers**      | You write them            | Your code or vendor SDK           | **Built-in ecosystem, unified device model** |
| **Build system** | Your choice               | Project specific, CMake supported | **CMake with west as meta-tool**             |
| **Device Tree**  | No                        | No                                | **Yes**                                      |
| **Subsystems**   | Custom or vendor specific | Optional libraries, vendor stacks | **Built-in: USB, BLE, Net, FS**              |
| **Portability**  | You build the layer       | Broad kernel (40+ archs)          | **Broad board ecosystem (1000+ boards)**     |

### Zephyr RTOS setup for Ubuntu

1. Install [dependencies](https://docs.zephyrproject.org/latest/develop/getting_started/index.html#install-dependencies).

2. Python virtual environment creation.
    - Create Zephyr workspace
    - Run `python3 -m venv .venv`
    - Run `source .venv/Scripts/activate`

3. Install `west`
    - **Official meta-tool** for managing Zephyr projects. It is a Python-based command-line tool developed by the Zephyr Project.
    - Command to install: `pip3 install west`
    - Command to check: `west --version`
    - What it does?
        - **Project management:** Initializes, clones, and manages Zephyr and its modules via `west init`, `west update`
        - **Build system frontend:** Wraps cmake and ninja for building applications (`west build`)
        - **Flashing & debugging:** Supports flashing and debugging binaries to hardware (`west flash`, `west debug`)

4. Get Zephyr and install python build tools.
    - Create project using `west init project_name`
        - Creates the folder **zephyrproject**
        - Inside that folder it creates **.west/** containing a **config** file.
        - Clones the **Zephyr RTOS repository itself**
    - Inside project `west update`
        - Reads and fetches other projects listed in **zephyr/west.yml**
        - vendor HALs (hal_stm32, hal_nordic, hal_espressif, ...)
        - third-party libs (cmsis, mbedtls, open-amp, tinycbor ...)
        - optional stacks and tools (lvgl, mcuboot, acpica, ...)
    - Other utility commands
        - `west manifest --path`
        - `west list`
    - `west zephyr-export`
        - registers the Zephyr source tree as a CMake package, so projects or IDEs, that invoke CMake directly (without `west build`) can locate Zephyr automatically
    - `west packages pip --install`
        - Looks at the list of modules from the manifest (`west.yml`)
        - Checks if they have a `requirements.txt`
        - Installs the required Python packages from each one using `pip`

5. Install Zephyr SDK.
    - To know more about toolchains installed use `west sdk list`
    - For GCC based ARM toolchain for zephyr
        - `west sdk install -t arm-zephyr-eabi`
    - For x86 toolchain for zephyr (used mainly with QEMU)
        - `west sdk install -t x86_64-zephyr-elf`

## Build and run your first Zephyr application

### Build and run hello-world application on QEMU enumator.
- To build use `west build -p always -b <board_name> <application-path>`
    - Example: `west build -b qemu_x86_64 zephyr/samples/hello_world`
- To run use `west build -t run`

### Build and run blinky application on real hardware.
- To build use `west build -b <board_name> <application-path>`
- To flash use `west flash`

### QEMU-supported architectures in Zephyr.

- To list all boards use `west boards`.
- Use `west boards -n "qemu"` to get below list.

| Architecture    | QEMU Board Name | Description                            |
|-----------------|-----------------|----------------------------------------|
| x86             | qemu_x86        | 32-bit x86 (IA-32)                     |
| x86_64          | qemu_x86_64     | 64-bit x86 (long mode)                 |
| ARM Cortex-M3   | qemu_cortex_m3  | Emulates ARMv7-M                       |
| ARM64 (AArch64) | qemu_cortex_a53 | Emulates Cortex-A53 (64-bit ARM cores) |
| RISC-V 32-bit   | qemu_riscv32    | RISC-V RV32IMAC                        |
| RISC-V 64-bit   | qemu_riscv64    | RISC-V RV64GC                          |
| ARC             | qemu_arc_em     | ARC EM processor                       |
| NIOS II         | qemu_nios2      | Soft-core processor by Intel           |
| Xtensa          | qemu_xtensa     | Generic Xtensa simulator               |

## Zephyr application structure and configuration basics

### Application development

What to know before starting application development in Zephyr?

1. [Setup Zephyr](#zephyr-rtos-setup-for-ubuntu) (install dependence, tools)
2. Minimal project (app) structure
3. West basics and workflow
4. Devicetree and overlay basics
5. Kconfig basics
6. Kernel essentials (threads, scheduling, sync primitives)
7. Subsystems (GPIO, UART, I2C, SPI, PWM, etc.)
8. Device model and drivers
9. Logging and diagnostics
10. Board support, runners, and flashing tools

### Creating an Application

In Zephyr, Application can be created using two main ways

1. Using [reference workspace application](https://github.com/zephyrproject-rtos/example-application).
2. Creating an application by hand.

### Understanding important files

- **CMakeLists.txt:** CMake file used to compile the application.
- **VERSION:** Application specific version file.
- **prj.conf:** Used to set or override Kconfig configuration items of application.
    - This file is optional.
    - [Kconfig search](https://docs.zephyrproject.org/latest/kconfig.html) is useful link to look available configuration.
    - `west build -t menuconfig` is a command used to check interactive Kconfig.
- **./build/zephyr/.config:** This is the master configuration file for compilation.
    - This is autogenerated based on other config files.
    - [Kconfig search](https://docs.zephyrproject.org/latest/kconfig.html) is useful link to look available configuration.
- **Kconfig:** Application specific Kconfig file
    - This file is optional.
- **boards/<board>.overlay:** Device tree overlay file

## LED Blinky application

Goal of this application is to build and run a minimal Zephyr program that toggles an on board LED using the GPIO subsystem

- Starts with the LED off
- Toggles the LED on and off in a loop
- Uses a default period of 500 milliseconds
- Prints a simple status message to the console while running

How to approach?

- **Create a custom board port** by adding a new board folder, a DTS from scratch, an optional pin control include, a board YAML file, Kconfig files, and CMakeLists.

- **Enable required on chip peripherals in the DTS**, add a leds node and an aliases section for led0 and the console UART, then build the new board target with west.

- **Write a minimal blinky** that uses the GPIO subsystem. Configure the LED pin and toggle it every 500 milliseconds using `gpio_pin_configure_dt` and `gpio_pin_toggle_dt`.

- **Get device bindings from the devicetree** using `DEVICE_DT_GET` or `device_get_binding`, and verify readiness with `device_is_ready`.

- **Inspect the merged devicetree** with `west build -t devicetree` to confirm that the LED alias maps to the expected pin.

- **Keep the app portable** by using devicetree aliases instead of hard coded pins.

## Source code

Refer [this link](https://github.com/niekiran/mastering-zephyr/tree/main/001_za_led_blinky) for source code.

