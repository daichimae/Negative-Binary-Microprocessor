----------------------------------------------------------------------------------
-- Company: 
-- Engineer:       Daichi Mae
-- 
-- Create Date:    16:14:05 11/07/2009 
-- Design Name:    Operation Mode Controller
-- Module Name:    OMC - Behavioral 
-- Project Name:   Negative Binary Microprocesser
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

entity OMC is
    Port ( CLK : in  STD_LOGIC := '0';
			  STA : in  STD_LOGIC := '0';
			  RST : in  STD_LOGIC := '0';
           HLT : in  STD_LOGIC := '0';
           T_5 : in  STD_LOGIC := '0';
			  OP : out STD_LOGIC := '0';
			  RSTT : out STD_LOGIC := '0');			  
end OMC;

architecture Behavioral of OMC is

component SRFF
	port ( S,R : in std_logic;
			 Q,Qb : out std_logic);
end component;

component DFF
	port ( D,CLK : in std_logic;
			 Q,Qb : out std_logic);
end component;

signal CLKb,a01,a02,o01,F0_Q,F1_Q,F2_Qb,F4_Q,F5_Q,F6_Qb : std_logic;

begin

	F0 : SRFF port map (STA,a02,F0_Q,open);
	F1 : DFF port map (F0_Q,CLKb,F1_Q,open);
	F2 : DFF port map (F1_Q,CLKb,open,F2_Qb);
	F3 : SRFF port map (a01,o01,OP,open);
	F4 : SRFF port map (RST,a01,F4_Q,open);
	F5 : DFF port map (F4_Q,CLK,F5_Q,open);
	F6 : DFF port map (F5_Q,CLK,open,F6_Qb);

	CLKb <= not CLK;
	a01 <= F1_Q and F2_Qb;
	a02 <= F5_Q and F6_Qb;
	o01 <= a02 or (CLK and HLT and T_5);
	RSTT <= a02;

end Behavioral;
