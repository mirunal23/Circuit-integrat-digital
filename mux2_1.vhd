library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity mux2_1 is
    Port ( I0 : in STD_LOGIC;
           I1 : in STD_LOGIC;
           a : in STD_LOGIC;
           y : out STD_LOGIC);
end mux2_1;

architecture Behavioral of mux2_1 is

begin
process (I0,I1,a)
begin
    if a='0' then
       y <= I0;
    else 
       y <= I1 ;
   end if;
end process;

end Behavioral;
