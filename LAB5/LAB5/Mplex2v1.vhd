----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:09:24 05/11/2017 
-- Design Name: 
-- Module Name:    Mplex2v1 - Behavioral 
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

entity Mplex2v1 is
    Port ( Q0 : in  STD_LOGIC_VECTOR (4 downto 0);
           Q1 : in  STD_LOGIC_VECTOR (4 downto 0);
           Sign : in  STD_LOGIC;
           OUTM : out  STD_LOGIC_VECTOR (4 downto 0));
end Mplex2v1;

architecture Behavioral of Mplex2v1 is

begin
PROCESS(Sign,Q1,Q0)
begin
if(Sign='0') then
	OUTM<=Q0;
ELSE
	OUTM<=Q1;
END IF;
END PROCESS;

end Behavioral;

