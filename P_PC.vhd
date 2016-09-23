----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:45:53 11/26/2009 
-- Design Name: 
-- Module Name:    P_PC - Behavioral 
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

entity P_PC is
    Port ( CLK : in  STD_LOGIC;
           RSTT : in  STD_LOGIC;
           T_2 : in  STD_LOGIC;
           S_PC : in  STD_LOGIC;
           RI : in  STD_LOGIC_VECTOR (11 downto 0);
           PC : out  STD_LOGIC_VECTOR (11 downto 0));
end P_PC;

architecture Behavioral of P_PC is

component JKFFwPC
	port ( J,CLK,K,P,C : in std_logic;
			 Q,Qb : out std_logic);
end component;

signal F_CLK,F0_P,F0_C,F0_Q,F1_P,F1_C,F1_Q,F2_J,F2_P,F2_C,F2_Q,F3_J,F3_P,F3_C,F3_Q,F4_J,F4_P,F4_C,F4_Q,F5_J,F5_P,F5_C,F5_Q,F6_J,F6_P,F6_C,F6_Q,F7_J,F7_P,F7_C,F7_Q,F8_J,F8_P,F8_C,F8_Q,F9_J,F9_P,F9_C,F9_Q,F10_J,F10_P,F10_C,F10_Q,F11_J,F11_P,F11_C : std_logic;

begin

	F_CLK <= CLK and T_2;

	F2_J <= F0_Q and F1_Q;
	F3_J <= F2_J and F2_Q;
	F4_J <= F3_J and F3_Q;
	F5_J <= F4_J and F4_Q;
	F6_J <= F5_J and F5_Q;
	F7_J <= F6_J and F6_Q;
	F8_J <= F7_J and F7_Q;
	F9_J <= F8_J and F8_Q;
	F10_J <= F9_J and F9_Q;
	F11_J <= F10_J and F10_Q;

	F0_P <= S_PC and RI(0);
	F0_C <= RSTT or (S_PC and (not RI(0)));
	F1_P <= S_PC and RI(1);
	F1_C <= RSTT or (S_PC and (not RI(1)));
	F2_P <= S_PC and RI(2);
	F2_C <= RSTT or (S_PC and (not RI(2)));
	F3_P <= S_PC and RI(3);
	F3_C <= RSTT or (S_PC and (not RI(3)));
	F4_P <= S_PC and RI(4);
	F4_C <= RSTT or (S_PC and (not RI(4)));
	F5_P <= S_PC and RI(5);
	F5_C <= RSTT or (S_PC and (not RI(5)));
	F6_P <= S_PC and RI(6);
	F6_C <= RSTT or (S_PC and (not RI(6)));
	F7_P <= S_PC and RI(7);
	F7_C <= RSTT or (S_PC and (not RI(7)));
	F8_P <= S_PC and RI(8);
	F8_C <= RSTT or (S_PC and (not RI(8)));
	F9_P <= S_PC and RI(9);
	F9_C <= RSTT or (S_PC and (not RI(9)));
	F10_P <= S_PC and RI(10);
	F10_C <= RSTT or (S_PC and (not RI(10)));
	F11_P <= S_PC and RI(11);
	F11_C <= RSTT or (S_PC and (not RI(11)));

	PC(0) <= F0_Q;
	PC(1) <= F1_Q;
	PC(2) <= F2_Q;
	PC(3) <= F3_Q;
	PC(4) <= F4_Q;
	PC(5) <= F5_Q;
	PC(6) <= F6_Q;
	PC(7) <= F7_Q;
	PC(8) <= F8_Q;
	PC(9) <= F9_Q;
	PC(10) <= F10_Q;

	F0 : JKFFwPC port map ('1',F_CLK,'1',F0_P,F0_C,F0_Q,open);
	F1 : JKFFwPC port map (F0_Q,F_CLK,F0_Q,F1_P,F1_C,F1_Q,open);
	F2 : JKFFwPC port map (F2_J,F_CLK,F2_J,F2_P,F2_C,F2_Q,open);
	F3 : JKFFwPC port map (F3_J,F_CLK,F3_J,F3_P,F3_C,F3_Q,open);
	F4 : JKFFwPC port map (F4_J,F_CLK,F4_J,F4_P,F4_C,F4_Q,open);
	F5 : JKFFwPC port map (F5_J,F_CLK,F5_J,F5_P,F5_C,F5_Q,open);
	F6 : JKFFwPC port map (F6_J,F_CLK,F6_J,F6_P,F6_C,F6_Q,open);
	F7 : JKFFwPC port map (F7_J,F_CLK,F7_J,F7_P,F7_C,F7_Q,open);
	F8 : JKFFwPC port map (F8_J,F_CLK,F8_J,F8_P,F8_C,F8_Q,open);
	F9 : JKFFwPC port map (F9_J,F_CLK,F9_J,F9_P,F9_C,F9_Q,open);
	F10 : JKFFwPC port map (F10_J,F_CLK,F10_J,F10_P,F10_C,F10_Q,open);
	F11 : JKFFwPC port map (F11_J,F_CLK,F11_J,F11_P,F11_C,PC(11),open);

end Behavioral;
