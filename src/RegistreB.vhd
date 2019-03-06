library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity RegistreB is
  port(
    B : in std_logic_vector(31 downto 0);
    DATAOUT : out std_logic_vector(31 downto 0);
    clk, rst : in std_logic
  );
end entity;

architecture RTL of RegistreB is
  
  signal int : std_logic_vector(31 downto 0);
  
begin
  
  process(clk, rst)
    
    begin
      
      if rst = '1' then
        
        int <= (others => '0');
      
      else
      
        if rising_edge(clk) then
          
          int <= B;
          
        end if;
        
      end if;
      
    end process;
    
    DATAOUT <= int;
    
  end architecture;