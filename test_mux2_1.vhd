library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity test_mux2_1 is
 Port ( a : in STD_LOGIC;
              b : in STD_LOGIC;
              c : in STD_LOGIC;
              f : out STD_LOGIC);
end test_mux2_1;

architecture Behavioral of test_mux2_1 is

    component mux2_1 is        -- componenta mux2:1 
        Port ( I0 : in STD_LOGIC;
               I1 : in STD_LOGIC;
               a : in STD_LOGIC;
               y : out STD_LOGIC);
    end component;

    
    signal ina, in0, in1, outy : std_logic;
begin

in0 <= (not b) or c;
in1 <= b or (not c);
    UUT : mux2_1 port map (a =>ina, I0 => in0, I1 =>in1, y=> outy);
    
    -- Stimulus process
    generate_clock: process
    begin
        -- Initialize inputs
        ina <= '0';
        in0 <= '0';
        in1 <= '0';
        wait for 10 ns;

        -- Test case 1
        ina <= '0';
        in0 <= '0';
        in1 <= '1';
        wait for 10 ns;
       -- assert (outy = '0') report "Test case 1 failed" severity failure;

        -- Test case 2
        ina <= '1';
        in0 <= '1';
        in1 <= '0';
        wait for 10 ns;
        --assert (outy = '1') report "Test case 2 failed" severity failure;

        -- Test case 3
       ina <= '0';
        in0 <= '1';
        in1 <= '1';
        wait for 10 ns;
     --   assert (outy = '1') report "Test case 3 failed" severity failure;

       -- wait;
    end process;

end Behavioral;
