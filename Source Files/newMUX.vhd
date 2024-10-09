----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.09.2024 15:03:40
-- Design Name: 
-- Module Name: newMUX - Behavioral
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

entity newMUX is
    Port (
        a : in STD_LOGIC_VECTOR (3 downto 0);
        b : in STD_LOGIC_VECTOR (3 downto 0);
        c : in STD_LOGIC_VECTOR (3 downto 0);
        d : in STD_LOGIC_VECTOR (3 downto 0);
        s1 : in STD_LOGIC;
        s2 : in STD_LOGIC;
        Output : out STD_LOGIC_VECTOR (3 downto 0)
    );
end newMUX;

architecture Behavioral of newMUX is
begin
    Output(0) <= (a(0) AND (NOT s1) AND (NOT s2)) OR
                  (b(0) AND s1 AND (NOT s2)) OR
                  (c(0) AND (NOT s1) AND s2) OR
                  (d(0) AND s1 AND s2);
    
    Output(1) <= (a(1) AND (NOT s1) AND (NOT s2)) OR
                  (b(1) AND s1 AND (NOT s2)) OR
                  (c(1) AND (NOT s1) AND s2) OR
                  (d(1) AND s1 AND s2);
    
    Output(2) <= (a(2) AND (NOT s1) AND (NOT s2)) OR
                  (b(2) AND s1 AND (NOT s2)) OR
                  (c(2) AND (NOT s1) AND s2) OR
                  (d(2) AND s1 AND s2);
    
    Output(3) <= (a(3) AND (NOT s1) AND (NOT s2)) OR
                  (b(3) AND s1 AND (NOT s2)) OR
                  (c(3) AND (NOT s1) AND s2) OR
                  (d(3) AND s1 AND s2);
end Behavioral;