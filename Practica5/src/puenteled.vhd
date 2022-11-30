library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity puenteled is
  port (
    in0,in1,in2,in3 : out std_logic;
    inp: in std_logic_vector(3 downto 0)
  ) ;
end puenteled;

architecture arq_puenteled of puenteled is
begin
    in3<=inp(3);in2<=inp(2);in1<=inp(1);in0<=inp(0);
end architecture;
