----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:39:58 05/12/2017 
-- Design Name: 
-- Module Name:    ASFsm - Behavioral 
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

entity ASFsm is
    Port ( Clk : in  STD_LOGIC;
           Rst : in  STD_LOGIC;
           A_Signal : in  STD_LOGIC;
           S_Signal : in  STD_LOGIC;
           AS_PushEn : out  STD_LOGIC;
           AS_PopEn : out  STD_LOGIC;
			  AddSubAction:out std_logic;
			  AddOrSubSignal:out std_logic;
			  FSM0En:out std_logic;
           Reg0Act : out  STD_LOGIC;
			  Reg2Act: out std_logic;
			  Reg1Act : out  STD_LOGIC);
end ASFsm;

architecture Behavioral of ASFsm is
Type state is (DN0,outElem,outElemp,writeR0,writeR1,writeSt,waitS,DN1);
signal currentS, nextS: state;
begin
fsm_comp0: process (A_Signal,S_Signal,currentS,nextS)
begin
IF(A_Signal = '1') THEN	
		AddSubAction<='0';
		FSM0En<='1';
		 AddOrSubSignal<='1';
elsif	S_Signal='1' then
		AddSubAction<='1';
		FSM0En<='1';
		AddOrSubSignal<='1';
else
		AddSubAction<='0';
		FSM0En<='0';
		AddOrSubSignal<='0';
end if;
if(A_Signal='1' or S_Signal='1') then
		case(currentS) is
			when DN0 => nextS<=outElem;
			when outElem=>nextS<=writeR0;
			when writeR0=>nextS<=outElemp;
			when outElemp=>nextS<=writeR1;
			when writeR1=>nextS<=waitS;
			when waitS=>nextS<=writeSt;
			when writeSt=>nextS<=DN1;
			when DN1=>nextS<=DN1;
			when others => nextS <= DN0;
		end case;
end if;
END PROCESS;


With (currentS) select
	AS_PushEn<='1' when writeSt,
					
					'0' when others;
			 
With (currentS) select
	AS_PopEn<='1' when outElem,
				'1' when outElemp,
				'0' when others;
				

With (currentS) select
	Reg0Act<=
				'1' WHEN outElem,
				'1' when writeR0,
				'1' when outElemp,
				'0' when others;
				    
with currentS select
	Reg1Act<='1'  when waitS,
				'1' when writeR1,
				'0' when others;
				
with currentS select
	Reg2Act<='1' when writeSt,
				'0' when others;


fsm_sync: process(Clk, Rst)
BEGIN
	IF (Rst = '1') then 
		currentS <= DN0;
	ELSIF (rising_edge(Clk)) then 
		currentS <= nextS; 
	END IF;
END PROCESS;


end Behavioral;

