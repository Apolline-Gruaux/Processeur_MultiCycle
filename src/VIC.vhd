library ieee;
use ieee.std_logic_1164.all;

entity VIC is 
  port(
    clk , rst, IRQ_SERV, IRQ0, IRQ1 : in std_logic ;
    IRQ : out std_logic;
    VICPC : out std_logic_vector(31 downto 0)
  );
end entity;

architecture RTL of VIC is 



end architecture;