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
signal StackOut:STD_LOGIC_VECTOR(7 DOWNTO 0):="00000000";
signal Mode0Sig,Mode1Sig,Mode2Sig,ModePipe:std_logic:='0';
signal AddOut,SubOut:std_logic:='0';
signal UnarySubOut,SwapOut:std_logic:='0';
signal Reg0Val,Reg1Val,Reg2Val:std_logic_vector(7 downto 0);
signal RegEn0,RegEn1,RegEn2:std_logic:='0';
signal actionSignal:std_logic;
signal UnaryVal:std_logic_vector(7 downto 0);
signal boxCarry,boxV:std_logic;
SIGNAL boxResult:STD_LOGIC_VECTOR(7 DOWNTO 0);
signal PopSignal,PushSignal:std_logic;
signal PopSign,PushSign:std_logic;
signal PopS,PushS:std_logic;
signal R0En,R1En:std_logic;
signal enableReg0,enableReg1:std_logic;
signal temp1,temp2,temp3,temp4,temp5,temp6,temp7:std_logic:='0';
SIGNAL multi2v1_1Val,multi2v1_2Val,multi4v1Val:std_logic_vector(7 downto 0):="00000000";
signal FSM0En1,FSM0En2,FSM0En3:std_Logic;
signal addsubsig:std_Logic;
signal signCoder:std_logic_vector(1 downto 0);

COMPONENT singlepulsegen IS
    Port ( clk 		: in std_logic;		-- connect it to the Clock of the board
           rst 		: in std_logic;		-- connect it to the Reset Button of the board			
           input 	: in std_logic;		-- connect it to the Push Button of the board
           output 	: out std_logic		-- connect it to the input of your circuit
          );
end COMPONENT;

component Reg is
    Port ( Clock : in  STD_LOGIC;
           D : in  STD_LOGIC_VECTOR(7 DOWNTO 0);
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

component UnaryOp is
    Port ( NIn : in  STD_LOGIC_vector(7 downto 0);
           NOut : out  STD_LOGIC_vector(7 downto 0));
end component;

COMPONENT ASFsm is
    Port ( Clk : in  STD_LOGIC;
           Rst : in  STD_LOGIC;
           A_Signal : in  STD_LOGIC;
           S_Signal : in  STD_LOGIC;
           AS_PushEn : out  STD_LOGIC;
           AS_PopEn : out  STD_LOGIC;
			  AddSubAction:out std_logic;
			  AddOrSubSignal:out std_logic;
			  FSM0En:out std_logic;
			  Reg2Act:out std_logic;
           Reg0Act : out  STD_LOGIC;
			  Reg1Act : out  STD_LOGIC);
end COMPONENT;


component CLA8BIT is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           M : in  STD_LOGIC;
           Result : out  STD_LOGIC_VECTOR (7 downto 0);
           COUT : out  STD_LOGIC;
           V : out  STD_LOGIC);
end component;

component UFsm is
    Port ( Clock : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           U_Signal : in  STD_LOGIC;
           U_PopEn : out  STD_LOGIC;
           U_PushEn : out  STD_LOGIC;
			  FSM0En:out std_logic;
           Reg0Out: out  STD_LOGIC);
end component;

component SwapFSM is
    Port ( Clk : in  STD_LOGIC;
           Rst : in  STD_LOGIC;
           S_Signal : in  STD_LOGIC;
           S_PushEn : out  STD_LOGIC;
			  FSM0En:out std_logic;
           S_PopEn : out  STD_LOGIC;
           Reg0Output : out  STD_LOGIC;
           Reg1Output : out  STD_LOGIC);
end component;

COMPONENT Multiplexer2v1 is
    Port ( Q0 : in  STD_LOGIC_VECTOR (7 downto 0);
           Q1 : in  STD_LOGIC_VECTOR (7 downto 0);
           Sign : in  STD_LOGIC;
           OUTM : out  STD_LOGIC_VECTOR (7 downto 0));
end COMPONENT;

component Multiplexer4v1 is
    Port ( Q0 : in  STD_LOGIC_VECTOR (7 downto 0);
           Q1 : in  STD_LOGIC_VECTOR (7 downto 0);
           Q2 : in  STD_LOGIC_VECTOR (7 downto 0);
           Q3 : in  STD_LOGIC_VECTOR (7 downto 0);
           Sign : in  STD_LOGIC_VECTOR (1 downto 0);
           OUTM : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

component Coder is
    Port ( Input : in  STD_LOGIC_VECTOR (3 downto 0);
           Output : out  STD_LOGIC_VECTOR (1 downto 0));
end component;


begin

coderSign:Coder
port map(Input(0)=>NOT AddOut,
			Input(1)=>NOT SubOut,
			Input(2)=>NOT UnarySubOut,
			Input(3)=>NOT SwapOut,
			Output=>signCoder);
			
SFsm:SwapFSM
Port map(Clk=>Clock,
           Rst=>Reset,
           S_Signal=>SwapOut,
           S_PopEn=>PopS,
			  FSM0En=>FSM0En3,
			  S_PushEn=>PushS,
           Reg0Output=>enableReg0,
           Reg1Output=>enableReg1);


Multi4v1:Multiplexer4v1
port map(Q0=>Reg2Val,
			Q1=>Reg2Val,
			Q2=>UnaryVal,
			Q3=>multi2v1_1Val,
			Sign=>signCoder,
			OUTM=>multi4v1Val);


UnFsm:UFsm
Port map(Clock=>Clock,
           Reset=>Reset,
           U_Signal=>UnarySubOut,
           U_PopEn=>PopSign,
           U_PushEn=>PushSign,
			  FSM0En=>FSM0En2,
           Reg0Out=>R0En);


StackMultiplexer:Multiplexer2v1
port map(Q0=>NUMIN,
			Q1=>multi4v1Val,
			Sign=>FSM0En1 or FSM0En3 or FSM0En2,
			OUTM=>multi2v1_2Val);
			
swapMultiplexer:Multiplexer2v1
port map(Q0=>Reg0Val,
			Q1=>Reg1Val,
			Sign=>FSM0En3,
			OUTM=>multi2v1_1Val);
				

UnaryACT: UnaryOp
	PORT MAP(NIn=>Reg0Val,
				NOut=>UnaryVal);


temp4<=RegEn0 or R0En or enableReg0;
Reg0: Reg 
	PORT MAP(Clock => Clock,
				D => StackOut,
				Enable =>temp4,
				Q => Reg0Val);


temp5<= RegEn1 or R1En or enableReg1;
Reg1: Reg 
	PORT MAP(Clock => Clock,
				D => StackOut,
				Enable =>temp5,
				Q => Reg1Val);


Reg2: Reg
	Port map(ClOCK=>Clock,
				D=>boxResult ,
				Enable=>RegEn2,
				Q=>Reg2Val);
				


AddSubFSM: ASFsm
	PORT MAP(Clk=>Clock,
				Rst=>Reset,
				A_Signal=>AddOut,
				S_Signal=>SubOut,
				AS_PushEn=>PushSignal,
				AS_PopEn=>PopSignal,
				FSM0En=>FSM0En1,
				AddSubAction=>actionSignal,
				AddOrSubSignal=>addsubsig,
				Reg0Act=>RegEn0,
				Reg2Act=>RegEn2,
				Reg1Act=>RegEn1);

AddSubBox: CLA8BIT
	PORT MAP(A=>Reg0Val,
           B=>Reg1Val,
           M=>actionSignal,
           Result=>boxResult,
           COUT=>boxCarry,
           V=>boxV);




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


temp1<=	BTN1P or  (PushSignal or PushSign or PushS);
temp2<=	BTN2P or   (PopSignal or PopSign or PopS);
temp3<=	Mode0Sig OR FSM0En1 or FSM0En2 or FSM0En3;
FSM_M0 : FSM0 
	PORT MAP( Push => temp1,
				 Pop => temp2,
				 Clk => Clock,
				 ModeEn=>temp3,
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
	PORT MAP( a => out_tos, --<< 
				 d =>multi2v1_2Val,
				 clk => Clock,
				 we => WriteEnable,
				 spo => StackOut);

				 
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

NUMOUT<=StackOut;
SecCounEn <= CounterEnable AND FlagEnable;

end behavioral;