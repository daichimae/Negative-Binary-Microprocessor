----------------------------------------------------------------------------------
-- Company: 
-- Engineer:       Daichi Mae
-- 
-- Create Date:    12:19:40 11/16/2009 
-- Design Name:    Basic Timing Generator
-- Module Name:    BTG - Behavioral 
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

entity BTG is
    Port ( CLK : in  STD_LOGIC;
           OP : in  STD_LOGIC;
           LSAS : in  STD_LOGIC;
           T : out  STD_LOGIC_VECTOR (9 downto 0));
end BTG;

architecture Behavioral of BTG is

component JKFF
	port ( J,CLK,K : in std_logic;
			 Q,Qb : out std_logic);
end component;

component DEC3to8
	port ( A : in std_logic_vector (2 downto 0);
			 D : out std_logic_vector (7 downto 0));
end component;

signal TCL,TCLb,CLKb,a01,a02,a03,a04,o01,o02,o03,F0_Q,F1_Q,F2_Q,F3_Q : std_logic;
signal DECin : std_logic_vector (2 downto 0);
signal DECout : std_logic_vector (7 downto 0);

begin

	TCL <= (not OP) or (LSAS and a04) or (not LSAS and DECout(5));
	DECin <= F2_Q & F1_Q & F0_Q;
	CLKb <= not CLK;
	TCLb <= not TCL;
	a01 <= TCLb and F0_Q;
	a02 <= TCLb and (F0_Q and F1_Q);
	a03 <= TCLb and (F0_Q and F1_Q and F2_Q);
	a04 <= DECout(1) and F3_Q;
	o01 <= F0_Q or TCL;
	o02 <= TCL or (F0_Q and F1_Q);
	o03 <= TCL or (F0_Q and F1_Q and F2_Q);

	T(0) <= DECout(0) and not F3_Q and OP;
	T(1) <= DECout(1) and not F3_Q;
	T(2) <= DECout(2);
	T(3) <= DECout(3);
	T(4) <= DECout(4);
	T(5) <= DECout(5);
	T(6) <= DECout(6);
	T(7) <= DECout(7);
	T(8) <= DECout(0) and F3_Q;
	T(9) <= a04;

	F0 : JKFF port map (TCLb,CLKb,'1',F0_Q,open);
	F1 : JKFF port map (a01,CLKb,o01,F1_Q,open);
	F2 : JKFF port map (a02,CLKb,o02,F2_Q,open);
	F3 : JKFF port map (a03,CLKb,o03,F3_Q,open);
	DEC : DEC3to8 port map (DECin,DECout);

end Behavioral;
