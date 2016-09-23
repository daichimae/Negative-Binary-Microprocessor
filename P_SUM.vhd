----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:36:03 12/09/2009 
-- Design Name: 
-- Module Name:    P_SUM - Behavioral 
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

entity P_SUM is
    Port ( X : in  STD_LOGIC;
           Y : in  STD_LOGIC;
           C_IN : in  STD_LOGIC;
           G : out  STD_LOGIC;
           P : out  STD_LOGIC;
           S : out  STD_LOGIC);
end P_SUM;

architecture Behavioral of P_SUM is

begin

	G <= X and Y;
	P <= X xor Y;
	S <= X xor Y xor C_IN;

end Behavioral;
