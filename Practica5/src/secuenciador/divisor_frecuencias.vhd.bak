library ieee;
use ieee.std_logic_1164.all;

entity divisor_frecuencias is
port(clk: in std_logic;
	  clkl: buffer std_logic:='0');
end entity;

architecture arq_divisor_frecuencias of divisor_frecuencias is
signal contador: integer range 0 to 50000000;
begin
	process(clk)
		begin
			if(rising_edge(clk)) then
				if(contador=50000000) then
					contador<=0;
					clkl<= not clkl;
				else
					contador<= contador+1;
				end if;
			end if;
		end process;
end architecture;