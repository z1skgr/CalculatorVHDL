----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:31:44 03/28/2017 
-- Design Name: 
-- Module Name:    Coder - Behavioral 
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

entity Coder is
    Port ( Input : in  STD_LOGIC_VECTOR (3 downto 0);
           Output : out  STD_LOGIC_VECTOR (1 downto 0));
end Coder;

architecture Behavioral of Coder is
begin

coder : process(Input)

begin
	IF(Input = "1110") THEN Output <= "00";
	ELSIF(Input = "1101") THEN Output <= "01";
	ELSIF(Input = "1011") THEN Output <= "10";
	ELSIF(Input = "0111") THEN Output <= "11";
	ELSE Output <= "00";
	END IF;
end process;

end Behavioral;

