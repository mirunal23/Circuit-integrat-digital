library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity testmux2_1 is
--  Port ( );
end testmux2_1;

architecture Behavioral of testmux2_1 is

component mux2_1 is
    Port ( I0 : in STD_LOGIC;
           I1 : in STD_LOGIC;
           a : in STD_LOGIC;
           y : out STD_LOGIC);
end component mux2_1;

signal in0, in1, outy, a, b, c: std_logic;

begin

in0 <= (not b) or c;
in1 <= b or (not c);

MUX: mux2_1 port map ( I0 => in0, I1 => in1, a => a, y => outy);

generate_ina: process
begin
a <= '0'; wait for 5 ns;
a <= '1'; wait for 5 ns;
end process;

generate_in0: process
begin
b <= '0'; wait for 3 ns;
b <= '1'; wait for 3 ns;
end process;

generate_in1: process
begin
c <= '0'; wait for 2 ns;
c <= '1'; wait for 2 ns;
end process;


end Behavioral;