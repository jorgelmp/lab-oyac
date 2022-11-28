library IEEE;
use IEEE.std_logic_1164.ALL;

entity tristatebuffer is
    port ( 
        in3  : in  std_logic_vector (3 downto 0);
        enbl  : in  std_logic;
        out3 : out std_logic_vector (3 downto 0)
    );
end tristatebuffer;

architecture arq_tristatebuffer of tristatebuffer is
begin
    -- 4 input/output active low enabled tri-state buffer
    out3 <= in3 when (enbl = '0') else "ZZZZ";
end arq_tristatebuffer;
