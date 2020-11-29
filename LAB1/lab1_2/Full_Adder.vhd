----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:39:43 02/25/2017 
-- Design Name: 
-- Module Name:    Full_Adder - Behavioral 
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

entity Full_Adder is
    Port ( IN0 : in  STD_LOGIC;
           IN1 : in  STD_LOGIC;
           IN2 : in  STD_LOGIC;
           LED : out  STD_LOGIC_VECTOR (1 downto 0));
end Full_Adder;

architecture Behavioral of Full_Adder is

SIGNAL OS,OC,TC: STD_LOGIC;

component Half_Adder
port (IN0,IN1: in  STD_LOGIC;
		SUM,CARRY : out  STD_LOGIC);
end component;

begin

Half_Adder1 : Half_Adder
port map ( IN0=>IN0,IN1=>IN1,SUM=>OS,CARRY=>OC);

Half_Adder2 : Half_Adder
port map ( IN0=>OS ,IN1=>IN2,SUM=>LED(0),CARRY=>TC);

LED(1)<= TC OR OC;

end Behavioral;

