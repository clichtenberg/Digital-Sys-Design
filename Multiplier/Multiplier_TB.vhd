LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;

ENTITY Multiplier_TB IS
END Multiplier_TB;

ARCHITECTURE TB_Beh OF Multiplier_TB IS 
	COMPONENT Multiplier IS
		PORT(
			Q	:	IN	STD_LOGIC_VECTOR(3 DOWNTO 0);	-- Multiplier
			M	:	IN	STD_LOGIC_VECTOR(3 DOWNTO 0);	-- Multiplicand
			P	:	OUT	STD_LOGIC_VECTOR(7 DOWNTO 0)	-- Product
		);
	END COMPONENT;
	-- Inputs
	SIGNAL qInputs,mInputs	:	STD_LOGIC_VECTOR(3 DOWNTO 0);
	-- Outputs
	SIGNAL pOutputs		:	STD_LOGIC_VECTOR(7 DOWNTO 0);
	-- Constant: delay
	CONSTANT delay	: time := 65 nS;
BEGIN
	uut : Multiplier
	PORT MAP(
		Q => qInputs,
		M => mInputs,
		P => pOutputs
	);
	verification : PROCESS
	BEGIN
		FOR i IN 0 TO 15 LOOP
			mInputs <= CONV_STD_LOGIC_VECTOR(i,4);
			
			FOR j IN 0 TO 15 LOOP
				qInputs <= CONV_STD_LOGIC_VECTOR(j,4);
				WAIT FOR delay;
				ASSERT(pOutputs = qInputs*mInputs) REPORT "All aboard the fail bus!" SEVERITY FAILURE;
			END LOOP;
		END LOOP;
		REPORT "Done";
		wait;
	END PROCESS verification;
		
END TB_Beh;