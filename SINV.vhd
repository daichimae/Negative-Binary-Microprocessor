----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:34:28 01/21/2010 
-- Design Name: 
-- Module Name:    SINV - Behavioral 
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

entity SINV is
    Port ( X : in  STD_LOGIC_VECTOR (15 downto 0);
           negX : out  STD_LOGIC_VECTOR (15 downto 0));
end SINV;

architecture Behavioral of SINV is

component N_SFT
    Port ( X : in  STD_LOGIC_VECTOR (15 downto 0);
           SFL : in  STD_LOGIC;
           SFR : in  STD_LOGIC;
           SF : out  STD_LOGIC_VECTOR (15 downto 0));
end component;

component N_ADD
    Port ( X : in  STD_LOGIC_VECTOR (15 downto 0);
           Y : in  STD_LOGIC_VECTOR (15 downto 0);
           C_IN : in  STD_LOGIC_VECTOR (1 downto 0);
           S : out  STD_LOGIC_VECTOR (15 downto 0);
           C_OUT : out  STD_LOGIC_VECTOR (1 downto 0));
end component;

signal SF : std_logic_vector (15 downto 0);

begin

	U0 : N_SFT port map (X,'1','0',SF);
	U1 : N_ADD port map (X,SF,"00",negX,open);

end Behavioral;
