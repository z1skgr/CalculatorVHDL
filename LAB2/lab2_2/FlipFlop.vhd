----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:29:51 03/07/2017 
-- Design Name: 
-- Module Name:    FlipFlop - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FlipFlop is
    Port ( D : in  STD_LOGIC;
           Clock : in  STD_LOGIC;
			  Reset : in STD_LOGIC;
           Q : out  STD_LOGIC);
end FlipFlop;

architecture Behavioral of FlipFlop is

begin
	PROCESS
	BEGIN
		WAIT UNTIL Clock'EVENT AND CLOCK='1';
		IF RESET='0' THEN Q<='0';
		ELSE					Q<=D;
		END IF;
		END PROCESS;
		
end Behavioral;

