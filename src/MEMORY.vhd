library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity MEMORY is
  port (
    adress : in std_logic_vector(5 downto 0);
    datain : in std_logic_vector(31 downto 0);
    dataout : out std_logic_vector(31 downto 0); --A SAVOIR SI READ_DATA ET WRITE_DATA SONT SUR LE MEME PORT OU PAS
    MemRdEn, MemWrEn : in std_logic
  );
end entity;

architecture RTL of MEMORY is
  
  type RAM64x32 is array (0 to 63) of std_logic_vector (31 downto 0);
	
function init_mem return RAM64x32 is 
	variable result : RAM64x32;
	
begin
  
  for i in 63 downto 0 loop
		result (i):=(others=>'0');
	end loop;
	return result;
end init_mem;	

signal mem: RAM64x32 := init_mem;

 begin
   
 process(MemWrEn, MemRdEn, datain)
   
 begin
  
  if(MemWrEn = '1') then
  
    mem(to_integer(unsigned(adress))) <= datain;
  end if;
    
  if(MemRdEn = '1') then
    
    dataout <= mem(to_integer(unsigned(adress)));
    
  end if;
  
end process;

end architecture;
