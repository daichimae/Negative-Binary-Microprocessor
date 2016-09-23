----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:32:48 12/03/2009 
-- Design Name: 
-- Module Name:    MEMDEV - Behavioral 
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

entity MEMDEV is
    Port ( CS : in  STD_LOGIC;
           RW : in  STD_LOGIC;
           AD : in  STD_LOGIC_VECTOR (11 downto 0) := (others => '0');
           D_IN : in  STD_LOGIC_VECTOR (15 downto 0);
           D_OUT : out  STD_LOGIC_VECTOR (15 downto 0));
end MEMDEV;

architecture Behavioral of MEMDEV is

type RAMARRAY is array (0 to 31) of std_logic_vector(15 downto 0);

signal AD_INT : integer range 0 to 31;
signal RAMDATA : RAMARRAY := (
	"0000000000001110","0011000000001110","0001000000001111","0001000000010000",
	"0000000000010000","0010000000001110","0001000000010000","0010000000001111",
	"0001000000001111","0000000000010000","0011000000001101","1010000000000100",
	"1110000000000000","0000000000110010","0000000000000001","0000000000000000",
	"0000000000000000","0000000000000000","0000000000000000","0000000000000000",
	"0000000000000000","0000000000000000","0000000000000000","0000000000000000",
	"0000000000000000","0000000000000000","0000000000000000","0000000000000000",
	"0000000000000000","0000000000000000","0000000000000000","0000000000000000"
	);


begin
	AD_INT <= conv_integer(AD);
	process(CS,RW,AD,D_IN,AD_INT,RAMDATA) begin
		if(CS='1') then
			if(RW='0') then
				D_OUT <= RAMDATA(AD_INT);
			elsif(RW='1') then
				RAMDATA(AD_INT) <= D_IN;
			end if;
		end if;
	end process;
end Behavioral;
