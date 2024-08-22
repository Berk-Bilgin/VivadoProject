library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity tb_nand_flash_controller_wrapper is
end tb_nand_flash_controller_wrapper;

architecture Behavioral of tb_nand_flash_controller_wrapper is

  -- Testbench signals
  signal clk                  : std_logic := '0';
  signal reset                : std_logic := '1';
  
  signal CE_N                 : std_logic;
  signal WE_N                 : std_logic;
  signal RE_N                 : std_logic;
  signal CLE                  : std_logic;
  signal ALE                  : std_logic;
  signal IO_I                 : std_logic_vector(7 downto 0) := (others => '0');
  signal IO_O                 : std_logic_vector(7 downto 0);
  signal IO_OE                : std_logic;
  signal WP_N                 : std_logic;
  signal RB_N                 : std_logic := '1';  -- Ready/Busy signal, assume device is ready initially
  
  signal cpu_if_command       : std_logic_vector(7 downto 0) := (others => '0');
  signal cpu_if_command_valid : std_logic := '0';
  signal cpu_if_address       : std_logic_vector(39 downto 0) := (others => '0');
  signal cpu_if_address_bytes : std_logic_vector(4 downto 0) := (others => '0');
  signal cpu_if_data_bytes    : std_logic_vector(39 downto 0) := (others => '0');
  signal cpu_if_data_rw       : std_logic := '0';  -- 0 for write, 1 for read
  signal cpu_if_data_wp       : std_logic := '0';
  signal cpu_if_access_request: std_logic := '0';
  signal cpu_if_access_complete: std_logic;
  signal cpu_if_access_ready  : std_logic;
  
  signal buf_rd_write         : std_logic;
  signal buf_rd_address       : std_logic_vector(39 downto 0);
  signal buf_rd_write_data    : std_logic_vector(255 downto 0);
  signal buf_wr_address       : std_logic_vector(39 downto 0);
  signal buf_wr_read_data     : std_logic_vector(255 downto 0) := (others => '0');
  
  signal busy                 : std_logic;

  -- Instantiate the NAND flash controller wrapper
  component nand_flash_controller_wrapper
    generic (
      DATA_WIDTH      : integer := 256;
      ADDR_WIDTH      : integer := 40;
      CMND_WIDTH      : integer := 8;
      BYTE_PER_PAGE   : integer := 2112;
      PAGE_PER_BLOCK  : integer := 64;
      BLOCK_SIZE      : integer := 4096
    );
    port (
      clk                     : in  std_logic;
      reset                   : in  std_logic;
      
      CE_N                    : out std_logic;
      WE_N                    : out std_logic;
      RE_N                    : out std_logic;
      CLE                     : out std_logic;
      ALE                     : out std_logic;
      IO_I                    : in  std_logic_vector(7 downto 0);
      IO_O                    : out std_logic_vector(7 downto 0);
      IO_OE                   : out std_logic;
      WP_N                    : out std_logic;
      RB_N                    : in  std_logic;
      
      cpu_if_command          : in  std_logic_vector(7 downto 0);
      cpu_if_command_valid    : in  std_logic;
      cpu_if_address          : in  std_logic_vector(39 downto 0);
      cpu_if_address_bytes    : in  std_logic_vector(4 downto 0);
      cpu_if_data_bytes       : in  std_logic_vector(39 downto 0);
      cpu_if_data_rw          : in  std_logic;
      cpu_if_data_wp          : in  std_logic;
      cpu_if_access_request   : in  std_logic;
      cpu_if_access_complete  : out std_logic;
      cpu_if_access_ready     : out std_logic;
      
      buf_rd_write            : out std_logic;
      buf_rd_address          : out std_logic_vector(39 downto 0);
      buf_rd_write_data       : out std_logic_vector(255 downto 0);
      buf_wr_address          : out std_logic_vector(39 downto 0);
      buf_wr_read_data        : in  std_logic_vector(255 downto 0);
      
      busy                    : out std_logic
    );
  end component;

begin

  -- Generate clock
  clk_process : process
  begin
    clk <= '0';
    wait for 10 ns;
    clk <= '1';
    wait for 10 ns;
  end process;

  -- Apply reset
  reset_process : process
  begin
    reset <= '1';
    wait for 50 ns;
    reset <= '0';
    wait;
  end process;

  -- Stimulus process to perform a data write
  stimulus_process : process
  begin
    wait for 100 ns;
    
    -- Issue a write command
    cpu_if_command       <= x"80";  -- Write command
    cpu_if_command_valid <= '1';
    cpu_if_address       <= "0000000000010000000000000000000000000000"; -- Example address
    cpu_if_address_bytes <= "00101";  -- Address is 5 bytes
    cpu_if_data_bytes    <= "0000000000000000000000000000000001000000"; -- Data is 32 bytes
    cpu_if_data_rw       <= '0';  -- Write operation
    cpu_if_access_request<= '1';
    
    -- Simulate data to be written
    buf_wr_read_data <= x"1234567812345678123456781234567812345678123456781234567812345678";
    
    wait until cpu_if_access_ready = '1'; -- Wait until controller is ready
    cpu_if_command_valid <= '0';
    cpu_if_access_request<= '0';
    
    -- Wait for the access to complete
    wait until cpu_if_access_complete = '1';

    -- Wait for some time to observe the result
    wait for 100 ns;

    -- End of simulation
    wait;
  end process;

  -- Instantiate the NAND flash controller wrapper
  u_nand_flash_controller_wrapper : nand_flash_controller_wrapper
    port map (
      clk                     => clk,
      reset                   => reset,
      CE_N                    => CE_N,
      WE_N                    => WE_N,
      RE_N                    => RE_N,
      CLE                     => CLE,
      ALE                     => ALE,
      IO_I                    => IO_I,
      IO_O                    => IO_O,
      IO_OE                   => IO_OE,
      WP_N                    => WP_N,
      RB_N                    => RB_N,
      cpu_if_command          => cpu_if_command,
      cpu_if_command_valid    => cpu_if_command_valid,
      cpu_if_address          => cpu_if_address,
      cpu_if_address_bytes    => cpu_if_address_bytes,
      cpu_if_data_bytes       => cpu_if_data_bytes,
      cpu_if_data_rw          => cpu_if_data_rw,
      cpu_if_data_wp          => cpu_if_data_wp,
      cpu_if_access_request   => cpu_if_access_request,
      cpu_if_access_complete  => cpu_if_access_complete,
      cpu_if_access_ready     => cpu_if_access_ready,
      buf_rd_write            => buf_rd_write,
      buf_rd_address          => buf_rd_address,
      buf_rd_write_data       => buf_rd_write_data,
      buf_wr_address          => buf_wr_address,
      buf_wr_read_data        => buf_wr_read_data,
      busy                    => busy
    );

end Behavioral;
