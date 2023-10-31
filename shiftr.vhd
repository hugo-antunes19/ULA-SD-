----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Hugo Antunes, Giovanni e Bernardo Pozzato
-- 
-- Create Date:    31/10/2023
-- Module Name:    shiftr - Behavioral 
-- Additional Comments: Faz o shift do número para a direita.
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity shiftr is
    Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           resultr : out  STD_LOGIC_VECTOR (3 downto 0));
end shiftr;

architecture Behavioral of shiftr is


SIGNAL resultshiftr : STD_LOGIC;

-- O shift sendo realizado abaixo
-- não alteramos o bit de sinal no shift

begin

resultr(3) <= x(3);
resultr(0) <= x(1);
resultr(1) <= x(2);
resultr(2) <= '0';

end Behavioral;

