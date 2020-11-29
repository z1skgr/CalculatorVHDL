# Advanced Design
 VHDL


# LABS <br />
1)Familiarity with design description and hierarchical design. <br />
      Simple Circuit and Half Adder.<br />
2)Extended familiarity with VHDL. <br />
	4 Bit CLA and FSM. <br />
3)Creating post-increment,pre-decrement stack. <br />
	Push/Pop  operations. <br />
4)Recognition of operations for calculator design. <br />
	Illustration of actions of calculator. <br />
5)Complete Calculator Design. <br />
	Connection of all internal design. <br />

The full Design of the implementation is shown in block diagram stack.vsdx. The internal implementations can be viewed in the other diagrams inside every lab.<br />

Test Benches for specific interior designs for tests.

SinglePulseGenerator.vhd is used for appplying simulation on FPGA. It is used for applying pulse in FPGA's buttons.

The other .vhd files are created from scratch.

Stack is created through Xilinx Core Generator with depth 32 positions and width 8 bits

# How to Run
Import project in Xilinx or create new project and import files.
Xilix Version 13.0. Simulations can be viewed over ISIM. For simulation run Behavioural Check.