LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity chaoqianadd is
	port(
		a:in std_logic_vector(3 downto 0);
		b:in std_logic_vector(3 downto 0);
		c:in std_logic;
		ans:out std_logic_vector(4 downto 0)
	);
end chaoqianadd;

architecture chaobhv of chaoqianadd is
	component count_c
		port(
			pn:in std_logic_vector(3 downto 0);
			gn:in std_logic_vector(3 downto 0);
			c_1:in std_logic;
			cn:out std_logic_vector(3 downto 0)
		);
	end component;
	component num_add
		port(
			a1:in std_logic;
			b1:in std_logic;
			c1:in std_logic;
			sout:out std_logic
		);
	end component;
	signal pm: std_logic_vector(3 downto 0);
	signal gm: std_logic_vector(3 downto 0);
	signal cc: std_logic_vector(3 downto 0);
begin	
	U1: num_add port map(a1 => a(0), b1 => b(0), c1 => c, sout => ans(0));
	U2: num_add port map(a1 => a(1), b1 => b(1), c1 => cc(0), sout => ans(1));
	U3: num_add port map(a1 => a(2), b1 => b(2), c1 => cc(1), sout => ans(2));
	U4: num_add port map(a1 => a(3), b1 => b(3), c1 => cc(2), sout => ans(3));
	U5: count_c port map(pn => pm, gn => gm, c_1 => c, cn => cc);
	ans(4) <= cc(3);
	process(a,b)
	begin
		for i in 0 to 3 loop
			pm(i) <= a(i) xor b(i);
			gm(i) <= a(i) and b(i);
		end loop;
	end process;
end;
