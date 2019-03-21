library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

<<<<<<< Updated upstream
entity ALU is Port(
  OP   : in std_logic_vector(1 downto 0);
  A, B : in std_logic_vector(31 downto 0);
  S    : out std_logic_vector(31 downto 0);
  N    : out std_logic);
=======
entity ALU is 
  port (
    ALUOP : in std_logic_vector(1 downto 0);
    A, B : in std_logic_vector(31 downto 0);
    S : out std_logic_vector(31 downto 0);
    N : out std_logic_vector(31 downto 0)
  );
  
>>>>>>> Stashed changes
end entity;



Architecture RTL of ALU is
  
  signal S_temp : std_logic_vector(31 downto 0);
  
<<<<<<< Updated upstream
  Begin
=======
  process(ALUOP, A, B)
    
  begin
    
    case(ALUOP) is
>>>>>>> Stashed changes
    
    S <= S_temp;
    N <= S_temp(31);
    
<<<<<<< Updated upstream
    process(OP, A, B)
      begin
        case OP is
          when "00" => S_temp <= std_logic_vector(signed(A) + signed(B));
          when "01" => S_temp <= B;
          when "10" => S_temp <= std_logic_vector(signed(A) - signed(B));
          when "11" => S_temp <= A;
          when others => S_temp <= (others => '0');
        end case;
          
        
    end process;
=======
      
    
  end process;
  
  N <= (others => resultat(31));
>>>>>>> Stashed changes
  
end RTL;

