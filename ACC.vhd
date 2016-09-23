----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:27:15 12/15/2009 
-- Design Name: 
-- Module Name:    ACC - Behavioral 
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

entity ACC is
    Port ( S_ACC : in  STD_LOGIC;
           ALU : in  STD_LOGIC_VECTOR (15 downto 0);
           AC : out  STD_LOGIC_VECTOR (15 downto 0);
           ACb : out  STD_LOGIC_VECTOR (15 downto 0));
end ACC;

architecture Behavioral of ACC is

component DFF
	port ( D,CLK : in std_logic;
			 Q,Qb : out std_logic);
end component;

begin

	F0 : DFF port map (ALU(0),S_ACC,AC(0),ACb(0));
	F1 : DFF port map (ALU(1),S_ACC,AC(1),ACb(1));
	F2 : DFF port map (ALU(2),S_ACC,AC(2),ACb(2));
	F3 : DFF port map (ALU(3),S_ACC,AC(3),ACb(3));
	F4 : DFF port map (ALU(4),S_ACC,AC(4),ACb(4));
	F5 : DFF port map (ALU(5),S_ACC,AC(5),ACb(5));
	F6 : DFF port map (ALU(6),S_ACC,AC(6),ACb(6));
	F7 : DFF port map (ALU(7),S_ACC,AC(7),ACb(7));
	F8 : DFF port map (ALU(8),S_ACC,AC(8),ACb(8));
	F9 : DFF port map (ALU(9),S_ACC,AC(9),ACb(9));
	F10 : DFF port map (ALU(10),S_ACC,AC(10),ACb(10));
	F11 : DFF port map (ALU(11),S_ACC,AC(11),ACb(11));
	F12 : DFF port map (ALU(12),S_ACC,AC(12),ACb(12));
	F13 : DFF port map (ALU(13),S_ACC,AC(13),ACb(13));
	F14 : DFF port map (ALU(14),S_ACC,AC(14),ACb(14));
	F15 : DFF port map (ALU(15),S_ACC,AC(15),ACb(15));

end Behavioral;

