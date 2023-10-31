----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Hugo Antunes, Giovanni e Bernardo Pozzato
-- 
-- Create Date:    31/10/2023
-- Module Name:    addOne - Behavioral 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity addOne is
    Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           cout : out  STD_LOGIC;
           zeroFlag : out  STD_LOGIC;
           signFlag : out  STD_LOGIC;
           ovFlag : out  STD_LOGIC;
           sum : out  STD_LOGIC_VECTOR (3 downto 0));
end addOne;

architecture Behavioral of addOne is

-- Importing fourBitAdder

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

-- Cria as variáveis temporárias

SIGNAL sumAdder : STD_LOGIC;
SIGNAL zeroFlagAdder : STD_LOGIC;
SIGNAL signFlagAdder : STD_LOGIC;
SIGNAL ovFlagAdder : STD_LOGIC;

SIGNAL fBAdder : STD_LOGIC_VECTOR(3 downto 0);
SIGNAL zeroVector : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');

begin

-- Faz a operação de adição utilizando o fourBitAdder, mas com o cin sendo 1

	label2: fourBitAdder port map (x, zeroVector, '1', cout, zeroFlag, signFlag, ovFlag, sum);

end Behavioral;

