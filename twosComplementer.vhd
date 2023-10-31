----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Hugo Antunes, Giovanni e Bernardo Pozzato
-- 
-- Create Date:    31/10/2023
-- Module Name:    TwosComplementer - Behavioral 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Para transformar um número em complemento a dois:
-- Inverte ( x = NOT x )
-- E soma um ( addOne)

entity twosComplementer is
    Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           zeroFlag : out  STD_LOGIC;
           signFlag : out  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (3 downto 0));
end twosComplementer;

architecture Behavioral of twosComplementer is

-- componente do addOne importado abaixo

component addOne is
    Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           cout : out  STD_LOGIC;
           zeroFlag : out  STD_LOGIC;
           signFlag : out  STD_LOGIC;
           ovFlag : out  STD_LOGIC;
           sum : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

-- Criação das variáveis temporárias

SIGNAL sumAdder : STD_LOGIC;
SIGNAL coutAdder : STD_LOGIC;
SIGNAL zeroFlagAdder : STD_LOGIC;
SIGNAL signFlagAdder : STD_LOGIC;
SIGNAL ovFlagAdder : STD_LOGIC;
SIGNAL notX : STD_LOGIC_VECTOR(3 downto 0);


begin

	notX <= NOT x;
	label3: addOne port map (notX,coutAdder,zeroFlagAdder, signFlagAdder, ovFlagAdder, output);

end Behavioral;