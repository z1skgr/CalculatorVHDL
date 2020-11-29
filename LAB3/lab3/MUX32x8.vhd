----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:32:08 03/27/2017 
-- Design Name: 
-- Module Name:    MUX32x8 - Behavioral 
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

entity MUX32x8 is
    Port ( INPUT : in  STD_LOGIC_VECTOR (31 downto 0);
           control : in  STD_LOGIC_VECTOR(1 downto 0);
           OUTPUT : out  STD_LOGIC_VECTOR (7 downto 0));
end MUX32x8;

architecture Behavioral of MUX32x8 is

begin

 mux: process (INPUT, control)
 begin
  IF(control = "00") then OUTPUT(0) <= INPUT(0); 
								  OUTPUT(1) <= INPUT(1); 
								  OUTPUT(2) <= INPUT(2); 
								  OUTPUT(3) <= INPUT(3); 
								  OUTPUT(4) <= INPUT(4); 
								  OUTPUT(5) <= INPUT(5); 
								  OUTPUT(6) <= INPUT(6); 
								  OUTPUT(7) <= INPUT(7);
  ELSIF(control = "01") then OUTPUT(0) <= INPUT(8); 
								  OUTPUT(1) <= INPUT(9); 
								  OUTPUT(2) <= INPUT(10); 
								  OUTPUT(3) <= INPUT(11); 
								  OUTPUT(4) <= INPUT(12); 
								  OUTPUT(5) <= INPUT(13); 
								  OUTPUT(6) <= INPUT(14); 
								  OUTPUT(7) <= INPUT(15);
  ELSIF(control = "10") then OUTPUT(0) <= INPUT(16); 
								  OUTPUT(1) <= INPUT(17); 
								  OUTPUT(2) <= INPUT(18); 
								  OUTPUT(3) <= INPUT(19); 
								  OUTPUT(4) <= INPUT(20); 
								  OUTPUT(5) <= INPUT(21); 
								  OUTPUT(6) <= INPUT(22); 
								  OUTPUT(7) <= INPUT(23);
  ELSIF(control = "11") then OUTPUT(0) <= INPUT(24); 
								  OUTPUT(1) <= INPUT(25); 
								  OUTPUT(2) <= INPUT(26); 
								  OUTPUT(3) <= INPUT(27); 
								  OUTPUT(4) <= INPUT(28); 
								  OUTPUT(5) <= INPUT(29); 
								  OUTPUT(6) <= INPUT(30); 
								  OUTPUT(7) <= INPUT(31);
 ELSE OUTPUT <= "11111111";
 END IF;
 END PROCESS;

end Behavioral;

