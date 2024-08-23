library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
--use IEEE.STD_LOGIC_ARITH.ALL;
--use IEEE.STD_TEXTIO.ALL;
use STD.TEXTIO.ALL;

ENTITY test1_tb IS
END test1_tb;

architecture behaviour of test1_tb is
COMPONENT top_wrapper 
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
end component;

constant CLK_period : time := 10ns; 
--encoder signals
signal input_time_series_V_data_0_V_TDATA : STD_LOGIC_VECTOR (15 downto 0);
signal ap_clk : STD_LOGIC;
signal ap_rst_n : STD_LOGIC := '0';
signal input_time_series_V_data_0_V_TVALID : STD_LOGIC := '0';
signal input_time_series_V_data_0_V_TREADY : STD_LOGIC;
signal ap_start : STD_LOGIC := '0';
signal ap_done :  STD_LOGIC;
signal ap_ready : STD_LOGIC;
signal ap_idle :  STD_LOGIC;

-- ONFI signals
--signal clk                  : std_logic := '0';
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
signal encoded_data_valid : std_logic;
signal reset_onfi : std_logic;
signal busy                 : std_logic;
signal ready_for_encoded : std_logic;
-- File declaration
file data_file : text open read_mode is "output.txt";
BEGIN
ready_for_encoded <= not(busy);
uut: top_wrapper PORT MAP (
    input_time_series_V_data_0_V_TDATA => input_time_series_V_data_0_V_TDATA,
    ap_clk => ap_clk,
    ap_rst_n => ap_rst_n,
    input_time_series_V_data_0_V_TVALID => input_time_series_V_data_0_V_TVALID,
    input_time_series_V_data_0_V_TREADY => input_time_series_V_data_0_V_TREADY,
    ap_start => ap_start,
    encoded_data_valid => encoded_data_valid,
    ap_done => ap_done,
    ap_ready => ap_ready,
    ap_idle => ap_idle,
    --ONFI ports
    reset_onfi                   => reset_onfi,
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
    busy                    => busy);
      
inputData: process(ap_clk)
variable line_in : line;
variable int_val : integer;
variable slv_val : std_logic_vector(15 downto 0);
variable count : integer := 0;
variable init_slv_val : std_logic_vector(15 downto 0);
begin
--assert not(count = 63) severity ERROR;
if rising_edge(ap_clk) then
    ap_start <= '1';
    input_time_series_V_data_0_V_TVALID <= '0';
    if count = 0 and ap_idle = '0' and not(endfile(data_file)) then
        readline(data_file, line_in); -- Read a line from the file
        read(line_in, int_val);       -- Convert the line to an integer
        count := count + 1;
        slv_val := std_logic_vector(to_signed(int_val, 16));
    end if;
    if ap_idle = '0' and count < 65 then
        input_time_series_V_data_0_V_TDATA <= slv_val;
        input_time_series_V_data_0_V_TVALID <= '1';
    elsif ap_idle = '0' and count = 65 and ap_ready ='1' and not(endfile(data_file)) then
        count := 0;
    end if;
    if endfile(data_file) and count = 65 then
        ap_start <= '0';
        report "Just Kidding.   Test Done."  severity failure ;
    end if;   
end if;
if falling_edge(ap_clk) then
    if input_time_series_V_data_0_V_TREADY = '1' and count < 65 and count>0 then
        if count<64 then
            readline(data_file, line_in); -- Read a line from the file
            read(line_in, int_val);       -- Convert the line to an integer
            -- Convert integer to std_logic_vector
            slv_val := std_logic_vector(to_signed(int_val, 16));
        end if;
        count := count + 1;
    end if;
    if encoded_data_valid = '1' and busy = '0' then
         -- Issue a write command
        cpu_if_command       <= x"80";  -- Write command
        cpu_if_command_valid <= '1';
        cpu_if_address       <= "0000000000010000000000000000000000000000"; -- Example address
        cpu_if_address_bytes <= "00101";  -- Address is 5 bytes
        cpu_if_data_bytes    <= "0000000000000000000000000000000001000000"; -- Data is 32 bytes
        cpu_if_data_rw       <= '0';  -- Write operation
        cpu_if_access_request<= '1';
    elsif cpu_if_access_complete = '1' then
        cpu_if_command_valid <= '0';
        cpu_if_access_request<= '0';
    end if;
end if;
end process inputData;

CLK_process :process
begin
ap_clk <= '0';
wait for CLK_period/2;
ap_clk <= '1';
wait for CLK_period/2;
end process CLK_process;

rst_start: process
begin
    wait for 10ns;
    ap_rst_n <= '1';
    reset_onfi <= '1';
    wait for 30 ns;
    reset_onfi <= '0';
    wait;
end process rst_start;

end behaviour;