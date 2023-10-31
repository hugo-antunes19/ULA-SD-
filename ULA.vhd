----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Hugo Antunes, Giovanni e Bernardo Pozzato
-- 
-- Create Date:    31/10/2023
-- Module Name:    ULA - Behavioral 
-- Revision 0.01 - File Created
-- Additional Comments: Módulo da ULA, que importa todos os outros módulos
-- 			como componentes.
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Nomeação da entidade e os parâmetros

entity ULA is
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
end ULA;

architecture Behavioral of ULA is

-- Importação dos componentes utilizados (oito operações no total)

component addOne is
    Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           cout : out  STD_LOGIC;
           zeroFlag : out  STD_LOGIC;
           signFlag : out  STD_LOGIC;
           ovFlag : out  STD_LOGIC;
           sum : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

component shifte is
    Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           ovFlag : out  STD_LOGIC;
           result : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

component shiftr is
    Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           resultr : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

component inversor is
    Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
			  invertido : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

component comparador is
    Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           y : in  STD_LOGIC_VECTOR (3 downto 0);
           resultado : out  STD_LOGIC_VECTOR (2 downto 0));
end component;

component fourBitAdder is
    Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           y : in  STD_LOGIC_VECTOR (3 downto 0);
           cin : in  STD_LOGIC;
           cout : out  STD_LOGIC;
           zeroFlag : out  STD_LOGIC;
           signFlag : out  STD_LOGIC;
           ovFlag : out  STD_LOGIC;
           sum : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

component fourBitSubtractor is
    Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           y : in  STD_LOGIC_VECTOR (3 downto 0);
           borrowFlag : out  STD_LOGIC;
           zeroFlag : out  STD_LOGIC;
           signFlag : out  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (3 downto 0));
end component;


component twosComplementer is
    Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           zeroFlag : out  STD_LOGIC;
           signFlag : out  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

-- Nomeação das variáveis temporárias abaixo

-- Outputs:
SIGNAL addOneOutput : STD_LOGIC_VECTOR (3 downto 0);
SIGNAL fourBitAdderOutput : STD_LOGIC_VECTOR (3 downto 0);
SIGNAL fourBitSubtractorOutput : STD_LOGIC_VECTOR (3 downto 0);
SIGNAL twosComplementerOutput : STD_LOGIC_VECTOR (3 downto 0);
SIGNAL shifteOutput : STD_LOGIC_VECTOR (3 downto 0);
SIGNAL shiftrOutput : STD_LOGIC_VECTOR (3 downto 0);
SIGNAL inversorOutput : STD_LOGIC_VECTOR (3 downto 0);
SIGNAL comparadorOutput : STD_LOGIC_VECTOR (2 downto 0);

-- Demais variáveis utilizadas
SIGNAL addOneCOut, fourBitAdderCOut, fourBitSubtractorCOut : STD_LOGIC;
SIGNAL addOneZeroFlag, fourBitAdderZeroFlag, fourBitSubtractorZeroFlag, twosComplementerZeroFlag, inversorZeroFlag : STD_LOGIC;
SIGNAL addOneSignFlag, fourBitAdderSignFlag, fourBitSubtractorSignFlag, twosComplementerSignFlag, shifteSignFlag : STD_LOGIC;
SIGNAL addOneOVFlag, fourBitAdderOVFlag, fourBitSubtractorOVFlag, shifteOVFlag: STD_LOGIC;

BEGIN

-- Label para cada operação

addOneLabel: addOne port map (x, addOneCOut, addOneZeroFlag, addOneSignFlag, addOneOVFlag, addOneOutput);
fourBitAdderLabel: fourBitAdder port map (x, y, '0', fourBitAdderCOut, fourBitAdderZeroFlag, fourBitAdderSignFlag, fourBitAdderOVFlag, fourBitAdderOutput);
fourBitSubtractorLabel : fourBitSubtractor port map (x, y, fourBitSubtractorcout, fourBitSubtractorzeroFlag, fourBitSubtractorsignFlag, fourBitSubtractoroutput);
twosComplementerLabel : twosComplementer port map (x, twosComplementerzeroFlag, twosComplementersignFlag, twosComplementeroutput);
shifteLabel: shifte port map(x, shifteOVFlag, shifteOutput);
shiftrLabel: shiftr port map(x , shiftrOutput);
inversorLabel: inversor port map(x, inversorOutput);
comparadorLabel: comparador port map(x, y, comparadorOutput);


process(selection, addOneOutput, fourBitAdderOutput, fourBitSubtractorOutput, twosComplementerOutput,comparadorOutput,shifteOutput)

begin

-- Utilização do seletor para escolher qual operação será o output

	case selection is
		when "000" => -- addOne
			cout <= addOneZeroFlag;
			zeroFlag <= addOneZeroFlag;
			signFlag <= addOneSignFlag;
			ovFlag <= addOneOVFlag;
			output <= addOneOutput;
		when "001" => -- shifte
			cout <= '0';
			signFlag <= shifteOutput(3);
			ovFlag <= shifteOVFlag;
			output <= shifteOutput;
		when "010" => -- fourBitAdder
			cout <= fourBitAdderCOut;
			zeroFlag <= fourBitAdderZeroFlag;
			signFlag <= fourBitAdderSignFlag;
			ovFlag <= fourBitAdderOVFlag;
			output <= fourBitAdderOutput;
		when "011" => -- fourBitSubtractor
			cout <= fourBitSubtractorCOut;
			zeroFlag <= fourBitSubtractorZeroFlag;
			signFlag <= fourBitSubtractorSignFlag;
			ovFlag <= fourBitSubtractorOVFlag;
			output <= fourBitSubtractorOutput;
		when "100" => -- shiftr
			cout <= '0';
			output <= shiftrOutput;
			signFlag <= shiftrOutput(3);
		when "101" => -- comparador
			igual <= comparadorOutput(2);
			ymaior <= comparadorOutput(1);
			xmaior <= comparadorOutput(0);
		when "110" => -- twosComplementer
			cout <= '0';
			zeroFlag <= twosComplementerZeroFlag;
			signFlag <= twosComplementerSignFlag;
			ovFlag <= '0';
			output <= twosComplementerOutput;
		when "111" => -- inversor
			cout <= '0';
			zeroFlag <= '0';
			signFlag <= inversorOutput(3);
			ovFlag <= '0';
			output <= inversorOutput;
		when others =>

	end case;

end process; 
	

END Behavioral;
