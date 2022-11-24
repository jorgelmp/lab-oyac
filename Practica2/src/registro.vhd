library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity registro is
  port (
    clk :in std_logic;
    e0: in std_logic;
	  e1: in std_logic;
	  e2: in std_logic;
	  e3: in std_logic;
    esiguiente: in std_logic_vector(2 downto 0):="000";
    epresente_entradas: out std_logic_vector(6 downto 0)
  );
end entity registro;

architecture arq_registro of registro is
begin
  process(clk)
  begin
    if(rising_edge(clk)) then
      epresente_entradas <= esiguiente & e3 & e2 & e1 & e0;
    end if;
  end process;  
end architecture arq_registro;