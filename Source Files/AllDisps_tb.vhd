------------------------------------------------------------------------------------
---- Company: 
---- Engineer: 
---- 
---- Create Date: 06.09.2024 22:36:16
---- Design Name: 
---- Module Name: AllDisps_tb - Behavioral
---- Project Name: 
---- Target Devices: 
---- Tool Versions: 
---- Description: 
---- 
---- Dependencies: 
---- 
---- Revision:
---- Revision 0.01 - File Created
---- Additional Comments:
---- 
------------------------------------------------------------------------------------


--library IEEE;
--use IEEE.STD_LOGIC_1164.ALL;

---- Uncomment the following library declaration if using
---- arithmetic functions with Signed or Unsigned values
----use IEEE.NUMERIC_STD.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx leaf cells in this code.
----library UNISIM;
----use UNISIM.VComponents.all;

--entity AllDisps_tb is
--end AllDisps_tb;

--architecture Behavioral of AllDisps_tb is

--begin


--end Behavioral;












library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

entity tb_allsDisplays is
end tb_allsDisplays;

architecture tb of tb_allsDisplays is

    -- Component Declaration for the Unit Under Test (UUT)
    component allsDisplays is
        Port (
            a : in STD_LOGIC_VECTOR (3 downto 0);
            b : in STD_LOGIC_VECTOR (3 downto 0);
            c : in STD_LOGIC_VECTOR (3 downto 0);
            d : in STD_LOGIC_VECTOR (3 downto 0);
            segment : out STD_LOGIC_VECTOR (6 downto 0);
            clk_in : in STD_LOGIC;
            reset : in STD_LOGIC;
            anodes : out STD_LOGIC_VECTOR (3 downto 0)
        );
    end component;

    -- Testbench Signals
    signal a_tb, b_tb, c_tb, d_tb : STD_LOGIC_VECTOR(3 downto 0);
    signal segment_tb : STD_LOGIC_VECTOR(6 downto 0);
    signal clk_in_tb : STD_LOGIC := '0';
    signal reset_tb : STD_LOGIC := '0';
    signal anodes_tb : STD_LOGIC_VECTOR(3 downto 0);

    -- Clock period definition
    constant clk_period : time := 10 ns; -- 100 MHz clock

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: allsDisplays Port map (
        a => a_tb,
        b => b_tb,
        c => c_tb,
        d => d_tb,
        segment => segment_tb,
        clk_in => clk_in_tb,
        reset => reset_tb,
        anodes => anodes_tb
    );

    -- Clock process definitions
    clk_process : process
    begin
        clk_in_tb <= '0';
        wait for clk_period/2;
        clk_in_tb <= '1';
        wait for clk_period/2;
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        -- Hold reset state for 100 ns.
        reset_tb <= '1';
        wait for 100 ns;
        
        reset_tb <= '0'; -- Release reset
        
        -- Test case 1: Provide initial values to a, b, c, d
        a_tb <= "0001";  -- 1
        b_tb <= "0010";  -- 2
        c_tb <= "0011";  -- 3
        d_tb <= "0100";  -- 4
        wait for 10 ms;  -- Wait for 10 cycles of new_clk (10 ms for 1 kHz)

        -- Test case 2: Change the input values
        a_tb <= "0101";  -- 5
        b_tb <= "0110";  -- 6
        c_tb <= "0111";  -- 7
        d_tb <= "1000";  -- 8
        wait for 10 ms;

        -- Test case 3: Another set of values
        a_tb <= "1001";  -- 9
        b_tb <= "1010";  -- A
        c_tb <= "1011";  -- B
        d_tb <= "1100";  -- C
        wait for 10 ms;
        
        -- Test case 4: More values
        a_tb <= "1101";  -- D
        b_tb <= "1110";  -- E
        c_tb <= "1111";  -- F
        d_tb <= "0000";  -- 0
        wait for 10 ms;

        -- Stop the simulation
        wait;
    end process;

end tb;

