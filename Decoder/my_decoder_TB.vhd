-- Author: Caroline Lichtenberger
-- 12/04/12
-- Description: 2 to 4 Decoder Test Bench

LIBRARY ieee;
USE ieee.std_logic_1164.all;

--Entity Declaration
ENTITY my_decoder_TB IS
END my_decoder_TB;

-- Architecture Declaration
ARCHITECTURE TB_decoder OF my_decoder_TB IS
	-- Component: my_decoder
	COMPONENT my_decoder IS
		PORT(
			EN		:	IN 	STD_LOGIC;
			DATA	:	IN	STD_LOGIC_VECTOR(1 DOWNTO 0);
			Q		:	OUT STD_LOGIC_VECTOR (3 DOWNTO 0)
		);
	END COMPONENT my_decoder;
	
	-- Signal Declarations
	-- Inputs
	SIGNAL sInputs	:	STD_LOGIC_VECTOR(1 DOWNTO 0);
	SIGNAL sENInput	:	STD_LOGIC;
	-- Outputs
	SIGNAL sOutputs	:	STD_LOGIC_VECTOR(3 DOWNTO 0);
	
	-- Constant Declaration
	-- Used for delay
	CONSTANT delay	:	time:= 40 nS;
		
BEGIN
	-- Port map
	uut	:	my_decoder
	PORT MAP(
		EN		=>	sENInput,
		DATA(0) =>	sInputs(0),
		DATA(1) =>	sInputs(1),
		Q(0)	=>	sOutputs(0),
		Q(1)	=>	sOutputs(1),
		Q(2)	=>	sOutputs(2),
		Q(3)	=>	sOutputs(3)
	);
	-- Verification process
	verification	:	PROCESS
		BEGIN
		
		-- State 0, Enable low
		sENInput	<=	'0';
		sInputs		<=	"00";
		WAIT FOR delay;
		ASSERT(sOutputs = "0000") REPORT "Error for ENABLE input" SEVERITY ERROR;
		
		-- State 1, Enable low
		sENInput	<=	'0';
		sInputs		<=	"01";
		WAIT FOR delay;
		ASSERT(sOutputs = "0000") REPORT "Error for ENABLE input" SEVERITY ERROR;
		
		-- State 2, Enable low
		sENInput	<=	'0';
		sInputs		<=	"10";
		WAIT FOR delay;
		ASSERT(sOutputs = "0000") REPORT "Error for ENABLE input" SEVERITY ERROR;
		
		-- State 3, Enable low
		sENInput	<=	'0';
		sInputs		<=	"11";
		WAIT FOR delay;
		ASSERT(sOutputs = "0000") REPORT "Error for ENABLE input" SEVERITY ERROR;
		
		-- State 0, Enable high
		sENInput	<=	'1';
		sInputs		<=	"00";
		WAIT FOR delay;
		ASSERT(sOutputs = "0001") REPORT "Error for ENABLE input" SEVERITY ERROR;
		
		-- State 1, Enable high
		sENInput	<=	'1';
		sInputs		<=	"01";
		WAIT FOR delay;
		ASSERT(sOutputs = "0010") REPORT "Error for ENABLE input" SEVERITY ERROR;
		
		-- State 2, Enable high
		sENInput	<=	'1';
		sInputs		<=	"10";
		WAIT FOR delay;
		ASSERT(sOutputs = "0100") REPORT "Error for ENABLE input" SEVERITY ERROR;
		
		-- State 3, Enable high
		sENInput	<=	'1';
		sInputs		<=	"11";
		WAIT FOR delay;
		ASSERT(sOutputs = "1000") REPORT "Error for ENABLE input" SEVERITY ERROR;
		
		END PROCESS verification;
		
END TB_decoder;