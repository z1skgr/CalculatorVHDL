----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:30:57 03/07/2017 
-- Design Name: 
-- Module Name:    Fsm - Behavioral 
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

entity Fsm is
    Port ( RST : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           IN0 : in  STD_LOGIC;
           IN1 : in  STD_LOGIC;
           IN2 : in  STD_LOGIC;
           OUTPUT : out  STD_LOGIC_VECTOR (7 downto 0));
end Fsm;

architecture Behavioral of Fsm is

TYPE STATE IS (A, B, C);
SIGNAL CURRENTS, NEXTS: STATE;
begin

FSM_COMB:PROCESS(CURRENTS, IN0, IN1, IN2)
BEGIN
	CASE CURRENTS IS
		WHEN A =>		OUTPUT<="11111111";
							IF IN0 = '1' THEN NEXTS <= B;
							ELSIF IN1 = '1' THEN NEXTS <= C;
							ELSIF IN2='1' THEN NEXTS <= A;
							ELSE NEXTS<= A;
							END IF;
		WHEN B =>		OUTPUT<="11000011";
							IF IN0 = '1' THEN NEXTS <= C;
							ELSIF IN1 = '1' THEN NEXTS <= A;
							ELSIF IN2='1' THEN NEXTS <= B;
							ELSE NEXTS<= B;
							END IF;
		WHEN C =>		OUTPUT<="00111100";
							IF IN0 = '1' THEN NEXTS <= A;
							ELSIF IN1 = '1' THEN NEXTS <= B;
							ELSIF IN2='1' THEN NEXTS <= C;
							ELSE NEXTS<= C;
							END IF;
							
		WHEN OTHERS => OUTPUT <= "11111111";
							NEXTS <= A;
	END CASE;		
END PROCESS;	

fsm_synch:PROCESS(CLK,RST)
Begin
	IF(RST='1') THEN CURRENTS<=A;
	ELSIF(rising_edge(CLK)) THEN CURRENTS<=NEXTS;
	END IF;
END PROCESS;



end Behavioral;

