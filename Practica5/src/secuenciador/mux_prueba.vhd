library IEEE;
use IEEE.std_logic_1164.all;

entity mux_prueba is
  port (
    prueba : in std_logic_vector(1 downto 0);
    q1, q0, int : in std_logic;
    qsel : out std_logic
  );
end entity mux_prueba;

architecture arq_mux_prueba of mux_prueba is
begin
  with prueba select
  qsel <= '0' when "00",   -- Qaux
          q0  when "01",   -- X
          q1  when "10",   -- Y
          int when "11",   -- INT
          '0' when others;
end architecture arq_mux_prueba;
