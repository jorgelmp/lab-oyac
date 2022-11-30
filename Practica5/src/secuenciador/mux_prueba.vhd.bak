library IEEE;
use IEEE.std_logic_1164.all;

entity mux_prueba is
  port (
    prueba : in std_logic_vector(2 downto 0);
    q0,fc,op1,op2,int : in std_logic;
    qsel : out std_logic
  );
end entity mux_prueba;

-- Modificar para la nueva longitud de ¨prueba¨

architecture arq_mux_prueba of mux_prueba is
begin
  with prueba select
  qsel <= '0' when "000",   -- Qaux
          q0  when "001",   -- Q0
          fc  when "010",   -- FC
          op1 when "011",   -- OP1
          op2 when "100",   -- OP2
          int when "101",   -- INT
          '0' when others;
end architecture arq_mux_prueba;
