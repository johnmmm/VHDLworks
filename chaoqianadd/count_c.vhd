LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity count_c is
	port(
		pn:in std_logic_vector(3 downto 0);
		gn:in std_logic_vector(3 downto 0);
		c_1:in std_logic;
		cn:out std_logic_vector(3 downto 0)
	);
end count_c;
	
architecture countbhv of count_c is
begin
	cn(0) <= gn(0) or (pn(0) and c_1);
	cn(1) <= gn(1) or (pn(1) and gn(0)) or (pn(1) and pn(0) and c_1);
	cn(2) <= gn(2) or (pn(2) and gn(1)) or (pn(2) and pn(1) and gn(0)) or (pn(2) and pn(1) and pn(0) and c_1);
	cn(3) <= gn(3) or (pn(3) and gn(2)) or (pn(3) and pn(2) and gn(1)) or (pn(3) and pn(2) and pn(1) and pn(0) and c_1);
end;