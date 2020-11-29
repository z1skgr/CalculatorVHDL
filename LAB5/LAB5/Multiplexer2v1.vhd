----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:20:35 05/14/2017 
-- Design Name: 
-- Module Name:    Multiplexer2v1 - Behavioral 
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

entity Multiplexer2v1 is
    Port ( Q0 : in  STD_LOGIC_VECTOR (7 downto 0);
           Q1 : in  STD_LOGIC_VECTOR (7 downto 0);
           Sign : in  STD_LOGIC;
           OUTM : out  STD_LOGIC_VECTOR (7 downto 0));
end Multiplexer2v1;

architecture Behavioral of Multiplexer2v1 is

begin
process(Q0,Q1,Sign)
begin
if Sign='0' then
	OUTM<=Q0;
ELSIF Sign='1' then
	OUTM<=Q1;
END IF;
END PROCESS;


end Behavioral;

