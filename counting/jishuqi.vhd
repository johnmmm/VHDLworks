LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity jishuqi is
	port(
		enable: in std_logic;
		clk: in std_logic;
		rst: in std_logic;
		display1: out std_logic_vector(6 downto 0);
		display2: out std_logic_vector(6 downto 0)
	);
end jishuqi;

architecture bhv of jishuqi is
	component counting
		port(
			clk: in std_logic;
			rst: in std_logic;
			panqian: in std_logic;
			choose: in std_logic;
			panquan: out std_logic;
			num: out std_logic
		);
	end component;
	
	component display
		port(
			key: in std_logic_vector(3 downto 0);
			display: out std_logic_vector(6 downto 0)
		);
	end component;
	
	signal keys: std_logic_vector(7 downto 0);
	signal changekeys: std_logic_vector(7 downto 0);
	signal rcs: std_logic_vector(7 downto 0);
	signal choose: std_logic:='0';
	signal tmpcp: std_logic;
	signal cp: std_logic;
	
begin 
	process(clk)
	variable cnt: integer:=0;
		begin
			if(clk' event and clk = '0')then
				cnt:=cnt+1;
				if(cnt = 1000000)then
					cnt:=0;
					tmpcp<=not tmpcp;
				end if;
			end if;
			cp<=tmpcp;
	end process;
		
	u0: counting port map(clk=>cp, rst=>rst, panqian=>enable, choose=>choose, panquan=>rcs(0), num=>keys(0));
	u1: counting port map(clk=>cp, rst=>rst, panqian=>rcs(0), choose=>choose, panquan=>rcs(1), num=>keys(1));
	u2: counting port map(clk=>cp, rst=>rst, panqian=>rcs(1), choose=>choose, panquan=>rcs(2), num=>keys(2));
	u3: counting port map(clk=>cp, rst=>rst, panqian=>rcs(2), choose=>choose, panquan=>rcs(3), num=>keys(3));
	u4: counting port map(clk=>cp, rst=>rst, panqian=>rcs(3), choose=>choose, panquan=>rcs(4), num=>keys(4));
	u5: counting port map(clk=>cp, rst=>rst, panqian=>rcs(4), choose=>choose, panquan=>rcs(5), num=>keys(5));
	u6: counting port map(clk=>cp, rst=>rst, panqian=>rcs(5), choose=>choose, panquan=>rcs(6), num=>keys(6));
	u7: counting port map(clk=>cp, rst=>rst, panqian=>rcs(6), choose=>choose, panquan=>rcs(7), num=>keys(7));
	
	d1: display port map(key=>changekeys(3 downto 0), display=>display1);
	d2: display port map(key=>changekeys(7 downto 4), display=>display2);
	
	process(keys)
	variable cnt: integer:=0;
	variable tmp: integer:=0;
	begin
		cnt:=conv_integer(keys);
		if(cnt=59)then
			choose<='1';
		elsif(cnt=0)then
			choose<='0';
		end if;
		tmp:=cnt/10;
		changekeys(3 downto 0) <= conv_std_logic_vector(cnt - (tmp * 10), 4);
		changekeys(7 downto 4) <= conv_std_logic_vector(tmp, 4);
	end process;
end bhv;
	
	
	
	
	
	
	
	
	
	
	
	
	