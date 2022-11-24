library ieee;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity memoria_rom is
  port(
    epresente: in std_logic_vector(3 downto 0);
	  s0: out std_logic;
	  s1: out std_logic;
	  s2: out std_logic;
	  s3: out std_logic;
    l_verdadera: out std_logic_vector(3 downto 0);
    l_falsa: out std_logic_vector(3 downto 0);
	 prueba: out std_logic_vector(1 downto 0)

  );
end entity;

architecture arq_memoria_rom of memoria_rom is
  signal int: std_logic_vector(13 downto 0);
begin
	process(epresente)
	begin
    case epresente is 
		  when "0000" => int <= "00000100010001";
		  when "0001" => int <= "11001100101110";
		  when "0010" => int <= "01011001010101";
		  when "0011" => int <= "00010001000001";
		  when "0100" => int <= "00000110000000";
		  when "0101" => int <= "00100110010010";
		  when "0110" => int <= "00011101111010";
		  when "0111" => int <= "00101010101100";
		  when "1000" => int <= "00101010101010";
		  when "1001" => int <= "10110010110000";
		  when "1010" => int <= "00111011010100";
		  when "1011" => int <= "00111111111110";
		  when "1100" => int <= "00111111110001";
		  when "1101" => int <= "00111111110011";
		  when "1110" => int <= "00111111111000";
		  when "1111" => int <= "00000000000000";
		  when others => int <= "00000000001111";
		end case;
    prueba      <= int(13 downto 12);
    l_verdadera <= int(11 downto 8);
    l_falsa     <= int(7 downto 4);
    s3 <= int(3); s2 <= int(2); s1<= int(1); s0 <= int(0);

  end process;
end architecture;