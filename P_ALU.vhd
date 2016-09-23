----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:37:59 12/16/2009 
-- Design Name: 
-- Module Name:    P_ALU - Behavioral 
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

entity P_ALU is
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
end P_ALU;

architecture Behavioral of P_ALU is

component P_ADD
    Port ( X : in  STD_LOGIC_VECTOR (15 downto 0);
           Y : in  STD_LOGIC_VECTOR (15 downto 0);
           SUB : in  STD_LOGIC;
           S : out  STD_LOGIC_VECTOR (15 downto 0));
end component;

component P_SFT
    Port ( X : in  STD_LOGIC_VECTOR (15 downto 0);
           SFL : in  STD_LOGIC;
           SFR : in  STD_LOGIC;
           SF : out  STD_LOGIC_VECTOR (15 downto 0));
end component;

component FLG
    Port ( X_14 : in  STD_LOGIC;
           X_15 : in  STD_LOGIC;
           Y_15 : in  STD_LOGIC;
           S_15 : in  STD_LOGIC;
           ADD : in  STD_LOGIC;
           SUB : in  STD_LOGIC;
           SFL : in  STD_LOGIC;
           S_ACC : in  STD_LOGIC;
           RSTT : in  STD_LOGIC;
           OVF : out  STD_LOGIC);
end component;

signal X,Y,S,SF,LD16,SUB16,G_AUO16 : std_logic_vector (15 downto 0);

begin

	X <= AC and (not LD16);
	Y <= MD xor SUB16;
	ALU <= ((not G_AUO16) and S) or (G_AUO16 and SF);
	AL0 <= ACb(0) and ACb(1) and ACb(2) and ACb(3) and ACb(4) and ACb(5) and ACb(6) and ACb(7) and ACb(8) and ACb(9) and ACb(10) and ACb(11) and ACb(12) and ACb(13) and ACb(14) and ACb(15);
	ACN <= AC(15);

	LD16 <= LD & LD & LD & LD & LD & LD & LD & LD & LD & LD & LD & LD & LD & LD & LD & LD;
	SUB16 <= SUB & SUB & SUB & SUB & SUB & SUB & SUB & SUB & SUB & SUB & SUB & SUB & SUB & SUB & SUB & SUB;
	G_AUO16 <= G_AUO & G_AUO & G_AUO & G_AUO & G_AUO & G_AUO & G_AUO & G_AUO & G_AUO & G_AUO & G_AUO & G_AUO & G_AUO & G_AUO & G_AUO & G_AUO;

	U0 : P_ADD port map (X,Y,SUB,S);
	U1 : P_SFT port map (X,SFL,SFR,SF);
	U2 : FLG port map (X(14),X(15),MD(15),S(15),ADD,SUB,SFL,S_ACC,RSTT,OVF);

end Behavioral;
