----------------------------------------------------------------------------------
-- Company: 
-- Engineer:       Daichi Mae
-- 
-- Create Date:    15:49:43 01/21/2010 
-- Design Name:    Negative Arithmetic Logic Unit
-- Module Name:    N_ALU - Behavioral 
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

entity N_ALU is
    Port ( AC : in  STD_LOGIC_VECTOR (15 downto 0);
           MD : in  STD_LOGIC_VECTOR (15 downto 0);
           LD : in  STD_LOGIC;
           ADD : in  STD_LOGIC;
           SUB : in  STD_LOGIC;
           SFL : in  STD_LOGIC;
           SFR : in  STD_LOGIC;
           G_AUO : in  STD_LOGIC;
           ALU : out  STD_LOGIC_VECTOR (15 downto 0));
end N_ALU;

architecture Behavioral of N_ALU is

component N_ADD
    Port ( X : in  STD_LOGIC_VECTOR (15 downto 0);
           Y : in  STD_LOGIC_VECTOR (15 downto 0);
           C_IN : in  STD_LOGIC_VECTOR (1 downto 0);
           S : out  STD_LOGIC_VECTOR (15 downto 0);
           C_OUT : out  STD_LOGIC_VECTOR (1 downto 0));
end component;

component N_SFT
    Port ( X : in  STD_LOGIC_VECTOR (15 downto 0);
           SFL : in  STD_LOGIC;
           SFR : in  STD_LOGIC;
           SF : out  STD_LOGIC_VECTOR (15 downto 0));
end component;

component SINV
    Port ( X : in  STD_LOGIC_VECTOR (15 downto 0);
           negX : out  STD_LOGIC_VECTOR (15 downto 0));
end component;

signal X,Y,S,SF,IX,LD16,SUB16,G_AUO16 : std_logic_vector (15 downto 0);

begin

	X <= AC and (not LD16);
	Y <= ((not SUB16) and MD) or (SUB16 and IX);
	ALU <= ((not G_AUO16) and S) or (G_AUO16 and SF);

	LD16 <= LD & LD & LD & LD & LD & LD & LD & LD & LD & LD & LD & LD & LD & LD & LD & LD;
	SUB16 <= SUB & SUB & SUB & SUB & SUB & SUB & SUB & SUB & SUB & SUB & SUB & SUB & SUB & SUB & SUB & SUB;
	G_AUO16 <= G_AUO & G_AUO & G_AUO & G_AUO & G_AUO & G_AUO & G_AUO & G_AUO & G_AUO & G_AUO & G_AUO & G_AUO & G_AUO & G_AUO & G_AUO & G_AUO;

	U0 : N_ADD port map (X,Y,"00",S,open);
	U1 : N_SFT port map (X,SFL,SFR,SF);
	U2 : SINV port map (MD,IX);

end Behavioral;
