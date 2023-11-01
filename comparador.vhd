----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Hugo Antunes, Giovanni e Bernardo Pozzato
-- 
-- Create Date:    31/10/2023
-- Module Name:    comparador - Behavioral 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity comparador is
    Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
			  y : in  STD_LOGIC_VECTOR (3 downto 0);
           resultado : out  STD_LOGIC_VECTOR (2 downto 0));
end comparador;

architecture Behavioral of comparador is

-- Cria as variáveis temporárias

SIGNAL ig : STD_LOGIC;
SIGNAL a0 : STD_LOGIC;
SIGNAL a1 : STD_LOGIC;
SIGNAL a2 : STD_LOGIC;
SIGNAL a3 : STD_LOGIC;
SIGNAL vasco: STD_LOGIC_VECTOR (1 downto 0);

begin

-- vasco é o vetor que recebe os bits de sinais de cada número

vasco(0) <= y(3);
vasco(1) <= x(3);

-- Fazemos as operações lógicas para calcular a comparação devidamente
-- ig é igual a 1 caso os números sejam iguais
-- a3 é igual a 1 caso o número x seja maior

ig <= (x(3) XNOR y(3)) AND (x(2) XNOR y(2)) AND (x(1) XNOR y(1)) AND (x(0) XNOR y(0));
a2 <= (x(2) XOR y(2)) and (NOT x(2));
a1 <= (x(1) XOR y(1)) and (NOT x(1)) and NOT((x(2) XOR y(2)) AND NOT a2);
a0 <= (x(0) XOR y(0)) and (NOT x(0)) and NOT((x(1) XOR y(1)) AND NOT a1);
a3 <= (a2) or (a1 AND NOT a2) or ((a0 AND NOT a1)AND NOT a2);

-- resultado(3) -> iguais
-- resultado(1) -> y maior 
-- resultado(0) -> x maior 

PROCESS (vasco, ig, a3) BEGIN

-- se os dois números forem positivos, fazemos a operação normalmente

	IF vasco = "00" THEN
		resultado(2) <= ig;
		resultado(1) <= a3;
		resultado(0) <= (NOT a3) AND (NOT ig);

-- se um for negativo e o outro positivo, o positivo é maior

	ELSIF vasco = "01" THEN
		resultado(2) <= '0';
		resultado(1) <= '0';
		resultado(0) <= '1';

-- se um for negativo e o outro positivo, o positivo é maior
		
	ELSIF vasco = "10" THEN
		resultado(2) <= '0';
		resultado(1) <= '1';
		resultado(0) <= '0';

-- se os dois forem negativos, fazemos a operação normalmente
-- considerando que o número esteja em complemento a dois

	ELSE
		resultado(1) <= a3;
		resultado(2) <= ig;
		resultado(0) <= (NOT a3) AND (NOT ig);

	END IF;
END PROCESS;
end Behavioral;
