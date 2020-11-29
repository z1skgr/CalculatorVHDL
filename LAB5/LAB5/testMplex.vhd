--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:11:14 05/11/2017
-- Design Name:   
-- Module Name:   C:/Xilinx/LABS/LAB3/lab3/testMplex.vhd
-- Project Name:  lab3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Mplex2v1
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
 
ENTITY testMplex IS
END testMplex;
 
ARCHITECTURE behavior OF testMplex IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Mplex2v1
    PORT(
         Q0 : IN  std_logic_vector(4 downto 0);
         Q1 : IN  std_logic_vector(4 downto 0);
         Sign : IN  std_logic;
         OUTM : OUT  std_logic_vector(4 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Q0 : std_logic_vector(4 downto 0) := (others => '0');
   signal Q1 : std_logic_vector(4 downto 0) := (others => '0');
   signal Sign : std_logic := '0';

 	--Outputs
   signal OUTM : std_logic_vector(4 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Mplex2v1 PORT MAP (
          Q0 => Q0,
          Q1 => Q1,
          Sign => Sign,
          OUTM => OUTM
        );

   -- Clock process definitions
 

   -- Stimulus process
   stim_proc: process
   begin		
      Q0<="11111";
		Q1<="00000";
		Sign<='0';
      wait for 100 ns;
		
Q0<="11111";
		Q1<="00000";
		Sign<='1';
		WAIT FOR 100 NS;
     

      wait;
   end process;

END;
