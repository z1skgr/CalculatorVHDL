----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:17:51 03/22/2017 
-- Design Name: 
-- Module Name:    FSM - Behavioral 
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

entity FSM0 is
    Port ( Push : in  STD_LOGIC;
           Pop : in  STD_LOGIC;
			  Empty : in STD_LOGIC;
			  ModeEn:in std_logic;
			  Full: in STD_Logic;
           Clk : in  STD_LOGIC;
           Rst : in  STD_LOGIC;
           U_D : out  STD_LOGIC;
           LOAD : out  STD_LOGIC;
           CounterEn : out  STD_LOGIC;
			  STACK_OVF : out  STD_LOGIC;
			  StackWrite : out STD_LOGIC);
end FSM0;

architecture Behavioral of FSM0 is
type state is(PUSH1S, PUSH2S,POPS,OV,DN);
signal currentS,nextS:state;

begin

fsm_s:PROCESS(currentS,Push,Pop,Full,Empty, nextS,ModeEn)
begin
if ModeEn='1' then
	case currentS is
	when DN=> 		StackWrite<='0';
						CounterEn <= '0';
						STACK_OVF <= '0';
						U_D<='1';
						IF (Pop='1' AND Empty='0') then nextS<=POPS;
						end if;
						If (Pop='1' AND Empty='1') then nextS<=DN;
						END IF;
						IF	(Push='1' AND Full='0') then nextS<=PUSH1S;
						END IF;
						IF (Push='1' AND Full='1') then nextS<=OV;
						END IF;
	
	when PUSH1S=>	nextS<=PUSH2S;
						CounterEn<='0';
						StackWrite<='1';
						STACK_OVF <= '0';
						U_D<='1';
						
	when PUSH2S=>	nextS<=DN;
						CounterEn<='1';
						U_D<='1';
						STACK_OVF <= '0';
						StackWrite<='0';

					
	when POPS=>		nextS<=DN;
						CounterEn<='1';
						U_D<='0';
						STACK_OVF <= '0';
						StackWrite<='0';
	
	when OV=>  		STACK_OVF <= '1';
						nextS<=OV;
						StackWrite<='0';
						U_D<='1';
						CounterEn<='0';
	
	when OTHERS=> 	nextS <= DN;
						STACK_OVF <= '0';
						StackWrite<='0';
						U_D<='1';
						CounterEn<='0';
	
end case;
end if;
end process;

fsm_sync: PROCESS (Rst, Clk)
BEGIN
	IF (Rst = '1') then 
		currentS <= DN;
		LOAD<='0';
	ELSIF (rising_edge(Clk)) then 
		currentS <= nextS; 
		LOAD <='1';
	END IF;
END PROCESS;

end Behavioral;

