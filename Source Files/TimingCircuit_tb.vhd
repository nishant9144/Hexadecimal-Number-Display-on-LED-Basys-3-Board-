library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Timing_block_tb is
-- Testbench does not have any ports
end Timing_block_tb;

architecture Behavioral of Timing_block_tb is
    -- Component Declaration of the Unit Under Test (UUT)
    component Timing_block
        Port (
            clk_in : in STD_LOGIC;
            reset : in STD_LOGIC;
            mux_out : out STD_LOGIC_VECTOR (1 downto 0);
            anodes : out STD_LOGIC_VECTOR (3 downto 0)
        );
    end component;

    -- Signal declaration to connect to UUT
    signal clk_in : STD_LOGIC := '0';
    signal reset : STD_LOGIC := '0';
    signal mux_out : STD_LOGIC_VECTOR (1 downto 0);
    signal anodes : STD_LOGIC_VECTOR (3 downto 0);

    -- Clock period (in ns) for 100 MHz clock (10 ns period)
    constant clk_period : time := 10 ns;

begin
    -- Instantiate the Unit Under Test (UUT)
    uut: Timing_block
        Port map (
            clk_in => clk_in,
            reset => reset,
            mux_out => mux_out,
            anodes => anodes
        );

    -- Clock process definitions
    clk_process : process
    begin
        clk_in <= '0';
        wait for clk_period / 2;
        clk_in <= '1';
        wait for clk_period / 2;
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        -- Apply reset
        wait for 1000 ns;
        reset <= '1';
        wait for 3 ms;  -- Wait for some time after reset
        reset <= '0';

        -- Wait for the clock to run and observe mux_out and anodes
        wait for 1000 ns;  -- Adjust the time as per your observation needs

        -- Finish simulation
        wait;
    end process;

end Behavioral;
