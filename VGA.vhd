library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all; 
--use ieee.std_logic_signed.all;
USE ieee.numeric_std.all ;

entity VGA is
port( reset_n, CLOCK_50,VGA_Clk25 : in std_logic;
-- till VGA enheten
  HC : out std_logic_vector(10-1 downto 0);
  VC : out std_logic_vector(10-1 downto 0);
  VGA_HS, VGA_VS, VGA_CLK : out std_logic;
  VGA_BLANK_N, VGA_SYNC_N : out std_logic;
  VGA_B, VGA_G, VGA_R : out std_logic_vector(7 downto 0);
  SW0  :in std_logic;
  SW1  :in std_logic;
  SW2  :in std_logic;
  SW3  :in std_logic;
  SW4  :in std_logic;
  SW5 : in std_logic; 
  SW6 : in std_logic; 
  SW7 : in std_logic; 
  SW8 : in std_logic; 
  SW9 : in std_logic;  
  SW10 : in std_logic; 
  SW11 : in std_logic; 
  SW12 : in std_logic; 
  SW13 : in std_logic; 
  SW14 : in std_logic;
  SW15 : in std_logic; 
  SW16 : in std_logic;
  board_pos_check : in std_logic_vector(3 downto 0);
  SW17 : in std_logic);-- Switch 4);
end VGA;
architecture VGA_ARCH of VGA is
signal  HCOUNTER: integer:=0;
signal  VCOUNTER: integer :=0;
Signal  H : std_logic_vector(10-1 downto 0):= "0000000000";
Signal  V : std_logic_vector(10-1 downto 0) := "0000000000";
Signal  Temp_P1 : std_logic_vector(4-1 downto 0):= "0000";
Signal  Temp_P2: std_logic_vector(4-1 downto 0) := "0000";
Signal  Temp_S: std_logic_vector(4-1 downto 0) := "0000";
signal re_fresh: std_logic;
constant BAR_Vert: integer:= 4;
-----------------------------------------------------------
constant BAR_X_L: integer := 600;
constant BAR_X_R: integer := 603;
-- x, y coordinates (0,0 to (639, 479
constant BAR_Y_SIZE: integer := 72;
constant MAX_X: integer := 640;
constant MAX_Y: integer := 480;
signal temp1,temp2,temp3,temp4,temp5,temp6,temp7,temp8,temp9: std_logic:='0';
signal tempB1,tempB2,tempB3,tempB4,tempB5,tempB6,tempB7,tempB8,tempB9: std_logic:='0';
-- -------------------------------------------------
signal p_count : std_logic_vector(4-1 downto 0) := "0000";
signal wall_en, bar_en, ball_en: std_logic;
signal P1,P2,P3,P4,P5,P6,P7,P8,P9: std_logic;
signal PD1,PD2,PD3,PD4,PD5,PD6,PD7,PD8,PD9: std_logic;
signal PB1,PB2,PB3,PB4,PB5,PB6,PB7,PB8,PB9: std_logic;
signal TB1,TB2,TB3,TB4,TB5,TB6,TB7,TB8,TB9: std_logic;
signal Hline1,Hline2,Vline1,Vline2: std_logic; 
signal PL1,PL2,PL3,PL4,W1,W2,TL: std_logic;
signal RS1,RS2,RS3,RS4,RS5,RS6,RS7,RS8,RS9: std_logic;
signal HWline1,HWline2,HWline3,VWline1,VWline2,VWline3,DWline1,DWline2: std_logic; 
signal vbar_rgb1,vbar_rgb2, hbar_rgb1,hbar_rgb2, ball_rgb: std_logic_vector(7 downto 0);
signal vwbar_rgb1,vwbar_rgb2,vwbar_rgb3,dwbar_rgb1,dwbar_rgb2,hwbar_rgb1,hwbar_rgb2,hwbar_rgb3: std_logic_vector(7 downto 0);
signal clk_25mhz : std_logic;
begin
VGA_CLK <= clk_25mhz; -- dett var något med att en klocka skall ut till VGA kontrollerns, kolla med DE2 manualen
process_clock_25mhz: 
process (clock_50) 
     begin
	       if reset_n='0' then
            clk_25mhz<= '0';
          elsif rising_edge(clock_50) then
          clk_25mhz <= not clk_25mhz;
          end if;
 end process;
process_sync_screen : 
process (clk_25mhz)
  begin
      HC<=H;
		VC<=V;
     if rising_edge(clk_25mhz) then 
       if reset_n = '0' then
			H <=(others => '0');
         V <=(others => '0');
			VCOUNTER<=0;
			HCOUNTER<=0;
        Else
        if (H >= 799)then
        H <= (others => '0');
		  HCOUNTER<=0;
        else
        H <= H + 1;
		  HCOUNTER<=HCOUNTER+1;
        end if;
        if (v >= 524) and (h >= 707) then
            v <= (others => '0');
        elsif h = 707 then
             v <= v + 1;
				VCOUNTER<=VCOUNTER+1;
        end if;
        if (H>= 0 AND H <= 639) then
            VGA_BLANK_N <= '1';
        else
            VGA_BLANK_N <= '0';
        end if;
        if (V >= 0 AND V <= 479) then
             VGA_SYNC_N <= '1';
        else
              VGA_SYNC_N <= '0';
        end if;
		   if (H >= 659 AND H <= 755) then
            VGA_HS<= '0';
        else
             VGA_HS<= '1';
        end if;
        if (V>= 493 AND V<= 494) then
             VGA_VS<= '0';
        else
             VGA_VS <= '1';
        end if;
		  
	----------------------------------------------------------------------------
	    if((H>=208) and (H<=212))then
		      Hline1<='1';
            Hbar_rgb1 <= "11111111"; 
		  else
		       Hline1<='0';
		      Hbar_rgb1 <= "00000000";
		  end if;
	-------------------------------------------------------------------------
	    if((H>=418) and (H<=422))then
		      Hline2<='1';
            Hbar_rgb2 <= "11111111"; 
		  else
		       Hline2<='0';
		       Hbar_rgb2 <= "00000000";
		  end if;
	----------------------------------------------------------------------------
	   if((V>=158) and (V<=162))then
		      Vline1<='1';
            Vbar_rgb1 <= "11111111"; 
		  else
		       Vline1<='0';
		      Vbar_rgb1 <= "00000000";
		  end if;
	-------------------------------------------------------------------------
	   if((V>=318) and (V<=322))then
		      Vline2<='1';
            Vbar_rgb2 <= "11111111"; 
		  else
		       Vline2<='0';
		       Vbar_rgb2 <= "00000000";
		  end if;
   ---------------------------------------------------------------------------
	----------------- Screen Color Control--------------------------------
	----------------------------------------------------------------------------
	    if((H>=0) and (H<=210))then
		       HWline1<='1';
            HWbar_rgb1 <= "11111111"; 
		  else
		       HWline1<='0';
		       HWbar_rgb1 <= "00000000";
		  end if;
----------------------------------------------------------------------------
	    if((H>=214) and (H<=416))then
		       HWline2<='1';
            HWbar_rgb2 <= "11111111"; 
		  else
		       HWline2<='0';
		       HWbar_rgb2 <= "00000000";
		  end if;
 ----------------------------------------------------------------------------
	    if((H>=424) and (H<=638))then
		      HWline3<='1';
            HWbar_rgb3 <= "11111111"; 
		  else
		       HWline3<='0';
		       HWbar_rgb3 <= "00000000";
		  end if;
		  
 -------------------------------------------------
		   if((V>=0) and (V<=160))then
		      VWline1<='1';
            VWbar_rgb1 <= "11111111"; 
		  else
		       VWline1<='0';
		      VWbar_rgb1 <= "00000000";
		  end if;
	-----------------------------------------------------------------------
		   if((V>=164) and (V<=316))then
		      VWline2<='1';
            VWbar_rgb2 <= "11111111"; 
		  else
		       VWline2<='0';
		      VWbar_rgb2 <= "00000000";
		  end if;
	-----------------------------------------------------------------------
	   if((V>=324) and (V<=476))then
		      VWline3<='1';
            VWbar_rgb3 <= "11111111"; 
		  else
		       VWline3<='0';
		      VWbar_rgb3 <= "00000000";
		  end if;
	-----------------------------------------------------------------------
	   if((H>=0 and H<=210 and V>=0) and (V<=160))then
		      DWline1<='1';
		  else
		       DWline1<='0';
		 end if;
	---------------------------------------------------------
	    if((H>=318 and H<=322) and (V>=200 and V<=280))then
		 Pl1<='1'; else Pl1<='0'; end if;
		 if((H>=320 and H<=360) and (V>=200 and V<=204))then
		 Pl2<='1'; else Pl2<='0'; end if;
		 if((H>=356 and H<=360) and (V>=200 and V<=240))then
		 Pl3<='1'; else Pl3<='0'; end if;
		 if((H>=320 and H<=360) and (V>=236 and V<=240))then
		 Pl4<='1'; else Pl4<='0'; end if;
		 if((H>=376 and H<=380) and (V>=200 and V<=280))then
		 W1<='1'; else W1<='0'; end if;
		 if(((H>=376 and H<=416) and (V>=200 and V<=204))OR ((H>=412 and H<=416) and (V>=200 and V<=240))
		OR ((H>=376 and H<=416) and (V>=236 and V<=240) ) OR ((H>=376 and H<=380) and (V>=240 and V<=280))
		OR ((H>=376 and H<=416) and (V>=276 and V<=280)))then
		 W2<='1'; else W2<='0'; end if;
	---------------------------------------------------------------
	 if(((H>=100 and H<=540) and (V>=100 and V<=104))OR ((H>=100 and H<=104) and (V>=100 and V<=380))
	 OR ((H>=100 and H<=540) and (V>=376 and V<=380) ) OR ((H>=536 and H<=540) and (V>=100 and V<=380))
	 OR ((H>=200 and H<=240) and (V>=130 and V<=132))OR ((H>=400 and H<=440) and (V>=130 and V<=132))
	 OR ((H>=200 and H<=240) and (V>=155 and V<=157))OR ((H>=400 and H<=440) and (V>=155 and V<=157))
	 OR ((H>=200 and H<=202) and (V>=130 and V<=180))OR ((H>=400 and H<=402) and (V>=130 and V<=180))
	 OR ((H>=238 and H<=240) and (V>=130 and V<=155))OR ((H>=438 and H<=440) and (V>=130 and V<=155))
	 OR ((H>=250 and H<=252) and (V>=130 and V<=180))OR ((H>=450 and H<=486) and (V>=130 and V<=132))
	 OR ((H>=450 and H<=452) and (V>=155 and V<=180))OR ((H>=484 and H<=486) and (V>=130 and V<=155))
	 OR ((H>=450 and H<=452) and (V>=153 and V<=155))OR ((H>=450 and H<=486) and (V>=153 and V<=155))
	 OR ((H>=450 and H<=486) and (V>=178 and V<=180)) OR((H>=100 and H<=540) and (V>=200 and V<=204)))then
	 --OR ((H>=130 and H<=180) and (V>=130 and V<=180)) OR((H>=330 and H<=380) and (V>=130 and V<=180))
	  RS1<='1'; else RS1<='0'; end if;
	  If((H>=130 and H<=180) and (V>=130 and V<=180))then
       RS2<='1'; else RS2<='0'; end if;
	  if((H>=330 and H<=380) and (V>=130 and V<=180)) then
	    RS3<='1'; else RS3<='0'; end if;
	-----------------------Color Display--------------------------------------------
--	  If((H>=106 and H<=538) and (V>=205 and V<=379))then
--       RS4<='1'; else RS4<='0'; end if;
	--------------------------------------------------------------------
	    If(((H>=200 and H<=202) and (V>=262 and V<=322)) 
		 OR ((H>=200 and H<=230) and (V>=262 and V<=264)) 
		 OR ((H>=228 and H<=230) and (V>=262 and V<=292))
		 OR ((H>=200 and H<=230) and (V>=292 and V<=294))
		 OR ((H>=240 and H<=242) and (V>=262 and V<=322))
		 OR ((H>=280 and H<=282) and (V>=262 and V<=322))
		 OR ((H>=310 and H<=312) and (V>=262 and V<=322))
		 OR ((H>=340 and H<=342) and (V>=262 and V<=322))
		 OR ((H>=280 and H<=342) and (V>=320 and V<=322))
		 OR((H>=370 and H<=372) and (V>=262 and V<=322))
       OR((H>=400 and H<=402) and (V>=262 and V<=322))
		 OR((H>=430 and H<=432) and (V>=262 and V<=322))
		 OR ((H>=400 and H<=432) and (V>=262 and V<=264))
		 OR ((H>=368 and H<=374) and (V>=262 and V<=264))
		 OR ((H>=368 and H<=374) and (V>=320 and V<=322))) then
		  
         RS4<='1'; else RS4<='0'; end if;
	---------------------------------------------------------
	   If(((H>=200 and H<=202) and (V>=262 and V<=322)) 
		 OR ((H>=200 and H<=230) and (V>=262 and V<=264)) 
		 OR ((H>=228 and H<=230) and (V>=262 and V<=292))
		 OR ((H>=200 and H<=230) and (V>=292 and V<=294))
		 OR ((H>=240 and H<=260) and (V>=262 and V<=264))
		 OR ((H>=258 and H<=260) and (V>=262 and V<=292))
		 OR ((H>=240 and H<=260) and (V>=290 and V<=292))
		 OR ((H>=238 and H<=240) and (V>=292 and V<=322))
		 OR ((H>=238 and H<=240) and (V>=292 and V<=322))
		 OR ((H>=240 and H<=260) and (V>=320 and V<=322))
		 OR ((H>=280 and H<=282) and (V>=262 and V<=322))
		 OR ((H>=310 and H<=312) and (V>=262 and V<=322))
		 OR ((H>=340 and H<=342) and (V>=262 and V<=322))
		 OR ((H>=280 and H<=342) and (V>=320 and V<=322))
		 OR ((H>=370 and H<=372) and (V>=262 and V<=322))
       OR ((H>=400 and H<=402) and (V>=262 and V<=322))
		 OR ((H>=430 and H<=432) and (V>=262 and V<=322))
		 OR ((H>=400 and H<=432) and (V>=262 and V<=264))
		 OR ((H>=368 and H<=374) and (V>=262 and V<=264))
		 OR ((H>=368 and H<=374) and (V>=320 and V<=322))) then
		  
         RS5<='1'; else RS5<='0'; end if;
	--------------------------------------------------------------------
		---------------------------------------------------------
	    If(((H>=300 and H<=302) and (V>=262 and V<=322)) 
		 OR ((H>=280 and H<=322) and (V>=262 and V<=264)) 
		 OR ((H>=350 and H<=352) and (V>=262 and V<=322))
		 OR ((H>=380 and H<=382) and (V>=262 and V<=322))
		 OR ((H>=380 and H<=410) and (V>=262 and V<=264))
		 OR ((H>=380 and H<=410) and (V>=290 and V<=292))
		 OR ((H>=380 and H<=410) and (V>=320 and V<=322))) then
		  
         RS6<='1'; else RS6<='0'; end if;
     ----------------------------------------------------------
		  if (V = 481) and (H = 0) then
	       re_fresh <= '1';
         else 
		   re_fresh <= '0';
         end if;
	-----------------------------------------------
	  ---  Temp_P1<="1001";
	-----------------------------------------------
		end if;
		end if;
end process process_sync_screen;
-------------------------------------------------------------------------------------
process_position_move:process(H,V)
   begin
	    if ((H>=78) and (H<=130)and (V>=53) and (V<=105))then
		       P1<='1';
		------------------------------------------------------------------------
		 elsif((H>=78) and (H<=130)and (V>=216) and (V<=268)) then 
		       P4<='1';
		------------------------------------------------------------------------
		 elsif((H>=78) and (H<=130)and (V>=379) and (V<=431) ) then 
		        P7<='1';
		------------------------------------------------------------------------
		 elsif((H>=290) and (H<=342)and (V>=53) and (V<=105)) then 
	           P2<='1';
		 ------------------------------------------------------------------------
		 elsif((H>=290) and (H<=342)and (V>=216) and (V<=268)) then 
		        P5<='1';
		------------------------------------------------------------------------
		 elsif((H>=290) and (H<=342)and (V>=379) and (V<=431)) then 
		        P8<='1';
		 ----------------------------------------------------------------------
		 elsif((H>=500) and (H<=552)and (V>=53) and (V<=105)) then 
	           P3<='1';
		 ------------------------------------------------------------------------
		 elsif((H>=500) and (H<=552)and (V>=216) and (V<=268)) then 
		        P6<='1';
		------------------------------------------------------------------------
		 elsif((H>=500) and (H<=552)and (V>=379) and (V<=431)) then 
		        P9<='1';
		------------------------------------------------------------------------
		else
            P1<='0'; P2<='0'; P3<='0'; P4<='0'; P5<='0'; P6<='0';
            P7<='0'; P8<='0'; P9<='0';
		-------------------------------------------------------------
			 --PB1<='0'; PB2<='0'; PB3<='0'; PB4<='0'; PB5<='0'; PB6<='0';
			 --PB7<='0'; PB8<='0'; PB9<='0';
	    end if;
end process process_position_move;
-------------------------------------------------------------------------------------
process_digonal_move:process(H,V)
   begin
	    if ((H>=0) and (H<=210)and (V>=0) and (V<=160))then
		       PD1<='1';
		-----------------------------------------------------------
		 elsif((H>=214) and (H<=416)and (V>=164) and (V<=316)) then 
		       PD5<='1';
     -------------------------------------------------------------
		 elsif((H>=424) and (H<=638)and (V>=324) and (V<=476)) then 
		        PD9<='1';
		------------------------------------------------------------
		elsif((H>=424) and (H<=638)and (V>=0) and (V<=160)) then 
	           PD3<='1';
		------------------------------------------------------------
		elsif((H>=0) and (H<=210)and (V>=324) and (V<=476) ) then 
		        PD7<='1';
		else
            PD1<='0'; PD2<='0'; PD3<='0'; PD4<='0'; PD5<='0'; PD6<='0';
            PD7<='0'; PD8<='0'; PD9<='0';
		end if;
-----------------------------------------------
end process process_digonal_move; 
-----------------------------------------------------------------------------------------

process_ping_pong: process(Hline1,Hline2,Vline1,Vline2,Hbar_rgb1,Hbar_rgb2,Vbar_rgb1,Vbar_rgb2,H,V,temp1,tempb1,PD1,PD5,PD7,PD3,PD9,  board_pos_check)
  begin
			  if(Hline1='1') then
			  VGA_R <= Hbar_rgb1 ;
           VGA_G <= Hbar_rgb1 ;
			  VGA_B<= Hbar_rgb1 ;
           elsif Hline2='1' then
			  VGA_R <= Hbar_rgb2 ;
           VGA_G <= Hbar_rgb2 ;
			  VGA_B<= Hbar_rgb2 ;
			  elsif Vline1='1' then
			  VGA_R <= Vbar_rgb1 ;
           VGA_G <= Vbar_rgb1 ;
			  VGA_B<= Vbar_rgb1 ;
			  elsif Vline2='1' then
			  VGA_R <= Vbar_rgb2 ;
           VGA_G <= Vbar_rgb2 ;
			  VGA_B<= Vbar_rgb2 ;
			  else
           VGA_R <= "10000000";
			  VGA_G <= "10000000";
			  VGA_B <= "10000000";
			 end if;
		 -----------------------------------------------------------------------
		  if (P1='1') and (SW0='1') then 
	          VGA_R <= "11111111";
             VGA_G <= "00000000";
			    VGA_B <=  "00000000";
		  elsif(P1='1') and ( SW9='1') then 
	          VGA_R <= "00000000";
             VGA_G <= "11111111";
			    VGA_B <=  "00000000";
		  end if;
		  -----------------------------------------------------------------------
		  if (P2='1') and (SW1='1') then 
	          VGA_R <= "11111111";
             VGA_G <= "00000000";
			    VGA_B <=  "00000000";
				
		  elsif(P2='1') and (SW10='1') then 
	          VGA_R <= "00000000";
             VGA_G <= "11111111";
			    VGA_B <=  "00000000";
		  end if;
		  -----------------------------------------------------------------------
		  if (P3='1') and (SW2='1') then 
	          VGA_R <= "11111111";
             VGA_G <= "00000000";
			    VGA_B <=  "00000000";
		  elsif(P3='1') and (SW11='1') then 
	          VGA_R <= "00000000";
             VGA_G <= "11111111";
			    VGA_B <=  "00000000";
		  end if;
		  -----------------------------------------------------------------------
		  if (P4='1') and (SW3='1') then 
	          VGA_R <= "11111111";
             VGA_G <= "00000000";
			    VGA_B <=  "00000000";
		  elsif(P4='1') and (SW12='1') then 
	          VGA_R <= "00000000";
             VGA_G <= "11111111";
			    VGA_B <=  "00000000";
		  end if;
		  -----------------------------------------------------------------------
		  if (P5='1') and (SW4='1') then 
	          VGA_R <= "11111111";
             VGA_G <= "00000000";
			    VGA_B <=  "00000000";
		  elsif(P5='1') and (SW13='1') then 
	          VGA_R <= "00000000";
             VGA_G <= "11111111";
			    VGA_B <=  "00000000";
		  end if;
		  -----------------------------------------------------------------------
		  if (P6='1') and (SW5='1') then 
	          VGA_R <= "11111111";
             VGA_G <= "00000000";
			    VGA_B <=  "00000000";
		  elsif(P6='1') and (SW14='1') then 
	          VGA_R <= "00000000";
              VGA_G <= "11111111";
			    VGA_B <=  "00000000";
		  end if;
		  -----------------------------------------------------------------------
		  if (P7='1') and (SW6='1') then 
	          VGA_R <= "11111111";
             VGA_G <= "00000000";
			    VGA_B <=  "00000000";
		  elsif(P7='1') and (SW15='1') then 
	          VGA_R <= "00000000";
             VGA_G <= "11111111";
			    VGA_B <=  "00000000";
		  end if;
		  -----------------------------------------------------------------------
		  if (P8='1') and (SW7='1') then 
	          VGA_R <= "11111111";
             VGA_G <= "00000000";
			    VGA_B <=  "00000000";
		  elsif(P8='1') and (SW16='1') then 
	          VGA_R <= "00000000";
             VGA_G <= "11111111";
			    VGA_B <=  "00000000";
		  end if;
		  -----------------------------------------------------------------------
		  if (P9='1') and (SW8='1') then 
	          VGA_R <= "11111111";
             VGA_G <= "00000000";
			    VGA_B <=  "00000000";
		  elsif(P9='1') and (SW17='1') then 
	          VGA_R <= "00000000";
             VGA_G <= "11111111";
			    VGA_B <=  "00000000";
		  end if;
--------------------------------------------------------------------------------
		  if ((SW0='1' and SW1='1' and SW2='1') OR (SW3='1' and SW4='1' and SW5='1') 
		  OR (SW6='1' and SW7='1' and SW8='1') OR (SW0='1' and SW3='1' and SW6='1') 
		  OR (SW1='1' and SW4='1' and SW7='1') OR (SW2='1' and SW5='1' and SW8='1')
		  OR (SW0='1' and SW4='1' and SW8='1') OR (SW2='1' and SW4='1' and SW6='1'))then
		     if(RS1='1') then  VGA_R<= "11111111"; 
			      VGA_G<= "11111111"; VGA_B <=  "11111111"; 
		     elsif(RS2='1')then  VGA_R<= "11111111"; 
		          VGA_G<= "00000000"; VGA_B <=  "00000000";
			  elsif(RS3='1') then  VGA_G<= "11111111"; 
			      VGA_R<= "00000000"; VGA_B <=  "00000000";
			      elsif(RS4='1') then  VGA_G<= "11111111"; 
				  VGA_R<= "11111111"; VGA_B <=  "11111111";
			   else
				   VGA_R<= "00000000"; 
				   VGA_G<= "00000000"; VGA_B <=  "00000000";
				 end if;
		--------------------------------------------------------------------------- 
		elsif ((SW9='1' and SW10='1' and SW11='1') OR (SW12='1' and SW13='1' and SW14='1') 
		  OR (SW15='1' and SW16='1' and SW17='1') OR (SW9='1' and SW12='1' and SW15='1') 
		  OR (SW10='1' and SW13='1' and SW16='1') OR (SW11='1' and SW14='1' and SW17='1')
		  OR (SW9='1' and SW13='1' and SW17='1') OR (SW11='1' and SW13='1' and SW15='1'))then
		    if(RS1='1') then  VGA_R<= "11111111"; 
			   VGA_G<= "11111111"; VGA_B <=  "11111111"; 
		     elsif(RS2='1')then  VGA_R<= "11111111"; 
		     VGA_G<= "00000000"; VGA_B <=  "00000000";
			   elsif(RS3='1') then  VGA_G<= "11111111"; 
				VGA_R<= "00000000"; VGA_B <=  "00000000";
				 elsif(RS5='1') then  VGA_G<= "11111111"; 
				  VGA_R<= "11111111"; VGA_B <=  "11111111";
				  else
				   VGA_R<= "00000000"; 
				   VGA_G<= "00000000"; VGA_B <=  "00000000";
				end if;
		  --end if;

		  -------------------------------------------------------------	
	   elsif ((  board_pos_check >=9 )) then
		        if(RS1='1') then  VGA_R<= "11111111"; 
			     VGA_G<= "11111111"; VGA_B <=  "11111111"; 
			     elsif(RS2='1')then  VGA_R<= "11111111"; 
			     VGA_G<= "00000000"; VGA_B <=  "00000000";
			     elsif(RS3='1') then  VGA_G<= "11111111"; 
				  VGA_R<= "00000000"; VGA_B <=  "00000000";
				  elsif(RS6='1') then  VGA_G<= "11111111"; 
				  VGA_R<= "11111111"; VGA_B <=  "11111111";
				  else
			     VGA_R<= "00000000"; 
				  VGA_G<= "00000000"; VGA_B <=  "00000000";
			    end if; 
       --end if;		
   end if;
--    ----------------------------------------------------
-------------------------------------------------------------------------------
end process process_ping_pong; 
-----------------------------------------------
process_display: process(H,V)
begin
end process process_display;
--------------------------------------------------------
end VGA_ARCH;