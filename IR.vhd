----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:34:41 11/26/2009 
-- Design Name: 
-- Module Name:    IR - Behavioral 
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

entity IR is
    Port ( S_IR : in  STD_LOGIC;
           MD : in  STD_LOGIC_VECTOR (15 downto 0);
           IR : out  STD_LOGIC_VECTOR (15 downto 0));
end IR;

architecture Behavioral of IR is

component DFF
	port ( D,CLK : in std_logic;
			 Q,Qb : out std_logic);
end component;

begin

	F0 : DFF port map (MD(0),S_IR,IR(0),open);
	F1 : DFF port map (MD(1),S_IR,IR(1),open);
	F2 : DFF port map (MD(2),S_IR,IR(2),open);
	F3 : DFF port map (MD(3),S_IR,IR(3),open);
	F4 : DFF port map (MD(4),S_IR,IR(4),open);
	F5 : DFF port map (MD(5),S_IR,IR(5),open);
	F6 : DFF port map (MD(6),S_IR,IR(6),open);
	F7 : DFF port map (MD(7),S_IR,IR(7),open);
	F8 : DFF port map (MD(8),S_IR,IR(8),open);
	F9 : DFF port map (MD(9),S_IR,IR(9),open);
	F10 : DFF port map (MD(10),S_IR,IR(10),open);
	F11 : DFF port map (MD(11),S_IR,IR(11),open);
	F12 : DFF port map (MD(12),S_IR,IR(12),open);
	F13 : DFF port map (MD(13),S_IR,IR(13),open);
	F14 : DFF port map (MD(14),S_IR,IR(14),open);
	F15 : DFF port map (MD(15),S_IR,IR(15),open);

end Behavioral;
