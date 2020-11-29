----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:23:28 03/22/2017 
-- Design Name: 
-- Module Name:    MUX4v1 - Behavioral 
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

entity MUX4v1 is
    Port ( Q0 : in  STD_LOGIC;
           Q1 : in  STD_LOGIC;
           Q2 : in  STD_LOGIC;
           Q3 : in  STD_LOGIC;
           Sign0 : in  STD_LOGIC;
           Sign1 : in  STD_LOGIC;
           OUTM : out  STD_LOGIC);
end MUX4v1;

architecture Behavioral of MUX4v1 is
Signal out1,out2:std_logic;
component MUX2v1 is
    Port ( Q0 : in  STD_LOGIC;
           Q1 : in  STD_LOGIC;
           Sign : in  STD_LOGIC;
           OUTM : out  STD_LOGIC);
end component;


begin
MUX2: MUX2v1 PORT MAP(Q0=>Q2,Q1=>Q3,Sign=>Sign0,OUTM=>out2);
MUX1: MUX2v1 PORT MAP(Q0=>Q0,Q1=>Q1,Sign=>Sign0,OUTM=>out1);
MUX3: MUX2v1 PORT MAP(Q0=>out1,Q1=>out2,Sign=>Sign1,OUTM=>OUTM);

end Behavioral;

