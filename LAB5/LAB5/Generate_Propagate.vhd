----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:04:59 03/20/2017 
-- Design Name: 
-- Module Name:    Generate_Propagate - Behavioral 
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

entity Generate_Propagate is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
			  M : in STD_LOGIC;
           P : out  STD_LOGIC;
           G : out  STD_LOGIC);
end Generate_Propagate;

architecture Behavioral of Generate_Propagate is
signal Bsignal:std_logic;
begin

P<=A XOR (B XOR M);
G<=A AND (B XOR M);
end Behavioral;

