--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   02:32:42 05/12/2017
-- Design Name:   
-- Module Name:   C:/Xilinx/LABS/LAB3/lab3/testASFsm.vhd
-- Project Name:  lab3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ASFsm
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
 
ENTITY testASFsm IS
END testASFsm;
 
ARCHITECTURE behavior OF testASFsm IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ASFsm
    PORT(
         Clk : IN  std_logic;
         Rst : IN  std_logic;
         A_Signal : IN  std_logic;
         S_Signal : IN  std_logic;
         PushEn : OUT  std_logic;
         PopEn : OUT  std_logic;
         AddSubAction : OUT  std_logic;
         Reg0Act : OUT  std_logic;
         Reg1Act : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Clk : std_logic := '0';
   signal Rst : std_logic := '0';
   signal A_Signal : std_logic := '0';
   signal S_Signal : std_logic := '0';

 	--Outputs
   signal PushEn : std_logic;
   signal PopEn : std_logic;
   signal AddSubAction : std_logic;
   signal Reg0Act : std_logic;
   signal Reg1Act : std_logic;

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ASFsm PORT MAP (
          Clk => Clk,
          Rst => Rst,
          A_Signal => A_Signal,
          S_Signal => S_Signal,
          PushEn => PushEn,
          PopEn => PopEn,
          AddSubAction => AddSubAction,
          Reg0Act => Reg0Act,
          Reg1Act => Reg1Act
        );

   -- Clock process definitions
   Clk_process :process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
     A_Signal<='1';
	  
      wait for 100 ns;	
		A_Signal<='0';
		S_Signal<='1';
      -- insert stimulus here 

      wait;
   end process;

END;
