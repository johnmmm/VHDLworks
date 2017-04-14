LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity half_num is
	port(
		a1:in std_logic;
		b1:in std_logic;
		so:out std_logic;
		co:out std_logic
	);
end half_num;

architecture half_add of half_num is
begin
	so <= a1 xor b1;
	co <= a1 and b1;
end;