----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:28:07 05/16/2017 
-- Design Name: 
-- Module Name:    Multiplexer4v1 - Behavioral 
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

entity Multiplexer4v1 is
    Port ( Q0 : in  STD_LOGIC_VECTOR (7 downto 0);
           Q1 : in  STD_LOGIC_VECTOR (7 downto 0);
           Q2 : in  STD_LOGIC_VECTOR (7 downto 0);
           Q3 : in  STD_LOGIC_VECTOR (7 downto 0);
           Sign : in  STD_LOGIC_VECTOR (1 downto 0);
           OUTM : out  STD_LOGIC_VECTOR (7 downto 0));
end Multiplexer4v1;

architecture Behavioral of Multiplexer4v1 is

begin
process(Sign,Q0,Q1,Q2,Q3)
BEGIN
if(Sign="00") then
	OUTM<=Q0;
ELSIF Sign<="01" then
	OUTM<=Q1;
ELSIF Sign<="10" then
	OUTM<=Q2;
ELSIF Sign<="11" then
	OUTM<=Q3;
ELSE OUTM<=Q0;
END IF;
END PROCESS;
end Behavioral;

