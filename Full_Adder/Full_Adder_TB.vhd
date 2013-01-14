-- Author: Caroline Lichtenberger
-- 12/06/12
-- Description: Full adder test bench exhaustively tests all input combinations
LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Full_Adder_TB IS
END Full_Adder_TB;

ARCHITECTURE TB_Output OF Full_Adder_TB IS
	-- Component
	COMPONENT Full_Adder IS
		PORT(
			adder_inputs	:	IN	STD_LOGIC_VECTOR(2 DOWNTO 0);
			adder_sum		:	OUT	STD_LOGIC;
			adder_cout		:	OUT	STD_LOGIC
		);
	END COMPONENT Full_Adder;
	-- Signals
	-- Inputs
	SIGNAL sInputs		:	STD_LOGIC_VECTOR(2 DOWNTO 0);
	-- Outputs
	SIGNAL sOutputs		:	STD_LOGIC_VECTOR(1 DOWNTO 0);
	-- Constant: delay
	CONSTANT delay	: time := 50 nS;
BEGIN
	uut : Full_Adder
	PORT MAP(
		adder_inputs(0)	=>	sInputs(0),
		adder_inputs(1)	=>	sInputs(1),
		adder_inputs(2)	=>	sInputs(2),
		adder_sum		=>	sOutputs(0),
		adder_cout		=>	sOutputs(1)
	);
	verification : PROCESS
		BEGIN
		sInputs	<=	"000";
		WAIT FOR delay;
		ASSERT(sOutputs = "00") REPORT "Error for input combination" SEVERITY ERROR;
		
		sInputs	<=	"001";
		WAIT FOR delay;
		ASSERT(sOutputs = "01") REPORT "Error for input combination" SEVERITY ERROR;
		
		sInputs	<=	"010";
		WAIT FOR delay;
		ASSERT(sOutputs = "01") REPORT "Error for input combination" SEVERITY ERROR;
		
		sInputs	<=	"011";
		WAIT FOR delay;
		ASSERT(sOutputs = "10") REPORT "Error for input combination" SEVERITY ERROR;
		
		sInputs	<=	"100";
		WAIT FOR delay;
		ASSERT(sOutputs = "01") REPORT "Error for input combination" SEVERITY ERROR;
		
		sInputs	<=	"101";
		WAIT FOR delay;
		ASSERT(sOutputs = "10") REPORT "Error for input combination" SEVERITY ERROR;
		
		sInputs	<=	"110";
		WAIT FOR delay;
		ASSERT(sOutputs = "10") REPORT "Error for input combination" SEVERITY ERROR;
		
		sInputs	<=	"111";
		WAIT FOR delay;
		ASSERT(sOutputs = "11") REPORT "Error for input combination" SEVERITY ERROR;
		
	END PROCESS verification;
END TB_OUTPUT;