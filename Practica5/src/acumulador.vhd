library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity acumulador is
  port (
    e0,e1,w:    in std_logic;
    Ci,Bi,Ai:   in std_logic_vector(7 downto 0);
    Co:   out std_logic_vector(7 downto 0)
  ) ;
end acumulador;

architecture arq_acumulador of acumulador is
    signal ew: std_logic_vector(2 downto 0):=e1&e0&w;
	 signal valor: std_logic_vector(7 downto 0);
begin
    process(ew)
    begin
        case ew is
            when "011" => valor <= Ai;
            when "101" => valor <= Bi;
            when "111" => valor <= Ci;
	        when others => valor <= valor;
        end case;
		  if w='0' then
		      Co <= valor;
		  end if;
    end process;
end architecture;





