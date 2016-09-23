----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:16:43 11/26/2009 
-- Design Name: 
-- Module Name:    DEC - Behavioral 
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

entity DEC is
    Port ( IR : in  STD_LOGIC_VECTOR (15 downto 12);
           LSAS : out  STD_LOGIC;
           LD : out  STD_LOGIC;
           ST : out  STD_LOGIC;
           ADD : out  STD_LOGIC;
           SUB : out  STD_LOGIC;
           SFR : out  STD_LOGIC;
           SFL : out  STD_LOGIC;
           JP : out  STD_LOGIC;
           JPZ : out  STD_LOGIC;
           JPN : out  STD_LOGIC;
           JPO : out  STD_LOGIC;
           JL : out  STD_LOGIC;
           RET : out  STD_LOGIC;
           HLT : out  STD_LOGIC);
end DEC;

architecture Behavioral of DEC is

component DEC3to8
	port ( A : in std_logic_vector (2 downto 0);
			 D : out std_logic_vector (7 downto 0));
end component;

signal DS : std_logic_vector (7 downto 0);

begin

	LSAS <= DS(0) or DS(1);
	LD <= (not IR(12)) and DS(0);
	ST <= IR(12) and DS(0);
	ADD <= (not IR(12)) and DS(1);
	SUB <= IR(12) and DS(1);
	SFR <= DS(2);
	SFL <= DS(3);
	JP <= (not IR(12)) and DS(4);
	JPZ <= IR(12) and DS(4);
	JPN <= (not IR(12)) and DS(5);
	JPO <= IR(12) and DS(5);
	JL <= (not IR(12)) and DS(6);
	RET <= IR(12) and DS(6);
	HLT <= DS(7);

	U0 : DEC3to8 port map (IR(15 downto 13),DS);

end Behavioral;
