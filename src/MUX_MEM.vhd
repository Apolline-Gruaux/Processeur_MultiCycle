library IEEE;
  use IEEE.std_logic_1164.ALL;
  use IEEE.numeric_std.ALL;

Entity MUX_MEM is 
  generic ( N : positive := 6);
  port (PC, AluOUT : in std_logic_vector(N-1 downto 0);
    AdrSel : in std_logic;
    S : out std_logic_vector(N-1 downto 0)
  );
  
end entity;

architecture RTL of MUX_MEM is
  
begin
  
  process(AdrSel, PC, AluOUT)
    
  begin
    
    case(AdrSel) is
    
    when '0' => S <= PC;
    when others => S <= AluOUT;
      
    end case;
    
  end process;
  
end architecture;