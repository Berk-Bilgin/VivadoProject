library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
--use IEEE.STD_LOGIC_ARITH.ALL;
--use IEEE.STD_TEXTIO.ALL;
use STD.TEXTIO.ALL;

ENTITY encoder_tb IS
END encoder_tb;
ARCHITECTURE behavior OF encoder_tb IS
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
constant CLK_period : time := 10ns; 
signal input_time_series_V_data_0_V_TDATA : STD_LOGIC_VECTOR (15 downto 0);
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
signal ap_clk : STD_LOGIC;
signal ap_rst_n : STD_LOGIC := '0';
signal input_time_series_V_data_0_V_TVALID : STD_LOGIC := '0';
signal input_time_series_V_data_0_V_TREADY : STD_LOGIC;
signal ap_start : STD_LOGIC := '0';
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
signal ap_done :  STD_LOGIC;
signal ap_ready : STD_LOGIC;
signal ap_idle :  STD_LOGIC;


-- File declaration
file data_file : text open read_mode is "output.txt";
file output_file : text open write_mode is "encoded_data.txt";

BEGIN
uut: Encoder PORT MAP (
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
   -- Process to read data from the file
inputData: process(ap_clk)
variable line_in : line;
variable int_val : integer;
variable slv_val : std_logic_vector(15 downto 0);
variable count : integer := 0;
variable line_out : line;
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
    if layer17_out_V_data_15_V_TVALID = '1' then
        int_val := to_integer(signed(layer17_out_V_data_0_V_TDATA));
        write(line_out, int_val);
        writeline(output_file, line_out);
        int_val := to_integer(signed(layer17_out_V_data_1_V_TDATA));
        write(line_out, int_val);
        writeline(output_file, line_out);
        int_val := to_integer(signed(layer17_out_V_data_2_V_TDATA));
        write(line_out, int_val);
        writeline(output_file, line_out);
        int_val := to_integer(signed(layer17_out_V_data_3_V_TDATA));
        write(line_out, int_val);
        writeline(output_file, line_out);
        int_val := to_integer(signed(layer17_out_V_data_4_V_TDATA));
        write(line_out, int_val);
        writeline(output_file, line_out);
        int_val := to_integer(signed(layer17_out_V_data_5_V_TDATA));
        write(line_out, int_val);
        writeline(output_file, line_out);
        int_val := to_integer(signed(layer17_out_V_data_6_V_TDATA));
        write(line_out, int_val);
        writeline(output_file, line_out);
        int_val := to_integer(signed(layer17_out_V_data_7_V_TDATA));
        write(line_out, int_val);
        writeline(output_file, line_out);
        int_val := to_integer(signed(layer17_out_V_data_8_V_TDATA));
        write(line_out, int_val);
        writeline(output_file, line_out);
        int_val := to_integer(signed(layer17_out_V_data_9_V_TDATA));
        write(line_out, int_val);
        writeline(output_file, line_out);
        int_val := to_integer(signed(layer17_out_V_data_10_V_TDATA));
        write(line_out, int_val);
        writeline(output_file, line_out);
        int_val := to_integer(signed(layer17_out_V_data_11_V_TDATA));
        write(line_out, int_val);
        writeline(output_file, line_out);
        int_val := to_integer(signed(layer17_out_V_data_12_V_TDATA));
        write(line_out, int_val);
        writeline(output_file, line_out);
        int_val := to_integer(signed(layer17_out_V_data_13_V_TDATA));
        write(line_out, int_val);
        writeline(output_file, line_out);
        int_val := to_integer(signed(layer17_out_V_data_14_V_TDATA));
        write(line_out, int_val);
        writeline(output_file, line_out);
        int_val := to_integer(signed(layer17_out_V_data_15_V_TDATA));
        write(line_out, int_val);
        writeline(output_file, line_out);
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
    wait for 10ns;
    --wait until ap_ready = '1';
    --ap_start <= '1';
    wait for 5ns;
    --ap_start <= '0';
    wait;
end process rst_start;

end architecture behavior;