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
-- ***************************************************************************
-- This file contains a Vhdl test bench template that is freely editable to   
-- suit user's needs .Comments are provided in each section to help the user  
-- fill out necessary details.                                                
-- ***************************************************************************
-- Generated on "09/13/2015 21:58:25"
                                                            
-- Vhdl Test Bench template for design  :  VHDL_Engineering_Job
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all; 
--use ieee.std_logic_signed.all;
USE ieee.numeric_std.all ;                               
--LIBRARY work;
ENTITY VHDL_Engineering_Job_vhd_tst IS
END VHDL_Engineering_Job_vhd_tst;
ARCHITECTURE VHDL_Engineering_Job_arch OF VHDL_Engineering_Job_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL HC : STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL Key : STD_LOGIC;
SIGNAL lysdiod_ut : STD_LOGIC_VECTOR(3 DOWNTO 0);
--SIGNAL reset_n : STD_LOGIC;
--SIGNAL SW0 : STD_LOGIC;
--SIGNAL SW1 : STD_LOGIC;
--SIGNAL SW2 : STD_LOGIC;
--SIGNAL SW3 : STD_LOGIC;
--SIGNAL SW4 : STD_LOGIC;
--SIGNAL SW5 : STD_LOGIC;
--SIGNAL SW6 : STD_LOGIC;
--SIGNAL SW7 : STD_LOGIC;
--SIGNAL SW8 : STD_LOGIC;
--SIGNAL SW9 : STD_LOGIC;
--SIGNAL SW10 : STD_LOGIC;
--SIGNAL SW11 : STD_LOGIC;
--SIGNAL SW12 : STD_LOGIC;
--SIGNAL SW13 : STD_LOGIC;
--SIGNAL SW14 : STD_LOGIC;
--SIGNAL SW15 : STD_LOGIC;
--SIGNAL SW16 : STD_LOGIC;
--SIGNAL SW17 : STD_LOGIC;
SIGNAL SW : STD_LOGIC_VECTOR(17 DOWNTO 0);
SIGNAL sys_clk : STD_LOGIC;
SIGNAL Clk_50 : STD_LOGIC;
SIGNAL VC : STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL VGA_B : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL VGA_BLANK_N : STD_LOGIC;
SIGNAL VGA_CLK : STD_LOGIC;
SIGNAL VGA_G : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL VGA_HS : STD_LOGIC;
SIGNAL VGA_R : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL VGA_SYNC_N : STD_LOGIC;
SIGNAL VGA_VS : STD_LOGIC;
COMPONENT VHDL_Engineering_Job
	PORT (
	HC : BUFFER STD_LOGIC_VECTOR(9 DOWNTO 0);
	Key : IN STD_LOGIC;
	lysdiod_ut : BUFFER STD_LOGIC_VECTOR(3 DOWNTO 0);
	SW : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
	sys_clk : IN STD_LOGIC;
	Clock_50 : IN STD_LOGIC;
	VC : BUFFER STD_LOGIC_VECTOR(9 DOWNTO 0);
	VGA_B : BUFFER STD_LOGIC_VECTOR(7 DOWNTO 0);
	VGA_BLANK_N : BUFFER STD_LOGIC;
	VGA_CLK : BUFFER STD_LOGIC;
	VGA_G : BUFFER STD_LOGIC_VECTOR(7 DOWNTO 0);
	VGA_HS : BUFFER STD_LOGIC;
	VGA_R : BUFFER STD_LOGIC_VECTOR(7 DOWNTO 0);
	VGA_SYNC_N : BUFFER STD_LOGIC;
	VGA_VS : BUFFER STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : VHDL_Engineering_Job
	PORT MAP (
-- list connections between master ports and signals
	HC => HC,
	Key => Key,
	lysdiod_ut => lysdiod_ut,
	SW => SW,
	sys_clk => sys_clk,
	VC => VC,
	VGA_B => VGA_B,
	VGA_BLANK_N => VGA_BLANK_N,
	VGA_CLK => VGA_CLK,
	VGA_G => VGA_G,
	VGA_HS => VGA_HS,
	VGA_R => VGA_R,
	VGA_SYNC_N => VGA_SYNC_N,
	VGA_VS => VGA_VS
	);
clock: process 
    begin 
-- Clock period is set to 20 ns => 50MHz 
     sys_clk <= '0'; 
	  Clk_50<= '0'; 
    WAIT FOR 25ps; 
    sys_clk <= '1'; 
	   Clk_50<= '1';
    WAIT FOR 25ps; 
   end process clock; 
init : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
        -- code that executes only once  
		  reset_n=key;
		  
--	KEY<='1';	  
--   SW<="00000000000000000"	;
--   WAIT FOR 100ps; 	
--	SW<="101100010010011101"; ----- TIE
--   WAIT FOR 300ps; 
--	KEY<='0';
--	WAIT FOR 100ps; 
--	KEY<='1';
--	SW<="011100010100011101"; ------Player 1 Win
--   WAIT FOR 300ps; 
--	KEY<='0';
--	WAIT FOR 100ps; 
--	KEY<='1';
--	SW<="001010100000100011"; ------Player 2 Win
--   WAIT FOR 25ps; 
WAIT;                                                       
END PROCESS init;                                           
always : PROCESS                                              
-- optional sensitivity list                                  
-- (        )                                                 
-- variable declarations                                      
BEGIN                                                         
        -- code executes for every event on sensitivity list  
WAIT;                                                        
END PROCESS always;                                          
END VHDL_Engineering_Job_arch;
