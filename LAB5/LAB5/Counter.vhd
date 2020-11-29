----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:51:34 03/22/2017 
-- Design Name: 
-- Module Name:    Counter - Behavioral 
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

entity COUNTER is
    Port ( En : in  STD_LOGIC;
           input : in  STD_LOGIC_Vector(4 downto 0);
           output : out  STD_LOGIC_Vector(4 downto 0);
           Clock : in  STD_LOGIC;
           Load : in  STD_LOGIC;
           U_D : in  STD_LOGIC);
end COUNTER;

architecture Behavioral of COUNTER is

component MUX4v1 is
    Port ( Q0 : in  STD_LOGIC;
           Q1 : in  STD_LOGIC;
           Q2 : in  STD_LOGIC;
           Q3 : in  STD_LOGIC;
           Sign0 : in  STD_LOGIC;
           Sign1 : in  STD_LOGIC;
           OUTM : out  STD_LOGIC);
end component;

component FlipFlop is
    Port ( Clock : in  STD_LOGIC;
           D : in  STD_LOGIC;
           Q : out  STD_LOGIC);		  
end component;
signal mout1,mout2,mout3,mout4,mout5:std_logic;
signal fout1,fout2,fout3,fout4,fout5:std_logic;
signal ms1,ms2,ms3,ms4,ms5:std_logic;
signal nfout1,nfout2,nfout3,nfout4,nfout5:std_logic;
signal nload1,nload2,nload3,nload4,nload5:std_logic;
signal nUD:std_logic;
begin

nUD<=NOT U_D;
ms1<=(En AND U_D) or (En AND nUD);
nfout1<=not fout1;
nload1<=not Load;
M1: MUX4v1 PORT MAP(Q0=>fout1,Q1=>nfout1,Q2=>input(0),Q3=>input(0),Sign1=>nload1,Sign0=>ms1,OUTM=>mout1);
F1: FlipFlop PORT MAP(D=>mout1,Clock=>Clock,Q=>fout1);

nload2<=not Load;
nfout2<=not fout2;
ms2<=(En AND fout1 AND U_D) or (En AND nfout1 AND nUD );
M2: MUX4v1 PORT MAP(Q0=>fout2,Q1=>nfout2,Q2=>input(1),Q3=>input(1),Sign1=>nload2,Sign0=>ms2,OUTM=>mout2);
F2: FlipFlop PORT MAP(D=>mout2,Clock=>Clock,Q=>fout2);

nload3<=not Load;
nfout3<=not fout3;
ms3<=(En AND fout1 AND fout2 AND U_D) or (En AND nfout1 AND nfout2 AND nUD);
M3: MUX4v1 PORT MAP(Q0=>fout3,Q1=>nfout3,Q2=>input(2),Q3=>input(2),Sign1=>nload3,Sign0=>ms3,OUTM=>mout3);
F3: FlipFlop PORT MAP(D=>mout3,Clock=>Clock,Q=>fout3);

nfout4<=not fout4;
nload4<=not Load;
ms4<=(En AND fout1 AND fout2 AND fout3 AND U_D) or (En AND nfout1 AND nfout2 AND nfout3 AND nUD);
M4: MUX4v1 PORT MAP(Q0=>fout4,Q1=>nfout4,Q2=>input(3),Q3=>input(3),Sign1=>nload4,Sign0=>ms4,OUTM=>mout4);
F4: FlipFlop PORT MAP(D=>mout4,Clock=>Clock,Q=>fout4);

nload5<=not Load;
nfout5<=not fout5;
ms5<=(En AND fout1 AND fout2 AND fout3 AND fout4 AND U_D) or (En AND nfout1 AND nfout2 AND nfout3 AND nfout4 AND nUD);
M5: MUX4v1 PORT MAP(Q0=>fout5,Q1=>nfout5,Q2=>input(4),Q3=>input(4),Sign1=>nload5,Sign0=>ms5,OUTM=>mout5);
F5: FlipFlop PORT MAP(D=>mout5,Clock=>Clock,Q=>fout5);

output(0)<=fout1;
output(1)<=fout2; 
output(2)<=fout3;
output(3)<=fout4;
output(4)<=fout5;

end Behavioral;

