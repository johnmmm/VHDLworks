LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity full_num is
	port(
		ain:in std_logic;
		bin:in std_logic;
		cin:in std_logic;
		sout:out std_logic;
		cout:out std_logic
	);
end full_num;

architecture full_add of full_num is
	component half_num
		port(
			a1:in std_logic;
			b1:in std_logic;
			so:out std_logic;
			co:out std_logic
		);
	end component;
	component or74
		port(
			a2:in std_logic;
			b2:in std_logic;
			c2:out std_logic
		);
	end component;
	signal pn, gn, pncn: std_logic;
begin
	U1: half_num port map(a1 => ain, b1 => bin, so => pn, co => gn);
	U2: half_num port map(a1 => cin, b1 => pn, so => sout, co => pncn);
	U3: or74 port map(a2 => pncn, b2 => gn, c2 =>cout);
end;