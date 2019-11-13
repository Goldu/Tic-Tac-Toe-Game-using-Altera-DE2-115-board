library IEEE;
use IEEE.std_logic_1164.all;

entity PLL_design is
    port (
        reset_n  : in std_logic;         -- this is the global active low reset signal
        --
        clkin_50   : in std_logic;         -- input clock
        clkout_25 : out std_logic         -- output clock (frequency = input clock frequency/2)
    );
end entity PLL_design;

architecture RTL of PLL_design is
signal clkout_i: std_logic;         -- clock output signal internal to the FPGA. 
                                    -- It is the same signal as clkout. You need it because you need
                                    -- to invert clkout. VHDL does not allow you to read an 'output' signal.
                                    -- It only allows you to assign to an 'output' signal.
                                    
begin

    divideBy2_proc : process(clkin_50, reset_n)
    begin
        if reset_n='0' then
            clkout_i <= '0';
        elsif rising_edge(clkin_50) then
            clkout_i <= not clkout_i;       -- here "clkout <= not clkout;" would not have worked.
                                            -- VHDL does not allow you to read 'clkout' to take its invert.
                                            -- 'clkout' is an output port. You can only drive it, not read it.
        end if;
    end process;
    clkout_25 <= clkout_i; -- drive the output port 'clkout'
end RTL;