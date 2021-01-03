library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_unsigned.all;
 
entity top_tb is
end top_tb;

architecture Behavioral of top_tb is
component SequencedDetector is
Port (
clck: std_logic;
rst : std_logic;
din : in std_logic;
out_1: out std_logic
 );
end  component;
 
signal    clk : STD_LOGIC:= '0';
signal    din : std_logic :='0';
signal    dout : std_logic;
signal    reset : std_logic := '0';
 
 
 
signal temp : std_logic_vector(8 downto 0) := "101010010";
signal count : integer range 0 to 12 := 0;
begin
 
T1 : SequencedDetector port map(clck => clk,din => din,out_1 => dout,rst=> reset);
 
p1 : process
begin
clk <= '1';
wait for 5 ns;
clk <= '0';
wait for 5ns;
end process;
 
p2 : process(clk)
begin
if(rising_edge(clk)) then
   if(count < 9) then
     din <= temp(count);
     count <= count + 1;
   else
      count <= 0;
   end if;
end if;
end process;
 
end Behavioral;
 