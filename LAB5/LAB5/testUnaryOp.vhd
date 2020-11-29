--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:35:08 05/09/2017
-- Design Name:   
-- Module Name:   C:/Xilinx/LABS/LAB3/lab3/testUnaryOp.vhd
-- Project Name:  lab3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: UnaryOp
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
 
ENTITY testUnaryOp IS
END testUnaryOp;
 
ARCHITECTURE behavior OF testUnaryOp IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT UnaryOp
    PORT(
         NIn : IN  std_logic_vector(7 downto 0);
         NOut : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal NIn : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal NOut : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: UnaryOp PORT MAP (
          NIn => NIn,
          NOut => NOut
        );


 

   -- Stimulus process
   stim_proc: process
   begin		
       NIn<="00000001";
      wait for 100 ns;	
		 NIn<="00000011";
      wait for 100 ns;
		 NIn<="00000111";
      wait for 100 ns;
		 NIn<="00001001";
      wait for 100 ns;
		 NIn<="00000000";


      wait;
   end process;

END;
