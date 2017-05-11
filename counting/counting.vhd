LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity counting is
	port(
		clk: in std_logic;
		rst: in std_logic;
		panqian: in std_logic;
		choose: in std_logic;
		panquan: out std_logic;
		num: out std_logic
	);
end counting;

architecture bhv of counting is
signal num1: std_logic:='0';
begin
	process(clk,rst)
	begin
		if(rst='0')then
			num1 <= '0';
		elsif(clk' event and clk = '0')then
			if(choose = '0')then
				num1 <= num1 xor panqian;
			else
				num1 <= '0';
			end if;
		end if;
	end process;
	num <= num1;
	panquan <= panqian and num1;
end bhv;