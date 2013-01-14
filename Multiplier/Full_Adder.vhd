-- Author: Caroline Lichtenberger
-- 12/06/12
-- Description: Full Adder
LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Full_Adder IS
	PORT(
		adder_inputs	:	IN	STD_LOGIC_VECTOR(2 DOWNTO 0);	-- X Y Cin
		adder_sum		:	OUT	STD_LOGIC;
		adder_cout		:	OUT	STD_LOGIC
	);
END Full_Adder;

ARCHITECTURE full_adder_arch OF Full_Adder IS
	SIGNAL bunched_inputs	:	STD_LOGIC_VECTOR(2 DOWNTO 0);
BEGIN
	bunched_inputs <= adder_inputs(2) & adder_inputs(1) & adder_inputs(0);
	WITH bunched_inputs SELECT
	adder_sum <=	'0' WHEN "000",
					'1' WHEN "001",
					'1' WHEN "010",
					'0' WHEN "011",
					'1' WHEN "100",
					'0' WHEN "101",
					'0' WHEN "110",
					'1' WHEN "111",
					'0' WHEN OTHERS;
	WITH bunched_inputs SELECT
	adder_cout <=	'0' WHEN "000",
					'0' WHEN "001",
					'0' WHEN "010",
					'1' WHEN "011",
					'0' WHEN "100",
					'1' WHEN "101",
					'1' WHEN "110",
					'1' WHEN "111",
					'0' WHEN OTHERS;
END full_adder_arch;