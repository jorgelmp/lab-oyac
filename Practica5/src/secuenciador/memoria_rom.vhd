library ieee;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity memoria_rom is
  port(
    epresente   : in std_logic_vector(3 downto 0);
    vf          : out std_logic;
    upa         : out std_logic_vector(9 downto 0);
    oeupa,dupa  : out std_logic;
    wa, ea1, ea0: out std_logic;
    wb, eb1, eb0: out std_logic;
    liga        : out std_logic_vector(3 downto 0);
    instruccion : out std_logic_vector(1 downto 0);
    prueba      : out std_logic_vector(2 downto 0)
  );
end entity;

architecture arq_memoria_rom of memoria_rom is
  signal int: std_logic_vector(27 downto 0);
begin
    process(epresente)
    begin
        case epresente is 
                            -- liga   µI   Pr   V   9876543210   OD   WW   BB   AA
		  when "0000" => int <= "0000"&"01"&"011"&"0"&"0000000000"&"00"&"00"&"00"&"00";
		  when "0001" => int <= "0000"&"00"&"000"&"0"&"0000000000"&"00"&"01"&"00"&"10";
		  when "0010" => int <= "0010"&"01"&"100"&"0"&"0000000000"&"00"&"00"&"00"&"00";
		  when "0011" => int <= "0000"&"00"&"000"&"0"&"0000000000"&"00"&"10"&"10"&"00";
		  when "0100" => int <= "0000"&"00"&"000"&"0"&"0000110000"&"00"&"00"&"00"&"11";
		  when "0101" => int <= "0000"&"00"&"000"&"0"&"0011000010"&"00"&"00"&"00"&"00";
		  when "0110" => int <= "0000"&"00"&"000"&"0"&"0000001010"&"11"&"01"&"00"&"01";
		  when "0111" => int <= "1001"&"01"&"001"&"1"&"0000000000"&"01"&"00"&"00"&"00";
		  when "1000" => int <= "1010"&"01"&"000"&"0"&"0010000000"&"00"&"00"&"00"&"11";
		  when "1001" => int <= "0000"&"00"&"000"&"0"&"0010000001"&"00"&"00"&"11"&"11";
		  when "1010" => int <= "0000"&"00"&"000"&"0"&"1010000000"&"00"&"00"&"00"&"00";
		  when "1011" => int <= "0000"&"00"&"000"&"0"&"1000000000"&"00"&"00"&"00"&"00";
		  when "1100" => int <= "0111"&"01"&"010"&"0"&"0000001011"&"11"&"01"&"00"&"01";
		  when "1101" => int <= "0000"&"00"&"000"&"0"&"0010110010"&"00"&"00"&"00"&"00";
		  when "1110" => int <= "0000"&"01"&"000"&"0"&"0000000000"&"11"&"10"&"01"&"00";
		  when "1111" => int <= "0000"&"01"&"000"&"0"&"0000000000"&"00"&"00"&"00"&"00";
		  when others => int <= "0000"&"01"&"000"&"0"&"0000000000"&"00"&"00"&"00"&"00";
        end case;
        liga        <= int(27 downto 24);
        instruccion <= int(23 downto 22);
        prueba      <= int(21 downto 19);
        vf          <= int(18);
        upa         <= int(17 downto 8);
        oeupa<= int(7); dupa<= int(6); wb <= int(5); wa <= int(4);
        eb1 <= int(3); eb0 <=int(2); ea1 <= int(1); ea0 <= int(0);
    end process;
end architecture;
