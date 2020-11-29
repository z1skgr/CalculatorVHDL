--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:57:51 03/28/2017
-- Design Name:   
-- Module Name:   C:/Users/sab/Desktop/ACE203Labs/lab3/testTop.vhd
-- Project Name:  lab3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Top
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
 
ENTITY testTop IS
END testTop;
 
ARCHITECTURE behavior OF testTop IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Top
    PORT(
         BTN1 : IN  std_logic;
         BTN2 : IN  std_logic;
         Mode : IN  std_logic;
         Reset : IN  std_logic;
         Clock : IN  std_logic;
         NUMIN : IN  std_logic_vector(7 downto 0);
         NUMOUT : OUT  std_logic_vector(7 downto 0);
         SSD_EN : OUT  std_logic_vector(3 downto 0);
         SSD : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal BTN1 : std_logic := '0';
   signal BTN2 : std_logic := '0';
   signal Mode : std_logic := '0';
   signal Reset : std_logic := '0';
   signal Clock : std_logic := '0';
   signal NUMIN : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal NUMOUT : std_logic_vector(7 downto 0);
   signal SSD_EN : std_logic_vector(3 downto 0);
   signal SSD : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant Clock_period : time := 6 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Top PORT MAP (
          BTN1 => BTN1,
          BTN2 => BTN2,
          Mode => Mode,
          Reset => Reset,
          Clock => Clock,
          NUMIN => NUMIN,
          NUMOUT => NUMOUT,
          SSD_EN => SSD_EN,
          SSD => SSD
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
     Reset <= '1';-- hold reset state for 100 ns.
	  wait for 20 ns;
	  BTN1<='1';
	  NUMIN<="11100100";
   		Reset<='0';
			wait for 80 ns;
			BTN1<='0';
			WAIT FOR 80 NS;
		BTN1<='1';
		NUMIN<="01111000";
		wait for 80 ns;
		BTN1<='0';
		wait for 80 ns;
		BTN1<='1';
		NUMIN<="01111001";

		wait for 80 ns;
		BTN1<='0';
		Mode<='1';
		wait for 80 ns;
		BTN2<='0';
		Mode<='0';
		wait for 80 ns;
		BTN2<='0';
		Mode<='1';
		wait for 80 ns;
		BTN2<='1';
		Mode<='0';
		wait for 80 ns;
		BTN1<='0';
		Mode<='1';
		BTN2<='0';
		WAIT FOR 80 NS;
		BTN2<='1';
		wait for 100 ns;
		BTN2<='0';
		WAIT FOR 80 NS;
		BTN2<='1';
		wait for 10 ns;
		BTN2<='0';
		

		

		
			
		
		
     
      wait;
   end process;

END;
