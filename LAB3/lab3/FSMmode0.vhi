
-- VHDL Instantiation Created from source file FSMmode0.vhd -- 20:10:40 04/12/2017
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT FSMmode0
	PORT(
		Push : IN std_logic;
		Pop : IN std_logic;
		Mode : IN std_logic;
		Reset : IN std_logic;
		Clock : IN std_logic;
		NUMIN : IN std_logic_vector(7 downto 0);          
		NUMOUT : OUT std_logic_vector(7 downto 0);
		SSD_EN : OUT std_logic_vector(3 downto 0);
		SSD : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

	Inst_FSMmode0: FSMmode0 PORT MAP(
		Push => ,
		Pop => ,
		Mode => ,
		Reset => ,
		Clock => ,
		NUMIN => ,
		NUMOUT => ,
		SSD_EN => ,
		SSD => 
	);


