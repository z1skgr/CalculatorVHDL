----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:50:46 05/14/2017 
-- Design Name: 
-- Module Name:    Multi2v1 - Behavioral 
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

entity Multi2v1 is
    Port ( Q0 : in  STD_LOGIC_VECTOR (7 downto 0);
           Q1 : in  STD_LOGIC_VECTOR (7 downto 0);
           Sign : in  STD_LOGIC;
           OUTM : out  STD_LOGIC_VECTOR (7 downto 0));
end Multi2v1;

architecture Behavioral of Multi2v1 is

begin
process(Sign,Q0,Q1)
BEGIN
IF Sign='0' then
	OUTM<=Q0;
ELSE 
	OUTM<=Q1;
END IF;
END PROCESS;
end Behavioral;

