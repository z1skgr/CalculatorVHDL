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
 
ENTITY testFSMmode0 IS
END testFSMmode0;
 
ARCHITECTURE behavior OF testFSMmode0 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FSMmode0
    PORT(
         Push : IN  std_logic;
         Pop : IN  std_logic;
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
   signal Push : std_logic := '0';
   signal Pop : std_logic := '0';
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
   uut: FSMmode0 PORT MAP (
          Push => Push,
          Pop => Pop,
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
      wait for 50 ns;	
		Reset <= '0';-- hold reset state for 100 ns.
		wait for 50 ns;
		Push<='1';
		NUMIN<="00000001";
		wait for 50 ns;
		Push<='0';
		wait for 50 ns;
		Push<='1';
		NUMIN<="00000010";
		wait for 50 ns;
		Push<='0';
		wait for 50 ns;
		Push<='1';
		NUMIN<="00000011";
		wait for 50 ns;
		Push<='0';
		wait for 50 ns;
		Push<='1';
		NUMIN<="00101010";
		Wait for 50 ns;
		Push<='0';
		Wait for 100 ns;
		Reset<='1';
		Wait for 25 ns;
		Reset<='0';
		Wait for 25 ns;
		
		
		

		
			
		
		
		
     
      wait;
   end process;

END;
