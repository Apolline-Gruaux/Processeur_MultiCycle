library ieee;
use ieee.std_logic_1164.all;

entity VIC is 
  port(
    clk , rst, IRQ_SERV, IRQ0, IRQ1 : in std_logic ;
    IRQ : out std_logic;
    VICPC : out std_logic_vector(31 downto 0)
  );
end entity;

architecture RTL of VIC is 

signal IRQ0_memo , IRQ1_memo , IRQ0n , IRQ0n1 , IRQ1n , IRQ1n1: std_logic;

begin
  process (rst , clk) 
    begin
  --initialisation de tous les signaux a z�ro
  if (rst ='1') then 
    IRQ0n <= '0';
    IRQ1n <= '0';
    IRQ0_memo <= '0';
    IRQ0n1 <= '0';
    IRQ1_memo <= '0';
    IRQ1n1 <= '0';

  -- clock pour mettre � jour les signaux 
  elsif rising_edge(clk) then 
    IRQ0n1 <= IRQ0n; 
    IRQ0n <= IRQ0_memo;
    IRQ1n1 <= IRQ1n; 
    IRQ1n <= IRQ1_memo;
  end process;
  
  process 
    if (IRQ0n1 ='0' and IRQ0n ='1') then     -- transition montante de IRQO
      IRQ0_memo <= '1';
      
    elsif ( IRQ1n1 ='0' and IRQ1n ='1') then     -- transition montante de IRQ1
      IRQ1_memo <='1';
   
    elsif ( IRQ_SERV = '1') then -- acquittement donc remise a zero des courants
      
      IRQ1_memo <= '0';
      IRQ0_memo <= '0';
         
    end if;
  end process;
    
    process
    if ( IRQ0_memo ='1')then  
      VICPC <= x"9";
    elsif ( (IRQ1_memo = '1') and (IRQ0_memo = '0')) then 
        VICPC <= x"15";
      end if; 

  end if;
  
  end process;
  
  IRQ <= ((IRQ0_memo) or (IRQ1_memo));
  
 
  
  
end architecture;