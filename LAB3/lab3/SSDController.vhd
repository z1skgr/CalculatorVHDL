----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:56:22 03/27/2017 
-- Design Name: 
-- Module Name:    SSDController - Behavioral 
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

entity SSDController is
	PORT (Clk : in  STD_LOGIC;
         Rst : in  STD_LOGIC;
         Empty : in  STD_LOGIC;
         Full : in  STD_LOGIC;
         Stack_OVF : in  STD_LOGIC;
			ANcontrol : out STD_LOGIC_VECTOR(3 downto 0);
			SSControl : out STD_LOGIC_VECTOR(7 downto 0));
end SSDController;

architecture Behavioral of SSDController is

Signal CounterPipe : STD_LOGIC;
Signal FSMOutPipe : STD_LOGIC_VECTOR(3 downto 0);
Signal muxInPipe: STD_LOGIC_VECTOR(31 downto 0);
Signal muxControl : STD_LOGIC_VECTOR(1 downto 0);

COMPONENT BehCounter IS
    Port ( Clk : in  STD_LOGIC;
           Rst : in  STD_LOGIC;
			  Q : out  STD_LOGIC);
END COMPONENT;

COMPONENT SSDFSM is
    Port ( Clk : in  STD_LOGIC;
           Rst : in  STD_LOGIC;
			  En  : in Std_logic;
           State_output : out  STD_LOGIC_VECTOR (3 downto 0));
end COMPONENT;

COMPONENT MUX32x8 is
    Port ( INPUT : in  STD_LOGIC_VECTOR (31 downto 0);
           control : in  STD_LOGIC_VECTOR(1 downto 0);
           OUTPUT : out  STD_LOGIC_VECTOR (7 downto 0));
end COMPONENT;

COMPONENT Decoder is
    Port ( E : in  STD_LOGIC;
           F : in  STD_LOGIC;
			  OV : in  STD_LOGIC;
           segmentLED : out  STD_LOGIC_VECTOR (31 downto 0));
end COMPONENT;

COMPONENT Coder is
    Port ( Input : in  STD_LOGIC_VECTOR (3 downto 0);
           Output : out  STD_LOGIC_VECTOR (1 downto 0));
end COMPONENT;

begin

count: BehCounter 
	PORT MAP (Clk => Clk,
				 Rst => Rst,
				 Q => CounterPipe);
				 
TheFSM: SSDFSM
	PORT MAP (Clk => Clk,
				 Rst => Rst,
				 En => CounterPipe,
				 State_output => FSMOutPipe);
				 
Mux: MUX32x8 
	PORT MAP(INPUT => muxInPipe, 
				control=>muxControl, 
				OUTPUT => SSControl);

myDecoder: Decoder 
	PORT MAP(E => Empty, 
				F => Full, 
				OV => Stack_OVF, 
				segmentLED => muxInPipe); 
				
myCoder: Coder
	PORT MAP(Input => FSMOutPipe,
				Output => muxControl);
				
ANControl <= FSMOutPipe;

end Behavioral;

