----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:27:18 05/13/2017 
-- Design Name: 
-- Module Name:    UFsm - Behavioral 
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

entity UFsm is
    Port ( Clock : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           U_Signal : in  STD_LOGIC;
           U_PopEn : out  STD_LOGIC;
           U_PushEn : out  STD_LOGIC;
			  FSM0En:out std_logic;
           Reg0Out : out  STD_LOGIC);
end UFsm;

architecture Behavioral of UFsm is
type state is(DN0,outElem,writeR0,waitS,writeSt,DN1);
signal currentS, nextS: state;
begin

fsm_comp2: process (U_Signal,currentS,nextS)
begin
If U_Signal='1' then
	 FSM0En<='1';
ELSE FSM0En<='0';
END IF;
If(U_Signal='1') then
case currentS is
when DN0=>nextS<=outElem;
when outElem=>nextS<=writeR0;
when writeR0=>nextS<=waitS;
when waitS=>nextS<=writeSt;
when writeSt=>nextS<=DN1;
when DN1=>nextS<=DN1;
when others=>nextS<=DN0;

			
end case;

end if;
end process;


With (currentS) select
	U_PushEn <= '1' when writeSt,
					'0' when others;
				 
With (currentS) select
	Reg0Out <= 	'1' when outElem,
					'1' when writeR0,
					'1' when waitS,
					'1' when writeSt,
					'0' when others;
					
					
With (currentS) select
	U_PopEn <= '1' when outElem,
					'0' when others;

fsm_sync: process(Clock, Reset)
BEGIN
	IF (Reset = '1') then 
		currentS <= DN0;
	ELSIF (rising_edge(Clock)) then 
		currentS <= nextS; 
	END IF;
END PROCESS;

end Behavioral;

