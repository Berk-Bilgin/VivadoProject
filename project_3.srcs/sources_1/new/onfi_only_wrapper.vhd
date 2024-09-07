
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VComponents.all;

entity onfi_only_wrapper is
Port ( 
    --data in
    input_time_series_V_data_0_V_TDATA : IN STD_LOGIC_VECTOR (15 downto 0);
    ap_clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    ready : out std_logic;
    input_time_series_V_data_0_V_TVALID : IN STD_LOGIC;
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
end onfi_only_wrapper;

architecture Behavioral of onfi_only_wrapper is
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
signal IO_I                 : std_logic_vector(7 downto 0) := (others => '0');
signal IO_O                 : std_logic_vector(7 downto 0);
signal IO_OE                : std_logic;
signal IO_internal : std_logic_vector(7 downto 0);
signal IO_buf      : std_logic_vector(7 downto 0);
signal buf_wr_read_data : std_logic_vector(255 downto 0);
--signal int_busy : std_logic := '0';
begin
onfi_controller: nand_flash_controller_wrapper
  port map(
    clk                    => ap_clk,
    reset                  => rst,
                           
    CE_N                   => CE_N,
    WE_N                   => WE_N,                  
    RE_N                   => RE_N,                  
    CLE                    => CLE,                   
    ALE                    => ALE,                   
    IO_I                   => IO_I,                  
    IO_O                   => IO_O,                  
    IO_OE                  => IO_OE,                 
    WP_N                   => WP_N,                  
    RB_N                   => RB_N,                  
                           
    cpu_if_command         => cpu_if_command,         
    cpu_if_command_valid   => cpu_if_command_valid,   
    cpu_if_address         => cpu_if_address,         
    cpu_if_address_bytes   => cpu_if_address_bytes,   
    cpu_if_data_bytes      => cpu_if_data_bytes,      
    cpu_if_data_rw         => cpu_if_data_rw,         
    cpu_if_data_wp         => cpu_if_data_wp,         
    cpu_if_access_request  => cpu_if_access_request,  
    cpu_if_access_complete => cpu_if_access_complete, 
    cpu_if_access_ready    => cpu_if_access_ready,    

    buf_rd_write           => buf_rd_write,           
    buf_rd_address         => buf_rd_address,         
    buf_rd_write_data      => buf_rd_write_data,      
    buf_wr_address         => buf_wr_address,         
    buf_wr_read_data       => buf_wr_read_data,                        
    busy                   => busy                    
  );                                            
ready <= not(busy);                            
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

inputData: process(ap_clk, rst)
variable count1 : integer := 0;
begin
    if rst = '1' then
        count1 := 0;
        buf_wr_read_data <= (others => '0'); -- Reset the signal
    elsif rising_edge(ap_clk) then
        if count1 < 16 and input_time_series_V_data_0_V_TVALID = '1' and busy = '0' then
            buf_wr_read_data((255 - count1 * 16) downto (240 - count1 * 16)) <= input_time_series_V_data_0_V_TDATA;
            count1 := count1 + 1;
        end if;
        if count1 = 16 and busy = '0' then
        -- Issue a write command
            cpu_if_command       <= x"80";  -- Write command
            cpu_if_command_valid <= '1';
            cpu_if_address       <= "0000000000010000000000000000000000000000"; -- Example address
            cpu_if_address_bytes <= "00101";  -- Address is 5 bytes
            cpu_if_data_bytes    <= "0000000000000000000000000000000001000000"; -- Data is 32 bytes
            cpu_if_data_rw       <= '0';  -- Write operation
            cpu_if_access_request<= '1';
        end if;
        if cpu_if_access_complete = '1' then
            count1 := 0;
            buf_wr_read_data <= (others => '0'); -- Reset the signal
            cpu_if_command_valid <= '0';
            cpu_if_access_request<= '0';
        end if;
    end if;
end process inputData;
end Behavioral;
