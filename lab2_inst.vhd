	component lab2 is
		port (
			clk_clk        : in std_logic                    := 'X';             -- clk
			reset_reset_n  : in std_logic                    := 'X';             -- reset_n
			cnt_3_export   : in std_logic_vector(7 downto 0) := (others => 'X'); -- export
			cnt_2_export   : in std_logic_vector(7 downto 0) := (others => 'X'); -- export
			cnt_2_1_export : in std_logic_vector(7 downto 0) := (others => 'X')  -- export
		);
	end component lab2;

	u0 : component lab2
		port map (
			clk_clk        => CONNECTED_TO_clk_clk,        --     clk.clk
			reset_reset_n  => CONNECTED_TO_reset_reset_n,  --   reset.reset_n
			cnt_3_export   => CONNECTED_TO_cnt_3_export,   --   cnt_3.export
			cnt_2_export   => CONNECTED_TO_cnt_2_export,   --   cnt_2.export
			cnt_2_1_export => CONNECTED_TO_cnt_2_1_export  -- cnt_2_1.export
		);

