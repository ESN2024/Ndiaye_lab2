library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 

entity lab2_vhd is port
(
	 clk,rst : in std_logic ; 
	 seg1 : out std_logic_vector(7 downto 0);
	 seg2 : out std_logic_vector(7 downto 0);
	 seg3 : out std_logic_vector(7 downto 0)
);
end entity;

architecture rtl of lab2_vhd is

signal cnt1 : std_logic_vector(3 downto 0);
signal cnt2 : std_logic_vector(3 downto 0);
signal cnt3 : std_logic_vector(3 downto 0);


    component lab2 is
        port (
            clk_clk                          : in  std_logic                    := 'X';             -- clk
            reset_reset_n                    : in  std_logic                    := 'X';             -- reset_n
            pio_2_external_connection_export : out std_logic_vector(3 downto 0);                    -- export
            pio_1_external_connection_export : out std_logic_vector(3 downto 0);                    -- export
            pio_0_external_connection_export : out std_logic_vector(3 downto 0)
        );
    end component lab2;
	 
	 component bin_to_7_seg is port 
	 (
					bin: in std_logic_vector(3 downto 0);
					seg: out std_logic_vector(7 downto 0)
     );
    end component bin_to_7_seg;
	 
begin

	u0 : component lab2 port map 
			(
            clk_clk                          => clk,                          --                       clk.clk
            reset_reset_n                    => rst,                    --                     reset.reset_n
            pio_2_external_connection_export => cnt3, -- pio_2_external_connection.export
            pio_1_external_connection_export => cnt2, -- pio_1_external_connection.export
            pio_0_external_connection_export => cnt1  --                       
			);

	v0: component bin_to_7_seg port map(cnt1,seg1);
	
	v1: component bin_to_7_seg port map(cnt2,seg2);
	
	v2: component bin_to_7_seg port map(cnt3,seg3);
	
   

		  
		  
		
		  
		  
end  architecture;
