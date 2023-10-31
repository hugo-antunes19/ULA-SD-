----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Hugo Antunes, Giovanni e Bernardo Pozzato
-- 
-- Create Date:    31/10/2023
-- Design Name: 
-- Module Name:    fourBitSubtractor - Behavioral 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fourBitSubtractor is
    Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           y : in  STD_LOGIC_VECTOR (3 downto 0);
           borrowFlag : out  STD_LOGIC;
           zeroFlag : out  STD_LOGIC;
           signFlag : out  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (3 downto 0));
end fourBitSubtractor;

architecture Behavioral of fourBitSubtractor is

-- Operação declarada assumindo que seja ( X - Y )
-- Vale lembrar que a subtração nada mais é que a soma de um número negativo
-- Para transformar o número y em negativo basta passarmos ele para complemento a dois

-- Abaixo declaramos os componentes utilizados para realizar a subtração

component inversor is
    Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
	        zeroFlag : out  STD_LOGIC;
           invertido : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

component twosComplementer is
    Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           zeroFlag : out  STD_LOGIC;
           signFlag : out  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (3 downto 0));
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

-- Abaixo declaramos as variáveis temporárias (SIGNALs) que usaremos

SIGNAL borrow : STD_LOGIC;
SIGNAL zeroFlagComp : STD_LOGIC;
SIGNAL signFlagComp : STD_LOGIC;
SIGNAL borrowFlagComp : STD_LOGIC;
SIGNAL complemented : STD_LOGIC_VECTOR (3 downto 0);
SIGNAL complemented1 : STD_LOGIC_VECTOR (3 downto 0);
SIGNAL subtraido_1: STD_LOGIC_VECTOR (3 downto 0);
SIGNAL R1: STD_LOGIC_VECTOR (3 downto 0);
SIGNAL R2: STD_LOGIC_VECTOR (3 downto 0);

begin

-- A operação mencionada no início desse texto está sendo feita abaixo

pos_neg: twosComplementer port map (y, zeroFlagComp, signFlagComp, complemented);
subtract1: fourBitAdder port map (x, complemented, '0', borrow, zeroFlag, signFlag, borrowFlag, output);

end Behavioral;

