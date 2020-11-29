----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:49:20 03/07/2017 
-- Design Name: 
-- Module Name:    SUM_UNIT - Behavioral 
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

entity SUM_UNIT is
    Port ( P : in  STD_LOGIC_VECTOR (3 downto 0);
           C : in  STD_LOGIC_VECTOR (2 downto 0);
           CIN : in  STD_LOGIC;
           S : out  STD_LOGIC_VECTOR (3 downto 0));
end SUM_UNIT;

architecture Behavioral of SUM_UNIT is

COMPONENT SUM_SINGLE_UNIT IS
PORT ( P : in  STD_LOGIC;
       C : in  STD_LOGIC;
       S : out  STD_LOGIC);
END COMPONENT;

begin

SU0 : SUM_SINGLE_UNIT PORT MAP (P => P(0), C => CIN, S => S(0));
SU1 : SUM_SINGLE_UNIT PORT MAP (P => P(1), C => C(0), S => S(1));
SU2 : SUM_SINGLE_UNIT PORT MAP (P => P(2), C => C(1), S => S(2));
SU3 : SUM_SINGLE_UNIT PORT MAP (P => P(3), C => C(2), S => S(3));

end Behavioral;

