--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:04:24 02/25/2017
-- Design Name:   
-- Module Name:   C:/Xilinx/LABS/lab1_2/test1_2.vhd
-- Project Name:  lab1_2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Full_Adder
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
 
ENTITY test1_2 IS
END test1_2;
 
ARCHITECTURE behavior OF test1_2 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Full_Adder
    PORT(
         IN0 : IN  std_logic;
         IN1 : IN  std_logic;
         IN2 : IN  std_logic;
         LED : OUT  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal IN0 : std_logic := '0';
   signal IN1 : std_logic := '0';
   signal IN2 : std_logic := '0';

 	--Outputs
   signal LED : std_logic_vector(1 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
  -- constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Full_Adder PORT MAP (
          IN0 => IN0,
          IN1 => IN1,
          IN2 => IN2,
          LED => LED
        );

   -- Clock process definitions
 --  <clock>_process :process
   --begin
	--	<clock> <= '0';
		--wait for <clock>_period/2;
		--<clock> <= '1';
		--wait for <clock>_period/2;
   --end process;
 

   -- Stimulus process
   stim_proc: process
   begin	
	
      -- hold reset state for 100 ns.
		
		IN0<='0';
		IN1<='0';
		IN2<='0';
      wait for 100 ns;
		
		IN0<='0';
		IN1<='1';
		IN2<='1';
      wait for 100 ns;
		
		IN0<='1';
		IN1<='1';
		IN2<='0';
		
      wait for 100 ns;
		
		IN0<='1';
		IN1<='1';
		IN2<='1';
      wait for 100 ns;	
		

--      wait for <clock>_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
