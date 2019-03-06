library IEEE;
  use IEEE.std_logic_1164.ALL;
  use IEEE.numeric_std.ALL;

Entity MUX_REG_BUSW is 
  generic ( N : positive := 32);
  port (DR, AluOUT : in std_logic_vector(N-1 downto 0);
    Wsel : in std_logic;
    S : out std_logic_vector(N-1 downto 0)
  );
  
end entity;

architecture RTL of MUX_REG_BUSW is
  
begin
  
  process(Wsel, DR, AluOUT)
    
  begin
    
    case(Wsel) is
    
    when '0' => S <= DR;
    when others => S <= AluOUT;
      
    end case;
    
  end process;
  
end architecture;