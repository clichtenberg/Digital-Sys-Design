-- Author: Caroline Lichtenberger
-- 12/04/12
-- Description: 2 to 4 Decoder

LIBRARY ieee; 
USE ieee.std_logic_1164.all;

-- Entity Declaration
ENTITY my_decoder IS
	PORT(
		EN		:	IN STD_LOGIC;
		DATA	:	IN	STD_LOGIC_VECTOR(1 DOWNTO 0);
		Q		:	OUT STD_LOGIC_VECTOR (3 DOWNTO 0)
	);
END my_decoder;

-- Architecture Declaration
ARCHITECTURE Output OF my_decoder IS
BEGIN
	Q(0) <= EN AND (NOT DATA(1)) AND (NOT DATA(0));
	Q(1) <= EN AND (NOT DATA(1)) AND DATA(0);
	Q(2) <= EN AND DATA(1) AND (NOT DATA(0));
	Q(3) <= EN AND DATA(1) AND DATA(0);
END Output;