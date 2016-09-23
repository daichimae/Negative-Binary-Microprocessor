----------------------------------------------------------------------------------
-- Company: 
-- Engineer:       Daichi Mae
-- 
-- Create Date:    15:28:10 12/01/2009 
-- Design Name:    Memory Address Register
-- Module Name:    MAR - Behavioral 
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

entity MAR is
    Port ( S_MAR : in  STD_LOGIC;
           MA : in  STD_LOGIC_VECTOR (11 downto 0);
           MAR : out  STD_LOGIC_VECTOR (11 downto 0));
end MAR;

architecture Behavioral of MAR is

component DFF
	port ( D,CLK : in std_logic;
			 Q,Qb : out std_logic);
end component;

begin

	F0 : DFF port map (MA(0),S_MAR,MAR(0),open);
	F1 : DFF port map (MA(1),S_MAR,MAR(1),open);
	F2 : DFF port map (MA(2),S_MAR,MAR(2),open);
	F3 : DFF port map (MA(3),S_MAR,MAR(3),open);
	F4 : DFF port map (MA(4),S_MAR,MAR(4),open);
	F5 : DFF port map (MA(5),S_MAR,MAR(5),open);
	F6 : DFF port map (MA(6),S_MAR,MAR(6),open);
	F7 : DFF port map (MA(7),S_MAR,MAR(7),open);
	F8 : DFF port map (MA(8),S_MAR,MAR(8),open);
	F9 : DFF port map (MA(9),S_MAR,MAR(9),open);
	F10 : DFF port map (MA(10),S_MAR,MAR(10),open);
	F11 : DFF port map (MA(11),S_MAR,MAR(11),open);

end Behavioral;
