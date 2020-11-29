--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:17:36 03/28/2017
-- Design Name:   
-- Module Name:   C:/Users/sab/Desktop/ACE203Labs/lab3/testSSD.vhd
-- Project Name:  lab3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: SSDController
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
 
ENTITY testSSD IS
END testSSD;
 
ARCHITECTURE behavior OF testSSD IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SSDController
    PORT(
         Clk : IN  std_logic;
         Rst : IN  std_logic;
         Empty : IN  std_logic;
         Full : IN  std_logic;
         Stack_OVF : IN  std_logic;
			A:in std_logic;
			S:in std_logic;
			U:in std_logic;
			SWAP:in std_logic;
			Mode0:in std_logic;
			Mode1:in std_logic;
			Mode2:in std_logic;
         ANcontrol : OUT  std_logic_vector(3 downto 0);
         SSControl : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Clk : std_logic := '0';
   signal Rst : std_logic := '0';
   signal Empty : std_logic := '0';
   signal Full : std_logic := '0';
   signal Stack_OVF : std_logic := '0';
	signal A:std_logic:='0';
	signal S:std_logic:='0';
	signal U:std_logic:='0';
	signal SWAP:std_logic:='0';
	signal Mode0:std_logic:='0';
	signal Mode1:std_logic:='0';
	signal Mode2:std_logic:='0';
	

 	--Outputs
   signal ANcontrol : std_logic_vector(3 downto 0);
   signal SSControl : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SSDController PORT MAP (
          Clk => Clk,
          Rst => Rst,
          Empty => Empty,
          Full => Full,
          Stack_OVF => Stack_OVF,
			 A=>A,
			 S=>S,
			 U=>U,
			 SWAP=>SWAP,
			 Mode0=>Mode0,
			 Mode1=>Mode1,
			 Mode2=>Mode2,
          ANcontrol => ANcontrol,
          SSControl => SSControl
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
      wait for 100 ns;
		Rst<='0';
		Mode0<='1';
		Empty<='1';
		wait for 100 ns;
		Empty<= '0';
		Full <= '1';
		wait for 100 ns;
		Full<='0';
		Stack_OVF<='1';
		wait for 100 ns;
		Stack_OVF<='0';
		Mode0<='0';
		Mode1<='1';
		wait for 100 ns;
		A<='1';
		wait for 100 ns;
		A<='0';
		S<='1';
		wait for 100 ns;
		S<='0';
		Mode1<='0';
		Mode2<='1';
		wait for 100 ns;
		SWAP<='1';
		WAIT FOR 100 NS;
		SWAP<='0';
		U<='1';
	  -- insert stimulus here 

      wait;
   end process;

END;
