library IEEE;
  use IEEE.std_logic_1164.ALL;
  use IEEE.numeric_std.ALL;

Entity MUX_ALU_A is 
  generic ( N : positive := 32);
  port (PC, A : in std_logic_vector(N-1 downto 0);
    AluSelA : in std_logic;
    S : out std_logic_vector(N-1 downto 0)
  );
  
end entity;

architecture RTL of MUX_ALU_A is
  
begin
  
  process(AluSelA, PC, A)
    
  begin
    
    case(AluSelA) is
    
    when '0' => S <= PC;
    when others => S <= A;
      
    end case;
    
  end process;
  
end architecture;