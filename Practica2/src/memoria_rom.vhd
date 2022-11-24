library ieee;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity memoria_rom is
  port(
    epresente_entradas: in std_logic_vector(6 downto 0);
	  s0: out std_logic;
	  s1: out std_logic;
	  s2: out std_logic;
	  s3: out std_logic;
    esiguiente: out std_logic_vector(2 downto 0)
  );
end entity;

architecture arq_memoria_rom of memoria_rom is
begin
	process(epresente_entradas)
	  begin
		if std_match(epresente_entradas, "000----") then
			esiguiente <= "001"; s3 <= '0'; s2 <= '0'; s1<= '0'; s0<='1';
		elsif std_match(epresente_entradas, "001---0") then
			esiguiente <= "010"; s3 <= '1'; s2 <= '1'; s1<= '1'; s0<='0';
		elsif std_match(epresente_entradas, "001---1") then
			esiguiente <= "101"; s3 <= '1'; s2 <= '1'; s1<= '1'; s0<='1';
		elsif std_match(epresente_entradas, "010-00-") then
			esiguiente <= "001"; s3 <= '0'; s2 <= '1'; s1<= '0'; s0<='1';
		elsif std_match(epresente_entradas, "010-01-") then
			esiguiente <= "011"; s3 <= '0'; s2 <= '1'; s1<= '0'; s0<='1';
		elsif std_match(epresente_entradas, "010-10-") then
			esiguiente <= "100"; s3 <= '0'; s2 <= '1'; s1<= '1'; s0<='1';
		elsif std_match(epresente_entradas, "011----") then
			esiguiente <= "111"; s3 <= '1'; s2 <= '0'; s1<= '0'; s0<='0';
		elsif std_match(epresente_entradas, "100----") then
			esiguiente <= "110"; s3 <= '1'; s2 <= '1'; s1<= '0'; s0<='0';
		elsif std_match(epresente_entradas, "1010---") then
			esiguiente <= "110"; s3 <= '1'; s2 <= '0'; s1<= '1'; s0<='0';
		elsif std_match(epresente_entradas, "1011---") then
			esiguiente <= "001"; s3 <= '0'; s2 <= '0'; s1<= '0'; s0<='0';
		elsif std_match(epresente_entradas, "110----") then
			esiguiente <= "000"; s3 <= '0'; s2 <= '1'; s1<= '0'; s0<='0';
		elsif std_match(epresente_entradas, "111----") then
			esiguiente <= "000"; s3 <= '0'; s2 <= '0'; s1<= '1'; s0<='0';
		else
			esiguiente <= "000"; s3 <= '1'; s2 <= '1'; s1<= '1'; s0<='1';
		end if;
  end process;
end architecture;