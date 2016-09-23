----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:40:16 12/06/2009 
-- Design Name: 
-- Module Name:    MEM - Behavioral 
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

entity MEM is
    Port ( CS : in  STD_LOGIC;
           RW : in  STD_LOGIC;
			  G_MDR : in  STD_LOGIC;
           S_MAR : in  STD_LOGIC;
           S_MDR : in  STD_LOGIC;
           MA : in  STD_LOGIC_VECTOR (11 downto 0);
           AC : in  STD_LOGIC_VECTOR (15 downto 0);
           MD : out  STD_LOGIC_VECTOR (15 downto 0));
end MEM;

architecture Behavioral of MEM is

component MAR
    Port ( S_MAR : in  STD_LOGIC;
           MA : in  STD_LOGIC_VECTOR (11 downto 0);
           MAR : out  STD_LOGIC_VECTOR (11 downto 0));
end component;

component MDR
    Port ( S_MDR : in  STD_LOGIC;
           MD : in  STD_LOGIC_VECTOR (15 downto 0);
           MDR : out  STD_LOGIC_VECTOR (15 downto 0));
end component;

component MEMDEV
    Port ( CS : in  STD_LOGIC;
           RW : in  STD_LOGIC;
           AD : in  STD_LOGIC_VECTOR (11 downto 0);
           D_IN : in  STD_LOGIC_VECTOR (15 downto 0);
           D_OUT : out  STD_LOGIC_VECTOR (15 downto 0));
end component;

signal AD : std_logic_vector (11 downto 0);
signal G_MDR16,MDR_IN,MDR_OUT,D_OUT : std_logic_vector (15 downto 0);

begin

	G_MDR16 <= G_MDR & G_MDR & G_MDR & G_MDR & G_MDR & G_MDR & G_MDR & G_MDR & G_MDR & G_MDR & G_MDR & G_MDR & G_MDR & G_MDR & G_MDR & G_MDR;

	MDR_IN <= (D_OUT and (not G_MDR16)) or (AC and G_MDR16);
	MD <= MDR_OUT;

	U0 : MAR port map (S_MAR,MA,AD);
	U1 : MDR port map (S_MDR,MDR_IN,MDR_OUT);
	U2 : MEMDEV port map (CS,RW,AD,MDR_OUT,D_OUT);

end Behavioral;
