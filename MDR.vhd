----------------------------------------------------------------------------------
-- Company: 
-- Engineer:       Daichi Mae
-- 
-- Create Date:    15:34:38 12/01/2009 
-- Design Name:    Memory Data Register
-- Module Name:    MDR - Behavioral 
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

entity MDR is
    Port ( S_MDR : in  STD_LOGIC;
           MD : in  STD_LOGIC_VECTOR (15 downto 0);
           MDR : out  STD_LOGIC_VECTOR (15 downto 0));
end MDR;

architecture Behavioral of MDR is

component DFF
	port ( D,CLK : in std_logic;
			 Q,Qb : out std_logic);
end component;

begin

	F0 : DFF port map (MD(0),S_MDR,MDR(0),open);
	F1 : DFF port map (MD(1),S_MDR,MDR(1),open);
	F2 : DFF port map (MD(2),S_MDR,MDR(2),open);
	F3 : DFF port map (MD(3),S_MDR,MDR(3),open);
	F4 : DFF port map (MD(4),S_MDR,MDR(4),open);
	F5 : DFF port map (MD(5),S_MDR,MDR(5),open);
	F6 : DFF port map (MD(6),S_MDR,MDR(6),open);
	F7 : DFF port map (MD(7),S_MDR,MDR(7),open);
	F8 : DFF port map (MD(8),S_MDR,MDR(8),open);
	F9 : DFF port map (MD(9),S_MDR,MDR(9),open);
	F10 : DFF port map (MD(10),S_MDR,MDR(10),open);
	F11 : DFF port map (MD(11),S_MDR,MDR(11),open);
	F12 : DFF port map (MD(12),S_MDR,MDR(12),open);
	F13 : DFF port map (MD(13),S_MDR,MDR(13),open);
	F14 : DFF port map (MD(14),S_MDR,MDR(14),open);
	F15 : DFF port map (MD(15),S_MDR,MDR(15),open);

end Behavioral;
