library IEEE;
  use IEEE.std_logic_1164.ALL;
  use IEEE.numeric_std.ALL;

Entity MUX_ALU_B is 
  generic ( N : positive := 32);
  port (B, ext8, ext24 : in std_logic_vector(N-1 downto 0);
    AluSelB : in std_logic_vector(1 downto 0);
    S : out std_logic_vector(N-1 downto 0)
  );
  
end entity;

architecture RTL of MUX_ALU_B is
  
begin
  
  process(B, ext8, ext24)
    
  begin
    
    case(AluSelB) is
    
    when "00" => S <= B;
    when "01" => S <= ext8; 
    when  "10" => S <= ext24;
    when others => S(0) <='1' ;
                  S(31 downto 1) <= (others =>'0');
      
    end case;
    
  end process;
  
end architecture;