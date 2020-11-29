----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:35:33 02/25/2017 
-- Design Name: 
-- Module Name:    Half_Adder - Behavioral 
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

entity Half_Adder is
    Port ( IN0 : in  STD_LOGIC;
           IN1 : in  STD_LOGIC;
           SUM : out  STD_LOGIC;
			  CARRY : out STD_LOGIC);
end Half_Adder;

architecture Behavioral of Half_Adder is

begin
SUM<=IN0 XOR IN1;
CARRY<=IN0 AND IN1;

end Behavioral;

