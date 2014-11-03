-- *****************************************************************************
-- Hello world (VHDL samples)                           monotone-RK 2014.11.03 *
-- *****************************************************************************
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity counter is
  generic (WIDTH : integer := 32);
  port    (CLK   : in std_logic;
           RST_X : in std_logic;
           VALUE : out std_logic_vector(WIDTH-1 downto 0));
end counter;

architecture rtl of counter is
  signal cnt : std_logic_vector(WIDTH-1 downto 0);

begin
  VALUE <= cnt;

  process (CLK)
  begin
    if (rising_edge(CLK)) then
      if (RST_X = '0') then
        cnt <= (others => '0');
      else
        cnt <= cnt + 1;
      end if;
    end if;
  end process;
  
end rtl;
