-- Author: Caroline Lichtenberger
-- Date: 12/12/12
-- Description: 4x4 multiplier

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY multiplier IS
	PORT(
		Q	:	IN	STD_LOGIC_VECTOR(3 DOWNTO 0);	-- Multiplier
		M	:	IN	STD_LOGIC_VECTOR(3 DOWNTO 0);	-- Multiplicand
		P	:	OUT	STD_LOGIC_VECTOR(7 DOWNTO 0)	-- Product
	);
END multiplier;

ARCHITECTURE Multiplier_arch OF multiplier IS
	SIGNAL part_prod, carry : STD_LOGIC_VECTOR(11 DOWNTO 0);
	SIGNAL temp0, temp1, temp2, temp3	:	STD_LOGIC_VECTOR(4 DOWNTO 0);
	SIGNAL temp4, temp5, temp6, temp7, temp8, temp9, temp10, temp11 : STD_LOGIC_VECTOR(3 DOWNTO 0);

	COMPONENT Bottom_Block
		PORT(
			BOT_IN	:	IN STD_LOGIC_VECTOR(3 DOWNTO 0); -- Qn, Mn, PPn, Cin
			BOT_COUT	:	OUT STD_LOGIC; -- Cout
			BOT_SUM		:	OUT STD_LOGIC -- Sum
		);
	END COMPONENT;
	COMPONENT Top_Block
		PORT(
			TOP_IN		:	IN	STD_LOGIC_VECTOR(4 DOWNTO 0);	-- Q1, Q0, Cin, Mn+1, Mn
			TOP_COUT	:	OUT	STD_LOGIC;	-- Cout
			TOP_SUM		:	OUT STD_LOGIC	-- Sum
		);
	END COMPONENT;
BEGIN
	P(0) <= M(0) AND Q(0);
	temp0 <= Q(1) & Q(0)& '0' & M(1) & M(0);	-- Q1, Q0, Cin, Mn+1, Mn
	temp1 <= Q(1) & Q(0)& carry(0)& M(2)& M(1);
	temp2 <= Q(1)& Q(0)& carry(1)& M(3)& M(2);
	temp3 <= Q(1)& Q(0)& carry(2)& '0'& M(3);
	temp4 <= Q(2)& M(0)& part_prod(0)& '0';		-- Qn, Mn, PPn, Cin
	temp5 <= Q(2)& M(1)& part_prod(1)& carry(4);
	temp6 <= Q(2)& M(2)& part_prod(2)& carry(5);
	temp7 <= Q(2)& M(3)& carry(3)& carry(6);
	temp8 <= Q(3)& M(0)& part_prod(3)& '0';
	temp9 <= Q(3)& M(1)& part_prod(4)& carry(8);
	temp10 <= Q(3)& M(2)& part_prod(5)& carry(9);
	temp11 <= Q(3)& M(3)& carry(7)& carry(10);
	stage0  : Top_Block PORT MAP(temp0, carry(0), P(1)); -- Cout Sum
	stage1  : Top_Block PORT MAP(temp1, carry(1), part_prod(0));
	stage2  : Top_Block PORT MAP(temp2, carry(2), part_prod(1));
	stage3  : Top_Block PORT MAP(temp3, carry(3), part_prod(2));
	stage4  : Bottom_Block PORT MAP(temp4, carry(4), P(2));
	stage5  : Bottom_Block PORT MAP(temp5, carry(5), part_prod(3)); -- Cout Sum
	stage6  : Bottom_Block PORT MAP(temp6, carry(6), part_prod(4));
	stage7  : Bottom_Block PORT MAP(temp7, carry(7), part_prod(5));
	stage8  : Bottom_Block PORT MAP(temp8, carry(8), P(3));
	stage9  : Bottom_Block PORT MAP(temp9, carry(9), P(4));
	stage10 : Bottom_Block PORT MAP(temp10, carry(10), P(5));
	stage11 : Bottom_Block PORT MAP(temp11, P(7), P(6));
END multiplier_arch;