--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   01:27:56 03/28/2017
-- Design Name:   
-- Module Name:   C:/Users/sab/Desktop/ACE203Labs/lab3/testfsm.vhd
-- Project Name:  lab3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: FSM
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
 
ENTITY testfsm IS
END testfsm;
 
ARCHITECTURE behavior OF testfsm IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FSM
    PORT(
         Push : IN  std_logic;
         Pop : IN  std_logic;
         Empty : IN  std_logic;
         Full : IN  std_logic;
         Clk : IN  std_logic;
         Rst : IN  std_logic;
         U_D : OUT  std_logic;
         LOAD : OUT  std_logic;
         CounterEn : OUT  std_logic;
         STACK_OVF : OUT  std_logic;
         StackWrite : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Push : std_logic := '0';
   signal Pop : std_logic := '0';
   signal Empty : std_logic := '0';
   signal Full : std_logic := '0';
   signal Clk : std_logic := '0';
   signal Rst : std_logic := '0';

 	--Outputs
   signal U_D : std_logic;
   signal LOAD : std_logic;
   signal CounterEn : std_logic;
   signal STACK_OVF : std_logic;
   signal StackWrite : std_logic;

   -- Clock period definitions
   constant Clk_period : time := 5 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FSM PORT MAP (
          Push => Push,
          Pop => Pop,
          Empty => Empty,
          Full => Full,
          Clk => Clk,
          Rst => Rst,
          U_D => U_D,
          LOAD => LOAD,
          CounterEn => CounterEn,
          STACK_OVF => STACK_OVF,
          StackWrite => StackWrite
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
Rst<='1';
wait for 60 ns;	
Rst<='0';
      Full<='0';
		Push<='1';
      wait for Clk_period;	
		Push<='0';
      wait for Clk_period;
		Push<='1';
      wait for Clk_period;	
		Push<='0';
      wait for Clk_period;
		Push<='1';
      wait for Clk_period;	
		Push<='0';
      wait for Clk_period;
		Push<='1';
      wait for Clk_period;	
		Push<='0';
      wait for Clk_period;
		Push<='1';
      wait for Clk_period;	
		Push<='0';
      wait for Clk_period;
		Push<='1';
      wait for Clk_period;	
		Push<='0';
      wait for Clk_period;
		Push<='1';
      wait for Clk_period;	
		Push<='0';
      wait for Clk_period;
		Push<='1';
      wait for Clk_period;	
		Push<='0';
      wait for Clk_period;
		Push<='1';
      wait for Clk_period;	
		Push<='0';
      wait for Clk_period;
		Push<='1';
      wait for Clk_period;	
		Push<='0';
      wait for Clk_period;
		Push<='1';
      wait for Clk_period;	
		Push<='0';
      wait for Clk_period;
		Push<='1';
      wait for Clk_period;	
		Push<='0';
      wait for Clk_period;
		Push<='1';
      wait for Clk_period;	
		Push<='0';
      wait for Clk_period;
		Push<='1';
      wait for Clk_period;	
		Push<='0';
      wait for Clk_period;
		Push<='1';
      wait for Clk_period;	
		Push<='0';
      wait for Clk_period;
		Push<='1';
      wait for Clk_period;	
		Push<='0';
      wait for Clk_period;
		Push<='1';
      wait for Clk_period;	
		Push<='0';
      wait for Clk_period;
		Push<='1';
      wait for Clk_period;	
		Push<='0';
      wait for Clk_period;
		Push<='1';
      wait for Clk_period;	
		Push<='0';
      wait for Clk_period;
		Push<='1';
      wait for Clk_period;	
		Push<='0';
      wait for Clk_period;
		Push<='1';
      wait for Clk_period;	
		Push<='0';
      wait for Clk_period;
		Push<='1';
      wait for Clk_period;	
		Push<='0';
      wait for Clk_period;
		Push<='1';
      wait for Clk_period;	
		Push<='0';
      wait for Clk_period;
		Push<='1';
      wait for Clk_period;	
		Push<='0';
      wait for Clk_period;
		Push<='1';
      wait for Clk_period;	
		Push<='0';
      wait for Clk_period;
		Push<='1';
      wait for Clk_period;	
		Push<='0';
      wait for Clk_period;
		Push<='1';
      wait for Clk_period;	
		Push<='0';
      wait for Clk_period;
		Push<='1';
      wait for Clk_period;	
		Push<='0';
      wait for Clk_period;
		Push<='1';
      wait for Clk_period;	
		Push<='0';
      wait for Clk_period;
		Push<='1';
      wait for Clk_period;	
		Push<='0';
      wait for Clk_period;
		Push<='1';
      wait for Clk_period;	
		Push<='0';
      wait for Clk_period;
		Push<='1';
      wait for Clk_period;	
		Push<='0';
      wait for Clk_period;
		Push<='1';
      wait for Clk_period;	
		Push<='0';
      wait for Clk_period;
		Push<='1';
      wait for Clk_period;	
		Push<='0';
      wait for Clk_period;
		Push<='1';
      wait for Clk_period;	
		Push<='0';
      wait for Clk_period;
		Push<='1';
      wait for Clk_period;	
		Push<='0';
      wait for Clk_period;
		Push<='1';
      wait for Clk_period;	
		Push<='0';
      wait for Clk_period;
		Push<='1';
      wait for Clk_period;	
		Push<='0';
      wait for Clk_period;
		Push<='1';
      wait for Clk_period;	
		Push<='0';
      wait for Clk_period;
		Push<='1';
      wait for Clk_period;	
		Push<='0';
      wait for Clk_period;
		Push<='1';
      wait for Clk_period;	
		Push<='0';
      wait for Clk_period;
		Push<='1';
      wait for Clk_period;	
		Push<='0';
      wait for Clk_period;
		Push<='1';
      wait for Clk_period;	
		Push<='0';
      wait for Clk_period;
		Push<='1';
      wait for Clk_period;	
		Push<='0';
      wait for Clk_period;
		Push<='1';
      wait for Clk_period;	
		Push<='0';
      wait for Clk_period;
		Push<='1';
      wait for Clk_period;	
		Push<='0';
      wait for Clk_period;
		Push<='1';
      wait for Clk_period;	
		Push<='0';
      wait for Clk_period;
		Push<='1';
      wait for Clk_period;	
		Push<='0';
      wait for Clk_period;
		Push<='1';
      wait for Clk_period;	
		Push<='0';
      wait for Clk_period;
		Push<='1';
      wait for Clk_period;	
		Push<='0';
      wait for Clk_period;
		Push<='1';
      wait for Clk_period;	
		Push<='0';
      wait for Clk_period;
		Push<='1';
      wait for Clk_period;	
		Push<='0';
      wait for Clk_period;
		Push<='1';
      wait for Clk_period;	
		Push<='0';
      wait for Clk_period;
		Push<='1';
      wait for Clk_period;	
		Push<='0';
      wait for Clk_period;
		Push<='1';
      wait for Clk_period;	
		Push<='0';
      wait for Clk_period;
		Push<='1';
      wait for Clk_period;	
		Push<='0';
      wait for Clk_period;
		Push<='1';
      wait for Clk_period;	
		Push<='0';
      wait for Clk_period;
		Push<='1';
      wait for Clk_period;	
		Push<='0';
      wait for Clk_period;
		Push<='1';
      wait for Clk_period;	
		Push<='0';
      wait for Clk_period;
		Push<='1';
      wait for Clk_period;	
		Push<='0';
      wait for Clk_period;
		Push<='1';
      wait for Clk_period;	
		Push<='0';
      wait for Clk_period;
		Push<='1';
      wait for Clk_period;	
		Push<='0';
      wait for Clk_period;
		Push<='1';
      wait for Clk_period;	
		Push<='0';
      wait for Clk_period;
		Push<='1';
      wait for Clk_period;	
		Push<='0';
      wait for Clk_period;
		Push<='1';
      wait for Clk_period;	
		Push<='0';
      wait for Clk_period;
		
		

      -- insert stimulus here 

      wait;
   end process;

END;
