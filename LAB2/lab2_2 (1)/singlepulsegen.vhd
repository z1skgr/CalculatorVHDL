-- Description:
-- implementation of a single-pulse generator circuit: it produces an output pulse 
-- with width equal to the period of 1 clock cycle, when the input becomes '1'. 
-- Consider a push button that is pressed (so it becomes '1') by a person: the person
-- cannot handle the width of the pulse, measured in clock cycles. But this circuit 
-- produces on its output a single pule. The circuit can be used in FSMs, to trigger 
-- the transition from state-to-state from an external push button
-- 
-- Do not feed the reset input of your circuit with the singlepulsegen
--
-- created by Kyprianos Papadimitriou, March 4, 2016
-- School of ECE, TU Crete, for the course Advanced Logic Design

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity singlepulsegen is
    Port ( clk 		: in std_logic;		-- connect it to the Clock of the board
           rst 		: in std_logic;		-- connect it to the Reset Button of the board			
           input 	: in std_logic;		-- connect it to the Push Button of the board
           output 	: out std_logic		-- connect it to the input of your circuit
          );
end singlepulsegen;

architecture behavioral of singlepulsegen is
	type stateType is (S0, S1, S2);
	signal currentS, nextS: stateType;
	
    begin	-- begin architecture
        
   	fsm_comb: process (currentS, input)
	begin			
		case currentS IS
			when S0 	=>	if input = '1' then 	nextS <= S1; 
							else	             	nextS <= S0; 
                			end if;		
			when S1 	=>							nextS <= S2;     			
			when S2		=>	if input = '1' then 	nextS <= S2; 
    						else					nextS <= S0;
                			end if;
   			when others	=> 							nextS <= S0;                				
		end case;
	end process fsm_comb;
        
    fsm_synch: process (clk, rst)
	begin
		if (rst='1')  	   			then 	currentS <= S0;  
       	elsif (rising_edge(clk))  	then	currentS <= nextS; 
     	end if;
	end process fsm_synch;
              
    output <= '1' when currentS = S1 else '0';    
                           
  	end Behavioral;	-- end architecture    
