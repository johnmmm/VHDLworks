LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity num_live is
	port(
		key:in std_logic_vector(3 downto 0);
		display:out std_logic_vector(6 downto 0);
		display_4:out std_logic_vector(3 downto 0)
	);
end num_live;

architecture bhv of num_live is
begin
	
	process(key)
	begin
		case key is
			when"0000"=>
				display<="0011111"; --0
				display_4<="0110";
			when"0001"=>
				display<="1110000"; --1
				display_4<="0110";
			when"0010"=>
				display<="1111111"; --2
				display_4<="1011";
			when"0011"=>
				display<="1110011"; --3
				display_4<="1011";
			when"0100"=>
				display<="1110111"; --4
				display_4<="1100";
			when"0101"=>
				display<="0011111"; --5
				display_4<="1100";
			when"0110"=>
				display<="1001110"; --6
				display_4<="0001";
			when"0111"=>
				display<="0111101"; --7
				display_4<="0001";
			when"1000"=>
				display<="1001111"; --8
				display_4<="0110";
			when"1001"=>
				display<="1000111"; --9
				display_4<="0110";
			when"1010"=>
				display<="1111110"; --a
				display_4<="1011";
			when"1011"=>
				display<="0110000"; --b
				display_4<="1011";
			when"1100"=>
				display<="1101101"; --c
				display_4<="1100";
			when"1101"=>
				display<="1111001"; --d
				display_4<="1100";
			when"1110"=>
				display<="0110011"; --e
				display_4<="0001";
			when"1111"=>
				display<="1011011"; --f
				display_4<="0001";
			when others=>
				display<="0000000";
		end case;
	end process;
end bhv;
