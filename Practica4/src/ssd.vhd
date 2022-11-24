library ieee;
use ieee.std_logic_1164.all;

entity ssd is
port(state: in std_logic_vector(2 downto 0);
	  ssd0, ssd1, ssd2, ssd3, ssd4, ssd5, ssd6: out std_logic
);
end entity;

architecture arqssd of ssd is
  signal int: std_logic_vector(6 downto 0);
begin
  process(state)
  begin
    case state is
      when "000" => int <= "1000000"; 
      when "001" => int <= "1111001";
      when "010" => int <= "0100100";
      when "011" => int <= "0110000";
      when "100" => int <= "0011001";
      when "101" => int <= "0010010";
      when "110" => int <= "0000010";
      when "111" => int <= "1111000";
		when others => int <= "0000000"; 
    end case;
    ssd6 <= int(6);
    ssd5 <= int(5);
    ssd4 <= int(4);
    ssd3 <= int(3);
    ssd2 <= int(2);
    ssd1 <= int(1);
    ssd0 <= int(0);
	end process;
end architecture;