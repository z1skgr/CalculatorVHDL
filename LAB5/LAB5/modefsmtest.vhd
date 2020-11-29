--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:51:43 04/27/2017
-- Design Name:   
-- Module Name:   C:/Xilinx/LABS/LAB3/lab3/modefsmtest.vhd
-- Project Name:  lab3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ModeFsm
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
 
ENTITY modefsmtest IS
END modefsmtest;
 
ARCHITECTURE behavior OF modefsmtest IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ModeFsm
    PORT(
         Clock : IN  std_logic;
         Reset : IN  std_logic;
         ModeSignal : IN  std_logic;
         Mode0En : OUT  std_logic;
         Mode1En : OUT  std_logic;
         Mode2En : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Clock : std_logic := '0';
   signal Reset : std_logic := '0';
   signal ModeSignal : std_logic := '0';

 	--Outputs
   signal Mode0En : std_logic;
   signal Mode1En : std_logic;
   signal Mode2En : std_logic;

   -- Clock period definitions
   constant Clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ModeFsm PORT MAP (
          Clock => Clock,
          Reset => Reset,
          ModeSignal => ModeSignal,
          Mode0En => Mode0En,
          Mode1En => Mode1En,
          Mode2En => Mode2En
        );

   -- Clock process definitions
   Clock_process :process
   begin
		Clock <= '0';
		wait for Clock_period/2;
		Clock <= '1';
		wait for Clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      Reset<='1';
		wait for 100 ns;
		Reset<='0';
		ModeSignal<='1';
		wait for 100 ns;
		ModeSignal<='0';
		wait for 100 ns;
		ModeSignal<='1';
      wait for 100 ns;
		ModeSignal<='0';
		wait for 100 ns;
		ModeSignal<='1';
      wait for 100 ns;
		ModeSignal<='0';
		wait for 100 ns;
		ModeSignal<='1';
      wait for 100 ns;	
      -- insert stimulus here 

      wait;
   end process;

END;
