LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity num_add is
	port(
		a1:in std_logic;
		b1:in std_logic;
		c1:in std_logic;
		sout:out std_logic
	);
end num_add;

architecture addbhv of num_add is
begin
	sout <= a1 xor b1 xor c1;
end;