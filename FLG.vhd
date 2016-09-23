----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Daichi Mae
-- 
-- Create Date:    14:37:10 12/15/2009 
-- Design Name:    Flag Register
-- Module Name:    FLG - Behavioral 
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

entity FLG is
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
end FLG;

architecture Behavioral of FLG is

component JKFFwPC
	port ( J,CLK,K,P,C : in std_logic;
			 Q,Qb : out std_logic);
end component;

signal F0_J,F0_CLK,F0_K : std_logic;

begin

	F0_J <= ((X_14 xor X_15) and SFL) or ((not (X_15 xor Y_15)) and (Y_15 xor S_15) and (ADD or SUB));
	F0_CLK <= ((ADD or SUB) or SFL) and S_ACC;
	F0_K <= not F0_J;

	F0 : JKFFwPC port map (F0_J,F0_CLK,F0_K,'0',RSTT,OVF,open);

end Behavioral;
