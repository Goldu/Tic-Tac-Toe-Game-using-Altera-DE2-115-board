-- Company: TEIS AB
-- Engineer: Jasim Abbasi
-- Create Date: 2014 November 21
-- Design Name: uppgift_vhdl_3b
-- Target Devices: ALTERA Cyclone IV EP4CE115F29C7
-- Tool versions: Quartus v11 and ModelSim
-- I/O Pin Description
-- Sys_clk: PIN_Y2
-- Reset_n: PIN_Y23
-- lysdiod_ut[2..0]:PIN_E24,PIN_E25,PIN_E22
-- knapp_in_1 : PIN_M23
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.ALL;
--use ieee.std_logic_arith.all ;
entity player_interface is
port
( Sys_clk, reset_n, P0,P1,P2,P3,P4,P5,P6,P7,P8: in std_logic;
   P9,P10,P11,P12,P13,P14,P15,P16,P17: in std_logic;
lysdiod_ut : out std_logic_vector(3 downto 0)
);
End entity player_interface;
architecture rtl of player_interface is
-- internal signal declarations
signal signal_raknarvarde : std_logic_vector(3 downto 0);
signal T0,T1,T2,T3,T4,T5,T6,T7,T8 : std_logic_vector(3 downto 0);
shared VARIABLE num0,num1, num2, num3,num4, num5, num6,num7, num8, numt   : integer;
signal old_P0,old_P1, old_P2, old_P3,old_P4, old_P5, old_P6, old_P7, old_P8, old_P9 : std_logic;
signal old_P10,old_P11, old_P12, old_P13,old_P14, old_P15, old_P16, old_P17: std_logic;
--signal SW0, SW1,SW2,SW3,SW4,SW5,SW6,SW7,SW8 :std_logic;
begin
process (sys_clk)
  begin
if(rising_edge(sys_clk)) then
      old_P0<=P0;  old_P1<=P1;  old_P2<=P2;  old_P3<=P3;  old_P4<=P4;
	   old_P5<=P5; old_P6<=P6;  old_P7<=P7; old_P8<=P8;
		old_P9<=P9;  old_P10<=P10;  old_P11<=P11;  old_P12<=P12;  old_P13<=P13;
		old_P14<=P14;  old_P15<=P15;  old_P16<=P16;  old_P17<=P17;
   if reset_n = '0' then -- Reset the counter to 0
    signal_raknarvarde <= "0000";
	  elsIf((P0 = '1' and old_P0 = '0')OR (P1 = '1'  And old_P1= '0' )OR (P2 = '1' And old_P2= '0')
	  OR (P3 = '1'  and old_P3 = '0') OR (P4 = '1' and old_P4 = '0') OR (P5 = '1' and old_P5 = '0') 
	  OR (P6 = '1' And old_P6= '0') OR (P7 = '1' And old_P7= '0') OR (P8 = '1'  And old_P8= '0')
	  OR (P9 = '1' and old_P9 = '0')OR (P10 = '1'  And old_P10= '0' )OR (P11 = '1' And old_P11= '0')
	  OR (P12 = '1'  and old_P12 = '0') OR (P13 = '1' and old_P13 = '0') OR (P14 = '1' and old_P14 = '0') 
	  OR (P15 = '1' And old_P15= '0') OR (P16 = '1' And old_P16= '0') OR (P17 = '1'  And old_P17= '0'))then
        signal_raknarvarde <= signal_raknarvarde + '1'; 
  	else
	signal_raknarvarde <= signal_raknarvarde;
   end if;
  end if;
end process;
lysdiod_ut <= signal_raknarvarde;
end rtl;