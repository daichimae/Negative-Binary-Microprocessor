----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:23:21 11/16/2009 
-- Design Name: 
-- Module Name:    DEC3to8 - Behavioral 
-- Project Name: 
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

entity DEC3to8 is
    Port ( A : in  STD_LOGIC_VECTOR (2 downto 0);
           D : out  STD_LOGIC_VECTOR (7 downto 0));
end DEC3to8;

architecture Behavioral of DEC3to8 is

begin

	process(A)
	begin
		case A is
			when "000" => D <= "00000001";
			when "001" => D <= "00000010";
			when "010" => D <= "00000100";
			when "011" => D <= "00001000";
			when "100" => D <= "00010000";
			when "101" => D <= "00100000";
			when "110" => D <= "01000000";
			when "111" => D <= "10000000";
			when others => D <= "00000000";
		end case;
	end process;

end Behavioral;
