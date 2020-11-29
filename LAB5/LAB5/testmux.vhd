--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:51:43 03/27/2017
-- Design Name:   
-- Module Name:   C:/Users/sab/Desktop/ACE203Labs/lab3/testmux.vhd
-- Project Name:  lab3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MUX4v1
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY testmux IS
END testmux;
 
ARCHITECTURE behavior OF testmux IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MUX4v1
    PORT(
         Q0 : IN  std_logic;
         Q1 : IN  std_logic;
         Q2 : IN  std_logic;
         Q3 : IN  std_logic;
         Sign0 : IN  std_logic;
         Sign1 : IN  std_logic;
         OUTM : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Q0 : std_logic := '0';
   signal Q1 : std_logic := '0';
   signal Q2 : std_logic := '0';
   signal Q3 : std_logic := '0';
   signal Sign0 : std_logic := '0';
   signal Sign1 : std_logic := '0';

 	--Outputs
   signal OUTM : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MUX4v1 PORT MAP (
          Q0 => Q0,
          Q1 => Q1,
          Q2 => Q2,
          Q3 => Q3,
          Sign0 => Sign0,
          Sign1 => Sign1,
          OUTM => OUTM
        );

   
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		
		Q0<='0';
		Q1<='0';
		Q2<='1';
		Q3<='0';
		Sign0<='1';
		Sign1<='0';
		wait for 100 ns;
		
		Q0<='0';
		Q1<='0';
		Q2<='1';
		Q3<='0';
		Sign0<='0';
		Sign1<='1';
		wait for 100 ns;
		
		Q0<='0';
		Q1<='0';
		Q2<='0';
		Q3<='1';
		Sign0<='1';
		Sign1<='1';
		wait for 100 ns;
		
		Q0<='1';
		Q1<='0';
		Q2<='0';
		Q3<='0';
		Sign0<='0';
		Sign1<='1';
		wait for 100 ns;

      -- insert stimulus here 

      wait;
   end process;

END;
