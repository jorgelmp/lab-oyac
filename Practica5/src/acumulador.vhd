library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity acumulador is
  port (
    w, e1, e0: in std_logic;
    A,B,C    : buffer std_logic_vector(7 downto 0)
  ) ;
end acumulador;

architecture arq_acumulador of acumulador is
    variable value: std_logic_vector(7 downto 0);
	 signal e: std_logic_vector(1 downto 0):=e1&e0;
begin
    process(w,e)
	 begin
    case w is
	     when '1' =>
        case e is
            when "00" => value := value;
            when "01" => value := A;
				when "01" => value := B;
				when "01" => value := C;
            when others => value := value;
			end case;
		  when '0' =>
        case e is
            when "00" =>
                A <= "ZZZZZZZZ";
                B <= "ZZZZZZZZ";
                C <= "ZZZZZZZZ";
            when "01" =>
                A <= value;
                B <= "ZZZZZZZZ";
                C <= "ZZZZZZZZ";
            when "10" =>
                A <= "ZZZZZZZZ";
                B <= value;
                C <= "ZZZZZZZZ";
            when "11" =>
                A <= "ZZZZZZZZ";
                B <= "ZZZZZZZZ";
                C <= value;
				when others =>
				    A <= "ZZZZZZZZ";
                B <= "ZZZZZZZZ";
                C <= "ZZZZZZZZ";
        end case;
    end case;
	 end process;
end architecture;





