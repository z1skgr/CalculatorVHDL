----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:29:44 05/02/2017 
-- Design Name: 
-- Module Name:    Register - Behavioral 
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

entity Reg is
    Port ( Clock : in  STD_LOGIC;
           D : in  STD_LOGIC_VECTOR(7 DOWNTO 0):="00000000";
           Enable : in  STD_LOGIC;
           Q : out  STD_LOGIC_vector(7 downto 0));
end Reg;

architecture Behavioral of Reg is

begin
process(Clock,Enable)
begin
	If rising_edge(Clock) then
		if Enable='1' then
			Q<=D;
		else
			Q<="00000000";
		end if;
	end if;
end process;
	
end Behavioral;

