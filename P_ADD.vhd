----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:16:02 12/09/2009 
-- Design Name: 
-- Module Name:    P_ADD - Behavioral 
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

entity P_ADD is
    Port ( X : in  STD_LOGIC_VECTOR (15 downto 0);
           Y : in  STD_LOGIC_VECTOR (15 downto 0);
           SUB : in  STD_LOGIC;
           S : out  STD_LOGIC_VECTOR (15 downto 0));
end P_ADD;

architecture Behavioral of P_ADD is

component P_SUM
    Port ( X : in  STD_LOGIC;
           Y : in  STD_LOGIC;
           C_IN : in  STD_LOGIC;
           G : out  STD_LOGIC;
           P : out  STD_LOGIC;
           S : out  STD_LOGIC);
end component;

component P_CLA
    Port ( G : in  STD_LOGIC_VECTOR (3 downto 0);
           P : in  STD_LOGIC_VECTOR (3 downto 0);
           C_IN : in  STD_LOGIC;
           G4 : out  STD_LOGIC;
           P4 : out  STD_LOGIC;
           C_OUT : out  STD_LOGIC_VECTOR (2 downto 0));
end component;

signal CS : std_logic_vector (14 downto 0);
signal SUM_G,SUM_P : std_logic_vector (15 downto 0);
signal CLA_G,CLA_P : std_logic_vector (3 downto 0);
signal CS_11_7_3 : std_logic_vector (2 downto 0);

begin

	CS(3) <= CS_11_7_3(0);
	CS(7) <= CS_11_7_3(1);
	CS(11) <= CS_11_7_3(2);

	SU0 : P_SUM port map (X(0),Y(0),SUB,SUM_G(0),SUM_P(0),S(0));
	SU1 : P_SUM port map (X(1),Y(1),CS(0),SUM_G(1),SUM_P(1),S(1));
	SU2 : P_SUM port map (X(2),Y(2),CS(1),SUM_G(2),SUM_P(2),S(2));
	SU3 : P_SUM port map (X(3),Y(3),CS(2),SUM_G(3),SUM_P(3),S(3));
	SU4 : P_SUM port map (X(4),Y(4),CS(3),SUM_G(4),SUM_P(4),S(4));
	SU5 : P_SUM port map (X(5),Y(5),CS(4),SUM_G(5),SUM_P(5),S(5));
	SU6 : P_SUM port map (X(6),Y(6),CS(5),SUM_G(6),SUM_P(6),S(6));
	SU7 : P_SUM port map (X(7),Y(7),CS(6),SUM_G(7),SUM_P(7),S(7));
	SU8 : P_SUM port map (X(8),Y(8),CS(7),SUM_G(8),SUM_P(8),S(8));
	SU9 : P_SUM port map (X(9),Y(9),CS(8),SUM_G(9),SUM_P(9),S(9));
	SU10 : P_SUM port map (X(10),Y(10),CS(9),SUM_G(10),SUM_P(10),S(10));
	SU11 : P_SUM port map (X(11),Y(11),CS(10),SUM_G(11),SUM_P(11),S(11));
	SU12 : P_SUM port map (X(12),Y(12),CS(11),SUM_G(12),SUM_P(12),S(12));
	SU13 : P_SUM port map (X(13),Y(13),CS(12),SUM_G(13),SUM_P(13),S(13));
	SU14 : P_SUM port map (X(14),Y(14),CS(13),SUM_G(14),SUM_P(14),S(14));
	SU15 : P_SUM port map (X(15),Y(15),CS(14),SUM_G(15),SUM_P(15),S(15));

	CU0 : P_CLA port map (SUM_G(3 downto 0),SUM_P(3 downto 0),SUB,CLA_G(0),CLA_P(0),CS(2 downto 0));
	CU1 : P_CLA port map (SUM_G(7 downto 4),SUM_P(7 downto 4),CS(3),CLA_G(1),CLA_P(1),CS(6 downto 4));
	CU2 : P_CLA port map (SUM_G(11 downto 8),SUM_P(11 downto 8),CS(7),CLA_G(2),CLA_P(2),CS(10 downto 8));
	CU3 : P_CLA port map (SUM_G(15 downto 12),SUM_P(15 downto 12),CS(11),CLA_G(3),CLA_P(3),CS(14 downto 12));
	CU4 : P_CLA port map (CLA_G,CLA_P,SUB,open,open,CS_11_7_3);	

end Behavioral;
