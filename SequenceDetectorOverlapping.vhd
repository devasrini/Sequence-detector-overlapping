----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.01.2021 16:26:54
-- Design Name: 
-- Module Name: SequencedDetector - Behavioral
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

entity SequencedDetectorOverlapping is
Port (
clck: std_logic;
rst : std_logic;
din : in std_logic;
out_1: out std_logic
 );
end SequencedDetectorOverlapping;

architecture Behavioral of SequencedDetectorOverlapping is
type state_type is (start,s0,s1,s2);
signal prev_state,next_state,state: state_type;
signal temp_out,prev_value : std_logic;
begin
p1: process(clck)
begin 
if(rising_edge(clck)) then
  if(rst = '1') then
     state <= start;
  else
    state <= next_state;
  end if;
end if;
end process p1;
p2: process(state,din)
begin
case(state) is
when s0=>
temp_out <= '0';
   if((din = '1')) then
   next_state <= s1;
   else 
    next_state <= s0;
    end if;
when s1=>
temp_out <= '0';
   if(din = '0') then
   next_state <= s2;
   else 
    next_state <= s1;
    end if;
when s2=>
   if(din = '1') then
   next_state <= s1;
   temp_out <= '1';
   else 
    next_state <= s0;
    temp_out <= '0';
    end if;
when others =>
   next_state <= s0;
end case;
end process p2;
out_1 <= temp_out;
end Behavioral;
