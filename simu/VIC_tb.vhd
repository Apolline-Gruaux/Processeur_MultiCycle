
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

Entity tb_VIC is 
end entity;

Architecture test_bench of tb_VIC is

	signal clk, rst : std_logic;
	signal IRQ_SERV, IRQ0, IRQ1 : std_logic;
	
	signal IRQ : std_logic;
	signal VICPC : std_logic_vector(31 downto 0);

begin

	clock : process begin
		clk <= '0';
		wait for 5 ns;
		clk <= '1';
		wait for 5 ns;
	end process;

	test_bench : process begin
		rst <= '1';
		wait for 1 ns;			-- 1 ns
	
		-- initialisation
		rst <= '0';
		IRQ_SERV <= '0';
		IRQ0 <= '0';
		IRQ1 <= '0';
		wait for 5 ns;			-- 6 ns
		assert (VICPC = std_logic_vector(to_unsigned(0,32))) report "erreur VPIC 0,0 != 0" severity error;
		assert (IRQ = '0') report "erreur IRQ 0,0 !=0" severity error;
		
		IRQ0 <= '1';
   -- IRQ0_memo <= '1'  	-- 15 ns
		wait for 10 ns;		-- 16 ns; 
		IRQ0 <= '0';		
		assert (VICPC = std_logic_vector(to_unsigned(9,32))) report "erreur VIPC 1,0 != 9 " severity error;
		assert (IRQ = '1') report "erreur IRQ 1,01 != 1" severity error;
		
		wait for 8 ns;			-- 24 ns (juste avant le front montant)
		IRQ_SERV <= '1';		-- supprime la requete --> memo a zeo
	-- IRQ0_memo <= '0'		-- 25 ns
		wait for 2 ns;			-- 26 ns 
		
		IRQ_SERV <= '0';
		IRQ1 <= '1';			-- 26 ns
	-- IRQ1_memo <= '1'	
		wait for 10 ns;		-- 36 ns
		IRQ1 <= '0';
		assert (VICPC = std_logic_vector(to_unsigned(21,32))) report "erreur VIPC 0,1 != 21" severity error;
		assert (IRQ = '1') report "erreur IRQ 0,1 != 1" severity error;
		
		-- on ne reinitialise pas IRQ1
		
		wait for 1 ns;			-- 37 ns
		IRQ0 <= '1';
		wait for 9 ns;			-- 46 ns;
		assert (VICPC = std_logic_vector(to_unsigned(21,32))) report "erreur VPIC ligne 65" severity error;
		
		wait;
		
	end process;
	
	 VIC_0: entity work.VIC(RTL) port map (CLK => clk, RST => rst, serv_irq => IRQ_SERV, IRQ0 => IRQ0, IRQ1 => IRQ1, IRQ => IRQ, VICPC => VICPC);
	   
end architecture;
    
  