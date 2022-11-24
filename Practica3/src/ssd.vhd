library ieee;
use ieee.std_logic_1164.all;

entity ssd is
port(state: in std_logic_vector(3 downto 0);
	  ssd0: out std_logic; ssd1: out std_logic; ssd2: out std_logic;
	  ssd3: out std_logic; ssd4: out std_logic; ssd5: out std_logic;
	  ssd6: out std_logic; ssd10: out std_logic; ssd11: out std_logic;
	  ssd12: out std_logic; ssd13: out std_logic; ssd14: out std_logic;
	  ssd15: out std_logic; ssd16: out std_logic
);
end entity;

architecture arqssd of ssd is
  signal int: std_logic_vector(13 downto 0);
begin
  process(state)
  begin
    case state is
      when "0000" => int <= "10000001000000"; 
      when "0001" => int <= "10000001111001";
      when "0010" => int <= "10000000100100";
      when "0011" => int <= "10000000110000";
      when "0100" => int <= "10000000011001";
      when "0101" => int <= "10000000010010";
      when "0110" => int <= "10000000000010";
      when "0111" => int <= "10000001111000";
	   when "1000" => int <= "10000000000000"; 
      when "1001" => int <= "10000000011000"; --9
      when "1010" => int <= "11110011000000"; --10
      when "1011" => int <= "11110011111001"; --11
      when "1100" => int <= "11110010100100"; --12
      when "1101" => int <= "11110010110000"; --13
      when "1110" => int <= "11110010011001";
      when "1111" => int <= "11110010010010";
		  when others => int <= "00000000000000"; 
    end case;
    ssd16 <= int(13);
    ssd15 <= int(12);
    ssd14 <= int(11);
    ssd13 <= int(10);
    ssd12 <= int(9);
    ssd11 <= int(8);
    ssd10 <= int(7);
    ssd6 <= int(6);
    ssd5 <= int(5);
    ssd4 <= int(4);
    ssd3 <= int(3);
    ssd2 <= int(2);
    ssd1 <= int(1);
    ssd0 <= int(0);
	end process;
end architecture;