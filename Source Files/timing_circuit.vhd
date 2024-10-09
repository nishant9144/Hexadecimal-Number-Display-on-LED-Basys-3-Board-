
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity Timing_block is
    Port (
        clk_in : in STD_LOGIC; -- 100 MHz input clock
        reset : in STD_LOGIC; -- Reset signal
        mux_out : out STD_LOGIC_VECTOR (1 downto 0); -- Signal for the mux
        anodes : out STD_LOGIC_VECTOR (3 downto 0) -- Anodes signal for display
    );
end Timing_block;
architecture Behavioral of Timing_block is
    constant N : integer := 100000;-- <need to select correct value>
    signal counter: integer := 0;
    signal new_clk : STD_LOGIC := '0';
    signal mux_select : STD_LOGIC_VECTOR (1 downto 0) := "00";
begin
    --Process 1 for dividing the clock from 100 Mhz to 1Khz - 60hz
    NEW_CLK_process: process(clk_in, reset)
    begin
        if reset = '1' then
            counter <= 0;
            new_clk <= '0';
        elsif rising_edge(clk_in) then
            if counter = N/2 - 1 then
                new_clk <= not new_clk;
                counter <= 0;
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;
    --Process 2 for mux select signal
    MUX_select_process: process(new_clk)
    begin
        if rising_edge(new_clk) then
            mux_select <= mux_select + 1;
        end if;
    end process;
    mux_out <= mux_select;
    --Process 3 for anode signal
    ANODE_select: process(mux_select)
    begin
        if reset = '1' then
            anodes <= "1111";
        else
            case mux_select is
                when "00" =>
                    anodes <= "1110"; --first display;
                when "01" =>
                    anodes <= "1101"; --second display
                when "10" =>
                    anodes <= "1011"; -- third display
                when "11" =>
                    anodes <= "0111"; -- fourth display
                when others =>
                    anodes <= "1111"; -- Default case
            end case;
        end if;
    end process;
end Behavioral;
