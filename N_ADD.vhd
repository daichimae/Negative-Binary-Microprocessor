----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:09:01 01/08/2010 
-- Design Name: 
-- Module Name:    N_ADD - Behavioral 
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

entity N_ADD is
    Port ( X : in  STD_LOGIC_VECTOR (15 downto 0);
           Y : in  STD_LOGIC_VECTOR (15 downto 0);
           C_IN : in  STD_LOGIC_VECTOR (1 downto 0);
           S : out  STD_LOGIC_VECTOR (15 downto 0);
           C_OUT : out  STD_LOGIC_VECTOR (1 downto 0));
end N_ADD;

architecture Behavioral of N_ADD is

component N_FA
    Port ( X : in  STD_LOGIC_VECTOR (1 downto 0);
           Y : in  STD_LOGIC_VECTOR (1 downto 0);
           C_IN : in  STD_LOGIC_VECTOR (1 downto 0);
           S : out  STD_LOGIC_VECTOR (1 downto 0);
           C_OUT : out  STD_LOGIC_VECTOR (1 downto 0));
end component;

signal C0,C1,C2,C3,C4,C5,C6 : std_logic_vector (1 downto 0);

begin

	U0 : N_FA port map (X(1 downto 0),Y(1 downto 0),C_IN,S(1 downto 0),C0);
	U1 : N_FA port map (X(3 downto 2),Y(3 downto 2),C0,S(3 downto 2),C1);
	U2 : N_FA port map (X(5 downto 4),Y(5 downto 4),C1,S(5 downto 4),C2);
	U3 : N_FA port map (X(7 downto 6),Y(7 downto 6),C2,S(7 downto 6),C3);
	U4 : N_FA port map (X(9 downto 8),Y(9 downto 8),C3,S(9 downto 8),C4);
	U5 : N_FA port map (X(11 downto 10),Y(11 downto 10),C4,S(11 downto 10),C5);
	U6 : N_FA port map (X(13 downto 12),Y(13 downto 12),C5,S(13 downto 12),C6);
	U7 : N_FA port map (X(15 downto 14),Y(15 downto 14),C6,S(15 downto 14),C_OUT);

end Behavioral;
