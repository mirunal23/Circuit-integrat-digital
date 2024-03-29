library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity bistabil is
    Port ( D : in STD_LOGIC;
           CLK : in STD_LOGIC;
           R : in STD_LOGIC;
           Q : out STD_LOGIC);
end bistabil;

architecture Behavioral of bistabil is

signal qint: std_logic;

begin

bistabil: process(R, CLK)
begin
if (R ='1') then
     qint<= '1';
     elsif (CLK'event and falling_edge (CLK)) then
      qint <= d;
      else
      qint <= qint;
 end if;
 end process;
 
 Q <= qint;

end Behavioral;
