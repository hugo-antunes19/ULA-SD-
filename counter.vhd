----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Hugo Antunes, Giovanni e Bernardo Pozzato
-- 
-- Create Date:    31/10/2023
-- Module Name:    counter - Behavioral 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity counter is
    Port ( selector : in  STD_LOGIC_VECTOR (2 downto 0);
           clk : in  STD_LOGIC;
           step : out  STD_LOGIC_VECTOR (1 downto 0);
           leds : out  STD_LOGIC_VECTOR (3 downto 0));
end counter;

architecture Behavioral of counter is

-- importamos a ULA como componente

component ULA is
    Port ( selection : in STD_LOGIC_VECTOR (2 downto 0);
			   x : in  STD_LOGIC_VECTOR (3 downto 0);
            y : in  STD_LOGIC_VECTOR (3 downto 0);
           cout : out  STD_LOGIC;
           zeroFlag : out  STD_LOGIC;
           signFlag : out  STD_LOGIC;
           ovFlag : out  STD_LOGIC;
			  xmaior: out STD_LOGIC;
			  ymaior: out STD_LOGIC;
			  igual: out STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

-- Steps:
-- #00: Show inputV1
-- #01: Show inputV2
-- #02: Show Results
-- #03: Show Flags

-- CountVector
SIGNAL counterVector : UNSIGNED (7 downto 0) := "00000000";

-- Flags:
SIGNAL ledCOut : STD_LOGIC := '0';
SIGNAL ledZeroFlag : STD_LOGIC := '0';
SIGNAL ledSignFlag : STD_LOGIC := '0';
SIGNAL ledOVFlag : STD_LOGIC := '0';

-- comparador:
SIGNAL xmaior: STD_LOGIC;
SIGNAL ymaior: STD_LOGIC;
SIGNAL igual: STD_LOGIC;

-- Input Vectors:
SIGNAL inputV1 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
SIGNAL inputV2 : STD_LOGIC_VECTOR (3 downto 0) := "0000";

-- Output
SIGNAL outputVector : STD_LOGIC_VECTOR (3 downto 0) := "0000";


begin

-- Map Vectors:
inputV1(0) <= counterVector(0);
inputV1(1) <= counterVector(1);
inputV1(2) <= counterVector(2);
inputV1(3) <= counterVector(3);
inputV2(0) <= counterVector(4);
inputV2(1) <= counterVector(5);
inputV2(2) <= counterVector(6);
inputV2(3) <= counterVector(7);

-- Map ULA:
use_ULA: ULA port map (selector, inputV1, inputV2, ledCOut, ledZeroFlag, ledSignFlag, ledOVFlag,xmaior, ymaior, igual, outputVector);

process(clk)

	VARIABLE showSteps : integer range 3 downto 0 := 0;

-- O clock considerado deve ser o da placa, caso contrário utilizar o módulo countertest
-- Clock up pulse
begin
if (clk'event and clk = '1') then

-- cada if retornará algo diferente, ou seja,
-- uma hora retornará o número x, outra hora o y
-- outra hora o output e os flags

	if ( showSteps = 0 ) then -- Input1
		leds <= inputV1;
		step <= "00";
	elsif ( showSteps = 1) then -- Input2
		leds <= inputV2;
		step <= "01";
	elsif ( showSteps = 2 ) then -- Result
		leds <= outputVector;
		step <= "10";
	elsif ( showSteps = 3 ) then -- Flags
		leds(0) <= ledCOut;
		leds(1) <= ledZeroFlag;
		leds(2) <= ledSignFlag;
		leds(3) <= ledOVFlag;
		step <= "11";
		counterVector <= counterVector + 1;
	end if;
	
	if ( showSteps = 3 ) then
		showSteps := 0;
	else
		showSteps := showSteps +1;
	end if;
	
end if;

end process;	

end Behavioral;