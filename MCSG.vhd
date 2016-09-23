----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:16:52 11/24/2009 
-- Design Name: 	
-- Module Name:    MCSG - Behavioral 
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

entity MCSG is
    Port ( CLK : in  STD_LOGIC;
           OP : in  STD_LOGIC;
           RSTT : in  STD_LOGIC;
           LSAS : in  STD_LOGIC;
           ST : in  STD_LOGIC;
           T_0 : in  STD_LOGIC;
           T_3 : in  STD_LOGIC;
           T_5 : in  STD_LOGIC;
           T_7 : in  STD_LOGIC;
           T_8 : in  STD_LOGIC;
           CS : out  STD_LOGIC;
           RW : out  STD_LOGIC);
end MCSG;

architecture Behavioral of MCSG is

component SRFF
	port ( S,R : in std_logic;
			 Q,Qb : out std_logic);
end component;

signal F0_S,F0_R,F0_Q,F1_S,F1_R,F1_Q,F2_S,F2_R : std_logic;

begin

	F0_S <= OP and T_0 and CLK;
	F0_R <= (T_3 and CLK) or RSTT;
	F1_S <= LSAS and T_5 and CLK;
	F1_R <= (T_8 and CLK) or RSTT;
	F2_S <= ST and T_7 and CLK;
	F2_R <= (T_8 and CLK) or RSTT;
	CS <= F0_Q or F1_Q;

	F0 : SRFF port map (F0_S,F0_R,F0_Q,open);
	F1 : SRFF port map (F1_S,F1_R,F1_Q,open);
	F2 : SRFF port map (F2_S,F2_R,RW,open);

end Behavioral;

