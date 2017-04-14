LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity num_live_click is
	port(
		clk,rst:in std_logic;
		display:out std_logic_vector(6 downto 0);
		display_14:out std_logic_vector(2 downto 0);
		display_24:out std_logic_vector(3 downto 0)
	);
end num_live_click;

architecture bhv of num_live_click is
begin
	
	process(clk,rst)
	variable cqi:integer range 0 to 15; 
	begin
		if rising_edge(clk) then
			if cqi=1
				then
				display<="1101101";
				display_14<="000";
				display_24<="0000";
			elsif cqi=2
				then
				display<="1111001";
				display_14<="001";
				display_24<="0001";
			elsif cqi=3
				then
				display<="1011011";
				display_14<="010";
				display_24<="0010";
			elsif cqi=4
				then
				display<="1110000";
				display_14<="011";
				display_24<="0011";
			elsif cqi=5
				then
				display<="0011111";
				display_14<="100";
				display_24<="0100";
			elsif cqi=6
				then
				display<="0111101";
				display_14<="000";
				display_24<="0101";
			elsif cqi=7
				then
				display<="1101101";
				display_14<="001";
				display_24<="0110";
			elsif cqi=8
				then
				display<="1111001";
				display_14<="010";
				display_24<="0111";
			elsif cqi=9
				then
				display<="1011011";
				display_14<="011";
				display_24<="1000";
			elsif cqi=10
				then
				display<="1110000";
				display_14<="100";
				display_24<="1001";
			end if;
			cqi:=cqi+1;
			if cqi=11
			then cqi:=0;
			end if;
		end if;
	end process;
end bhv;




