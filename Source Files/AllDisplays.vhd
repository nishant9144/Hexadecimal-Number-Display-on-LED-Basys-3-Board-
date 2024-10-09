
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity allsDisplays is
    Port (
        a : in STD_LOGIC_VECTOR (3 downto 0);
        b : in STD_LOGIC_VECTOR (3 downto 0);
        c : in STD_LOGIC_VECTOR (3 downto 0);
        d : in STD_LOGIC_VECTOR (3 downto 0);
        segment : out STD_LOGIC_VECTOR (6 downto 0);
        clk_in : in STD_LOGIC; -- 100 MHz input clock
        reset : in STD_LOGIC; -- Reset signal
        anodes : out STD_LOGIC_VECTOR (3 downto 0) -- Anodes signal for display
);
end allsDisplays;

architecture Behavioral of allsDisplays is
    -- Components
    component newMUX is
        Port (
            a : in STD_LOGIC_VECTOR (3 downto 0);
            b : in STD_LOGIC_VECTOR (3 downto 0);
            c : in STD_LOGIC_VECTOR (3 downto 0);
            d : in STD_LOGIC_VECTOR (3 downto 0);
            s1 : in STD_LOGIC;
            s2 : in STD_LOGIC;
            Output : out STD_LOGIC_VECTOR (3 downto 0)
        );
    end component;
    
    component seven_seg_decode is
        Port (
            v : in STD_LOGIC_VECTOR (3 downto 0);
            segments : out STD_LOGIC_VECTOR (6 downto 0)
        );
    end component;
    
    component Timing_block is
        Port (
            clk_in : in STD_LOGIC; -- 100 MHz input clock
            reset : in STD_LOGIC; -- Reset signal
            mux_out : out STD_LOGIC_VECTOR (1 downto 0); -- Signal for the mux
            anodes : out STD_LOGIC_VECTOR (3 downto 0) -- Anodes signal for display
        );
    end component;    
    
    signal mux_ka_out : STD_LOGIC_VECTOR (3 downto 0);
    signal mux_select: STD_LOGIC_VECTOR(1 downto 0);
begin
    --Process 1 for dividing the clock from 100 Mhz to 1Khz - 60hz
    mux_inst: newMUX Port map (
        a => a,
        b => b,
        c => c,
        d => d,
        s1 => mux_select(0),
        s2 => mux_select(1),
        Output => mux_ka_out
    );
    seg_decode_inst: seven_seg_decode Port map (
        v => mux_ka_out,
        segments => segment
    );
    timer_inst: Timing_block Port map (
        clk_in => clk_in,
        reset => reset,
        mux_out => mux_select,
        anodes => anodes
    );    
end Behavioral;