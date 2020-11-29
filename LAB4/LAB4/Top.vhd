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

entity Top is
    Port ( BTN1 : in  STD_LOGIC;
           BTN2 : in  STD_LOGIC;
           Mode: in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Clock : in  STD_LOGIC;
           NUMIN : in  STD_LOGIC_VECTOR (7 downto 0);
           NUMOUT : out  STD_LOGIC_VECTOR (7 downto 0);
           SSD_EN : out  STD_LOGIC_VECTOR (3 downto 0);
           SSD : out  STD_LOGIC_VECTOR (7 downto 0));
end Top;

architecture Behavioral of Top is
signal StackPointer:std_logic_vector(4 downto 0):="00000";
SIGNAL BTN1P, BTN2P, UDP, LD_P, WriteEnable,FlagEnable, SecCounEn, OVFP, CounterEnable, FullSignal, EmptySignal : STD_LOGIC;
SIGNAL out_tos,out_tosm1: STD_LOGIC_VECTOR(4 DOWNTO 0);
signal Mode0Sig,Mode1Sig,Mode2Sig,ModePipe:std_logic:='0';
signal AddOut,SubOut:std_logic:='0';
signal UnarySubOut,SwapOut:std_logic:='0';

COMPONENT singlepulsegen IS
    Port ( clk 		: in std_logic;		-- connect it to the Clock of the board
           rst 		: in std_logic;		-- connect it to the Reset Button of the board			
           input 	: in std_logic;		-- connect it to the Push Button of the board
           output 	: out std_logic		-- connect it to the input of your circuit
          );
end COMPONENT;

component Reg is
    Port ( Clock : in  STD_LOGIC;
           D : in  STD_LOGIC_VECTOR(7 DOWNTO 0):="00000000";
           Enable : in  STD_LOGIC;
           Q : out  STD_LOGIC_vector(7 downto 0));
end component;

COMPONENT FSM0 IS
    Port ( Push : in  STD_LOGIC;
           Pop : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
			  ModeEn:in std_logic;
           Rst : in  STD_LOGIC;
			  Empty : in STD_LOGIC;
			  Full: in STD_Logic;
           U_D : out  STD_LOGIC;
           LOAD : out  STD_LOGIC;
           CounterEn : out  STD_LOGIC;
			  StackWrite : out STD_LOGIC;
			  STACK_OVF : out  STD_LOGIC);
END COMPONENT;

component FSM1 is
		Port( Clk:in std_logic;
				Rst:in std_logic;
				ModeEn:in std_logic;
				Add:in std_logic;
				Sub:in std_logic;
				AddOutput:out std_logic;
				SubOutput:out std_logic);
end component;

component FSM2 is
		Port( Clk:in std_logic;
				Rst:in std_logic;
				ModeEn:in std_logic;
				UnarySub:in std_logic;
				Swap:in std_logic;
				UnarySubOutput:out std_logic;
				SwapOutput:out std_logic);
end component;

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
			A:in std_logic;
			S:in std_logic;
			U:in std_logic;
			SWAP:in std_logic;
			Mode0:in std_logic;
			Mode1:in std_logic;
			Mode2:in std_logic;
			ANcontrol : out STD_LOGIC_VECTOR(3 downto 0);
			SSControl : out STD_LOGIC_VECTOR(7 downto 0));
end COMPONENT;

Component ModeFsm is
    Port ( Clock : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           ModeSignal : in  STD_LOGIC;
           Mode0En : out  STD_LOGIC;
           Mode1En : out  STD_LOGIC;
           Mode2En : out  STD_LOGIC);
end component;

begin


SPG0 : singlepulsegen 
	PORT MAP( clk => Clock,
				 rst => Reset,
				 input => BTN1,
				 output => BTN1P);
				 
SPG1 : singlepulsegen 
	PORT MAP( clk => Clock,
				 rst => Reset,
				 input => BTN2,
				 output => BTN2P);
				 
SPG2 : singlepulsegen
	Port Map(clk=>Clock,
				rst=>Reset,
				input=>Mode,
				output=>ModePipe);
				 
FSM_M0 : FSM0 
	PORT MAP( Push => BTN1P,
				 Pop => BTN2P,
				 Clk => Clock,
				 ModeEn=>Mode0Sig,
				 Rst => Reset,
				 U_D => UDP,
				 Empty => EmptySignal,
				 Full => FullSignal,
				 LOAD => LD_P,
				 CounterEn => CounterEnable,
				 StackWrite => WriteEnable,
				 STACK_OVF =>OVFP);
				 
FSM_M1:FSM1
	Port MAP(Clk=>Clock,
				Rst=>Reset,
				ModeEn=>Mode1Sig,
				Add=>BTN1P,
				Sub=>BTN2P,
				AddOutput=>AddOut,
				SubOutput=>SubOut);

FSM_M2:FSM2
	Port MAP(Clk=>Clock,
				Rst=>Reset,
				ModeEn=>Mode2Sig,
				UnarySub=>BTN1P,
				Swap=>BTN2P,
				UnarySubOutput=>UnarySubOut,
				SwapOutput=>SwapOut);

ModeController:ModeFsm
	Port map(Clock=>Clock,
				Reset=>Reset,
				ModeSignal=>ModePipe,
				Mode0En=>Mode0Sig,
				Mode1En=>Mode1Sig,
				Mode2En=>Mode2Sig);
				

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
				A=>AddOut,
				S=>SubOut,
				U=>UnarySubOut,
				SWAP=>SwapOut,
				Mode0=>Mode0Sig,
				Mode1=>Mode1Sig,
				Mode2=>Mode2Sig,
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