--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:47:56 04/28/2017
-- Design Name:   
-- Module Name:   C:/Xilinx/LABS/LAB3/lab3/AddFSMTest.vhd
-- Project Name:  lab3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: FSM1
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
 
ENTITY AddFSMTest IS
END AddFSMTest;
 
ARCHITECTURE behavior OF AddFSMTest IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FSM1
    PORT(
         Clk : IN  std_logic;
         Rst : IN  std_logic;
         ModeEn : IN  std_logic;
         Add : IN  std_logic;
         Sub : IN  std_logic;
         AddOutput : OUT  std_logic;
         SubOutput : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Clk : std_logic := '0';
   signal Rst : std_logic := '0';
   signal ModeEn : std_logic := '0';
   signal Add : std_logic := '0';
   signal Sub : std_logic := '0';

 	--Outputs
   signal AddOutput : std_logic;
   signal SubOutput : std_logic;

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FSM1 PORT MAP (
          Clk => Clk,
          Rst => Rst,
          ModeEn => ModeEn,
          Add => Add,
          Sub => Sub,
          AddOutput => AddOutput,
          SubOutput => SubOutput
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
      Rst <= '1';-- hold reset state for 100 ns.
      wait for 100 ns;
			ModeEn<='1';
		Rst <= '0';
		wait for 100 ns;
		Add <= '1';
		wait for 100 ns;
		Add <='0';
		wait for 100 ns;
		Sub <= '1';
		wait for 30 ns;
		Sub <= '0';
		wait for 30 ns;
		Add <= '1';
		wait;

   

      -- insert stimulus here 

      wait;
   end process;

END;
