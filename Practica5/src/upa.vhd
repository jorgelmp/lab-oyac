library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity upa is
  port (
    Q7,Y7,D,OE:in std_logic;
    UPA       : in std_logic_vector(9 downto 0);
    A,B       : in std_logic_vector(7 downto 0);
    Y0,C,Q0,FC: out std_logic;
    Yupa      : out std_logic_vector(7 downto 0)
  ) ;
end upa;

architecture arq_upa of upa is
    signal Qr,Yr  : unsigned(7 downto 0);
    signal Z,Q,Y    : std_logic_vector(7 downto 0):="00000000";
    signal R,S  : std_logic_vector(7 downto 0);
	 signal F    : std_logic_vector(8 downto 0);
	 signal count: std_logic_vector(2 downto 0):="000" ;
begin
    process(UPA,Y,Q)
    begin
    case UPA(3 downto 0) is
        when "0000" => R <= A;  S <= Z;
        when "0001" => R <= A;  S <= B;
        when "0010" => R <= Q;  S <= Z;
        when "0011" => R <= B;  S <= Z;
        when "0100" => R <= Z;  S <= A;
        when "0101" => R <= A;  S <= B;
        when "0110" => R <= A;  S <=B;
        when "0111" => R <= A;  S <=B;
        when "1000" => R <= A;  S <=B;
        when "1001" => R <= Q;  S <=B;
        when "1010" => count <= "000";
        when "1011" => count <= count + "001";
        when "1100" => R <= Q;  S <= A;
        when "1101" => R <= Q;  S <= A;
        when "1110" => R <= Q;  S <= A;
        when "1111" => R <= Q;  S <= A;
    end case; 
    end process;

    process(UPA,R,S)
    begin
    case UPA(6 downto 4) is
        when "000" => F <= ('0'&R) + ('0'&S);
        when "001" => F <= ('0'&S) - ('0'&R);
        when "010" => F <= ('0'&R) - ('0'&S);
        when "011" => F <= ('0'&R) or ('0'&S);
        when "100" => F <= ('0'&R) and ('0'&S);
        when "101" => F <= not ('0'&R) and ('0'&S);
        when "110" => F <= ('0'&R) xor ('0'&S);
        when "111" => F <= ('0'&R) xnor ('0'&S);
    end case;
	 C <= F(8);  
    end process;

    process(UPA,F,Yr,Qr)
    begin
    case UPA(9 downto 7) is
        when "000" => Yr <= unsigned(F(7 downto 0)); Qr <= unsigned(F(7 downto 0));
        when "001" => Yr <= unsigned(F(7 downto 0));
        when "010" => Yr <= unsigned(A);
        when "011" => Yr <= unsigned(B);
        when "100" => Yr <= shift_left(unsigned(Yr),1); Yr(7) <= Y7;
        when "101" => Qr <= shift_left(unsigned(Q),1);  Qr(7) <= Q7;
        when "110" => Yr <= shift_right(unsigned(Y),1);
        when "111" => Qr <= shift_right(unsigned(Q),1);
    end case;
	 Y <= std_logic_vector(Yr);
	 Q <= std_logic_vector(Qr);
    Y0 <= Y(0);
    Q0 <= Q(0);
    end process;

    Yupa <= Y when (D='1' and OE='1') else "ZZZZZZZZ";

    with count select 
    FC <= '1' when "111",
          '0' when others;
end architecture arq_upa;
