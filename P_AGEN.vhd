----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:53:38 11/30/2009 
-- Design Name: 
-- Module Name:    AGEN - Behavioral 
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

entity AGEN is
    Port ( CLK : in  STD_LOGIC;
           RSTT : in  STD_LOGIC;
           T_2 : in  STD_LOGIC;
           G_PC : in  STD_LOGIC;
           G_MAR : in  STD_LOGIC;
           S_PC : in  STD_LOGIC;
           S_RAR : in  STD_LOGIC;
           IR : in  STD_LOGIC_VECTOR (11 downto 0);
           MA : out  STD_LOGIC_VECTOR (11 downto 0));
end AGEN;

architecture Behavioral of AGEN is

component P_PC
    Port ( CLK : in  STD_LOGIC;
           RSTT : in  STD_LOGIC;
           T_2 : in  STD_LOGIC;
           S_PC : in  STD_LOGIC;
           RI : in  STD_LOGIC_VECTOR (11 downto 0);
           PC : out  STD_LOGIC_VECTOR (11 downto 0));
end component;

component RAR
    Port ( S_RAR : in  STD_LOGIC;
           PC : in  STD_LOGIC_VECTOR (11 downto 0);
           RA : out  STD_LOGIC_VECTOR (11 downto 0));
end component;

signal RI,PC,RA,G_PC12,G_MAR12 : std_logic_vector (11 downto 0);

begin

	G_PC12 <= G_PC & G_PC & G_PC & G_PC & G_PC & G_PC & G_PC & G_PC & G_PC & G_PC & G_PC & G_PC;
	G_MAR12 <= G_MAR & G_MAR & G_MAR & G_MAR & G_MAR & G_MAR & G_MAR & G_MAR & G_MAR & G_MAR & G_MAR & G_MAR;

	RI <= ((not G_PC12) and IR) or (G_PC12 and RA);
	MA <= ((not G_MAR12) and PC) or (G_MAR12 and IR);

	U0 : P_PC port map (CLK,RSTT,T_2,S_PC,RI,PC);
	U1 : RAR port map (S_RAR,PC,RA);

end Behavioral;
