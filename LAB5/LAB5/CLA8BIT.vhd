----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:22:17 05/06/2017 
-- Design Name: 
-- Module Name:    CLA8BIT - Behavioral 
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

entity CLA8BIT is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           M : in  STD_LOGIC;
           Result : out  STD_LOGIC_VECTOR (7 downto 0);
           COUT : out  STD_LOGIC;
           V : out  STD_LOGIC);
end CLA8BIT;

architecture Behavioral of CLA8BIT is
component CLA is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
			  M : in STD_LOGIC;
           Cin : in  STD_LOGIC;
           SUM : out  STD_LOGIC_VECTOR (3 downto 0);
			  V:out std_logic;
			  Cout: out STD_LOGIC
           );
end component;
signal Csignal,V1,V2:std_logic;
begin
CLA1: CLA PORT MAP (A(0)=>A(0),
					A(1)=>A(1),
					A(2)=>A(2),
					A(3)=>A(3),
					B(0)=>B(0),
					B(1)=>B(1),
					B(2)=>B(2),
					B(3)=>B(3),
					M=>M,
					Cin=>M,
					SUM(0)=>Result(0),
					SUM(1)=>Result(1),
					SUM(2)=>Result(2),
					SUM(3)=>Result(3),
					Cout=>Csignal
						);
						
CLA2: CLA PORT MAP (A(0)=>A(4),
					A(1)=>A(5),
					A(2)=>A(6),
					A(3)=>A(7),
					B(0)=>B(4),
					B(1)=>B(5),
					B(2)=>B(6),
					B(3)=>B(7),
					M=>M,
					Cin=>Csignal,
					SUM(0)=>Result(4),
					SUM(1)=>Result(5),
					SUM(2)=>Result(6),
					SUM(3)=>Result(7),
					Cout=>COUT,
					V=>V);



end Behavioral;

