----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Hugo Antunes, Giovanni e Bernardo Pozzato
-- 
-- Create Date:    31/10/2023
-- Module Name:    fullAdder - Behavioral 
-- Additional Comments: Esse é um módulo utilizado por outro módulos
--			não utilizamos ele diretamente, mas sim indiretamente
--			ele é utilizado para realizar somas e subtrações.
--			Esse módulo é uma representação clara do lema:
--			"dividir para conquistar".
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fullAdder is
    Port ( x : in  STD_LOGIC;
           y : in  STD_LOGIC;
           cin : in  STD_LOGIC;
           cout : out  STD_LOGIC;
           sum : out  STD_LOGIC);
end fullAdder;

architecture Behavioral of fullAdder is

begin

-- a operação de soma feita por portas lógicas bit a bit

	sum 	<= (x XOR y) XOR cin;
	cout 	<= ((x AND y) or (x AND cin)) OR (x AND cin);

end Behavioral;

