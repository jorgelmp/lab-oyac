library ieee;
use ieee.std_logic_1164.all;

entity ssd is
port(operand: in std_logic_vector(7 downto 0);
     ssd0, ssd1, ssd2, ssd3, ssd4, ssd5, ssd6: out std_logic;
     ssd10, ssd11, ssd12, ssd13, ssd14, ssd15, ssd16: out std_logic
);
end entity;

architecture arqssd of ssd is
    signal zero:        std_logic_vector(6 downto 0):="1000000"; 
    signal one:         std_logic_vector(6 downto 0):="1111001"; 
    signal two:         std_logic_vector(6 downto 0):="0100100"; 
    signal three:       std_logic_vector(6 downto 0):="0110000"; 
    signal four:        std_logic_vector(6 downto 0):="0011001"; 
    signal five:        std_logic_vector(6 downto 0):="0010010"; 
    signal six:         std_logic_vector(6 downto 0):="0000010";
    signal seven:       std_logic_vector(6 downto 0):="1111000";
    signal eight:       std_logic_vector(6 downto 0):="0000000";
    signal nine:        std_logic_vector(6 downto 0):="0011000";
    signal ten:         std_logic_vector(6 downto 0):="0001000";
    signal eleven:      std_logic_vector(6 downto 0):="0000011";
    signal twelve:      std_logic_vector(6 downto 0):="0100111";
    signal thirteen:    std_logic_vector(6 downto 0):="0100111";
    signal fourteen:    std_logic_vector(6 downto 0):="0000110";
    signal fifteen:     std_logic_vector(6 downto 0):="0001110";
    signal pA,pB:       std_logic_vector(6 downto 0);
begin
    process(operand(3 downto 0))
    begin
        case operand(3 downto 0) is
            when "0000" => pB <= zero;
            when "0001" => pB <= one;
            when "0010" => pB <= two;
            when "0011" => pB <= three;
            when "0100" => pB <= four;
            when "0101" => pB <= five;
            when "0110" => pB <= six;
            when "0111" => pB <= seven;
            when "1000" => pB <= eight;
            when "1001" => pB <= nine;
            when "1010" => pB <= ten;
            when "1011" => pB <= eleven;
            when "1100" => pB <= twelve;
            when "1101" => pB <= thirteen;
            when "1110" => pB <= fourteen;
            when "1111" => pB <= fifteen;
            when others => pB <= zero;
    end case;
    ssd6  <= pB(6);
    ssd5  <= pB(5);
    ssd4  <= pB(4);
    ssd3  <= pB(3);
    ssd2  <= pB(2);
    ssd1  <= pB(1);
    ssd0  <= pB(0);
	 end process;
    process(operand(7 downto 4))
    begin
    case operand(7 downto 4) is
        when "0000" => pA <= zero;
        when "0001" => pA <= one;
        when "0010" => pA <= two;
        when "0011" => pA <= three;
        when "0100" => pA <= four;
        when "0101" => pA <= five;
        when "0110" => pA <= six;
        when "0111" => pA <= seven;
        when "1000" => pA <= eight;
        when "1001" => pA <= nine;
        when "1010" => pA <= ten;
        when "1011" => pA <= eleven;
        when "1100" => pA <= twelve;
        when "1101" => pA <= thirteen;
        when "1110" => pA <= fourteen;
        when "1111" => pA <= fifteen;
        when others => pA <= zero;
    end case;
	 ssd16 <= pA(6);
    ssd15 <= pA(5);
    ssd14 <= pA(4);
    ssd13 <= pA(3);
    ssd12 <= pA(2);
    ssd11 <= pA(1);
    ssd10 <= pA(0);
    end process;
end architecture;
