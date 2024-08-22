library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity nand_flash_controller_wrapper is
  generic (
    DATA_WIDTH : integer := 256;
    ADDR_WIDTH : integer := 40;
    CMND_WIDTH : integer := 8;
    BYTE_PER_PAGE : integer := 2112;
    PAGE_PER_BLOCK : integer := 64;
    BLOCK_SIZE : integer := 4096
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
    
    cpu_if_command          : in  std_logic_vector(CMND_WIDTH-1 downto 0);
    cpu_if_command_valid    : in  std_logic;
    cpu_if_address          : in  std_logic_vector(ADDR_WIDTH-1 downto 0);
    cpu_if_address_bytes    : in  std_logic_vector((ADDR_WIDTH/8)-1 downto 0);
    cpu_if_data_bytes       : in  std_logic_vector(ADDR_WIDTH-1 downto 0);
    cpu_if_data_rw          : in  std_logic;
    cpu_if_data_wp          : in  std_logic;
    cpu_if_access_request   : in  std_logic;
    cpu_if_access_complete  : out std_logic;
    cpu_if_access_ready     : out std_logic;
    
    buf_rd_write            : out std_logic;
    buf_rd_address          : out std_logic_vector(ADDR_WIDTH-1 downto 0);
    buf_rd_write_data       : out std_logic_vector(DATA_WIDTH-1 downto 0);
    buf_wr_address          : out std_logic_vector(ADDR_WIDTH-1 downto 0);
    buf_wr_read_data        : in  std_logic_vector(DATA_WIDTH-1 downto 0);
    
    busy                    : out std_logic
  );
end nand_flash_controller_wrapper;

architecture Behavioral of nand_flash_controller_wrapper is

  -- Declaration of the SystemVerilog module as a component
  component nand_flash_controller
    generic (
      DATA_WIDTH : integer;
      ADDR_WIDTH : integer;
      CMND_WIDTH : integer;
      BYTE_PER_PAGE : integer;
      PAGE_PER_BLOCK : integer;
      BLOCK_SIZE : integer
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
      
      cpu_if_command          : in  std_logic_vector(CMND_WIDTH-1 downto 0);
      cpu_if_command_valid    : in  std_logic;
      cpu_if_address          : in  std_logic_vector(ADDR_WIDTH-1 downto 0);
      cpu_if_address_bytes    : in  std_logic_vector((ADDR_WIDTH/8)-1 downto 0);
      cpu_if_data_bytes       : in  std_logic_vector(ADDR_WIDTH-1 downto 0);
      cpu_if_data_rw          : in  std_logic;
      cpu_if_data_wp          : in  std_logic;
      cpu_if_access_request   : in  std_logic;
      cpu_if_access_complete  : out std_logic;
      cpu_if_access_ready     : out std_logic;
      
      buf_rd_write            : out std_logic;
      buf_rd_address          : out std_logic_vector(ADDR_WIDTH-1 downto 0);
      buf_rd_write_data       : out std_logic_vector(DATA_WIDTH-1 downto 0);
      buf_wr_address          : out std_logic_vector(ADDR_WIDTH-1 downto 0);
      buf_wr_read_data        : in  std_logic_vector(DATA_WIDTH-1 downto 0);
      
      busy                    : out std_logic
    );
  end component;

begin

  -- Instantiate the SystemVerilog module
  u_nand_flash_controller : nand_flash_controller
    generic map (
      DATA_WIDTH      => DATA_WIDTH,
      ADDR_WIDTH      => ADDR_WIDTH,
      CMND_WIDTH      => CMND_WIDTH,
      BYTE_PER_PAGE   => BYTE_PER_PAGE,
      PAGE_PER_BLOCK  => PAGE_PER_BLOCK,
      BLOCK_SIZE      => BLOCK_SIZE
    )
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
