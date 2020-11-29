----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    04:22:42 05/13/2017 
-- Design Name: 
-- Module Name:    SwapFSM - Behavioral 
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

entity SwapFSM is
    Port ( Clk : in  STD_LOGIC;
           Rst : in  STD_LOGIC;
           S_Signal : in  STD_LOGIC;
			  S_PushEn : out  STD_LOGIC;
           S_PopEn : out  STD_LOGIC;
			  
			  FSM0En:out std_logic;
           Reg0Output : out  STD_LOGIC;
           Reg1Output : out  STD_LOGIC);
end SwapFSM;

architecture Behavioral of SwapFSM is
type state is(DN0,outElem,writeR0,outElemp,writeR1,waitS1,waitS2,writeSt1,writeSt2,DN1);
signal currentS, nextS: state;
begin

fsm_comb:process(S_Signal,currentS,nextS)
begin
if S_Signal='1' then
	 FSM0En<='1';
else FSM0En<='0';
End If;
if S_Signal='1' then
case currentS is
			when DN0 => nextS<=outElem;
			when outElem=>nextS<=writeR0;
			when writeR0=>nextS<=outElemp;
			when outElemp=>nextS<=writeR1;
			when writeR1=>nextS<=waitS1;
			when waitS1=>nextS<=writeSt1;
			when writeSt1=>nextS<=waitS2;
			when waitS2=>nextS<=writeSt2;
			when writeSt2=>nextS<=DN1;
			when DN1=>nextS<=DN1;
			when others=>nextS<=DN1;
end case;
end if;
end process;

with currentS select
	S_PushEn<='1' when writeSt1,
				'1' WHEN writeSt2,
				'0' when others;

			 
With (currentS) select
	S_PopEn <= '1' when outElem,
				'1' when outElemp,
				'0' when others;
				
With (currentS) select
	Reg0Output<='1' when outElem,
					'1' when writeR0,
					'1' when outElemp,
					'1' when waitS2,
					'1' when writeSt2,
					'0' when others;

with currentS select
	Reg1Output<='1' when writeR1,
					'1' when waitS1,
					'1' when writeSt1,
					'0' when others;



fsm_sync: PROCESS (Rst, Clk)
BEGIN
	IF (Rst = '1') then 
		currentS <= DN0;
	ELSIF (rising_edge(Clk)) then 
		currentS <= nextS; 
	END IF;
END PROCESS;
end Behavioral;

