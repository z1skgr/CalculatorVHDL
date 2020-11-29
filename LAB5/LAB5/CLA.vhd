----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:12:01 03/07/2017 
-- Design Name: 
-- Module Name:    CLA - Behavioral 
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

entity CLA is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           Cin : in  STD_LOGIC;
			  M : in STD_LOGIC;
           SUM : out  STD_LOGIC_VECTOR (3 downto 0);
			  V:out std_logic;
			  Cout: out STD_LOGIC
           );
end CLA;

architecture Behavioral of CLA is
signal Psignal,Gsignal: STD_LOGIC_VECTOR (3 downto 0);
signal Csignal: STD_LOGIC_VECTOR (2 downto 0);

Component CarryGPU is
Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           P : out  STD_LOGIC_VECTOR (3 downto 0);
			  M : in STD_LOGIC;
           G : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

Component SUM_UNIT is
    Port ( P : in  STD_LOGIC_VECTOR (3 downto 0);
           C : in  STD_LOGIC_VECTOR (2 downto 0);
           CIN : in  STD_LOGIC;
           S : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

Component CLAU is 
Port ( CIN : in  STD_LOGIC;
           P : in  STD_LOGIC_VECTOR (3 downto 0);
           G : in  STD_LOGIC_VECTOR (3 downto 0);
           C : out  STD_LOGIC_VECTOR (2 downto 0);
			  V:out std_logic;
           COUT : out  STD_LOGIC);
end component;

begin

CarryGPU1 : CarryGPU PORT MAP(A=>A,B=>B,M=>M,P=>Psignal,G=>Gsignal);
CLAU1: CLAU PORT MAP(CIN=>Cin,P=>Psignal,G=>Gsignal,C=>Csignal,COUT=>Cout,V=>V);
SUM_UNIT1: SUM_UNIT PORT MAP(P=>Psignal,C=>Csignal,CIN=>Cin,S=>SUM);

end Behavioral;

