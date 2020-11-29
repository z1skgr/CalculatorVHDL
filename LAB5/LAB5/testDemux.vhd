--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   02:13:52 05/10/2017
-- Design Name:   
-- Module Name:   C:/Xilinx/LABS/LAB3/lab3/testDemux.vhd
-- Project Name:  lab3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Demux2v1
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
 
ENTITY testDemux IS
END testDemux;
 
ARCHITECTURE behavior OF testDemux IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Demux2v1
    PORT(
         Input : IN  std_logic_vector(7 downto 0);
         Sign : IN  std_logic;
         Op0 : OUT  std_logic_vector(7 downto 0);
         Op1 : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Input : std_logic_vector(7 downto 0) := (others => '0');
   signal Sign : std_logic := '0';

 	--Outputs
   signal Op0 : std_logic_vector(7 downto 0);
   signal Op1 : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Demux2v1 PORT MAP (
          Input => Input,
          Sign => Sign,
          Op0 => Op0,
          Op1 => Op1
        );

   -- Clock process definitions
 

   -- Stimulus process
   stim_proc: process
   begin		
		Sign<='1';
		Input<="00001111";
      wait for 100 ns;
		Sign<='0';
		Input<="00001111";
      wait for 100 ns;
		Sign<='1';
		Input<="00111111";
      wait for 100 ns;			
		Sign<='0';
		Input<="00000000";
		



      wait;
   end process;

END;
