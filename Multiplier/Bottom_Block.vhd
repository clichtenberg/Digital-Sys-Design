-- Author: Caroline Lichtenberger
-- 12/13/12
-- Description: Define the bottom logic block for the multiplier

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Bottom_Block IS
	PORT(
		BOT_IN		:	IN STD_LOGIC_VECTOR(3 DOWNTO 0); -- Qn, Mn, PPn, Cin
		BOT_COUT	:	OUT STD_LOGIC; -- Cout
		BOT_SUM		:	OUT STD_LOGIC -- Sum
	);
END Bottom_Block;

ARCHITECTURE Bot_Arch OF Bottom_Block IS
	SIGNAL data0	:	STD_LOGIC;
	COMPONENT Full_Adder
		PORT(
			adder_inputs	:	IN	STD_LOGIC_VECTOR(2 DOWNTO 0);
			adder_sum		:	OUT	STD_LOGIC;
			adder_cout		:	OUT	STD_LOGIC
		);
	END COMPONENT;
BEGIN
	data0 <= (BOT_IN(3) AND BOT_IN(2));
	
	stage0	:	Full_Adder PORT MAP(
				adder_inputs(2) => data0,
				adder_inputs(1) => BOT_IN(1),
				adder_inputs(0) => BOT_IN(0),
				adder_sum => BOT_SUM,
				adder_cout => BOT_COUT
				);
END Bot_Arch;