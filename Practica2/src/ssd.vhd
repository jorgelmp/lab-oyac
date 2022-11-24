library ieee;
use ieee.std_logic_1164.all;

entity ssd is
port(state: in std_logic_vector(6 downto 0);
	  ssd0: out std_logic; ssd1: out std_logic; ssd2: out std_logic;
	  ssd3: out std_logic; ssd4: out std_logic; ssd5: out std_logic;
	  ssd6: out std_logic
);
end entity;

architecture arqssd of ssd is
begin
  process(state)
  begin
    case state(6 downto 4) is
      when "000" => ssd6 <= '1'; ssd5 <= '0'; ssd4 <= '0'; ssd3 <= '0';
                    ssd2 <= '0'; ssd1 <= '0'; ssd0 <= '0';
      when "001" => ssd6 <= '1'; ssd5 <= '1'; ssd4 <= '1'; ssd3 <= '1';
                    ssd2 <= '0'; ssd1 <= '0'; ssd0 <= '1';
      when "010" => ssd6 <= '0'; ssd5 <= '1'; ssd4 <= '0'; ssd3 <= '0';
                    ssd2 <= '1'; ssd1 <= '0'; ssd0 <= '0';
      when "011" => ssd6 <= '0'; ssd5 <= '1'; ssd4 <= '1'; ssd3 <= '0';
                    ssd2 <= '0'; ssd1 <= '0'; ssd0 <= '0';
      when "100" => ssd6 <= '0'; ssd5 <= '0'; ssd4 <= '1'; ssd3 <= '1';
                    ssd2 <= '0'; ssd1 <= '0'; ssd0 <= '1';
      when "101" => ssd6 <= '0'; ssd5 <= '0'; ssd4 <= '1'; ssd3 <= '0';
                    ssd2 <= '0'; ssd1 <= '1'; ssd0 <= '0';
      when "110" => ssd6 <= '0'; ssd5 <= '0'; ssd4 <= '0'; ssd3 <= '0';
                    ssd2 <= '0'; ssd1 <= '1'; ssd0 <= '0';
      when "111" => ssd6 <= '1'; ssd5 <= '1'; ssd4 <= '1'; ssd3 <= '1';
                    ssd2 <= '0'; ssd1 <= '0'; ssd0 <= '0';
		  when others => ssd0 <= '1'; ssd1 <= '1'; ssd2 <= '1'; ssd3 <= '1'; 
                    ssd4 <= '1'; ssd5 <= '1'; ssd6 <= '1';
    end case;
	end process;
end architecture;