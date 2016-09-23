----------------------------------------------------------------------------------
-- Company: 
-- Engineer:       Daichi Mae
-- 
-- Create Date:    16:12:11 11/05/2009 
-- Design Name:    D Flip Flop
-- Module Name:    DFF - Behavioral 
-- Project Name:   Negative Binary Microprocessor
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DFF is
    Port ( D : in  STD_LOGIC := '0';
           CLK : in  STD_LOGIC := '0';
           Q : out  STD_LOGIC := '0';
           Qb : out  STD_LOGIC := '0');
end DFF;

architecture Behavioral of DFF is

begin

process (CLK) begin
	if(CLK'event and CLK='1') then
		Q <= D;
		Qb <= not D;
	end if;
end process;

end Behavioral;
