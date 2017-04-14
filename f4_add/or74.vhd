LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity or74 is
	port(
		a2:in std_logic;
		b2:in std_logic;
		c2:out std_logic
	);
end or74;

architecture orbhv of or74 is
begin
	c2 <= a2 or b2;
end;