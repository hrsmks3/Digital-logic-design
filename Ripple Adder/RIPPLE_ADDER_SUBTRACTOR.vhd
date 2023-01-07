library ieee;
use ieee.std_logic_1164.all;

library work;
use work.Gates.all;

entity FULL_ADDER is
port(A, B, C: in std_logic; SUM, C_OUT: out std_logic);
end entity FULL_ADDER;

architecture Design of FULL_ADDER is
signal s1, s2, s3, s4, s5, s6, s7: std_logic;
begin
N1: NAND_2 port map (A => A, B => B, Y => s1);
N2: NAND_2 port map (A => A, B => s1, Y => s2);
N3: NAND_2 port map (A => s1, B => B, Y => s3);
N4: NAND_2 port map (A => s2, B => s3, Y => s4);
N5: NAND_2 port map (A => s4, B => C, Y => s5);
N6: NAND_2 port map (A => s4, B => s5, Y => s6);
N7: NAND_2 port map (A => s5, B => C, Y => s7);
N8: NAND_2 port map (A => s6, B => s7, Y => SUM);
N9: NAND_2 port map (A => s5, B => s1, Y => C_OUT);

end architecture Design;

library ieee;
use ieee.std_logic_1164.all;

library work;
use work.Gates.all;

entity RIPPLE_ADDER_SUBTRACTOR is
port(A3, A2, A1, A0, B3, B2, B1, B0, M: in std_logic; C_OUT, S3, S2, S1, S0: out std_logic);
end entity RIPPLE_ADDER_SUBTRACTOR;

architecture Struct of RIPPLE_ADDER_SUBTRACTOR is
component FULL_ADDER is
port(A, B, C: in std_logic; SUM, C_OUT: out std_logic);
end component FULL_ADDER;

signal sum1, sum2, sum3, sum4, c0, c1, c2: std_logic;
begin
XOR1: XOR_2 port map (A => M, B => B0, Y => sum1);
XOR2: XOR_2 port map (A => M, B => B1, Y => sum2);
XOR3: XOR_2 port map (A => M, B => B2, Y => sum3);
XOR4: XOR_2 port map (A => M, B => B3, Y => sum4);
FA1: FULL_ADDER port map (A => A0, B => sum1, C => M, SUM => S0, C_OUT => c0);
FA2: FULL_ADDER port map (A => A1, B => sum2, C => c0, SUM => S1, C_OUT => C1);
FA3: FULL_ADDER port map (A => A2, B => sum3, C => c1, SUM => S2, C_OUT => c2);
FA4: FULL_ADDER port map (A => A3, B => sum4, C => c2, SUM => S3, C_OUT => C_OUT);

end architecture Struct;
