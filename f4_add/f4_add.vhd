LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity f4_add is
	port(
		a:in std_logic_vector(3 downto 0);
		b:in std_logic_vector(3 downto 0);
		c:in std_logic;
		ans:out std_logic_vector(4 downto 0)
	);
end f4_add;

architecture final_add of f4_add is
	component full_num
		port(
			ain:in std_logic;
			bin:in std_logic;
			cin:in std_logic;
			sout:out std_logic;
			cout:out std_logic
		);
	end component;
	signal cn: std_logic_vector(1 to 3);
begin
	U1: full_num port map(ain => a(0), bin => b(0), cin => c, sout => ans(0), cout => cn(1));
	U2: full_num port map(ain => a(1), bin => b(1), cin => cn(1), sout => ans(1), cout => cn(2));
	U3: full_num port map(ain => a(2), bin => b(2), cin => cn(2), sout => ans(2), cout => cn(3));
	U4: full_num port map(ain => a(3), bin => b(3), cin => cn(3), sout => ans(3), cout => ans(4));
end;
	

