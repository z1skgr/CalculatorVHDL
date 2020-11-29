--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:01:53 03/13/2017
-- Design Name:   
-- Module Name:   C:/Users/sab/Desktop/ACE203Labs/lab2/lab2_2/testFSM.vhd
-- Project Name:  lab2_2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: TopFsm
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
 
ENTITY testFSM IS
END testFSM;
 
ARCHITECTURE behavior OF testFSM IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT TopFsm
    PORT(
         RST : IN  std_logic;
         CLK : IN  std_logic;
         IN0 : IN  std_logic;
         IN1 : IN  std_logic;
         IN2 : IN  std_logic;
         LED : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    
	 constant CLK_period : time := 10 ns;
	 signal stopClk:boolean;

   --Inputs
   signal RST : std_logic := '0';
   signal CLK : std_logic := '0';
   signal IN0 : std_logic := '0';
   signal IN1 : std_logic := '0';
   signal IN2 : std_logic := '0';

 	--Outputs
   signal LED : std_logic_vector(7 downto 0);

   -- Clock period definitions
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: TopFsm PORT MAP (
          RST => RST,
          CLK => CLK,
          IN0 => IN0,
          IN1 => IN1,
          IN2 => IN2,
          LED => LED
        );

   -- Clock process definitions
   CLK_process :process
   begin
		while not stopClk loop
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
		end loop;
		wait;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin

      -- hold reset state for 100 ns	
		rst <= '1';
		wait for 20 ns;
		rst <= '0';
		wait for 20 ns;
		
		IN1<='1';
		IN2<='0';
		IN0<='0';
      wait for CLK_period*5;
		IN1<='0';
		IN2<='1';
		IN0<='0';
      wait for CLK_period*5;
		IN1<='1';
		IN2<='0';
		IN0<='0';
      wait for CLK_period*5;
      IN1<='0';
		IN2<='0';
		IN0<='1';
      wait for CLK_period*5;
		IN1<='0';
		IN2<='0';
		IN0<='0';
      wait for CLK_period*5;
		stopClk<=true;
      wait;
   end process;

END;
