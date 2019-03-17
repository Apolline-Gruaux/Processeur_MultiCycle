library ieee;
use ieee.std_logic_1164.all;

Entity VIC is Port(
  CLK, reset           : in std_logic;
  SERV_IRQ, IRQ0, IRQ1 : in std_logic;
  IRQ                  : out std_logic;
  VICPC                : out std_logic_vector(31 downto 0));
end entity;

Architecture RTL of VIC is 

  signal IRQ0_memo, IRQ1_memo : std_logic;
  signal IRQ0_prec, IRQ1_prec : std_logic;
  
  Begin
    
    Process(CLK, reset)
      begin
        
        if reset = '1' then
          IRQ0_memo <= '0';
          IRQ1_memo <= '0';
          IRQ0_prec <= '0';
          IRQ1_prec <= '0';
          IRQ <= '0';
          VICPC <= (others => '0');
          
        elsif rising_edge(CLK) then
          
          if IRQ0 = '1' and IRQ0_prec = '0' then
            IRQ0_memo <= '1';
          end if;
          
          if IRQ1 = '1' and IRQ1_prec = '0' then
            IRQ1_memo <= '1';
          end if;
          
          if SERV_IRQ = '1' then
            IRQ0_memo <= '0';
            IRQ1_memo <= '0';
          end if;
          
          if IRQ0_memo = '0' and IRQ1_memo = '0' then     
            VICPC <= (others => '0');
          elsif IRQ0_memo = '1' then
            VICPC <= x"00000009";
          else
            VICPC <= x"00000015";
          end if;
          
          IRQ0_prec <= IRQ0;
          IRQ1_prec <= IRQ1;
          
          IRQ <= IRQ0_memo or IRQ1_memo;
        
      end if;
    end process;
    
end RTL;