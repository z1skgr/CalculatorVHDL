----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:18:59 03/07/2017 
-- Design Name: 
-- Module Name:    CarryGPU - Behavioral 
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

entity CarryGPU is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
			  M : in STD_LOGIC;
           P : out  STD_LOGIC_VECTOR (3 downto 0);
           G : out  STD_LOGIC_VECTOR (3 downto 0));
			  
end CarryGPU;


architecture Behavioral of CarryGPU is

Component Generate_Propagate Is
Port ( 	  A : in  STD_LOGIC;
           B : in  STD_LOGIC;
			  M : in STD_LOGIC;
           P : out  STD_LOGIC;
           G : out  STD_LOGIC);
end Component;

begin
GP0 : Generate_Propagate PORT MAP(A=>A(0),B=>B(0),M=>M,P=>P(0),G=>G(0));
GP1 : Generate_Propagate PORT MAP(A=>A(1),B=>B(1),M=>M,P=>P(1),G=>G(1));
GP2 : Generate_Propagate PORT MAP(A=>A(2),B=>B(2),M=>M,P=>P(2),G=>G(2));
GP3 : Generate_Propagate PORT MAP(A=>A(3),B=>B(3),M=>M,P=>P(3),G=>G(3));


end Behavioral;

