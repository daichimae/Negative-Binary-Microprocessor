----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:20:45 11/03/2009 
-- Design Name: 
-- Module Name:    SRFF - Behavioral 
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

entity SRFF is
    Port ( S : in  STD_LOGIC := '0';
           R : in  STD_LOGIC := '0';
           Q : out  STD_LOGIC := '0';
           Qb : out  STD_LOGIC := '0');
end SRFF;

architecture Behavioral of SRFF is

signal S_R : std_logic_vector(1 downto 0);

begin
	S_R <= S & R;

	process(S_R)
	begin
		case S_R is
			when "01" => Q <= '0'; Qb <= '1';
			when "10" => Q <= '1'; Qb <= '0';
			when "11" => Q <= '-'; Qb <= '-';
			when others => null;
		end case;
	end process;
end Behavioral;