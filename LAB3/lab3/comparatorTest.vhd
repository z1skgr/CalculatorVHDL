--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   03:29:20 03/29/2017
-- Design Name:   
-- Module Name:   C:/Users/sab/Desktop/ACE203Labs/lab3/comparatorTest.vhd
-- Project Name:  lab3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Comparator_Equality
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
 
ENTITY comparatorTest IS
END comparatorTest;
 
ARCHITECTURE behavior OF comparatorTest IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Comparator_Equality
    PORT(
         B1 : IN  std_logic_vector(4 downto 0);
         B2 : IN  std_logic_vector(4 downto 0);
         Y1 : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal B1 : std_logic_vector(4 downto 0) := (others => '0');
   signal B2 : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal Y1 : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Comparator_Equality PORT MAP (
          B1 => B1,
          B2 => B2,
          Y1 => Y1
        );

   

   -- Stimulus process
   stim_proc: process
   begin		
      B1 <= "00000";
		B2 <= "00000";
      wait for 100 ns;	
		B1 <= "11111";
		B2 <= "11111";
      wait for 100 ns;
		B1 <= "00100";
		B2 <= "00000";
      wait for 100 ns;

     

      -- insert stimulus here 

      wait;
   end process;

END;
