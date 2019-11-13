-- Copyright (C) 1991-2014 Altera Corporation. All rights reserved.
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, the Altera Quartus II License Agreement,
-- the Altera MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Altera and sold by Altera or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- PROGRAM		"Quartus II 64-Bit"
-- VERSION		"Version 14.0.0 Build 200 06/17/2014 SJ Web Edition"
-- CREATED		"Sat Sep 12 19:03:56 2015"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

--LIBRARY work;

ENTITY VHDL_Engineering_Job IS 
	PORT
	(
		sys_clk :  IN  STD_LOGIC;
		Key :  IN  STD_LOGIC;
		SW :  IN  STD_LOGIC_VECTOR(17 DOWNTO 0);
		lysdiod_ut : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		VGA_HS :  OUT  STD_LOGIC;
		VGA_VS :  OUT  STD_LOGIC;
		VGA_CLK :  OUT  STD_LOGIC;
		VGA_BLANK_N :  OUT  STD_LOGIC;
		VGA_SYNC_N :  OUT  STD_LOGIC;
		HC :  OUT  STD_LOGIC_VECTOR(9 DOWNTO 0);
		VC :  OUT  STD_LOGIC_VECTOR(9 DOWNTO 0);
		VGA_B :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
		VGA_G :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
		VGA_R :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END VHDL_Engineering_Job;

ARCHITECTURE bdf_type OF VHDL_Engineering_Job IS 

COMPONENT player_interface
	PORT(Sys_clk : IN STD_LOGIC;
		 reset_n : IN STD_LOGIC;
		 P0 : IN STD_LOGIC;
		 P1 : IN STD_LOGIC;
		 P2 : IN STD_LOGIC;
		 P3 : IN STD_LOGIC;
		 P4 : IN STD_LOGIC;
		 P5 : IN STD_LOGIC;
		 P6 : IN STD_LOGIC;
		 P7 : IN STD_LOGIC;
		 P8 : IN STD_LOGIC;
		 P9 : IN STD_LOGIC;
		 P10 : IN STD_LOGIC;
		 P11 : IN STD_LOGIC;
		 P12 : IN STD_LOGIC;
		 P13 : IN STD_LOGIC;
		 P14 : IN STD_LOGIC;
		 P15 : IN STD_LOGIC;
		 P16 : IN STD_LOGIC;
		 P17 : IN STD_LOGIC;
		 lysdiod_ut : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

COMPONENT vga
	PORT(reset_n : IN STD_LOGIC;
		 CLOCK_50 : IN STD_LOGIC;
		 VGA_Clk25 : IN STD_LOGIC;
		 SW0 : IN STD_LOGIC;
		 SW1 : IN STD_LOGIC;
		 SW2 : IN STD_LOGIC;
		 SW3 : IN STD_LOGIC;
		 SW4 : IN STD_LOGIC;
		 SW5 : IN STD_LOGIC;
		 SW6 : IN STD_LOGIC;
		 SW7 : IN STD_LOGIC;
		 SW8 : IN STD_LOGIC;
		 SW9 : IN STD_LOGIC;
		 SW10 : IN STD_LOGIC;
		 SW11 : IN STD_LOGIC;
		 SW12 : IN STD_LOGIC;
		 SW13 : IN STD_LOGIC;
		 SW14 : IN STD_LOGIC;
		 SW15 : IN STD_LOGIC;
		 SW16 : IN STD_LOGIC;
		 SW17 : IN STD_LOGIC;
		 board_pos_check : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 VGA_HS : OUT STD_LOGIC;
		 VGA_VS : OUT STD_LOGIC;
		 VGA_CLK : OUT STD_LOGIC;
		 VGA_BLANK_N : OUT STD_LOGIC;
		 VGA_SYNC_N : OUT STD_LOGIC;
		 HC : OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
		 VC : OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
		 VGA_B : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		 VGA_G : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		 VGA_R : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT pll_design
	PORT(reset_n : IN STD_LOGIC;
		 clkin_50 : IN STD_LOGIC;
		 clkout_25 : OUT STD_LOGIC
	);
END COMPONENT;

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
signal S0,S1, S2,S3,S4,S5,S6,S7,S8,S9,S10,S11,S12,S13,S14,S15,S16,S17 :std_logic;
signal S0_msp,S1_msp, S2_msp,S3_msp,S4_msp,S5_msp,S6_msp,S7_msp,S8_msp,S9_msp,S10_msp,S11_msp,S12_msp,S13_msp,S14_msp,S15_msp,S16_msp,S17_msp :std_logic;
signal reset_n_msp, reset_n: std_logic;
BEGIN 
metastability_protection : process(sys_clk)
 begin
    if rising_edge(sys_clk) then
         S0_msp<= SW(0);
			S1_msp<= SW(1);
			S2_msp<= SW(2);
			S3_msp<= SW(3);
			S4_msp<= SW(4);
			S5_msp<= SW(5);
			S6_msp<= SW(6);
			S7_msp<= SW(7);
			S8_msp<= SW(8);
			S9_msp<= SW(9);
			S10_msp<= SW(10);
			S11_msp<= SW(11);
			S12_msp<= SW(12);
			S13_msp<= SW(13);
			S14_msp<= SW(14);
			S15_msp<= SW(15);
			S16_msp<= SW(16);
			S17_msp<= SW(17);
			reset_n_msp<=key;
		------------------------------------
			S0<= S0_msp;
			S1<= S1_msp;
			S2<= S2_msp;
			S3<= S3_msp;
			S4<= S4_msp;
			S5<= S5_msp;
			S6<= S6_msp;
			S7<= S7_msp;
			S8<= S8_msp;
			S9<= S9_msp;
			S10<= S10_msp;
			S11<= S11_msp;
			S12<= S12_msp;
			S13<= S13_msp;
			S14<= S14_msp;
			S15<= S15_msp;
			S16<= S16_msp;
			S17<= S17_msp;
			reset_n<=reset_n_msp;
    end if;
end process metastability_protection;


b2v_inst : player_interface
PORT MAP(Sys_clk => sys_clk,
		 reset_n => reset_n,
		 P0 => S0,
		 P1 => S1,
		 P2 => S2,
		 P3 => S3,
		 P4 => S4,
		 P5 => S5,
		 P6 => S6,
		 P7 => S7,
		 P8 => S8,
		 P9 => S9,
		 P10 => S10,
		 P11 => S11,
		 P12 => S12,
		 P13 => S13,
		 P14 => S14,
		 P15 => S15,
		 P16 => S16,
		 P17 => S17,
		 lysdiod_ut => SYNTHESIZED_WIRE_1);


b2v_inst1 : vga
PORT MAP(reset_n => reset_n,
		 CLOCK_50 => sys_clk,
		 VGA_Clk25 => SYNTHESIZED_WIRE_0,
		 SW0 => S0,
		 SW1 => S1,
		 SW2 => S2,
		 SW3 => S3,
		 SW4 => S4,
		 SW5 => S5,
		 SW6 => S6,
		 SW7 => S7,
		 SW8 => S8,
		 SW9 => S9,
		 SW10 => S10,
		 SW11 => S11,
		 SW12 => S12,
		 SW13 => S13,
		 SW14 => S14,
		 SW15 => S15,
		 SW16 => S16,
		 SW17 => S17,
		 board_pos_check => SYNTHESIZED_WIRE_1,
		 VGA_HS => VGA_HS,
		 VGA_VS => VGA_VS,
		 VGA_CLK => VGA_CLK,
		 VGA_BLANK_N => VGA_BLANK_N,
		 VGA_SYNC_N => VGA_SYNC_N,
		 HC => HC,
		 VC => VC,
		 VGA_B => VGA_B,
		 VGA_G => VGA_G,
		 VGA_R => VGA_R);


b2v_inst2 : pll_design
PORT MAP(reset_n => reset_n,
		 clkin_50 => sys_clk,
		 clkout_25 => SYNTHESIZED_WIRE_0);


END bdf_type;