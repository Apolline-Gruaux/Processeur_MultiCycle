library IEEE;
  use IEEE.std_logic_1164.ALL;
  use IEEE.numeric_std.ALL;

Entity MUX_REG_RB is 
  generic ( N : positive := 4);
  port ( IR : in std_logic_vector(31 downto 0);
    S : out std_logic_vector(N-1 downto 0)
  );
  
end entity;

architecture RTL of MUX_REG_RB is
  signal COM : std_logic; 
  
  begin
    
  COM <= NOT(IR(27) OR IR(20)) AND IR(26);

  
  process(COM, IR)
    
  begin
    
    case(COM) is
    
    when '0' => S <= IR(3 downto 0);
    when others => S <= IR(15 downto 12);
      
    end case;
    
  end process;
  
end architecture;