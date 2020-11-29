----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:18:36 04/26/2017 
-- Design Name: 
-- Module Name:    ModeFsm - Behavioral 
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

entity ModeFsm is
    Port ( Clock : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           ModeSignal : in  STD_LOGIC;
           Mode0En : out  STD_LOGIC;
           Mode1En : out  STD_LOGIC;
           Mode2En : out  STD_LOGIC);
end ModeFsm;

architecture Behavioral of ModeFsm is
type state is(mode0,mode1,mode2);
signal currentS,nextS:state;
begin

fsm_mode:process(currentS,ModeSignal,nextS)
begin
case currentS is
when mode0=> if ModeSignal='1' then
					nextS<=mode1;
				 else
					nextS<=mode0;
				end if;
when mode1=> if ModeSignal='1' then
					nextS<=mode2;
				else
					nextS<=mode1;
					end if;
when mode2=> if ModeSignal='1' then
					nextS<=mode0;
				 else nextS<=mode2;
					end if;
when others=> nextS<=mode0;

end case;
end process;

with currentS Select
Mode0En<='1' when mode0,
			'0' when others;
			
with currentS Select
Mode1En<='1' when mode1,
			'0' when others;

with currentS Select
Mode2En<='1' when mode2,
			'0' when others;
			
fsm_sync:process(Reset,Clock)
Begin
if(Reset='1') then
	currentS<=mode0;
elsif(rising_edge(Clock)) then
	currentS<=nextS;
end if;
end process;
end Behavioral;

