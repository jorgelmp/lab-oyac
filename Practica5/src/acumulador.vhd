library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity acumulador is
  port (
    e0,e1,w:    in std_logic;
    Ci,Bi,Ai:   in std_logic_vector(7 downto 0);
    Co,Bo,Ao,D:   out std_logic_vector(7 downto 0)
  ) ;
end acumulador;

architecture arq_acumulador of acumulador is
    signal t2,temp: std_logic_vector(7 downto 0);
    signal ew: std_logic_vector(2 downto 0):=e1&e0&w;
	 signal e: std_logic_vector(1 downto 0):=e1&e0;
begin
    process(e,ew)
    begin
        case e is
            when "01" => t2 <= Ai;
            when "10" => t2 <= Bi;
            when "11" => t2 <= Ci;
	        when others => t2 <= temp;
        end case;
        if w='1' then
            temp <= t2;
        end if;
        if (e1='0' and e0='1' and w='0')  then Ao <= temp; else Ao<="ZZZZZZZZ"; end if;
	     if (e1='1' and e0='0' and w='0')  then Bo <= temp; else Bo<="ZZZZZZZZ"; end if;
	     if (e1='1' and e0='1' and w='0')  then Co <= temp; else Co<="ZZZZZZZZ"; end if;
    end process;
	 D <= temp;
end architecture;





