library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
--use IEEE.STD_LOGIC_ARITH.ALL;
--use IEEE.STD_TEXTIO.ALL;
use STD.TEXTIO.ALL;

ENTITY top_wrapper IS
generic (
    DATA_WIDTH : integer := 256;
    ADDR_WIDTH : integer := 40;
    CMND_WIDTH : integer := 8;
    BYTE_PER_PAGE : integer := 2112;
    PAGE_PER_BLOCK : integer := 64;
    BLOCK_SIZE : integer := 4096
  );
  port (
    --Encoder ports
    input_time_series_V_data_0_V_TDATA : IN STD_LOGIC_VECTOR (15 downto 0);
    ap_clk : IN STD_LOGIC;
    ap_rst_n : IN STD_LOGIC;
    input_time_series_V_data_0_V_TVALID : IN STD_LOGIC;
    input_time_series_V_data_0_V_TREADY : OUT STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    encoded_data_valid : out std_logic;
    --ONFI ports
    reset_onfi              : in  std_logic;
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
    busy                    : out std_logic
  );
END top_wrapper;
ARCHITECTURE behavior OF top_wrapper IS

COMPONENT Encoder
PORT(
    input_time_series_V_data_0_V_TDATA : IN STD_LOGIC_VECTOR (15 downto 0);
    layer17_out_V_data_0_V_TDATA : OUT STD_LOGIC_VECTOR (15 downto 0);
    layer17_out_V_data_1_V_TDATA : OUT STD_LOGIC_VECTOR (15 downto 0);
    layer17_out_V_data_2_V_TDATA : OUT STD_LOGIC_VECTOR (15 downto 0);
    layer17_out_V_data_3_V_TDATA : OUT STD_LOGIC_VECTOR (15 downto 0);
    layer17_out_V_data_4_V_TDATA : OUT STD_LOGIC_VECTOR (15 downto 0);
    layer17_out_V_data_5_V_TDATA : OUT STD_LOGIC_VECTOR (15 downto 0);
    layer17_out_V_data_6_V_TDATA : OUT STD_LOGIC_VECTOR (15 downto 0);
    layer17_out_V_data_7_V_TDATA : OUT STD_LOGIC_VECTOR (15 downto 0);
    layer17_out_V_data_8_V_TDATA : OUT STD_LOGIC_VECTOR (15 downto 0);
    layer17_out_V_data_9_V_TDATA : OUT STD_LOGIC_VECTOR (15 downto 0);
    layer17_out_V_data_10_V_TDATA : OUT STD_LOGIC_VECTOR (15 downto 0);
    layer17_out_V_data_11_V_TDATA : OUT STD_LOGIC_VECTOR (15 downto 0);
    layer17_out_V_data_12_V_TDATA : OUT STD_LOGIC_VECTOR (15 downto 0);
    layer17_out_V_data_13_V_TDATA : OUT STD_LOGIC_VECTOR (15 downto 0);
    layer17_out_V_data_14_V_TDATA : OUT STD_LOGIC_VECTOR (15 downto 0);
    layer17_out_V_data_15_V_TDATA : OUT STD_LOGIC_VECTOR (15 downto 0);
    ap_clk : IN STD_LOGIC;
    ap_rst_n : IN STD_LOGIC := '0';
    input_time_series_V_data_0_V_TVALID : IN STD_LOGIC;
    input_time_series_V_data_0_V_TREADY : OUT STD_LOGIC;
    ap_start : IN STD_LOGIC;
    layer17_out_V_data_0_V_TVALID : OUT STD_LOGIC;
    layer17_out_V_data_0_V_TREADY : IN STD_LOGIC;
    layer17_out_V_data_1_V_TVALID : OUT STD_LOGIC;
    layer17_out_V_data_1_V_TREADY : IN STD_LOGIC;
    layer17_out_V_data_2_V_TVALID : OUT STD_LOGIC;
    layer17_out_V_data_2_V_TREADY : IN STD_LOGIC;
    layer17_out_V_data_3_V_TVALID : OUT STD_LOGIC;
    layer17_out_V_data_3_V_TREADY : IN STD_LOGIC;
    layer17_out_V_data_4_V_TVALID : OUT STD_LOGIC;
    layer17_out_V_data_4_V_TREADY : IN STD_LOGIC;
    layer17_out_V_data_5_V_TVALID : OUT STD_LOGIC;
    layer17_out_V_data_5_V_TREADY : IN STD_LOGIC;
    layer17_out_V_data_6_V_TVALID : OUT STD_LOGIC;
    layer17_out_V_data_6_V_TREADY : IN STD_LOGIC;
    layer17_out_V_data_7_V_TVALID : OUT STD_LOGIC;
    layer17_out_V_data_7_V_TREADY : IN STD_LOGIC;
    layer17_out_V_data_8_V_TVALID : OUT STD_LOGIC;
    layer17_out_V_data_8_V_TREADY : IN STD_LOGIC;
    layer17_out_V_data_9_V_TVALID : OUT STD_LOGIC;
    layer17_out_V_data_9_V_TREADY : IN STD_LOGIC;
    layer17_out_V_data_10_V_TVALID : OUT STD_LOGIC;
    layer17_out_V_data_10_V_TREADY : IN STD_LOGIC;
    layer17_out_V_data_11_V_TVALID : OUT STD_LOGIC;
    layer17_out_V_data_11_V_TREADY : IN STD_LOGIC;
    layer17_out_V_data_12_V_TVALID : OUT STD_LOGIC;
    layer17_out_V_data_12_V_TREADY : IN STD_LOGIC;
    layer17_out_V_data_13_V_TVALID : OUT STD_LOGIC;
    layer17_out_V_data_13_V_TREADY : IN STD_LOGIC;
    layer17_out_V_data_14_V_TVALID : OUT STD_LOGIC;
    layer17_out_V_data_14_V_TREADY : IN STD_LOGIC;
    layer17_out_V_data_15_V_TVALID : OUT STD_LOGIC;
    layer17_out_V_data_15_V_TREADY : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC);
END COMPONENT;

component nand_flash_controller_wrapper
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
end component;
--encoder signals

signal layer17_out_V_data_0_V_TDATA : STD_LOGIC_VECTOR (15 downto 0);
signal layer17_out_V_data_1_V_TDATA : STD_LOGIC_VECTOR (15 downto 0);
signal layer17_out_V_data_2_V_TDATA : STD_LOGIC_VECTOR (15 downto 0);
signal layer17_out_V_data_3_V_TDATA : STD_LOGIC_VECTOR (15 downto 0);
signal layer17_out_V_data_4_V_TDATA : STD_LOGIC_VECTOR (15 downto 0);
signal layer17_out_V_data_5_V_TDATA : STD_LOGIC_VECTOR (15 downto 0);
signal layer17_out_V_data_6_V_TDATA : STD_LOGIC_VECTOR (15 downto 0);
signal layer17_out_V_data_7_V_TDATA : STD_LOGIC_VECTOR (15 downto 0);
signal layer17_out_V_data_8_V_TDATA : STD_LOGIC_VECTOR (15 downto 0);
signal layer17_out_V_data_9_V_TDATA : STD_LOGIC_VECTOR (15 downto 0);
signal layer17_out_V_data_10_V_TDATA : STD_LOGIC_VECTOR (15 downto 0);
signal layer17_out_V_data_11_V_TDATA : STD_LOGIC_VECTOR (15 downto 0);
signal layer17_out_V_data_12_V_TDATA : STD_LOGIC_VECTOR (15 downto 0);
signal layer17_out_V_data_13_V_TDATA : STD_LOGIC_VECTOR (15 downto 0);
signal layer17_out_V_data_14_V_TDATA : STD_LOGIC_VECTOR (15 downto 0);
signal layer17_out_V_data_15_V_TDATA : STD_LOGIC_VECTOR (15 downto 0);
signal layer17_out_V_data_0_V_TVALID : STD_LOGIC;
signal layer17_out_V_data_0_V_TREADY : STD_LOGIC := '1';
signal layer17_out_V_data_1_V_TVALID : STD_LOGIC;
signal layer17_out_V_data_1_V_TREADY : STD_LOGIC := '1';
signal layer17_out_V_data_2_V_TVALID : STD_LOGIC;
signal layer17_out_V_data_2_V_TREADY : STD_LOGIC := '1';
signal layer17_out_V_data_3_V_TVALID : STD_LOGIC;
signal layer17_out_V_data_3_V_TREADY : STD_LOGIC := '1';
signal layer17_out_V_data_4_V_TVALID : STD_LOGIC;
signal layer17_out_V_data_4_V_TREADY : STD_LOGIC := '1';
signal layer17_out_V_data_5_V_TVALID :  STD_LOGIC;
signal layer17_out_V_data_5_V_TREADY : STD_LOGIC := '1';
signal layer17_out_V_data_6_V_TVALID :  STD_LOGIC;
signal layer17_out_V_data_6_V_TREADY : STD_LOGIC := '1';
signal layer17_out_V_data_7_V_TVALID :  STD_LOGIC;
signal layer17_out_V_data_7_V_TREADY : STD_LOGIC:= '1';
signal layer17_out_V_data_8_V_TVALID :  STD_LOGIC;
signal layer17_out_V_data_8_V_TREADY : STD_LOGIC:= '1';
signal layer17_out_V_data_9_V_TVALID :  STD_LOGIC;
signal layer17_out_V_data_9_V_TREADY : STD_LOGIC:= '1';
signal layer17_out_V_data_10_V_TVALID :  STD_LOGIC;
signal layer17_out_V_data_10_V_TREADY : STD_LOGIC:= '1';
signal layer17_out_V_data_11_V_TVALID :  STD_LOGIC;
signal layer17_out_V_data_11_V_TREADY : STD_LOGIC:= '1';
signal layer17_out_V_data_12_V_TVALID :  STD_LOGIC;
signal layer17_out_V_data_12_V_TREADY : STD_LOGIC:= '1';
signal layer17_out_V_data_13_V_TVALID :  STD_LOGIC;
signal layer17_out_V_data_13_V_TREADY : STD_LOGIC:= '1';
signal layer17_out_V_data_14_V_TVALID :  STD_LOGIC;
signal layer17_out_V_data_14_V_TREADY : STD_LOGIC:= '1';
signal layer17_out_V_data_15_V_TVALID :  STD_LOGIC;
signal layer17_out_V_data_15_V_TREADY : STD_LOGIC:= '1';
signal encoder_out : std_logic_vector(255 downto 0);
-- ONFI signals
--signal clk                  : std_logic := '0';

BEGIN
encoded_data_valid <= layer17_out_V_data_0_V_TVALID;
u_encoder: Encoder PORT MAP (
    input_time_series_V_data_0_V_TDATA => input_time_series_V_data_0_V_TDATA,
    layer17_out_V_data_0_V_TDATA => layer17_out_V_data_0_V_TDATA ,
    layer17_out_V_data_1_V_TDATA => layer17_out_V_data_1_V_TDATA ,
    layer17_out_V_data_2_V_TDATA => layer17_out_V_data_2_V_TDATA ,
    layer17_out_V_data_3_V_TDATA => layer17_out_V_data_3_V_TDATA ,
    layer17_out_V_data_4_V_TDATA => layer17_out_V_data_4_V_TDATA ,
    layer17_out_V_data_5_V_TDATA => layer17_out_V_data_5_V_TDATA ,
    layer17_out_V_data_6_V_TDATA => layer17_out_V_data_6_V_TDATA ,
    layer17_out_V_data_7_V_TDATA => layer17_out_V_data_7_V_TDATA ,
    layer17_out_V_data_8_V_TDATA => layer17_out_V_data_8_V_TDATA ,
    layer17_out_V_data_9_V_TDATA => layer17_out_V_data_9_V_TDATA ,
    layer17_out_V_data_10_V_TDATA=> layer17_out_V_data_10_V_TDATA,
    layer17_out_V_data_11_V_TDATA=> layer17_out_V_data_11_V_TDATA,
    layer17_out_V_data_12_V_TDATA=> layer17_out_V_data_12_V_TDATA,
    layer17_out_V_data_13_V_TDATA=> layer17_out_V_data_13_V_TDATA,
    layer17_out_V_data_14_V_TDATA=> layer17_out_V_data_14_V_TDATA,
    layer17_out_V_data_15_V_TDATA=> layer17_out_V_data_15_V_TDATA,
    ap_clk => ap_clk,
    ap_rst_n => ap_rst_n,
    input_time_series_V_data_0_V_TVALID => input_time_series_V_data_0_V_TVALID,
    input_time_series_V_data_0_V_TREADY => input_time_series_V_data_0_V_TREADY,
    ap_start => ap_start,
    layer17_out_V_data_0_V_TVALID => layer17_out_V_data_0_V_TVALID ,
    layer17_out_V_data_0_V_TREADY => layer17_out_V_data_0_V_TREADY ,
    layer17_out_V_data_1_V_TVALID => layer17_out_V_data_1_V_TVALID ,
    layer17_out_V_data_1_V_TREADY => layer17_out_V_data_1_V_TREADY ,
    layer17_out_V_data_2_V_TVALID => layer17_out_V_data_2_V_TVALID ,
    layer17_out_V_data_2_V_TREADY => layer17_out_V_data_2_V_TREADY ,
    layer17_out_V_data_3_V_TVALID => layer17_out_V_data_3_V_TVALID ,
    layer17_out_V_data_3_V_TREADY => layer17_out_V_data_3_V_TREADY ,
    layer17_out_V_data_4_V_TVALID => layer17_out_V_data_4_V_TVALID ,
    layer17_out_V_data_4_V_TREADY => layer17_out_V_data_4_V_TREADY ,
    layer17_out_V_data_5_V_TVALID => layer17_out_V_data_5_V_TVALID ,
    layer17_out_V_data_5_V_TREADY => layer17_out_V_data_5_V_TREADY ,
    layer17_out_V_data_6_V_TVALID => layer17_out_V_data_6_V_TVALID ,
    layer17_out_V_data_6_V_TREADY => layer17_out_V_data_6_V_TREADY ,
    layer17_out_V_data_7_V_TVALID => layer17_out_V_data_7_V_TVALID ,
    layer17_out_V_data_7_V_TREADY => layer17_out_V_data_7_V_TREADY ,
    layer17_out_V_data_8_V_TVALID => layer17_out_V_data_8_V_TVALID ,
    layer17_out_V_data_8_V_TREADY => layer17_out_V_data_8_V_TREADY ,
    layer17_out_V_data_9_V_TVALID => layer17_out_V_data_9_V_TVALID ,
    layer17_out_V_data_9_V_TREADY => layer17_out_V_data_9_V_TREADY ,
    layer17_out_V_data_10_V_TVALID=> layer17_out_V_data_10_V_TVALID,
    layer17_out_V_data_10_V_TREADY=> layer17_out_V_data_10_V_TREADY,
    layer17_out_V_data_11_V_TVALID=> layer17_out_V_data_11_V_TVALID,
    layer17_out_V_data_11_V_TREADY=> layer17_out_V_data_11_V_TREADY,
    layer17_out_V_data_12_V_TVALID=> layer17_out_V_data_12_V_TVALID,
    layer17_out_V_data_12_V_TREADY=> layer17_out_V_data_12_V_TREADY,
    layer17_out_V_data_13_V_TVALID=> layer17_out_V_data_13_V_TVALID,
    layer17_out_V_data_13_V_TREADY=> layer17_out_V_data_13_V_TREADY,
    layer17_out_V_data_14_V_TVALID=> layer17_out_V_data_14_V_TVALID,
    layer17_out_V_data_14_V_TREADY=> layer17_out_V_data_14_V_TREADY,
    layer17_out_V_data_15_V_TVALID=> layer17_out_V_data_15_V_TVALID,
    layer17_out_V_data_15_V_TREADY=> layer17_out_V_data_15_V_TREADY,
    ap_done => ap_done,
    ap_ready => ap_ready,
    ap_idle => ap_idle); 
    
     -- Instantiate the NAND flash controller wrapper
  u_nand_flash_controller_wrapper : nand_flash_controller_wrapper
    port map (
      clk                     => ap_clk,
      reset                   => reset_onfi,
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
      buf_wr_read_data        => encoder_out,
      busy                    => busy
    );
encoder_out <= layer17_out_V_data_0_V_TDATA & layer17_out_V_data_1_V_TDATA
        & layer17_out_V_data_2_V_TDATA & layer17_out_V_data_3_V_TDATA & layer17_out_V_data_4_V_TDATA
        & layer17_out_V_data_5_V_TDATA & layer17_out_V_data_6_V_TDATA & layer17_out_V_data_7_V_TDATA
        & layer17_out_V_data_8_V_TDATA & layer17_out_V_data_9_V_TDATA & layer17_out_V_data_10_V_TDATA
        & layer17_out_V_data_11_V_TDATA & layer17_out_V_data_12_V_TDATA & layer17_out_V_data_13_V_TDATA
        & layer17_out_V_data_14_V_TDATA & layer17_out_V_data_15_V_TDATA;
end architecture behavior;
