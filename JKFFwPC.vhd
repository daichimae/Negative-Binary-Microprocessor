----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:58:25 11/26/2009 
-- Design Name: 
-- Module Name:    JKFFwPC - Behavioral 
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

entity JKFFwPC is
    Port ( J : in  STD_LOGIC := '0';
           CLK : in  STD_LOGIC := '0';
           K : in  STD_LOGIC := '0';
           P : in  STD_LOGIC := '0';
           C : in  STD_LOGIC := '0';
           Q : out  STD_LOGIC := '0';
           Qb : out  STD_LOGIC := '0');
end JKFFwPC;

architecture Behavioral of JKFFwPC is

signal J_K : std_logic_vector(1 downto 0) := "00";
signal temp : std_logic := '0';

begin
	J_K <= J & K;
	Q <= temp;
	Qb <= not temp;

	process(C,P,CLK)
	begin
		if(C='1') then
			temp <= '0';
		elsif(P='1') then
			temp <= '1';
		elsif(CLK'event and CLK='1') then
			case J_K is
				when "01" => temp <= '0';
				when "10" => temp <= '1';
				when "11" => temp <= not temp;
				when others => null;
			end case;
		end if;
	end process;
end Behavioral;
