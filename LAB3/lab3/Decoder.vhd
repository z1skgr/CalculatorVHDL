----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:11:34 03/27/2017 
-- Design Name: 
-- Module Name:    Decoder - Behavioral 
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

entity Decoder is
    Port ( E : in  STD_LOGIC;
           F : in  STD_LOGIC;
			  OV : in  STD_LOGIC;
           segmentLED : out  STD_LOGIC_VECTOR (31 downto 0));
end Decoder;

architecture Behavioral of Decoder is
begin

coder: process(E, F, OV)
begin
	IF(E='1') THEN segmentLED <= "11111111111111111111111101100001";
	ELSIF(OV='1') THEN segmentLED <= "11111111000000111000001101110001";
	ELSIF(F='1') THEN segmentLED <= "11111111111111111111111101110001";
	ELSE segmentLED <= "11111111111111111111111111111111";
	END IF;
end process;	
end Behavioral;

