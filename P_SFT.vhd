----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:34:45 12/11/2009 
-- Design Name: 
-- Module Name:    P_SFT - Behavioral 
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

entity P_SFT is
    Port ( X : in  STD_LOGIC_VECTOR (15 downto 0);
           SFL : in  STD_LOGIC;
           SFR : in  STD_LOGIC;
           SF : out  STD_LOGIC_VECTOR (15 downto 0));
end P_SFT;

architecture Behavioral of P_SFT is

begin

	SF(0) <= ('0' and SFL) or (X(1) and SFR);
	SF(1) <= (X(0) and SFL) or (X(2) and SFR);
	SF(2) <= (X(1) and SFL) or (X(3) and SFR);
	SF(3) <= (X(2) and SFL) or (X(4) and SFR);
	SF(4) <= (X(3) and SFL) or (X(5) and SFR);
	SF(5) <= (X(4) and SFL) or (X(6) and SFR);
	SF(6) <= (X(5) and SFL) or (X(7) and SFR);
	SF(7) <= (X(6) and SFL) or (X(8) and SFR);
	SF(8) <= (X(7) and SFL) or (X(9) and SFR);
	SF(9) <= (X(8) and SFL) or (X(10) and SFR);
	SF(10) <= (X(9) and SFL) or (X(11) and SFR);
	SF(11) <= (X(10) and SFL) or (X(12) and SFR);
	SF(12) <= (X(11) and SFL) or (X(13) and SFR);
	SF(13) <= (X(12) and SFL) or (X(14) and SFR);
	SF(14) <= (X(13) and SFL) or (X(15) and SFR);
	SF(15) <= X(15);

end Behavioral;
