----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:37:10 03/13/2017 
-- Design Name: 
-- Module Name:    TopFsm - Behavioral 
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

entity TopFsm is
    Port ( RST : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           IN0 : in  STD_LOGIC;
           IN1 : in  STD_LOGIC;
           IN2 : in  STD_LOGIC;
           LED : out  STD_LOGIC_VECTOR (7 downto 0));
end TopFsm;

architecture Behavioral of TopFsm is
SIGNAL pipe0,pipe1,pipe2:STD_LOGIC;
Component Fsm is
    Port ( RST : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           IN0 : in  STD_LOGIC;
           IN1 : in  STD_LOGIC;
           IN2 : in  STD_LOGIC;
           OUTPUT : out  STD_LOGIC_VECTOR (7 downto 0));
end Component;

component singlepulsegen is
    Port ( clk 		: in std_logic;		-- connect it to the Clock of the board
           rst 		: in std_logic;		-- connect it to the Reset Button of the board			
           input 	: in std_logic;		-- connect it to the Push Button of the board
           output 	: out std_logic		-- connect it to the input of your circuit
          );
end component;

begin

PUSH0: singlepulsegen PORT MAP(clk=>CLK,rst=>RST,input=>IN0,output=>pipe0);
PUSH1: singlepulsegen PORT MAP(clk=>CLK,rst=>RST,input=>IN1,output=>pipe1);
PUSH2: singlepulsegen PORT MAP(clk=>CLK,rst=>RST,input=>IN2,output=>pipe2);

TOP_FSM:Fsm PORT MAP(RST=>RST,CLK=>CLK,IN0=>pipe0,IN1=>pipe1,IN2=>pipe2,OUTPUT=>LED);

end Behavioral;

