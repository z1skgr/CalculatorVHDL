----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:37:45 03/21/2017 
-- Design Name: 
-- Module Name:    Top - Behavioral 
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
USE IEEE.STD_LOGIC_ARITH.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FSMmode0 is
    Port ( Push : in  STD_LOGIC;
           Pop : in  STD_LOGIC;
           Mode: in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Clock : in  STD_LOGIC;
           NUMIN : in  STD_LOGIC_VECTOR (7 downto 0);
           NUMOUT : out  STD_LOGIC_VECTOR (7 downto 0);
           SSD_EN : out  STD_LOGIC_VECTOR (3 downto 0);
           SSD : out  STD_LOGIC_VECTOR (7 downto 0));
end FSMmode0;

architecture Behavioral of FSMmode0 is
signal StackPointer:std_logic_vector(4 downto 0):="00000";
SIGNAL PUSHP, POPP, UDP, LD_P, WriteEnable,FlagEnable, SecCounEn, OVFP, CounterEnable, FullSignal, EmptySignal : STD_LOGIC;
SIGNAL out_tos,out_tosm1: STD_LOGIC_VECTOR(4 DOWNTO 0);

COMPONENT singlepulsegen IS
    Port ( clk 		: in std_logic;		-- connect it to the Clock of the board
           rst 		: in std_logic;		-- connect it to the Reset Button of the board			
           input 	: in std_logic;		-- connect it to the Push Button of the board
           output 	: out std_logic		-- connect it to the input of your circuit
          );
end COMPONENT;

COMPONENT FSM IS
    Port ( Push : in  STD_LOGIC;
           Pop : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           Rst : in  STD_LOGIC;
			  Empty : in STD_LOGIC;
			  Full: in STD_Logic;
           U_D : out  STD_LOGIC;
           LOAD : out  STD_LOGIC;
           CounterEn : out  STD_LOGIC;
			  StackWrite : out STD_LOGIC;
			  STACK_OVF : out  STD_LOGIC);
END COMPONENT;		

COMPONENT Comparator_Equality is
    Port ( B1 : in  STD_LOGIC_VECTOR (4 downto 0);
           B2 : in  STD_LOGIC_VECTOR (4 downto 0);
           Y1 : out  STD_LOGIC);
end COMPONENT;

COMPONENT STACK IS
	PORT ( a: in STD_LOGIC_VECTOR(4 downto 0);
	       d: in STD_LOGIC_VECTOR(7 downto 0);
			 clk: in STD_LOGIC;
			 we: in STD_LOGIC;
			 spo: out STD_LOGIC_VECTOR(7 downto 0));
END COMPONENT;

COMPONENT COUNTER IS
    Port ( En : in  STD_LOGIC;
           input : in  STD_LOGIC_Vector(4 downto 0);
           output : out  STD_LOGIC_Vector(4 downto 0);
           Clock : in  STD_LOGIC;
           Load : in  STD_LOGIC;
           U_D : in  STD_LOGIC);
end COMPONENT;

COMPONENT SSDController is
	PORT (Clk : in  STD_LOGIC;
         Rst : in  STD_LOGIC;
         Empty : in  STD_LOGIC;
         Full : in  STD_LOGIC;
         Stack_OVF : in  STD_LOGIC;
			ANcontrol : out STD_LOGIC_VECTOR(3 downto 0);
			SSControl : out STD_LOGIC_VECTOR(7 downto 0));
end COMPONENT;

begin

SPG0 : singlepulsegen 
	PORT MAP( clk => Clock,
				 rst => Reset,
				 input => Push,
				 output => PUSHP);
				 
SPG1 : singlepulsegen 
	PORT MAP( clk => Clock,
				 rst => Reset,
				 input => Pop,
				 output => POPP);
MY_FSM : FSM 
	PORT MAP( Push => PUSHP,
				 Pop => POPP,
				 Clk => Clock,
				 Rst => Reset,
				 U_D => UDP,
				 Empty => EmptySignal,
				 Full => FullSignal,
				 LOAD => LD_P,
				 CounterEn => CounterEnable,
				 StackWrite => WriteEnable,
				 STACK_OVF =>OVFP);

myStack : STACK 
	PORT MAP( a => StackPointer, --<< 
				 d => NUMIN,
				 clk => Clock,
				 we => WriteEnable,
				 spo => NUMOUT);

				 
Counter2 : COUNTER
	PORT MAP( input => StackPointer,
				 U_D => UDP,
				 En => CounterEnable,
				 Clock => Clock,
				 Load=>LD_P,
				 output => out_tos);
				 
 
Counter1 : COUNTER
	PORT MAP( input =>  StackPointer,
				 U_D => UDP,
				 En => SecCounEn, --Blepe telos kodika
				 Clock => Clock,
				 Load=>LD_P,
				 output => out_tosm1);
				 
EmptyComparator : Comparator_Equality
	PORT MAP (B1 => "00000",
				 B2 => out_tos,
				 Y1 => EmptySignal);
				 
FullComparator : Comparator_Equality
	PORT MAP (B1 => "11111",
				 B2 => out_tos,
				 Y1 => FullSignal);


ssdControl: SSDController 
	PORT MAP(Clk => Clock, 
				Rst => Reset, 
				Empty => EmptySignal, 
				Full => FullSignal, 
				Stack_OVF=> OVFP, 
				ANControl => SSD_EN, 
				SSControl => SSD);

secondCounterEnable :PROCESS(EmptySignal)
BEGIN
	IF (EmptySignal = '1') THEN --<<<<<
		FlagEnable <= '0';
	ELSE
		FlagEnable <= '1';
	END IF;
END PROCESS;



SecCounEn <= CounterEnable AND FlagEnable;

end behavioral;