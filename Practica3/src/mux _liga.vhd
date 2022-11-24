library IEEE;
use IEEE.std_logic_1164.all;

entity mux_liga is
  port (
    l_verdadera: in std_logic_vector(3 downto 0);
    l_falsa: in std_logic_vector(3 downto 0);
    qsel : in std_logic;
    esiguiente : out std_logic_vector(3 downto 0)
  );
end entity mux_liga;

architecture arq_mux_liga of mux_liga is
begin
  with qsel select
  esiguiente <= l_falsa when '0',
                l_verdadera when '1',
                "0000" when others;
end architecture arq_mux_liga;