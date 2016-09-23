----------------------------------------------------------------------------------
-- Company: 
-- Engineer:       Daichi Mae
-- 
-- Create Date:    14:57:36 11/24/2009 
-- Design Name:    Set Signal Generator
-- Module Name:    SSG - Behavioral 
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

entity SSG is
    Port ( CLK : in  STD_LOGIC;
           OP : in  STD_LOGIC;
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
			  AL0 : in  STD_LOGIC;
           ACN : in  STD_LOGIC;
           OVF : in  STD_LOGIC;
           T_0 : in  STD_LOGIC;
           T_3 : in  STD_LOGIC;
           T_4 : in  STD_LOGIC;
           T_5 : in  STD_LOGIC;
           T_6 : in  STD_LOGIC;
           T_8 : in  STD_LOGIC;
           S_MAR : out  STD_LOGIC;
           S_MDR : out  STD_LOGIC;
           S_ACC : out  STD_LOGIC;
           S_IR : out  STD_LOGIC;
           S_RAR : out  STD_LOGIC;
           S_PC : out  STD_LOGIC);
end SSG;

architecture Behavioral of SSG is

begin

	S_MAR <= (OP and T_0 and CLK) or (LSAS and T_5 and CLK);
	S_MDR <= (T_3 and CLK) or (T_8 and (LD or ADD or SUB) and CLK) or (ST and T_6 and CLK);
	S_ACC <= OP and T_0 and ((LD or ADD or SUB) or SFR or SFL) and CLK;
	S_IR <= T_4 and CLK;
	S_RAR <= T_5 and (JL or RET) and CLK;
	S_PC <= T_5 and ((JL or RET) or JP or (JPZ and AL0) or (JPN and ACN) or (JPO and OVF)) and CLK;

end Behavioral;

