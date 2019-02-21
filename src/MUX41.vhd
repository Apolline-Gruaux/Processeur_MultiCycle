library IEEE;
  use IEEE.std_logic_1164.ALL;
  use IEEE.numeric_std.ALL;

Entity MUX41 is 
  generic ( N : positive := 32);
  port (A, B, C, D : in std_logic_vector(N-1 downto 0);
    COM : in std_logic_vector(1 downto 0);
    S : out std_logic_vector(N-1 downto 0)
  );
  
end entity;

architecture RTL of MUX41 is
  
begin
  
  process(COM, A, B, C, D)
    
  begin
    
    case(COM) is
    
    when "00" => S <= A;
    when "01" => S <= B; 
    when  "10" => S <= C;
    when others => S <= D;
      
    end case;
    
  end process;
  
end architecture;