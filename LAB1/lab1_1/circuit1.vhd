----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:36:16 02/25/2017 
-- Design Name: 
-- Module Name:    circuit1 - Behavioral 
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

entity circuit1 is
    Port ( IN0 : in  STD_LOGIC;
           IN1 : in  STD_LOGIC;
           BTN0 : in  STD_LOGIC;
           BTN1 : in  STD_LOGIC;
           BTN2 : in  STD_LOGIC;
           BTN3 : in  STD_LOGIC;
           LED : out  STD_LOGIC_VECTOR (7 downto 0));
end circuit1;

architecture Behavioral of circuit1 is

begin
LED(0)<=IN0 AND IN1 AND BTN0;
LED(1)<=(IN0 XOR IN1) AND BTN1;
LED(2)<=(IN0 NOR IN1) AND BTN2;
LED(3)<=NOT IN0 AND BTN3;
LED(4)<=IN0;
LED(5)<=IN1;

end Behavioral;

