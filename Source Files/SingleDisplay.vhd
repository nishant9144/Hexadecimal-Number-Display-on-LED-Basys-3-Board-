library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STv.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity seven_seg_decode is
--  Port ( );
    Port(
        v : in STD_LOGIC_VECTOR(3 downto 0);
        segments: out STD_LOGIC_VECTOR(6 downto 0);
        anode : out STD_LOGIC
    );
end seven_seg_decode;

architecture Behavioral of seven_seg_decode is
    signal a,b,c,d,e,f,g: std_logic;
begin
    a <= (not v(3) and not v(2) and not v(1) and v(0)) or (not v(3) and v(2) and not v(1) and not v(0)) or (v(3) and not v(2) and v(1) and v(0)) or (v(3) and v(2) and not v(1) and v(0));
    b <= (not v(3)and v(2) and not v(1) and v(0)) or (v(2) and v(1)and not v(0)) or (v(3) and v(2) and not v(0)) or (v(3) and v(1) and v(0));
    c <= (not v(3) and not v(2) and v(1) and not v(0)) or (v(3) and v(2) and not v(0)) or (v(3) and v(2) and v(1));
    d <= (not v(3) and not v(2) and not v(1) and  v(0)) or (not v(3) and v(2) and not v(1) and not v(0)) or (v(3) and not v(2) and v(1) and not v(0)) or (v(2) and v(1) and v(0));
    e <= (not v(2) and not v(1) and v(0)) or (not v(3) and v(2) and not v(1)) or (not v(3) and v(0)); 
    f <= (v(3) and v(2) and not v(1) and v(0)) or (not v(3) and not v(2) and v(0)) or (not v(3) and not v(2) and v(1)) or (not v(3) and v(1) and v(0)); 
    g <= (not v(3) and v(2) and v(1) and v(0)) or (v(3) and v(2) and not v(1) and not v(0)) or (not v(3) and not v(2) and not v(1));
    segments <= a & b & c & d & e & f & g;
    anode <= '0';
end Behavioral;