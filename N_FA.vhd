----------------------------------------------------------------------------------
-- Company: 
-- Engineer:       Daichi Mae
-- 
-- Create Date:    16:50:45 01/08/2010 
-- Design Name:    Negative Full Adder
-- Module Name:    N_FA - Behavioral 
-- Project Name:   Negarive Binary Microprocessor
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

entity N_FA is
    Port ( X : in  STD_LOGIC_VECTOR (1 downto 0);
           Y : in  STD_LOGIC_VECTOR (1 downto 0);
           C_IN : in  STD_LOGIC_VECTOR (1 downto 0);
           S : out  STD_LOGIC_VECTOR (1 downto 0);
           C_OUT : out  STD_LOGIC_VECTOR (1 downto 0));
end N_FA;

architecture Behavioral of N_FA is

signal U : std_logic_vector (1 downto 0);

begin

	S(0) <= X(0) xor Y(0) xor C_IN(0);
	S(1) <= X(1) xor Y(1) xor C_IN(1) xor U(0);
	C_OUT(0) <= (U(1) and (not U(0))) or (X(1) and Y(1) and C_IN(1)) or ((not X(1)) and (not Y(1)) and (not C_IN(1)) and U(0));
	C_OUT(1) <= (U(1) and (not U(0))) or (X(1) and Y(1) and C_IN(1));

	U(0) <= (X(0) and Y(0)) or (Y(0) and C_IN(0)) or (C_IN(0) and X(0));
	U(1) <= (X(1) and Y(1)) or (Y(1) and C_IN(1)) or (C_IN(1) and X(1));

end Behavioral;
