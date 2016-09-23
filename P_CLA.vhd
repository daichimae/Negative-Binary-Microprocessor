----------------------------------------------------------------------------------
-- Company: 
-- Engineer:       Daichi Mae
-- 
-- Create Date:    11:58:18 12/09/2009 
-- Design Name:    Positive Carry Look-ahead Adder
-- Module Name:    P_CLA - Behavioral 
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

entity P_CLA is
    Port ( G : in  STD_LOGIC_VECTOR (3 downto 0);
           P : in  STD_LOGIC_VECTOR (3 downto 0);
           C_IN : in  STD_LOGIC;
           G4 : out  STD_LOGIC;
           P4 : out  STD_LOGIC;
           C_OUT : out  STD_LOGIC_VECTOR (2 downto 0));
end P_CLA;

architecture Behavioral of P_CLA is

begin

	G4 <= G(3) or (P(3) and G(2)) or (P(3) and P(2) and G(1)) or (P(3) and P(2) and P(1) and G(0));
	P4 <= P(3) and P(2) and P(1) and P(0);
	C_OUT(0) <= G(0) or (P(0) and C_IN);
	C_OUT(1) <= G(1) or (P(1) and G(0)) or (P(1) and P(0) and C_IN);
	C_OUT(2) <= G(2) or (P(2) and G(1)) or (P(2) and P(1) and G(0)) or (P(2) and P(1) and P(0) and C_IN);

end Behavioral;
