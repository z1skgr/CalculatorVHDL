----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:34:59 03/22/2017 
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
    Port ( Clock : in  STD_LOGIC;
           D : in  STD_LOGIC;
           Q : out  STD_LOGIC); 
end FlipFlop;

architecture Behavioral of FlipFlop is

Begin
Process
	Begin
		WAIT UNTIL Clock'EVENT AND Clock='1';
		Q<=D;
		END PROCESS;
end Behavioral;

