----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:52:00 03/27/2017 
-- Design Name: 
-- Module Name:    BehCounter - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity BehCounter is
    Port ( Clk : in  STD_LOGIC;
           Rst : in  STD_LOGIC;
			  oo : out integer;
			  Q : out  STD_LOGIC);
end BehCounter;

architecture Behavioral of BehCounter is
signal outs: integer := 0;
begin
counter: process(Rst, Clk, outs)
begin
 If (Rst = '1') then outs<=0; Q<='0';
 elsif (rising_edge(Clk)) then 
			outs <=outs + 1;
			Q<='0';
 end if;
 if outs=3 then outs<=0;Q<='1';
 end if;
end process;


oo <= outs;

end Behavioral;

