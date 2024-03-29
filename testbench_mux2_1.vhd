library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity testbench_mux2_1 is
  Port ( a: in STD_LOGIC;
         b: in STD_LOGIC;
         c: in STD_LOGIC;
         f: out STD_LOGIC);
end testbench_mux2_1;

architecture Behavioral of testbench_mux2_1 is

    component mux2_1 is        -- componenta mux2:1 
        Port ( I0 : in STD_LOGIC;
               I1 : in STD_LOGIC;
               a : in STD_LOGIC;
               y : out STD_LOGIC);
    end component;
signal I0,I1, ina, outy: STD_LOGIC;
begin
 I0 <= (not b) or c ;
 I1 <= b or (not c);
 --f <= ( a and b) when a = '0' else ( a or b); 
    MUX: mux2_1 port map(I0 => I0, I1 => I1, a => ina, y => outy);
    
  generate_ina: process
  begin
  ina <= '0'; wait for 5 ns;
  ina <= '1'; wait for 5 ns;
  end process;
  
    generate_I0: process
  begin
  I0 <= '0'; wait for 3 ns;
  I0 <= '1'; wait for 3 ns;
  end process;

    generate_I1: process
  begin
  I1 <= '0'; wait for 2 ns;
  I1 <= '1'; wait for 2 ns;
  end process;
end Behavioral;
