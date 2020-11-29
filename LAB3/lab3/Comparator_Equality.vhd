----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:40:56 03/27/2017 
-- Design Name: 
-- Module Name:    Comparator_Equality - Behavioral 
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

entity Comparator_Equality is
    Port ( B1 : in  STD_LOGIC_VECTOR (4 downto 0);
           B2 : in  STD_LOGIC_VECTOR (4 downto 0);
           Y1 : out  STD_LOGIC);
end Comparator_Equality;

architecture Behavioral of Comparator_Equality is
signal xnout0,xnout1,xnout2,xnout3,xnout4:std_logic;
signal andout0,andout1,andout2,equal_out:std_logic;
component xnor_gate is
    Port ( B1 : in  STD_LOGIC;
           B2 : in  STD_LOGIC;
           Y1 : out  STD_LOGIC);
end component;
component and_gate is
    Port ( B1 : in  STD_LOGIC;
           B2 : in  STD_LOGIC;
           Y1 : out  STD_LOGIC);
end component;


begin
gate_xnor0: xnor_gate PORT MAP(B1=>B1(0),B2=>B2(0),Y1=>xnout0);
gate_xnor1: xnor_gate PORT MAP(B1=>B1(1),B2=>B2(1),Y1=>xnout1);
gate_xnor2: xnor_gate PORT MAP(B1=>B1(2),B2=>B2(2),Y1=>xnout2);
gate_xnor3: xnor_gate PORT MAP(B1=>B1(3),B2=>B2(3),Y1=>xnout3);
gate_xnor4: xnor_gate PORT MAP(B1=>B1(4),B2=>B2(4),Y1=>xnout4);

gate_and0 : and_gate PORT MAP(B1=>xnout0,B2=>xnout1,Y1=>andout0);
gate_and2 : and_gate PORT MAP(B1=>andout0,B2=>xnout2,Y1=>andout1);
gate_and3 : and_gate PORT MAP(B1=>andout1,B2=>xnout3,Y1=>andout2);
gate_and4 : and_gate PORT MAP(B1=>andout2,B2=>xnout4,Y1=>equal_out);

Y1<=equal_out;

end Behavioral;

