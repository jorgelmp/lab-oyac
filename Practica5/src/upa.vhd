library library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity upa is
  port (
    Q7,Y7,D,OE:in std_logic;|
    A,B       : in std_logic_vector(7 downto 0);
    UPA       : in std_logic_vector(9 downto 0);
    FC,Y0,Q0,C: out std_logic;
    Yupa      : out std_logic_vector(7 downto 0)
  ) ;
end upa;

architecture arq_upa of upa is
  signal Q  : std_logic_vector(7 downto 0);
  signal Z  : std_logic_vector(7 downto 0):="00000000"
  signal R,S: std_logic_vector(15 downto 0);
  signal F  : std_logic_vector(8 downto 0);
begin
 process(UPA(3 downto 0))
 begin
  case UPA(3 downto 0) is
    when "0000" => R <= Z&A;  S <= Z&Z;
    when "0001" => R <= Z&A;  S <= Z&B;
    when "0010" => R <= Z&Q;  S <= Z&Z;
    when "0011" => R <= Z&B;  S <= Z&Z;
    when "0100" => R <= Z&Z;  S <= Z&A;
    when "0101" => R <= A&B;  S <= Z&A;
    when "0110" => R <= A&B;  S <= Z&Q;
    when "0111" => R <= A&B;  S <= Z&Z;
    when "1000" => R <= A&B;  S <= Z&B;
    when "1001" => R <= Z&Q;  S <= Z&B;
    when "1010" => R <= Z&Q;  S <= Z&Z;
    when "1011" => R <= Z&B;  S <= Z&Z;
    when "1100" => R <= Z&Z;  S <= Z&A;
    when "1101" => R <= A&B;  S <= Z&A;
    when "1110" => R <= A&B;  S <= Z&Q;
    when "1111" => R <= A&B;  S <= Z&Q;
  end case; 
 end process
  
  
  
end architecture arq_upa;