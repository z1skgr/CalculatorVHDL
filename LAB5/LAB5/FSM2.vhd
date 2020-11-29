----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:10:07 04/26/2017 
-- Design Name: 
-- Module Name:    FSM2 - Behavioral 
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

entity FSM2 is
    Port ( Clk : in  STD_LOGIC;
           Rst : in  STD_LOGIC;
           ModeEn : in  STD_LOGIC;
           UnarySub : in  STD_LOGIC;
           Swap : in  STD_LOGIC;
           UnarySubOutput : out  STD_LOGIC;
           SwapOutput : out  STD_LOGIC);
end FSM2;

architecture Behavioral of FSM2 is
type state is(UnarySubS,SwapS,DN);
signal currentS,nextS:state;
signal UnarySubSig, SwapSig: STD_LOGIC := '0';
begin
fsm_proc:process(UnarySub,Swap,currentS,nextS,ModeEn)
begin
If(ModeEn = '1') then
case currentS is
	when DN=>	IF(UnarySub='1') then
					nextS<=UnarySubS;
					ELSIF(Swap='1')then
					nextS<=SwapS;
					else
					nextS<=DN;
					end if;
	when UnarySubS=> If(Swap = '1') then
					nextS<=SwapS;
					else
					nextS <= UnarySubS;
					end if;
					UnarySubSig<='1';
					SwapSig<='0';
	when SwapS=>If(UnarySub = '1') then
					nextS<=UnarySubS;
					else
					nextS <= SwapS;
					end if;
					UnarySubSig<='0';
					SwapSig<='1';
	when others => nextS<=DN;
					UnarySubSig<='0';
					SwapSig<='0';
						
end case;
else
					nextS <= DN;
					UnarySubSig<='0';
					SwapSig<='0';
end if;
end process;

UnarySubOutput<= UnarySubSig;
SwapOutput<=SwapSig;

fsm_sync: PROCESS (Rst, Clk)
BEGIN
	IF (Rst = '1') then 
		currentS <= DN;
	ELSIF (rising_edge(Clk)) then 
		currentS <= nextS; 
	END IF;
END PROCESS;


end Behavioral;

