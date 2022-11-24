library ieee;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity logica is
  port(
    instruccion:                in std_logic_vector(1 downto 0);
    qsel:                       in std_logic;
    mPCn,PLn, MAPn, VECTn:      out std_logic
  );
end entity;

architecture arq_logica of logica is
    signal inp:  std_logic_vector(2 downto 0):= instruccion & qsel; 
    signal outp: std_logic_vector(3 downto 0):= "1111";
begin
    process(inp)
    begin
        case inp is 
		  when "000" => outp <= "0111";
		  when "001" => outp <= "0111";
		  when "010" => outp <= "1011";
		  when "011" => outp <= "0111";
		  when "100" => outp <= "1101";
		  when "101" => outp <= "1101";
		  when "110" => outp <= "1110";
		  when "111" => outp <= "0111";
		  when others => outp <= "1111";
        end case;
    mPCn <= outp(3); PLn <= outp(2); MAPn <= outp(1); VECTn <= outp(0);
    end process;
end architecture;
