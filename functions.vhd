library ieee;
use ieee.STD_LOGIC_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;	-- Needed for the `ceil()` function

package functions is
	-- ====================================
	--  Calculate required bits for number
	-- ====================================
	function bit_width (num: natural) return natural;

	-- ============
	--  VHDL quirk
	-- ============
	function bit_to_vec (b: std_logic) return std_logic_vector;
end package functions;

package body functions is
	-- ====================================
	--  Calculate required bits for number
	-- ====================================
	function bit_width (num: natural) return natural is
	begin
		if num = 0 then
			return 1;
		else
			return integer(ceil(log2(real(num + 1))));
		end if;
	end function bit_width;

	-- ============
	--  VHDL quirk
	-- ============
	function bit_to_vec (b: std_logic) return std_logic_vector is
	begin
		case b is
			when '1' =>
				return "1";
			when others =>
				return "0";
		end case;
	end function;
end package body functions;
