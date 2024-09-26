# PIC Microcontroller Example Projects with C Codes and Proteus Simulation

This repository is a collection of tested example projects using **Microchip’s mid-range PIC16F877A Microcontroller**, programmed in **mikroC** and simulated in **Proteus**. These projects demonstrate various interfaces and external hardware components, providing a hands-on approach to learning embedded systems using the **PIC16F877A**.

## Features:
- **Step-by-step tutorials** covering the fundamentals of PIC16F877A programming.
- Complete **C codes** written in **mikroC**.
- **Proteus simulation files** to visualize and verify circuits.
- Examples include working with external hardware such as:
  - **LEDs**
  - **Seven-segment displays**
  - **LCDs**
  - **Keypads**
  - **Motors** (DC, stepper, etc.)
  - **Sensors** (analog/digital)
##  Keywords: PIC Micro PIC16F877A Proteus PICKIT2  


## Getting Started

### Minimum Knowledge Requirements:
Before diving into the projects, you should have a basic understanding of the following topics:
1. **Binary and Hexadecimal Systems**
2. **Digital Logic**
3. **Basic Electronic Components** (resistors, capacitors, transistors, etc.)
4. **PIC16F877A Architecture**
5. **mikroC Basics**: Familiarity with writing simple programs and compiling in mikroC.

### Recommended Tools:
- **mikroC for PIC** – [Download mikroC IDE](https://www.mikroe.com/mikroc-pic)
- **Proteus Design Suite** – [Download Proteus](https://www.labcenter.com/downloads/)
- **PICKIT2 Programmer** – for uploading the compiled HEX file to your microcontroller.

## mikroC Working Environment

The **mikroC** Integrated Development Environment (IDE) is designed for writing and compiling C code for various PIC microcontrollers. Here is a brief overview of its key features, with corresponding graphics for clarity:

### Key Features:
1. **Code Editor**: Write and manage your C code here.
   ![mikroC Code Editor](graphics/mikroc_code_editor.png)

2. **Project Manager**: Keep track of all your files and projects in the **Project Manager** window.
   ![mikroC Project Manager](graphics/mikroc_project_manager.png)

3. **Compiler**: Click on the "Build" button to compile your code and generate the **HEX file**.
   ![mikroC Compile Button](graphics/mikroc_compile_button.png)

4. **Library Manager**: Access ready-to-use libraries for various peripherals, such as **LCD**, **I2C**, and **UART**, simplifying development.
   ![mikroC Library Manager](graphics/mikroc_library_manager.png)

Once the code is written, the **mikroC compiler** converts it into a **HEX file**, which can be loaded into the PIC microcontroller using the **PICKIT2 Programmer** or simulated in **Proteus**.



##  Proteus Working Environment
Proteus Design Suite is a powerful tool used to simulate circuits and embedded systems. It allows you to test your microcontroller-based designs virtually before implementing them on hardware. Here’s a quick overview of Proteus usage:

Schematic Capture: Design circuits using the Schematic Capture interface.

Component Library: Select components like PIC16F877A, LCD, LEDs, etc., from the vast library of devices.

Microcontroller Simulation: Simulate your PIC16F877A by loading the HEX file generated from mikroC, allowing you to visualize the circuit's behavior.

Virtual Oscilloscope & Debugging Tools: Use Proteus' built-in debugging tools, such as virtual oscilloscopes and logic analyzers, to test and troubleshoot your circuits.

By integrating Proteus in this tutorial series, you’ll be able to:

Design, simulate, and test circuits before physical prototyping.
Visualize how each project functions in real-time without requiring physical hardware upfront.


## PICKIT2 Programmer
In each example, we will use the **PICKIT2 Programmer** to load the compiled HEX file into the PIC16F877A microcontroller. PICKIT2 is a simple and widely-used programmer by Microchip that allows seamless programming and debugging of PIC microcontrollers.

### How to Use PICKIT2:
1. **Connect the PICKIT2** to the PIC16F877A using the ICSP pins (VPP, VDD, GND, PGD, PGC).
2. Open **PICKIT2 Software** on your PC (available for download from Microchip).
3. Select the correct microcontroller (PIC16F877A).
4. Load the HEX file generated from mikroC.
5. Click on **Write** to upload the program to the microcontroller.

Each project will include a brief section explaining the required connections and steps for programming using the PICKIT2 programmer.

## Project Structure
Each project folder contains:
- **Source Code (.c)**
- **Proteus Simulation File (.pdsprj)**
- **Schematic Diagram**
- **Components List**

## Example Projects

### 1. **LED Blinking**
   - **Objective**: Basic LED control using GPIO pins.
   - **Description**: Introduction to microcontroller GPIO and basic delay function.
   - **External Hardware**: LED, resistor.
   - **PICKIT2 Setup**: Connect the programmer to the ICSP pins and upload the HEX file.

   ![LED Circuit](graphics/led_blink.gif)

### 2. **Seven-Segment Display Interfacing**
   - **Objective**: Display digits on a 7-segment display.
   - **Description**: Control single and multiple digits using multiplexing techniques.
   - **External Hardware**: 7-segment display, resistors.
   - **PICKIT2 Setup**: Load the program via PICKIT2 to control the display.

   ![Seven Segment](graphics/seven_segment.gif)

### 3. **LCD Display Interfacing**
   - **Objective**: Display text on a 16x2 LCD.
   - **Description**: Learn how to send commands and data to an LCD module.
   - **External Hardware**: 16x2 LCD, variable resistor for contrast control.
   - **PICKIT2 Setup**: Program the PIC16F877A using PICKIT2 after code compilation.

   ![LCD Interfacing](graphics/lcd_display.gif)

## Theories & References:
Each project includes references to key theoretical concepts:
- **PIC16F877A Datasheet** – [Download here](https://ww1.microchip.com/downloads/en/DeviceDoc/39582b.pdf)
- **MikroC Reference Manual** – [MikroC Docs](https://www.mikroe.com/mikroc-pic)
- **PICKIT2 User Guide** – [Download from Microchip](https://www.microchip.com/downloads/en/DeviceDoc/PICkit_2_User_Guide_51553F.pdf)

### Key Topics Covered:
- **GPIO Pins** – Understanding input/output configurations
- **Timers and Interrupts** – Generating delays, and handling real-time events
- **Analog-to-Digital Conversion (ADC)** – Reading analog sensors
- **PWM** – Pulse Width Modulation for motor control

## Graphics and Styles:
Projects are visually represented with intuitive **circuit diagrams**, **block diagrams**, and **simulation screenshots**, allowing for easy comprehension. The code sections are well-commented and follow a structured format to help beginners and advanced users alike.

Here is a typical code snippet from the LED Blinking project:

```c
void main() {
  TRISB = 0x00; // Set PORTB as output
  while(1) {
    PORTB = 0xFF; // Turn ON LEDs
    Delay_ms(500);
    PORTB = 0x00; // Turn OFF LEDs
    Delay_ms(500);
  }
}
```

## How to Use This Repository:
1. Clone this repository using:
   ```bash
   git clone https://github.com/gmostofabd/PIC-Microcontroller-Projects.git
   ```
2. Open the `.c` code files in **mikroC**.
3. Simulate the provided circuit diagrams using **Proteus**.
4. Use **PICKIT2 Programmer** to load the compiled HEX file to your PIC16F877A microcontroller for hardware implementation.

## License
This repository is licensed under the MIT License – see the [LICENSE](LICENSE) file for details.

##  Social Links:
For more tutorials and content on embedded systems and microcontroller projects, you can follow my work here:

GitHub: gmostofabd GitHub
YouTube: Embedded Systems & IoT Tutorials
LinkedIn: Professional Profile

##  Popular Learning Resources:
Microchip’s PIC Microcontrollers – C Programming Course: Udemy Course
Embedded Systems with PIC Microcontroller: Book Reference
Proteus Simulation for Embedded Systems: Proteus Forum
