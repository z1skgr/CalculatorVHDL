--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:32:51 05/09/2017
-- Design Name:   
-- Module Name:   C:/Xilinx/LABS/LAB3/lab3/testCLA.vhd
-- Project Name:  lab3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: CLA8BIT
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
 
ENTITY testCLA IS
END testCLA;
 
ARCHITECTURE behavior OF testCLA IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CLA8BIT
    PORT(
         A : IN  std_logic_vector(7 downto 0);
         B : IN  std_logic_vector(7 downto 0);
         M : IN  std_logic;
         Result : OUT  std_logic_vector(7 downto 0);
         Cout : OUT  std_logic;
         V : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(7 downto 0) := (others => '0');
   signal B : std_logic_vector(7 downto 0) := (others => '0');
   signal M : std_logic := '0';

 	--Outputs
   signal Result : std_logic_vector(7 downto 0);
   signal Cout : std_logic;
   signal V : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
  
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CLA8BIT PORT MAP (
          A => A,
          B => B,
          M => M,
          Result => Result,
          Cout => Cout,
          V => V
        );

   -- Clock process definitions
  
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		A<="00000001";
		B<="00000001";
		M<='0';
		wait for 100 ns;
		A<="00000001";
		B<="00000001";
		M<='1';
		wait for 100 ns;
		A<="00000011";
		B<="00000001";
		M<='1';
		wait for 100 ns;
		A<="00000011";
		B<="00000001";
		M<='0';
		wait for 100 ns;
		A<="01111000";
		B<="01111001";
		M<='0';
		wait for 100 ns;
		A<="11111101";
		B<="10000001";
		M<='0';
		wait for 100 ns;
   

      -- insert stimulus here 

      wait;
   end process;

END;
