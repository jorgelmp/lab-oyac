library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity secuenciador is
  port (
    op1,op2,clk,q0,fc   : in std_logic;
    dupa,oeupa          : out std_logic;
    upa                 : out std_logic_vector(9 downto 0);
    leds                : out std_logic_vector(3 downto 0);
    wa, ea1, ea0        : out std_logic;
    wb, eb1, eb0        : out std_logic
  ) ;
end secuenciador;

architecture arq_secuenciador of secuenciador is
    signal dclk,vf,qsel: std_logic;
    signal mPCn,PLn, MAPn, VECTn: std_logic;
    signal epresente,esiguiente,liga,einc: std_logic_vector(3 downto 0);
    signal instruccion : std_logic_vector(1 downto 0);
    signal prueba: std_logic_vector(2 downto 0);
begin
    u0: entity work.divisor_frecuencias(arq_divisor_frecuencias)
        port map(clk,dclk);
    u1: entity work.registro(arq_registro)
        port map(dclk,esiguiente,epresente);
    u2: entity work.incrementador(arq_incrementador)
        port map(epresente,einc);
    u3: entity work.memoria_rom(arq_memoria_rom)
        port map(epresente,vf,upa,oeupa,dupa,wa,ea1,ea0,wb,eb1,eb0,liga,
                instruccion, prueba);
    u4: entity work.mux_prueba(arq_mux_prueba)
        port map(prueba,q0,fc,op1,op2,'0',qsel);
    u5: entity work.logica(arq_logica) 
        port map(instruccion,qsel xor vf,mPCn,PLn,MAPn,VECTn);
    u6: entity work.tristatebuffer(arq_tristatebuffer)
        port map(einc,mPCn,esiguiente);
    u7: entity work.tristatebuffer(arq_tristatebuffer)
        port map("0000",MAPn,esiguiente);
    u8: entity work.tristatebuffer(arq_tristatebuffer)
        port map("0000",VECTn,esiguiente);
    u9: entity work.tristatebuffer(arq_tristatebuffer)
        port map(liga,PLn,esiguiente);
    u10:entity work.mux_paso(arq_mux_paso) port map(epresente,leds);
end arq_secuenciador;
