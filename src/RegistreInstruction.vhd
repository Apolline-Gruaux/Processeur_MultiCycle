library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity RegistreInstruction is
  port(
    DATAIN : in std_logic_vector(31 downto 0);
    IRWrEn : in std_logic;
    DATAOUT : out std_logic_vector(31 downto 0);
    clk, rst : in std_logic
  );
end entity;

architecture RTL of RegistreInstruction is
  
  signal int : std_logic_vector(31 downto 0);
  
begin
  
  process(clk, rst)
    
    begin
      
      if rst = '1' then
        
        int <= (others => '0');
      
      else
      
        if rising_edge(clk) then
          
            if( IRWrEn = '1') then 
              int <= DATAIN;
           end if;
           
        end if;
        
      end if;
      
    end process;
    
    DATAOUT <= int;
    
  end architecture;