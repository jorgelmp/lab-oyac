library IEEE;
use IEEE.std_logic_1164.ALL;

entity tristatebuffer2 is
    port ( 
        in0,in1,in2: in  std_logic;
        enbl  : in  std_logic;
        out3 : out std_logic_vector (2 downto 0)
    );
end tristatebuffer2;

architecture arq_tristatebuffer2 of tristatebuffer2 is
begin
    -- 4 input/output active low enabled tri-state buffer
    out3 <= in2&in1&in0 when (enbl = '0') else "ZZZ";
end arq_tristatebuffer2;