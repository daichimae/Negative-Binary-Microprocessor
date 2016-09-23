----------------------------------------------------------------------------------
-- Company: 
-- Engineer:       Daichi Mae
-- 
-- Create Date:    11:02:57 12/17/2009 
-- Design Name:    Microprocessor
-- Module Name:    TMR_MPU - Behavioral 
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

entity TMR_MPU is
    Port ( CLK : in  STD_LOGIC;
           STA : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           OP_OUT : out  STD_LOGIC;
           T_OUT : out  STD_LOGIC_VECTOR (9 downto 0);
			  MA_OUT : out  STD_LOGIC_VECTOR (11 downto 0);
			  IR_OUT : out  STD_LOGIC_VECTOR (15 downto 0);
			  AC_OUT : out  STD_LOGIC_VECTOR (15 downto 0));
end TMR_MPU;

architecture Behavioral of TMR_MPU is

component CTL
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
end component;

component IR
    Port ( S_IR : in  STD_LOGIC;
           MD : in  STD_LOGIC_VECTOR (15 downto 0);
           IR : out  STD_LOGIC_VECTOR (15 downto 0));
end component;

component DEC
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
end component;

component AGEN
    Port ( CLK : in  STD_LOGIC;
           RSTT : in  STD_LOGIC;
           T_2 : in  STD_LOGIC;
           G_PC : in  STD_LOGIC;
           G_MAR : in  STD_LOGIC;
           S_PC : in  STD_LOGIC;
           S_RAR : in  STD_LOGIC;
           IR : in  STD_LOGIC_VECTOR (11 downto 0);
           MA : out  STD_LOGIC_VECTOR (11 downto 0));
end component;

component MEM
    Port ( CS : in  STD_LOGIC;
           RW : in  STD_LOGIC;
			  G_MDR : in  STD_LOGIC;
           S_MAR : in  STD_LOGIC;
           S_MDR : in  STD_LOGIC;
           MA : in  STD_LOGIC_VECTOR (11 downto 0);
           AC : in  STD_LOGIC_VECTOR (15 downto 0);
           MD : out  STD_LOGIC_VECTOR (15 downto 0));
end component;

component P_ALU
    Port ( AC : in  STD_LOGIC_VECTOR (15 downto 0);
			  ACb : in  STD_LOGIC_VECTOR (15 downto 0);
			  MD : in  STD_LOGIC_VECTOR (15 downto 0);
           LD : in  STD_LOGIC;
           ADD : in  STD_LOGIC;
           SUB : in  STD_LOGIC;
           SFL : in  STD_LOGIC;
           SFR : in  STD_LOGIC;
			  RSTT : in  STD_LOGIC;
           G_AUO : in  STD_LOGIC;
           S_ACC : in  STD_LOGIC;
           ALU : out  STD_LOGIC_VECTOR (15 downto 0);
           AL0 : out  STD_LOGIC;
           ACN : out  STD_LOGIC;
           OVF : out  STD_LOGIC);
end component;

component ACC
    Port ( S_ACC : in  STD_LOGIC;
           ALU : in  STD_LOGIC_VECTOR (15 downto 0);
           AC : out  STD_LOGIC_VECTOR (15 downto 0);
           ACb : out  STD_LOGIC_VECTOR (15 downto 0));
end component;

component N_ALU
    Port ( AC : in  STD_LOGIC_VECTOR (15 downto 0);
           MD : in  STD_LOGIC_VECTOR (15 downto 0);
           LD : in  STD_LOGIC;
           ADD : in  STD_LOGIC;
           SUB : in  STD_LOGIC;
           SFL : in  STD_LOGIC;
           SFR : in  STD_LOGIC;
           G_AUO : in  STD_LOGIC;
           ALU : out  STD_LOGIC_VECTOR (15 downto 0));
end component;

component ENCNBS
    Port ( PBS : in  STD_LOGIC_VECTOR (15 downto 0);
           NBS : out  STD_LOGIC_VECTOR (15 downto 0));
end component;

component DECPBS
    Port ( NBS : in  STD_LOGIC_VECTOR (15 downto 0);
           PBS : out  STD_LOGIC_VECTOR (15 downto 0));
end component;

component MRC
    Port ( A : in  STD_LOGIC_VECTOR (15 downto 0);
           B : in  STD_LOGIC_VECTOR (15 downto 0);
           C : in  STD_LOGIC_VECTOR (15 downto 0);
           Y : out  STD_LOGIC_VECTOR (15 downto 0));
end component;

signal LSASs,LDs,STs,ADDs,SUBs,SFRs,SFLs,JPs,JPZs,JPNs,JPOs,JLs,RETs,HLTs,AL0s,ACNs,OVFs,OPs,RSTTs,G_MDRs,G_AUOs,G_PCs,G_MARs,S_MARs,S_MDRs,S_ACCs,S_IRs,S_RARs,S_PCs,CSs,RWs : std_logic;
signal Ts : std_logic_vector (9 downto 0);
signal MAs : std_logic_vector (11 downto 0);
signal MDs,IRs,ACs,ACbs,ALUs,N_MDs1,N_MDs2,N_ACs1,N_ACs2,N_ALUs1,N_ALUs2,P_ALUs0,P_ALUs1,P_ALUs2 : std_logic_vector (15 downto 0);

begin

	OP_OUT <= OPs;
	T_OUT <= Ts;
	MA_OUT <= MAs;
	IR_OUT <= IRs;
	AC_OUT <= ACs;

	U0 : CTL port map (CLK,STA,RST,LSASs,LDs,STs,ADDs,SUBs,SFRs,SFLs,JPs,JPZs,JPNs,JPOs,JLs,RETs,HLTs,AL0s,ACNs,OVFs,OPs,RSTTs,Ts,G_MDRs,G_AUOs,G_PCs,G_MARs,S_MARs,S_MDRs,S_ACCs,S_IRs,S_RARs,S_PCs,CSs,RWs);
	U1 : IR port map (S_IRs,MDs,IRs);
	U2 : DEC port map (IRs(15 downto 12),LSASs,LDs,STs,ADDs,SUBs,SFRs,SFLs,JPs,JPZs,JPNs,JPOs,JLs,RETs,HLTs);
	U3 : AGEN port map (CLK,RSTTs,Ts(2),G_PCs,G_MARs,S_PCs,S_RARs,IRs(11 downto 0),MAs);
	U4 : MEM port map (CSs,RWs,G_MDRs,S_MARs,S_MDRs,MAs,ACs,MDs);
	U5 : P_ALU port map (ACs,ACbs,MDs,LDs,ADDs,SUBs,SFLs,SFRs,RSTTs,G_AUOs,S_ACCs,P_ALUs0,AL0s,ACNs,OVFs);
	U6 : ACC port map (S_ACCs,ALUs,ACs,ACbs);
	U7 : N_ALU port map (N_ACs1,N_MDs1,LDs,ADDs,SUBs,SFLs,SFRs,G_AUOs,N_ALUs1);
	U8 : N_ALU port map (N_ACs2,N_MDs2,LDs,ADDs,SUBs,SFLs,SFRs,G_AUOs,N_ALUs2);
	U9 : ENCNBS port map (MDs,N_MDs1);
	U10 : ENCNBS port map (MDs,N_MDs2);
	U11 : ENCNBS port map (ACs,N_ACs1);
	U12 : ENCNBS port map (ACs,N_ACs2);
	U13 : DECPBS port map (N_ALUs1,P_ALUs1);
	U14 : DECPBS port map (N_ALUs2,P_ALUs2);
	U15 : MRC port map (P_ALUs0,P_ALUs1,P_ALUs2,ALUs);

end Behavioral;
