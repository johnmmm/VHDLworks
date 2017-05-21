LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity codes is
	port(
		rst:in std_logic;
		clk:in std_logic;
		mode:in std_logic_vector(1 downto 0);
		code:in std_logic_vector(3 downto 0);
		error:out std_logic;
		alert:out std_logic;
		unlock:out std_logic;
		success:out std_logic;
		display:out std_logic_vector(3 downto 0)
	);
end codes;

architecture bhv of codes is
shared variable status:integer range 0 to 16:=0;

signal c1:std_logic_vector(3 downto 0);
signal c2:std_logic_vector(3 downto 0);
signal c3:std_logic_vector(3 downto 0);
signal c4:std_logic_vector(3 downto 0);

signal c5:std_logic_vector(3 downto 0):="0100";
signal c6:std_logic_vector(3 downto 0):="1000";
signal c7:std_logic_vector(3 downto 0):="0110";
signal c8:std_logic_vector(3 downto 0):="1001";

begin
	process(clk,rst)
	variable wrongtimes:integer:=0;
	begin
		if(rst = '0')then
			if(mode = "00" and status < 5)then
				status:=1;
			elsif(mode = "01")then
				if(wrongtimes < 3)then
					status:=5;
				else
					status:=9;
				end if;
			elsif(mode = "10")then
				status:=9;
			else
				status:=0;
			end if;
		else
			if(clk' event and clk = '0')then
				if(mode = "00")then
					if(status = 1)then
						c1 <= code;
						status:=status+1;
					elsif(status = 2)then
						c2 <= code;
						status:=status+1;
					elsif(status = 3)then
						c3 <= code;
						status:=status+1;
					elsif(status = 4)then
						c4 <= code;
						status:=0;
						success <= '0';
					end if;
				elsif(mode = "01")then
					if((status=5 and code=c1) or (status=6 and code=c2) or (status=7 and code=c3) or (status=8 and code=c4))then
						if(status=8)then
							status:=14;
							wrongtimes:=0;
							success <= '1';
						else
							status:=status+1;
						end if;
					else
						wrongtimes:=wrongtimes+1;
						if(wrongtimes < 3)then
							status:=13;
						else
							status:=0;
						end if;
					end if;
				elsif(mode = "10")then
					if((status=9 and code=c5) or (status=10 and code=c6) or (status=11 and code=c7) or (status=12 and code=c8))then
						if(status=12)then
							status:=14;
							wrongtimes:=0;
							success <= '1';
						else
							status:=status+1;
						end if;
					else
						status:=13;
					end if;
				end if;
			end if;
		end if;
	end process;
	
	process(clk,rst)
	begin
		if(status=0)then
			unlock <= '1';
		else
			unlock <= '0';
		end if;
		if(status=13)then
			error <= '1';
		else 
			error <= '0';
		end if;
		if(status > 8 and status < 13)then
			alert <= '1';
		else
			alert <= '0';
		end if;
		
		if(status=0)then
			display <= "0000";
		elsif(status=1)then
			display <= "0001";
		elsif(status=2)then
			display <= "0010";
		elsif(status=3)then
			display <= "0011";
		elsif(status=4)then
			display <= "0100";
		elsif(status=5)then
			display <= "0101";
		elsif(status=6)then
			display <= "0110";
		elsif(status=7)then
			display <= "0111";
		elsif(status=8)then
			display <= "1000";
		elsif(status=9)then
			display <= "1001";
		elsif(status=10)then
			display <= "1010";
		elsif(status=11)then
			display <= "1011";
		elsif(status=12)then
			display <= "1100";
		elsif(status=13)then
			display <= "1101";
		else
			display <= "0000";
		end if;
	end process;
end bhv;






