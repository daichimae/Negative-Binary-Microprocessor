----------------------------------------------------------------------------------
-- Company: 
-- Engineer:       Daichi Mae
-- 
-- Create Date:    15:17:43 11/17/2009 
-- Design Name:    Gate Signal Generator
-- Module Name:    GSG - Behavioral 
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

entity GSG is
    Port ( CLK : in  STD_LOGIC;
           RSTT : in  STD_LOGIC;
           LSAS : in  STD_LOGIC;
           ST : in  STD_LOGIC;
           SFR : in  STD_LOGIC;
           SFL : in  STD_LOGIC;
           RET : in  STD_LOGIC;
           T_3 : in  STD_LOGIC;
           T_5 : in  STD_LOGIC;
           T_7 : in  STD_LOGIC;
           G_MDR : out  STD_LOGIC;
           G_AUO : out  STD_LOGIC;
           G_PC : out  STD_LOGIC;
           G_MAR : out  STD_LOGIC);
end GSG;

architecture Behavioral of GSG is

component SRFF
	port ( S,R : in std_logic;
			 Q,Qb : out std_logic);
end component;

signal F0_S,F0_R,F1_S,F1_R : std_logic;

begin

	F0_S <= CLK and ST and T_5;
	F0_R <= RSTT or (CLK and T_7);
	F1_S <= CLK and T_3;
	F1_R <= RSTT or (CLK and T_7) or (CLK and (not LSAS) and T_5);
	G_AUO <= SFR or SFL;
	G_PC <= RET;

	F0 : SRFF port map (F0_S,F0_R,G_MDR,open);
	F1 : SRFF port map (F1_S,F1_R,G_MAR,open);

end Behavioral;
