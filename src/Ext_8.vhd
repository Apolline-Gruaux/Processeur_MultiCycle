library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_arith.all;

entity Ext_8 is
  port(
    A : in std_logic_vector(7 downto 0);
    S : out std_logic_vector(31 downto 0)
  );
end entity;

architecture RTL of Ext_8 is
  
begin
  
  S <= SXT(A, S'length);
  
end architecture;