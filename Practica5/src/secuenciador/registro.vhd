library IEEE;
use IEEE.std_logic_1164.all;

entity registro is
  port (
    clk :       in std_logic;
    esiguiente: in std_logic_vector(2 downto 0):="000";
    epresente:  out std_logic_vector(2 downto 0)
  );
end entity registro;

architecture arq_registro of registro is
begin
  process(clk)
  begin
    if(rising_edge(clk)) then
      epresente <= esiguiente; 
    end if;
  end process;  
end architecture arq_registro;
