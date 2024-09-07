
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
library UNISIM;
use UNISIM.VComponents.all;
Library xpm;
use xpm.vcomponents.all;
entity top_top_wrapper is
Port (
    --Encoder ports
    data_in : IN STD_LOGIC_VECTOR (15 downto 0);
    data_clk : in std_logic;
    ap_clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    data_in_valid : IN STD_LOGIC;
    --ONFI ports
    CE_N                    : out std_logic;
    WE_N                    : out std_logic;
    RE_N                    : out std_logic;
    CLE                     : out std_logic;
    ALE                     : out std_logic;
    IO                      : inout std_logic_vector (7 downto 0);
    WP_N                    : out std_logic;
    RB_N                    : in  std_logic
    );
end top_top_wrapper;

architecture Behavioral of top_top_wrapper is
Component top_wrapper
generic (
    DATA_WIDTH : integer := 256;
    ADDR_WIDTH : integer := 40;
    CMND_WIDTH : integer := 8;
    BYTE_PER_PAGE : integer := 2112;
    PAGE_PER_BLOCK : integer := 64;
    BLOCK_SIZE : integer := 4096
  );
PORT(
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
    busy                    : out std_logic);
end component;
signal ap_start : STD_LOGIC := '0';
signal ap_done :  STD_LOGIC;
signal ap_ready : STD_LOGIC;
signal ap_idle :  STD_LOGIC;
signal encoded_data_valid : std_logic;
signal ap_rst_n : std_logic;
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
signal busy : std_logic;
signal input_time_series_V_data_0_V_TREADY : STD_LOGIC;
signal IO_I                 : std_logic_vector(7 downto 0) := (others => '0');
signal IO_O                 : std_logic_vector(7 downto 0);
signal IO_OE                : std_logic;
signal IO_internal : std_logic_vector(7 downto 0);
signal IO_buf      : std_logic_vector(7 downto 0);
signal almost_empty : std_logic;
signal almost_full : std_logic;
signal data_valid : std_logic;
signal dbiterr : std_logic;
signal dout : std_logic_vector(15 downto 0);
signal empty : std_logic;
signal full : std_logic;
signal overflow : std_logic;
signal prog_empty : std_logic;
signal prog_full : std_logic;
signal rd_data_count : std_logic_vector(5 downto 0);
signal rd_rst_busy : std_logic;
signal sbiterr : std_logic;
signal underflow : std_logic;
signal wr_ack : std_logic;
signal wr_data_count : std_logic_vector(5 downto 0);
signal wr_rst_busy : std_logic;
signal injectdbiterr : std_logic;
signal injectsbiterr : std_logic;
signal sleep : std_logic := '0';



begin


-- xpm_fifo_async: Asynchronous FIFO
-- Xilinx Parameterized Macro, version 2020.1
xpm_fifo_async_inst : xpm_fifo_async
generic map (
 CDC_SYNC_STAGES => 2, -- DECIMAL
 DOUT_RESET_VALUE => "0", -- String
 ECC_MODE => "no_ecc", -- String
 FIFO_MEMORY_TYPE => "auto", -- String
 FIFO_READ_LATENCY => 1, -- DECIMAL
 FIFO_WRITE_DEPTH => 64, -- DECIMAL
 FULL_RESET_VALUE => 0, -- DECIMAL
 PROG_EMPTY_THRESH => 10, -- DECIMAL
 PROG_FULL_THRESH => 10, -- DECIMAL
 RD_DATA_COUNT_WIDTH => 6, -- DECIMAL
 READ_DATA_WIDTH => 16, -- DECIMAL
 READ_MODE => "std", -- String
 RELATED_CLOCKS => 0, -- DECIMAL
 SIM_ASSERT_CHK => 0, -- DECIMAL; 0=disable simulation messages, 1=enable simulation messages
 USE_ADV_FEATURES => "0707", -- String
 WAKEUP_TIME => 0, -- DECIMAL
 WRITE_DATA_WIDTH => 16, -- DECIMAL
 WR_DATA_COUNT_WIDTH => 6 -- DECIMAL
)
port map (
 almost_empty => almost_empty, -- 1-bit output: Almost Empty : When asserted, this signal indicates that
 -- only one more read can be performed before the FIFO goes to empty.
 almost_full => almost_full, -- 1-bit output: Almost Full: When asserted, this signal indicates that
 -- only one more write can be performed before the FIFO is full.
 data_valid => data_valid, -- 1-bit output: Read Data Valid: When asserted, this signal indicates
 -- that valid data is available on the output bus (dout).
 dbiterr => dbiterr, -- 1-bit output: Double Bit Error: Indicates that the ECC decoder
 -- detected a double-bit error and data in the FIFO core is corrupted.
dout => dout, -- READ_DATA_WIDTH-bit output: Read Data: The output data bus is driven
 -- when reading the FIFO.
 empty => empty, -- 1-bit output: Empty Flag: When asserted, this signal indicates that
 -- the FIFO is empty. Read requests are ignored when the FIFO is empty,
 -- initiating a read while empty is not destructive to the FIFO.
 full => full, -- 1-bit output: Full Flag: When asserted, this signal indicates that the
 -- FIFO is full. Write requests are ignored when the FIFO is full,
 -- initiating a write when the FIFO is full is not destructive to the
 -- contents of the FIFO.
 overflow => overflow, -- 1-bit output: Overflow: This signal indicates that a write request
 -- (wren) during the prior clock cycle was rejected, because the FIFO is
 -- full. Overflowing the FIFO is not destructive to the contents of the
 -- FIFO.
 prog_empty => prog_empty, -- 1-bit output: Programmable Empty: This signal is asserted when the
 -- number of words in the FIFO is less than or equal to the programmable
 -- empty threshold value. It is de-asserted when the number of words in
 -- the FIFO exceeds the programmable empty threshold value.
 prog_full => prog_full, -- 1-bit output: Programmable Full: This signal is asserted when the
 -- number of words in the FIFO is greater than or equal to the
 -- programmable full threshold value. It is de-asserted when the number
 -- of words in the FIFO is less than the programmable full threshold
 -- value.
 rd_data_count => rd_data_count, -- RD_DATA_COUNT_WIDTH-bit output: Read Data Count: This bus indicates
 -- the number of words read from the FIFO.
 rd_rst_busy => rd_rst_busy, -- 1-bit output: Read Reset Busy: Active-High indicator that the FIFO
 -- read domain is currently in a reset state.
 sbiterr => sbiterr, -- 1-bit output: Single Bit Error: Indicates that the ECC decoder
 -- detected and fixed a single-bit error.
 underflow => underflow, -- 1-bit output: Underflow: Indicates that the read request (rd_en)
 -- during the previous clock cycle was rejected because the FIFO is
 -- empty. Under flowing the FIFO is not destructive to the FIFO.
 wr_ack => wr_ack, -- 1-bit output: Write Acknowledge: This signal indicates that a write
 -- request (wr_en) during the prior clock cycle is succeeded.
 wr_data_count => wr_data_count, -- WR_DATA_COUNT_WIDTH-bit output: Write Data Count: This bus indicates
 -- the number of words written into the FIFO.
 wr_rst_busy => wr_rst_busy, -- 1-bit output: Write Reset Busy: Active-High indicator that the FIFO
 -- write domain is currently in a reset state.
 din => data_in, -- WRITE_DATA_WIDTH-bit input: Write Data: The input data bus used when
 -- writing the FIFO.
 injectdbiterr => injectdbiterr, -- 1-bit input: Double Bit Error Injection: Injects a double bit error if
 -- the ECC feature is used on block RAMs or UltraRAM macros.
 injectsbiterr => injectsbiterr, -- 1-bit input: Single Bit Error Injection: Injects a single bit error if
 -- the ECC feature is used on block RAMs or UltraRAM macros.
 rd_clk => ap_clk, -- 1-bit input: Read clock: Used for read operation. rd_clk must be a
 -- free running clock.
 rd_en => input_time_series_V_data_0_V_TREADY, -- 1-bit input: Read Enable: If the FIFO is not empty, asserting this
 -- signal causes data (on dout) to be read from the FIFO. Must be held
 -- active-low when rd_rst_busy is active high.
 rst => rst, -- 1-bit input: Reset: Must be synchronous to wr_clk. The clock(s) can be
 -- unstable at the time of applying reset, but reset must be released
 -- only after the clock(s) is/are stable.
 sleep => sleep, -- 1-bit input: Dynamic power saving: If sleep is High, the memory/fifo
 -- block is in power saving mode.
 wr_clk => data_clk, -- 1-bit input: Write clock: Used for write operation. wr_clk must be a
 -- free running clock.
 wr_en => data_in_valid -- 1-bit input: Write Enable: If the FIFO is not full, asserting this
 -- signal causes data (on din) to be written to the FIFO. Must be held
  -- active-low when rst or wr_rst_busy is active high.
);
-- End of xpm_fifo_async_inst instantiation

-- Output buffer instantiation
gen_obuf: for i in 0 to 7 generate
    OBUF_inst: OBUF
    port map (
        I => IO_O(i),
        O => IO_buf(i)
    );
end generate;

-- Input buffer instantiation
gen_ibuf: for i in 0 to 7 generate
    IBUF_inst: IBUF
    port map (
        I => IO_buf(i),
        O => IO_internal(i)
    );
end generate;

-- Bidirectional logic
IO <= IO_buf when IO_OE = '1' else
       (others => 'Z');

process(IO_OE, IO_internal)
begin
    if IO_OE = '0' then
        IO_I <= IO_internal;
    end if;
end process;
ap_rst_n <= not(rst);
u_top_wrapper: top_wrapper Port map(
    input_time_series_V_data_0_V_TDATA => dout,
    ap_clk => ap_clk,
    ap_rst_n => ap_rst_n,
    input_time_series_V_data_0_V_TVALID => data_valid,
    input_time_series_V_data_0_V_TREADY => input_time_series_V_data_0_V_TREADY,
    ap_start => ap_start,
    ap_done  => ap_done,
    ap_ready => ap_ready,
    ap_idle => ap_idle,
    encoded_data_valid => encoded_data_valid,
    reset_onfi => rst,           
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
    busy                    => busy );
    
inputData: process(ap_clk, rst)
variable count : integer := 0;
begin
if rst = '1' then
    ap_start <= '0';
elsif rising_edge(ap_clk) then
    if count = 0 and ap_idle = '0' and data_valid = '1' then
        ap_start <= '1';
        count := count + 1;
    end if;
    if ap_idle = '0' and count = 65 and ap_ready ='1' then
        count := 0;
    end if;
end if;
if falling_edge(ap_clk) then
    if input_time_series_V_data_0_V_TREADY = '1' and count < 65 and count>0 then
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
end Behavioral;
