----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:29:00 05/09/2017 
-- Design Name: 
-- Module Name:    UnaryOp - Behavioral 
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

entity UnaryOp is
    Port ( NIn : in  STD_LOGIC_vector(7 downto 0);
           NOut : out  STD_LOGIC_vector(7 downto 0));
end UnaryOp;

architecture Behavioral of UnaryOp is
COMPONENT CLA8BIT is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           M : in  STD_LOGIC;
           Result : out  STD_LOGIC_VECTOR (7 downto 0);
           COUT : out  STD_LOGIC;
           V : out  STD_LOGIC);
end component;

begin
complement2s : CLA8BIT PORT MAP(A=>"00000000",
									 B=>NIn,
									 M=>'1',
									 Result=>NOut);

end Behavioral;

