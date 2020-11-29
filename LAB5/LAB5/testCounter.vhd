--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:18:09 03/24/2017
-- Design Name:   
-- Module Name:   C:/Users/sab/Desktop/ACE203Labs/lab3/testCounter.vhd
-- Project Name:  lab3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: COUNTER
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
 
ENTITY testCounter IS
END testCounter;
 
ARCHITECTURE behavior OF testCounter IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT COUNTER
    PORT(
         En : IN  std_logic;
         input : IN  std_logic_vector(4 downto 0);
         output : OUT  std_logic_vector(4 downto 0);
         Clock : IN  std_logic;
         Load : IN  std_logic;
         U_D : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal En : std_logic := '0';
   signal input : std_logic_vector(4 downto 0) := (others => '0');
   signal Clock : std_logic := '0';
   signal Load : std_logic := '0';
   signal U_D : std_logic := '0';

 	--Outputs
   signal output : std_logic_vector(4 downto 0);

   -- Clock period definitions
   constant Clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: COUNTER PORT MAP (
          En => En,
          input => input,
          output => output,
          Clock => Clock,
          Load => Load,
          U_D => U_D
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
		
      
		 En<='1';-- hold reset state for 100 ns.
		U_D<='0';
		
		input<="00000";
		
		
      wait for 100 ns;	
		Load<='1';
		
		wait for 100 ns;
		
		
      -- insert stimulus here 

      wait;
   end process;

END;
