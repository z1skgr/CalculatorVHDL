# Advanced Design
> Calculator design using  VHDL

 ## Table of contents
* [Labs](#labs)
   * [1](#half-adder-design)
   * [2](#bit-cla-and-fsm)
   * [3](#post-increment-pre-decrement-stack)
   * [4](#operations-for-calculator-design)
   * [5](#full-calculator) 
* [How to run](#how-to-run)
* [Acknowledgments](#acknowledgments)

## Half Adder design
### Circuit
| Name |  In/Out  |  Width  | Board |
| ------- | --- | --- | --- |
| IN0 | IN | 1 | SW0 |
| IN1 | IN | 1 | SW1 |
| BTN0 | IN | 1 | BTN0 |
| BTN1 | IN | 1 | BTN1 |
| BTN2 | IN | 1 | BTN2 |
| BTN3 | IN | 1 | BTN3|
| LED | OUT | 8 | LD0 - LD7 |

LED[0] <= IN0 AND IN1 AND BTN0
LED[1] <= IN0 XOR IN1 AND BTN1
LED[2] <= IN0 NOR IN1 AND BTN2
LED[3] <= NOT IN0 AND BTN3
LED[4] <= IN0
LED[5] <= IN1

### FA
#### HA
| Name |  In/Out  |  Width  | Board |
| ------- | --- | --- | --- |
| IN0 | IN | 1 | SW0 |
| IN1 | IN | 1 | SW1 |
| IN2 | IN | 1 | SW2 |
| LED | OUT | 2 | LD0 - LD1 |

[HA](https://github.com/z1skgr/Advanced-Design/issues/2#issue-1164229190)
[FA]()

## Bit CLA and FSM
## Post increment Pre decrement Stack
## Operations for calculator design.
## Full Calculator







## How to Run
### For Simulation
1. Import project to workspace suite
2. Behavioral Check Syntax/Simulate Behavioral Model to .vdl
3. Simulate Behavioral Model on Test Bench

### For Synthesis (.vhd)
1. Find Synthesize from ```Processes``` tab
2. Follow Implement Design steps
3. Download load file
4. UCF file for board link
5. Configure Target Device

### For Core Generation (.xco)
1. New Source->IP(CORE Generator)
2. Memories & Storage Elements -> RAMs & ROMs -> Block Memory Generator
3. Single Port RAM Memory Type
4. Implementation View-> View HDL Functional Model for source code


## Acknowledgments
Projects were created for the requirements of the lesson Advanced Logic Design

[^1]: Stack is build from Xilinx Core Generator. Depth 32 positions, Width 8 bits
[^2]: SinglePulseGenerator.vhd is used for simulation on FPGA. Pulse in FPGA's buttons.
[^3]: Test Benches for interior designs for testing.
[^4]: Full Design in block diagram stack.vsdx. 
[^5]: Internal implementations in the other diagrams inside every lab.








