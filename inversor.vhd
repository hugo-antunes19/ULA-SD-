----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Hugo Antunes, Giovanni e Bernardo Pozzato
-- 
-- Create Date:    31/10/2023
-- Module Name:    inversor - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity inversor is
    Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           invertido : out  STD_LOGIC_VECTOR (3 downto 0));
end inversor;

architecture Behavioral of inversor is

SIGNAL i : STD_LOGIC_VECTOR (3 downto 0);

-- Inverte o vetor

begin

i(3) <= NOT x(3);
i(2) <= NOT x(2);
i(1) <= NOT x(1);
i(0) <= NOT x(0);

invertido(3) <= NOT x(3);
invertido(2) <= NOT x(2);
invertido(1) <= NOT x(1);
invertido(0) <= NOT x(0);

end Behavioral;

