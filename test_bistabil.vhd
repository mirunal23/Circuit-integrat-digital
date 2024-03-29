library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity test_bistabil is
--  Port ( );
end test_bistabil;

architecture Behavioral of test_bistabil is

component bistabil is
    Port ( D : in STD_LOGIC;
           CLK : in STD_LOGIC;
           R : in STD_LOGIC;
           Q : out STD_LOGIC);
end component bistabil;

signal d1,d2,d0, clkhz, r, outq0, outq1,outq2: std_logic;

begin

U2: bistabil port map ( D => outq0,
                        CLK => clkhz,
                        R => R,
                        Q => d1);
U1: bistabil port map ( D => outq2,
                        CLK => clkhz,
                        R => R,
                        Q => d0);
U0: bistabil port map ( D => outq1,
                        CLK => clkhz,
                        R => R,
                        Q => outq0);                                                    
                        
 R <= r;

 generate_clock: process
 begin
 clkhz <= '0'; wait for 5 ns;
 clkhz <= '1'; wait for 5 ns;
 end process;
 
 generate_reset: process
 begin
 r <= '0'; wait for 10 ns;
 r <= '1'; wait;
 end process;
 
                             
end Behavioral;
