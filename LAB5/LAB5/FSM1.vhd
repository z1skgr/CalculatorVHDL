----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:09:26 04/26/2017 
-- Design Name: 
-- Module Name:    FSM1 - Behavioral 
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

entity FSM1 is
    Port ( Clk : in  STD_LOGIC;
           Rst : in  STD_LOGIC;
           ModeEn : in  STD_LOGIC;
           Add : in  STD_LOGIC;
           Sub : in  STD_LOGIC;
           AddOutput : out  STD_LOGIC;
           SubOutput : out  STD_LOGIC);
end FSM1;

architecture Behavioral of FSM1 is
type state is(AddS,SubS,DN);
signal currentS,nextS:state;
signal AddSig, SubSig: STD_LOGIC := '0';
begin
fsm_proc:process(Add,Sub,currentS,nextS,ModeEn)
begin

If(ModeEn = '1') then
case currentS is
	when DN=>	IF(Add='1') then
					nextS<=AddS;
					ELSIF(Sub='1')then
					nextS<=SubS;
					else
					nextS<=DN;
					end if;
	when AddS=> If(Sub = '1') then
					nextS<=SubS;
					else
					nextS <= AddS;
					end if;
					AddSig<='1';
					SubSig<='0';
					
	when SubS=>If(Add = '1') then
					nextS<=AddS;
					else
					nextS <= SubS;
					end if;
					AddSig<='0';
					SubSig<='1';
	when others => nextS<=DN;
					AddSig<='0';
					SubSig<='0';
						
end case;
else
					nextS <= DN;
					AddSig<='0';
					SubSig<='0';
end if;
end process;

AddOutput<= AddSig;
SubOutput<=SubSig;


fsm_sync: PROCESS (Rst, Clk)
BEGIN
	IF (Rst = '1') then 
		currentS <= DN;
	ELSIF (rising_edge(Clk)) then 
		currentS <= nextS; 
	END IF;
END PROCESS;


end Behavioral;

