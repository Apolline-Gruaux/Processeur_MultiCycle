library IEEE;
  use IEEE.std_logic_1164.ALL;
  use IEEE.numeric_std.ALL;

Entity MUX_CPSR is 
  generic ( N : positive := 32);
  port (AluOut, SPSR, AluFlag : in std_logic_vector(N-1 downto 0);
        CPSRsel : in std_logic;
    S : out std_logic_vector(N-1 downto 0)
  );
  
end entity;

architecture RTL of MUX_CPSR is
  
begin
  
  process(CPSRsel, AluOut, SPSR)
    
  begin
    
    case(CPSRsel) is
    
    when '0' => S(31) <= AluFlag;
                S(30 downto 0) <= AluOut(30 downto 0);
    when others => S <= SPSR;
      
    end case;
    
  end process;
  
end architecture;