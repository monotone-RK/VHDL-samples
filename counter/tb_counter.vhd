library IEEE;
use std.textio.all;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_textio.all;
use IEEE.numeric_std.all;

entity tb_counter is
end tb_counter;

architecture sim of tb_counter is
  constant data_width    : integer := 32;
  constant halt_value    : integer := 30;
  constant clk_hf_period : time := 5 ns;  -- 100MHz
  constant reset_period  : time := 100 ns;

  signal CLK_IN      : std_logic := '0';
  signal RST_X_IN    : std_logic := '0';
  signal DOUT        : std_logic_vector(data_width-1 downto 0);
  signal finish_flag : boolean := false;
  
  component counter is
    generic (WIDTH : integer := 32);
    port    (CLK   : in std_logic;
             RST_X : in std_logic;
             VALUE : out std_logic_vector(WIDTH-1 downto 0));
  end component;

begin
  uut : counter
    generic map (WIDTH => data_width)
    port map    (CLK   => CLK_IN,
                 RST_X => RST_X_IN,
                 VALUE => DOUT);
  
  process  -- clock gen
  begin
    wait for clk_hf_period;
    CLK_IN <= not CLK_IN;
    if (finish_flag) then
      wait;
    end if;
  end process;
  
  process  -- reset gen
  begin
    wait for reset_period;
    RST_X_IN <= '1';
    wait;
  end process;

  process (CLK_IN)
    variable l : line;
  begin
    if (rising_edge (CLK_IN)) then
      if (RST_X_IN = '0') then
        write (l, String'("RESET..."));
        writeline (output, l);
      else 
        write (l, String'("DOUT is "));
        hwrite (l, DOUT);
        writeline (output, l);
        if (to_integer(unsigned(DOUT)) > halt_value) then
          finish_flag <= true;
        end if;
      end if;
    end if;
  end process;
  
end sim;
