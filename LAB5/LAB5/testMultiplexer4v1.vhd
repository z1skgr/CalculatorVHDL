--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:43:00 05/16/2017
-- Design Name:   
-- Module Name:   C:/Xilinx/LABS/LAB3/lab3/testMultiplexer4v1.vhd
-- Project Name:  lab3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Multiplexer4v1
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
 
ENTITY testMultiplexer4v1 IS
END testMultiplexer4v1;
 
ARCHITECTURE behavior OF testMultiplexer4v1 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Multiplexer4v1
    PORT(
         Q0 : IN  std_logic_vector(7 downto 0);
         Q1 : IN  std_logic_vector(7 downto 0);
         Q2 : IN  std_logic_vector(7 downto 0);
         Q3 : IN  std_logic_vector(7 downto 0);
         Sign : IN  std_logic_vector(1 downto 0);
         OUTM : out  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Q0 : std_logic_vector(7 downto 0) := (others => '0');
   signal Q1 : std_logic_vector(7 downto 0) := (others => '0');
   signal Q2 : std_logic_vector(7 downto 0) := (others => '0');
   signal Q3 : std_logic_vector(7 downto 0) := (others => '0');
   signal Sign : std_logic_vector(1 downto 0) := (others => '0');
   signal OUTM : std_logic_vector(7 downto 0) := (others => '0');
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Multiplexer4v1 PORT MAP (
          Q0 => Q0,
          Q1 => Q1,
          Q2 => Q2,
          Q3 => Q3,
          Sign => Sign,
          OUTM => OUTM
        );

   -- Clock process definitions
 

   -- Stimulus process
   stim_proc: process
   begin		
      Q0<="00001111";
		Q1<="11110000";
		Sign<="00";
      wait for 100 ns;	
		Sign<="01";
      wait for 100 ns;
		Q2<="11001100";
		Q3<="00110011";
		Sign<="11";
		wait for 100 ns;
		Sign<="10";

      -- insert stimulus here 

      wait;
   end process;

END;
