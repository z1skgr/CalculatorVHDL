--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:59:02 03/28/2017
-- Design Name:   
-- Module Name:   C:/Users/sab/Desktop/ACE203Labs/lab3/testDecoder.vhd
-- Project Name:  lab3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Decoder
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
 
ENTITY testDecoder IS
END testDecoder;
 
ARCHITECTURE behavior OF testDecoder IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Decoder
    PORT(
         E : IN  std_logic;
         F : IN  std_logic;
         OV : IN  std_logic;
         segmentLED : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal E : std_logic := '0';
   signal F : std_logic := '0';
   signal OV : std_logic := '0';

 	--Outputs
   signal segmentLED : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Decoder PORT MAP (
          E => E,
          F => F,
          OV => OV,
          segmentLED => segmentLED
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
		E<= '0';
		F<='0';
		OV<='1';
      wait for 100 ns;	
		E<= '1';
		F<='0';
		OV<='0';
      wait for 100 ns;	
		E<= '0';
		F<='1';
		OV<='0';
      wait for 100 ns;	
		E<= '0';
		F<='0';
		OV<='1';
      wait for 100 ns;	
		E<= '0';
		F<='1';
		OV<='0';
      wait for 100 ns;	
      wait;
   end process;

END;
