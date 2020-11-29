--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:53:10 03/28/2017
-- Design Name:   
-- Module Name:   C:/Users/sab/Desktop/ACE203Labs/lab3/testMux32.vhd
-- Project Name:  lab3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MUX32x8
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
 
ENTITY testMux32 IS
END testMux32;
 
ARCHITECTURE behavior OF testMux32 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MUX32x8
    PORT(
         INPUT : IN  std_logic_vector(31 downto 0);
         control : IN  std_logic_vector(1 downto 0);
         OUTPUT : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal INPUT : std_logic_vector(31 downto 0) := (others => '0');
   signal control : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal OUTPUT : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MUX32x8 PORT MAP (
          INPUT => INPUT,
          control => control,
          OUTPUT => OUTPUT
        );

   -- Clock process definitions
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      	
		INPUT <= "00000000111111110000000011111111";
		control <= "00";
		wait for 100 ns;
		INPUT <= "00000000111111110000000011111111";
		control <= "01";
		wait for 100 ns;
		INPUT <= "00000000111111110000000011111111";
		control <= "10";
		wait for 100 ns;	
		INPUT <= "00000000111111110000000011111111";
		control <= "11";
		wait for 100 ns;		
      -- insert stimulus here 

      wait;
   end process;

END;
