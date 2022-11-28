library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity upa is
  port (
    Q7,Y7,D,OE:in std_logic;
    A,B       : in std_logic_vector(7 downto 0);
    UPA       : in std_logic_vector(9 downto 0);
    FC,Y0,Q0,C: out std_logic;
    Yupa      : out std_logic_vector(7 downto 0)
  ) ;
end upa;

architecture arq_upa of upa is
    variable Qr,Yr  : unsigned(7 downto 0);
    signal Z,Q,Y    : std_logic_vector(7 downto 0):="00000000";
    signal R,S  : std_logic_vector(15 downto 0);
	 signal F    : std_logic_vector(8 downto 0);
	 variable count: std_logic_vector(2 downto 0):="000" ;
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
        when "1010" => count := "000";
        when "1011" => count := count + "001";
        when "1100" => R <= Z&Q;  S <= Z&A;
        when "1101" => R <= Z&Q;  S <= Z&A;
        when "1110" => R <= Z&Q;  S <= Z&A;
        when "1111" => R <= Z&Q;  S <= Z&A;
    end case; 
    end process;

    process(UPA(6 downto 4),R,S)
    begin
    case UPA(6 downto 4) is
        when "000" => F <= R + S; 
        when "001" => F <= S - R;
        when "010" => F <= R - S;
        when "011" => F <= R or S;
        when "100" => F <= R and S;
        when "101" => F <= not R and S;
        when "110" => F <= R xor S;
        when "111" => F <= R xnor S;
    end case; 
    end process;

    process(UPA(13 downto 7), F)
    begin
    case UPA(6 downto 4) is
        when "000" => Yr := unsigned(F(7 downto 0)); Qr := unsigned(F(7 downto 0));
        when "001" => Yr := unsigned(F(7 downto 0));
        when "010" => Yr := unsigned(A);
        when "011" => Yr := unsigned(B);
        when "100" => Yr := shift_left(unsigned(Y),1); Y(7) <= Y7;
        when "101" => Qr := shift_left(unsigned(Q),1); Q(7) <= Q7;
        when "110" => Yr := shift_right(unsigned(Y),1);
        when "111" => Qr := shift_right(unsigned(Q),1);
    end case; 
    end process;

    process(Y,Q)
    begin
        if not(D='1' or OE='1') then
            C <= F(8);
            Y0 <= Y(0);
            Q0 <= Q(0);
            Yupa <= Y;
        end if;
    end process;

    with count select 
    FC <= '1' when "111",
          '0' when others;
end architecture arq_upa;
