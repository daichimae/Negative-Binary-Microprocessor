----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:06:22 11/25/2009 
-- Design Name: 
-- Module Name:    CTL - Behavioral 
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

entity CTL is
    Port ( CLK : in  STD_LOGIC;
           STA : in  STD_LOGIC;
           RST : in  STD_LOGIC;
			  LSAS : in  STD_LOGIC;
           LD : in  STD_LOGIC;
           ST : in  STD_LOGIC;
           ADD : in  STD_LOGIC;
           SUB : in  STD_LOGIC;
           SFR : in  STD_LOGIC;
           SFL : in  STD_LOGIC;
           JP : in  STD_LOGIC;
           JPZ : in  STD_LOGIC;
           JPN : in  STD_LOGIC;
           JPO : in  STD_LOGIC;
           JL : in  STD_LOGIC;
           RET : in  STD_LOGIC;
           HLT : in  STD_LOGIC;
           AL0 : in  STD_LOGIC;
           ACN : in  STD_LOGIC;
           OVF : in  STD_LOGIC;
           OP : out  STD_LOGIC;
           RSTT : out  STD_LOGIC;
           T : out  STD_LOGIC_VECTOR (9 downto 0);
           G_MDR : out  STD_LOGIC;
           G_AUO : out  STD_LOGIC;
           G_PC : out  STD_LOGIC;
           G_MAR : out  STD_LOGIC;
           S_MAR : out  STD_LOGIC;
           S_MDR : out  STD_LOGIC;
           S_ACC : out  STD_LOGIC;
           S_IR : out  STD_LOGIC;
           S_RAR : out  STD_LOGIC;
           S_PC : out  STD_LOGIC;
           CS : out  STD_LOGIC;
           RW : out  STD_LOGIC);
end CTL;

architecture Behavioral of CTL is

component OMC
    Port ( CLK : in  STD_LOGIC;
			  STA : in  STD_LOGIC;
			  RST : in  STD_LOGIC;
           HLT : in  STD_LOGIC;
           T_5 : in  STD_LOGIC;
			  OP : out STD_LOGIC;
			  RSTT : out STD_LOGIC);			  
end component;

component BTG
    Port ( CLK : in  STD_LOGIC;
           OP : in  STD_LOGIC;
           LSAS : in  STD_LOGIC;
           T : out  STD_LOGIC_VECTOR (9 downto 0));
end component;

component GSG
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
end component;

component SSG
    Port ( CLK : in  STD_LOGIC;
           OP : in  STD_LOGIC;
           LSAS : in  STD_LOGIC;
           LD : in  STD_LOGIC;
           ST : in  STD_LOGIC;
           ADD : in  STD_LOGIC;
           SUB : in  STD_LOGIC;
           SFR : in  STD_LOGIC;
           SFL : in  STD_LOGIC;
           JP : in  STD_LOGIC;
           JPZ : in  STD_LOGIC;
           JPN : in  STD_LOGIC;
           JPO : in  STD_LOGIC;
           JL : in  STD_LOGIC;
           RET : in  STD_LOGIC;
			  AL0 : in  STD_LOGIC;
           ACN : in  STD_LOGIC;
           OVF : in  STD_LOGIC;
           T_0 : in  STD_LOGIC;
           T_3 : in  STD_LOGIC;
           T_4 : in  STD_LOGIC;
           T_5 : in  STD_LOGIC;
           T_6 : in  STD_LOGIC;
           T_8 : in  STD_LOGIC;
           S_MAR : out  STD_LOGIC;
           S_MDR : out  STD_LOGIC;
           S_ACC : out  STD_LOGIC;
           S_IR : out  STD_LOGIC;
           S_RAR : out  STD_LOGIC;
           S_PC : out  STD_LOGIC);
end component;

component MCSG
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
end component;

signal OPS,RSTTS : std_logic;
signal TS : std_logic_vector (9 downto 0);

begin

	OP <= OPS;
	RSTT <= RSTTS;
	T <= TS;

	U0 : OMC port map (CLK,STA,RST,HLT,TS(5),OPS,RSTTS);
	U1 : BTG port map (CLK,OPS,LSAS,TS);
	U2 : GSG port map (CLK,RSTTS,LSAS,ST,SFR,SFL,RET,TS(3),TS(5),TS(7),G_MDR,G_AUO,G_PC,G_MAR);
	U3 : SSG port map (CLK,OPS,LSAS,LD,ST,ADD,SUB,SFR,SFL,JP,JPZ,JPN,JPO,JL,RET,AL0,ACN,OVF,TS(0),TS(3),TS(4),TS(5),TS(6),TS(8),S_MAR,S_MDR,S_ACC,S_IR,S_RAR,S_PC);
	U4 : MCSG port map (CLK,OPS,RSTTS,LSAS,ST,TS(0),TS(3),TS(5),TS(7),TS(8),CS,RW);

end Behavioral;
