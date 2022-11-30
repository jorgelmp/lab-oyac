library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity puente is
  port (
    in0,in1,in2,in3,in4,in5,in6,in7 : in std_logic;
    inp: out std_logic_vector(7 downto 0)
  ) ;
end puente;

architecture arq_puente of puente is
begin
    inp <= in7&in6&in5&in4&in3&in2&in1&in0;
end architecture;
