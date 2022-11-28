library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity incrementador is
  port (
    epresente:      in std_logic_vector(3 downto 0);
    epresente_inc:  out std_logic_vector(3 downto 0)
  );
end entity incrementador;

architecture arq_incrementador of incrementador is
begin
    epresente_inc <= epresente + "0001";
end architecture arq_incrementador;
