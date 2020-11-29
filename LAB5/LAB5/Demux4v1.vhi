
-- VHDL Instantiation Created from source file Demux4v1.vhd -- 00:18:23 05/14/2017
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT Demux4v1
	PORT(
		Input1 : IN std_logic_vector(7 downto 0);
		Sign : IN std_logic_vector(1 downto 0);
		Input2 : IN std_logic_vector(7 downto 0);
		Input3 : IN std_logic_vector(7 downto 0);
		Input4 : IN std_logic_vector(7 downto 0);          
		Output : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

	Inst_Demux4v1: Demux4v1 PORT MAP(
		Input1 => ,
		Output => ,
		Sign => ,
		Input2 => ,
		Input3 => ,
		Input4 => 
	);


