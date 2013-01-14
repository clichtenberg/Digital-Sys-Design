-- Author: Caroline Lichtenberger
-- 12/13/12
-- Description: Define the top logic block for the multiplier

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Top_Block IS
	PORT(
		TOP_IN		:	IN	STD_LOGIC_VECTOR(4 DOWNTO 0);	-- Q1, Q0, Cin, Mn+1, Mn
		TOP_COUT	:	OUT	STD_LOGIC;	-- Cout
		TOP_SUM		:	OUT STD_LOGIC	-- Sum
	);
END Top_Block;

ARCHITECTURE Top_Arch OF Top_Block IS
	SIGNAL add_data	:	STD_LOGIC_VECTOR(1 DOWNTO 0);
	COMPONENT Full_Adder
		PORT(
			adder_inputs	:	IN	STD_LOGIC_VECTOR(2 DOWNTO 0);
			adder_sum		:	OUT	STD_LOGIC;
			adder_cout		:	OUT	STD_LOGIC
		);
	END COMPONENT;
BEGIN
	add_data(1) <= (TOP_IN(1) AND TOP_IN(3));
	add_data(0) <= (TOP_IN(0) AND TOP_IN(4));
	
	stage0	:	Full_Adder PORT MAP(
				adder_inputs(2) => add_data(1),
				adder_inputs(1) => add_data(0),
				adder_inputs(0) => TOP_IN(2),
				adder_sum => TOP_SUM,
				adder_cout => TOP_COUT
				);
END Top_Arch;