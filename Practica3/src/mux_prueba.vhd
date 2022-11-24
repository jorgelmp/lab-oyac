library IEEE;
use IEEE.std_logic_1164.all;

entity mux_prueba is
  port (
	 prueba : in std_logic_vector(1 downto 0);
    q3, q2, q1, q0 : in std_logic;
    qsel : out std_logic
  );
end entity mux_prueba;

architecture arq_mux_prueba of mux_prueba is
begin
  with prueba select
  qsel <= q0 when "00",
          q1 when "01",
          q2 when "10",
          q3 when "11",
          '0' when others;
--  process(prueba)
--  begin
--    if(prueba="00" and q0='1') then
--      qsel <= '1';
--    elsif (prueba="01" and q1 ='1') then
--      qsel <= '1';
--    elsif (prueba="10" and q2 ='1') then
--      qsel <= '1';
--    elsif (prueba="11" and q3 ='1') then
--      qsel <= '1';
--    else
--      qsel <= '0';
--    end if;
--  end process;
end architecture arq_mux_prueba;