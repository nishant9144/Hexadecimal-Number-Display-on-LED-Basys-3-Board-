
-- Company: 
-- Engineer: ----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.08.2024 14:48:04
-- Design Name: 
-- Module Name: seven_seg_decode_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity seven_seg_decode_tb is
--  Port ( );
end seven_seg_decode_tb;

architecture tb of seven_seg_decode_tb is
component seven_seg_decode        
    Port (            
       v : in STD_LOGIC_VECTOR(3 downto 0); -- 4-bit input digit (0-9)            
       segments : out STD_LOGIC_VECTOR(6 downto 0); -- 7-segment             
       anode : out STD_LOGIC -- Anode control for the single display
    );
end component;

signal v : STD_LOGIC_VECTOR(3 downto 0);
signal segments : STD_LOGIC_VECTOR(6 downto 0);
signal anode : STD_LOGIC;

begin
    uut : seven_seg_decode       
    Port map (
        v => v,
        segments => segments,
        anode => anode
    );
    v <= "0000", "0001" after 100 ns, "0010" after 200 ns, "0011" after 300ns, "0100" after 400ns, "0101" after 500ns, "0110" after 600ns, "0111" after 700ns, "1000" after 800ns, "1001" after 900ns, "1010" after 1000ns, "1011" after 1100ns, "1100" after 1200ns, "1101" after 1300ns, "1110" after 1400ns, "1111" after 1500ns;  
end tb;

-- 
-- Create Date: 02.09.2024 12:47:33
-- Design Name: 
-- Module Name: SingleDisplay_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


--library IEEE;
--use IEEE.STD_LOGIC_1164.ALL;

---- Uncomment the following library declaration if using
---- arithmetic functions with Signed or Unsigned values
----use IEEE.NUMERIC_STD.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx leaf cells in this code.
----library UNISIM;
----use UNISIM.VComponents.all;

--entity SevenSegmentDecoder_tb is
--end SevenSegmentDecoder_tb;

--architecture Behavioral of SevenSegmentDecoder_tb is

--    signal x : STD_LOGIC_VECTOR (3 downto 0);
--    signal a_to_g : STD_LOGIC_VECTOR (6 downto 0);

--    -- Instantiate the Unit Under Test (UUT)
--    component SevenSegmentDecoder
--    Port(
--        x : in STD_LOGIC_VECTOR (3 downto 0);
--        a_to_g : out STD_LOGIC_VECTOR (6 downto 0)
--    );
--    end component;

--begin
--    uut: SevenSegmentDecoder Port Map (
--        x => x,
--        a_to_g => a_to_g
--    );

--    -- Apply test vectors using `after` keyword
--    x <= "0000" after 0 ns,
--         "0001" after 100 ns,
--         "0010" after 200 ns,
--         "0011" after 300 ns,
--         "0100" after 400 ns,
--         "0101" after 500 ns,
--         "0110" after 600 ns,
--         "0111" after 700 ns,
--         "1000" after 800 ns,
--         "1001" after 900 ns,
--         "1010" after 1000 ns,
--         "1011" after 1100 ns,
--         "1100" after 1200 ns,
--         "1101" after 1300 ns,
--         "1110" after 1400 ns,
--         "1111" after 1500 ns;

--    -- End simulation after all test cases
--    -- Wait indefinitely (required in some simulators)
--    end_simulation: process
--    begin
--        wait for 1600 ns;
--        wait;
--    end process;

--end Behavioral;

