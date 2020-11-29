----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:13:45 03/27/2017 
-- Design Name: 
-- Module Name:    SSDFSM - Behavioral 
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

entity SSDFSM is
    Port ( Clk : in  STD_LOGIC;
           Rst : in  STD_LOGIC;
			  En  : in Std_logic;
			  State_output : out  STD_LOGIC_VECTOR (3 downto 0));
end SSDFSM;

architecture Behavioral of SSDFSM is
type state is(A,B,C,D);
signal currentS,nextS:state;
begin

fsm_com:process(currentS,En,nextS)
begin

case currentS is
	when A=> if En='1' then nextS<=B;
				else nextS<=A;
				end if;
	
	
	when B=> if En='1' then nextS<=C;
				else nextS<=B;
				end if;
	
	
	when C=> if En='1' then nextS<=D;
				else nextS<=C;
				end if;
	
	when D=> if En='1' then nextS<=A;
				else nextS<=D;
				end if;
	when others=>nextS<=A;
end case;
end process;

with currentS SELECT
State_output <="0111" when A,
					"1011" when B,
					"1101" when C,
					"1110" when D,
					"1111" when others;

fsm_synch:process(Clk,Rst)
begin
if(Rst='1') then currentS<=A;
elsif(rising_edge(Clk)) then currentS<=nextS;
end if;
end process;

end Behavioral;

