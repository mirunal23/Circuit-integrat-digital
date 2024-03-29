library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity simulation is  
end simulation;  

architecture Behavior of simulation is  
    
    component bistabil is      -- componenta bistabilului
        Port ( D : in STD_LOGIC;
               CLK : in STD_LOGIC;
               R : in STD_LOGIC;
               Q : out STD_LOGIC);
    end component;
    
    component mux2_1 is        -- componenta mux2:1 
        Port ( I0 : in STD_LOGIC;
               I1 : in STD_LOGIC;
               a : in STD_LOGIC;
               y : out STD_LOGIC);
    end component;


     constant clk_p : time := 10 ns;   -- perioada de timp 
     signal clock  : STD_LOGIC := '0';  
     signal reset  : STD_LOGIC := '0';
     signal Q  : STD_LOGIC_VECTOR (2 downto 0) := "111";  --setam starea initiala ca fiind "111" de la automatul de tranzitii
     signal  D0, D1, D2 : STD_LOGIC := '1';
     signal not_Q0 : STD_LOGIC := '1';  -- poarta Qo negat intrucat o folosim la doar mux-uri
     signal mux1_I1 : STD_LOGIC :='1';  -- poarta or intre Q0 negat si Q1
 
begin 
    
    not_Q0 <= not Q(0);
    mux1_I1 <= (not Q(0)) or Q(1);
    
    BST0: bistabil port map( D => D0, CLK => clock, R => reset, Q => Q(0));  -- 3 bistabile realizate de starea viitoare din tabelul de adevar
    BST1: bistabil port map( D => D1, CLK => clock, R => reset, Q => Q(1));
    BST2: bistabil port map( D => D2, CLK => clock, R => reset, Q => Q(2));
    
    MUX0: mux2_1 port map(I0 => Q(1), I1 => Q(1), a => Q(2), y => D0);      -- 3 mux-uri realizate de starea viitoare din tabelul de adevar                   
    MUX1: mux2_1 port map(I0 => '0', I1 => mux1_I1, a => Q(2), y => D1);                         
    MUX2: mux2_1 port map(I0 => not_Q0, I1 => not_Q0, a => Q(2), y => D2); 
    
    clk: process             -- procesul de clock
    begin
            clock <= '0';
            wait for clk_p/2;
            clock <= '1';
            wait for clk_p/2; 
           
    end process; 
     
     
    stim: process            -- procesul de reset
    begin 
           reset <= '1';
           wait for 10 ns;   
           reset <= '0';
           wait;
    end process;
 
end;