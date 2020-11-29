----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:49:55 03/07/2017 
-- Design Name: 
-- Module Name:    SUM_SINGLE_UNIT - Behavioral 
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

entity SUM_SINGLE_UNIT is
    Port ( P : in  STD_LOGIC;
           C : in  STD_LOGIC;
           S : out  STD_LOGIC);
end SUM_SINGLE_UNIT;

architecture Behavioral of SUM_SINGLE_UNIT is

begin

S <= P XOR C;

end Behavioral;

