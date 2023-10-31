----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Hugo Antunes, Giovanni e Bernardo Pozzato
-- 
-- Create Date:    31/10/2023
-- Module Name:    shifte - Behavioral 
-- Additional Comments: Faz um shift do número para a esquerda
----------------------------------------------------------------------------------]

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity shifte is
    Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           ovFlag : out  STD_LOGIC;
           result : out  STD_LOGIC_VECTOR (3 downto 0));
end shifte;

architecture Behavioral of shifte is


SIGNAL resultshift : STD_LOGIC;

-- O shift sendo realizado abaixo
-- não alteramos o bit de sinal no shift

begin

result(3) <= x(3);
result(2) <= x(1);
result(1) <= x(0);
result(0) <= '0';
ovFlag <= x(2);

end Behavioral;

