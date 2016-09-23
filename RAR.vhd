----------------------------------------------------------------------------------
-- Company: 
-- Engineer:       Daichi Mae
-- 
-- Create Date:    11:44:40 11/30/2009 
-- Design Name:    Return Address Register
-- Module Name:    RAR - Behavioral 
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

entity RAR is
    Port ( S_RAR : in  STD_LOGIC;
           PC : in  STD_LOGIC_VECTOR (11 downto 0);
           RA : out  STD_LOGIC_VECTOR (11 downto 0));
end RAR;

architecture Behavioral of RAR is

component DFF
	port ( D,CLK : in std_logic;
			 Q,Qb : out std_logic);
end component;

begin

	F0 : DFF port map (PC(0),S_RAR,RA(0),open);
	F1 : DFF port map (PC(1),S_RAR,RA(1),open);
	F2 : DFF port map (PC(2),S_RAR,RA(2),open);
	F3 : DFF port map (PC(3),S_RAR,RA(3),open);
	F4 : DFF port map (PC(4),S_RAR,RA(4),open);
	F5 : DFF port map (PC(5),S_RAR,RA(5),open);
	F6 : DFF port map (PC(6),S_RAR,RA(6),open);
	F7 : DFF port map (PC(7),S_RAR,RA(7),open);
	F8 : DFF port map (PC(8),S_RAR,RA(8),open);
	F9 : DFF port map (PC(9),S_RAR,RA(9),open);
	F10 : DFF port map (PC(10),S_RAR,RA(10),open);
	F11 : DFF port map (PC(11),S_RAR,RA(11),open);

end Behavioral;
