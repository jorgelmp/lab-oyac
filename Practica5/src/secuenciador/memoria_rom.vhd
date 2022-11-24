library ieee;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity memoria_rom is
  port(
    epresente:          in std_logic_vector(2 downto 0);
    s0, s1, s2, s3, vf: out std_logic;
    liga:               out std_logic_vector(2 downto 0);
    instruccion:        out std_logic_vector(1 downto 0);
    prueba:             out std_logic_vector(1 downto 0)

  );
end entity;

architecture arq_memoria_rom of memoria_rom is
  signal int: std_logic_vector(11 downto 0);
begin
    process(epresente)
    begin
        case epresente is 
		  when "000" => int <= "000000000001";
		  when "001" => int <= "000100000010";
		  when "010" => int <= "100010110100";
		  when "011" => int <= "000010000001";
		  when "100" => int <= "000111100010";
		  when "101" => int <= "001010000010";
		  when "110" => int <= "101011001000";
		  when "111" => int <= "001010000100";
		  when others => int <= "000000000000";
        end case;
    liga        <= int(11 downto 9);
    instruccion <= int(8 downto 7);
    prueba      <= int(6 downto 5);
    vf <= int(4); s3 <= int(3); s2 <= int(2); s1<= int(1); s0 <= int(0);
    end process;
end architecture;
