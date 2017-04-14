LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity adding is
	port(
		a:in std_logic_vector(3 downto 0);
		b:in std_logic_vector(3 downto 0);
		c:in std_logic;
		ans:out std_logic_vector(4 downto 0)
	);
end adding;

architecture addbhv of adding is
signal a1:std_logic_vector(4 downto 0):="00000";
signal b1:std_logic_vector(4 downto 0):="00000";
signal c1:std_logic_vector(4 downto 0):="00000";
begin
	a1(3 downto 0) <= a;
	b1(3 downto 0) <= b;
	c1(0) <= c;
	ans <= a1 + b1 + c1;
end;