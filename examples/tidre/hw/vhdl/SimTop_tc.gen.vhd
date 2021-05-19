-- Copyright 2018-2019 Delft University of Technology
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--     http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_misc.all;

library work;
use work.Interconnect_pkg.all;
use work.UtilStr_pkg.all;
use work.UtilConv_pkg.all;

entity SimTop_tc is
  generic (
    -- Accelerator properties
    INDEX_WIDTH                 : natural := 32;
    TAG_WIDTH                   : natural := 1;

    -- Host bus properties
    BUS_ADDR_WIDTH              : natural := 64;
    BUS_DATA_WIDTH              : natural := 512;
    BUS_LEN_WIDTH               : natural := 8;
    BUS_BURST_MAX_LEN           : natural := 64;
    BUS_BURST_STEP_LEN          : natural := 1
  );
end SimTop_tc;

architecture Behavorial of SimTop_tc is

  -----------------------------------------------------------------------------
  -- Default wrapper component.
  -----------------------------------------------------------------------------
    component Kernel_Mantle is
    generic (
      INDEX_WIDTH        : integer := 32;
      TAG_WIDTH          : integer := 1;
      BUS_ADDR_WIDTH     : integer := 64;
      BUS_DATA_WIDTH     : integer := 512;
      BUS_LEN_WIDTH      : integer := 8;
      BUS_BURST_STEP_LEN : integer := 1;
      BUS_BURST_MAX_LEN  : integer := 16
    );
    port (
      bcd_clk            : in  std_logic;
      bcd_reset          : in  std_logic;
      kcd_clk            : in  std_logic;
      kcd_reset          : in  std_logic;
      mmio_awvalid       : in  std_logic;
      mmio_awready       : out std_logic;
      mmio_awaddr        : in  std_logic_vector(31 downto 0);
      mmio_wvalid        : in  std_logic;
      mmio_wready        : out std_logic;
      mmio_wdata         : in  std_logic_vector(31 downto 0);
      mmio_wstrb         : in  std_logic_vector(3 downto 0);
      mmio_bvalid        : out std_logic;
      mmio_bready        : in  std_logic;
      mmio_bresp         : out std_logic_vector(1 downto 0);
      mmio_arvalid       : in  std_logic;
      mmio_arready       : out std_logic;
      mmio_araddr        : in  std_logic_vector(31 downto 0);
      mmio_rvalid        : out std_logic;
      mmio_rready        : in  std_logic;
      mmio_rdata         : out std_logic_vector(31 downto 0);
      mmio_rresp         : out std_logic_vector(1 downto 0);
      rd_mst_rreq_valid  : out std_logic;
      rd_mst_rreq_ready  : in  std_logic;
      rd_mst_rreq_addr   : out std_logic_vector(BUS_ADDR_WIDTH-1 downto 0);
      rd_mst_rreq_len    : out std_logic_vector(BUS_LEN_WIDTH-1 downto 0);
      rd_mst_rdat_valid  : in  std_logic;
      rd_mst_rdat_ready  : out std_logic;
      rd_mst_rdat_data   : in  std_logic_vector(BUS_DATA_WIDTH-1 downto 0);
      rd_mst_rdat_last   : in  std_logic;
      wr_mst_wreq_valid  : out std_logic;
      wr_mst_wreq_ready  : in  std_logic;
      wr_mst_wreq_addr   : out std_logic_vector(BUS_ADDR_WIDTH-1 downto 0);
      wr_mst_wreq_len    : out std_logic_vector(BUS_LEN_WIDTH-1 downto 0);
      wr_mst_wreq_last   : out std_logic;
      wr_mst_wdat_valid  : out std_logic;
      wr_mst_wdat_ready  : in  std_logic;
      wr_mst_wdat_data   : out std_logic_vector(BUS_DATA_WIDTH-1 downto 0);
      wr_mst_wdat_strobe : out std_logic_vector(BUS_DATA_WIDTH/8-1 downto 0);
      wr_mst_wdat_last   : out std_logic;
      wr_mst_wrep_valid  : in  std_logic;
      wr_mst_wrep_ready  : out std_logic;
      wr_mst_wrep_ok     : in  std_logic
    );
  end component;
  -----------------------------------------------------------------------------

  -- Fletcher defaults
  constant REG_CONTROL          : natural := 0;
  constant REG_STATUS           : natural := 1;
  constant REG_RETURN0          : natural := 2;
  constant REG_RETURN1          : natural := 3;

  constant CONTROL_CLEAR        : std_logic_vector(31 downto 0) := X"00000000";
  constant CONTROL_START        : std_logic_vector(31 downto 0) := X"00000001";
  constant CONTROL_STOP         : std_logic_vector(31 downto 0) := X"00000002";
  constant CONTROL_RESET        : std_logic_vector(31 downto 0) := X"00000004";

  constant STATUS_IDLE          : std_logic_vector(31 downto 0) := X"00000001";
  constant STATUS_BUSY          : std_logic_vector(31 downto 0) := X"00000002";
  constant STATUS_DONE          : std_logic_vector(31 downto 0) := X"00000004";

  -- Sim signals
  signal clock_stop             : boolean := false;

  -- Accelerator signals
  signal kcd_clk                : std_logic;
  signal kcd_reset              : std_logic;

  -- Fletcher bus signals
  signal bcd_clk                : std_logic;
  signal bcd_reset              : std_logic;

  -- External signals

  -- MMIO signals
  signal mmio_awvalid           : std_logic := '0';
  signal mmio_awready           : std_logic := '0';
  signal mmio_awaddr            : std_logic_vector(32-1 downto 0);
  signal mmio_wvalid            : std_logic := '0';
  signal mmio_wready            : std_logic := '0';
  signal mmio_wdata             : std_logic_vector(32-1 downto 0);
  signal mmio_wstrb             : std_logic_vector(32/8-1 downto 0);
  signal mmio_bvalid            : std_logic := '0';
  signal mmio_bready            : std_logic := '0';
  signal mmio_bresp             : std_logic_vector(1 downto 0);
  signal mmio_arvalid           : std_logic := '0';
  signal mmio_arready           : std_logic := '0';
  signal mmio_araddr            : std_logic_vector(32-1 downto 0);
  signal mmio_rvalid            : std_logic := '0';
  signal mmio_rready            : std_logic := '0';
  signal mmio_rdata             : std_logic_vector(32-1 downto 0);
  signal mmio_rresp             : std_logic_vector(1 downto 0);

  -- Mmio signals to source in mmio procedures.
  type mmio_source_t is record
    awvalid           : std_logic;
    awaddr            : std_logic_vector(32-1 downto 0);
    wvalid            : std_logic;
    wdata             : std_logic_vector(32-1 downto 0);
    wstrb             : std_logic_vector(32/8-1 downto 0);
    bready            : std_logic;

    arvalid           : std_logic;
    araddr            : std_logic_vector(32-1 downto 0);
    rready            : std_logic;
  end record;

  -- Mmio signals to sink in mmio procedures
  type mmio_sink_t is record
    wready            : std_logic;

    awready           : std_logic;

    bvalid            : std_logic;
    bresp             : std_logic_vector(1 downto 0);

    arready           : std_logic;

    rvalid            : std_logic;
    rdata             : std_logic_vector(32-1 downto 0);
    rresp             : std_logic_vector(1 downto 0);
  end record;

  signal mmio_source : mmio_source_t;
  signal mmio_sink : mmio_sink_t;

  -- Memory interface signals
  signal bus_rreq_addr          : std_logic_vector(BUS_ADDR_WIDTH-1 downto 0);
  signal bus_rreq_len           : std_logic_vector(BUS_LEN_WIDTH-1 downto 0);
  signal bus_rreq_valid         : std_logic;
  signal bus_rreq_ready         : std_logic;
  signal bus_rdat_data          : std_logic_vector(BUS_DATA_WIDTH-1 downto 0);
  signal bus_rdat_last          : std_logic;
  signal bus_rdat_valid         : std_logic;
  signal bus_rdat_ready         : std_logic;
  signal bus_wreq_addr          : std_logic_vector(BUS_ADDR_WIDTH-1 downto 0);
  signal bus_wreq_last          : std_logic;
  signal bus_wreq_len           : std_logic_vector(BUS_LEN_WIDTH-1 downto 0);
  signal bus_wreq_valid         : std_logic;
  signal bus_wreq_ready         : std_logic;
  signal bus_wdat_data          : std_logic_vector(BUS_DATA_WIDTH-1 downto 0);
  signal bus_wdat_strobe        : std_logic_vector(BUS_DATA_WIDTH/8-1 downto 0);
  signal bus_wdat_last          : std_logic;
  signal bus_wdat_valid         : std_logic;
  signal bus_wdat_ready         : std_logic;
  signal bus_wrep_ok            : std_logic;
  signal bus_wrep_valid         : std_logic;
  signal bus_wrep_ready         : std_logic;

  procedure mmio_write32 (constant idx    : in  natural;
                          constant data   : in  std_logic_vector(31 downto 0);
                          signal   source : out mmio_source_t;
                          signal   sink   : in  mmio_sink_t;
                          signal   clk    : in  std_logic;
                          signal   reset  : in  std_logic)
  is
  begin
    -- Wait for reset
    loop
      exit when reset = '0';
      wait until rising_edge(clk);
    end loop;
    -- Address write channel
    source.awaddr <= slv(16 + (32/8)*idx, 32);
    source.awvalid <= '1';
    loop
      wait until rising_edge(clk);
      exit when sink.awready = '1';
    end loop;
    source.awvalid <= '0';
    source.awaddr <= (others => 'U');
    -- Write channel
    source.wdata <= data;
    source.wstrb <= X"F";
    source.wvalid <= '1';
    loop
      wait until rising_edge(clk);
      exit when sink.wready = '1';
    end loop;
    source.wvalid <= '0';
    source.wdata <= (others => 'U');
    source.wstrb <= (others => 'U');
    -- Write response channel.
    source.bready <= '1';
    loop
      wait until rising_edge(clk);
      exit when sink.bvalid = '1';
    end loop;
    source.bready <= '0';
  end procedure;

  procedure mmio_read32(constant idx    : in  natural;
                        variable data   : out std_logic_vector(31 downto 0);
                        signal   source : out mmio_source_t;
                        signal   sink   : in  mmio_sink_t;
                        signal   clk    : in  std_logic;
                        signal   reset  : in  std_logic)
  is
  begin
    -- Wait for reset
    loop
      exit when reset = '0';
      wait until rising_edge(clk);
    end loop;
    -- Address read channel
    source.araddr <= slv(16 + (32/8)*idx, 32);
    source.arvalid <= '1';
    loop
      wait until rising_edge(clk);
      exit when sink.arready = '1';
    end loop;
    source.arvalid <= '0';
    source.araddr <= (others => 'U');
    -- Read channel
    loop
      source.rready <= '1';
      wait until rising_edge(clk);
      if sink.rvalid = '1' then
        data := sink.rdata;
        exit;
      end if;
    end loop;
    source.rready <= '0';
  end procedure;


begin

  -- Connect to records for easier readibility downstream.
  mmio_awvalid <= mmio_source.awvalid;
  mmio_awaddr  <= mmio_source.awaddr;
  mmio_wvalid  <= mmio_source.wvalid;
  mmio_wdata   <= mmio_source.wdata;
  mmio_wstrb   <= mmio_source.wstrb;
  mmio_bready  <= mmio_source.bready;
  mmio_arvalid <= mmio_source.arvalid;
  mmio_araddr  <= mmio_source.araddr;
  mmio_rready  <= mmio_source.rready;

  mmio_sink.wready  <= mmio_wready;
  mmio_sink.awready <= mmio_awready;
  mmio_sink.bvalid  <= mmio_bvalid;
  mmio_sink.bresp   <= mmio_bresp;
  mmio_sink.arready <= mmio_arready;
  mmio_sink.rvalid  <= mmio_rvalid;
  mmio_sink.rdata   <= mmio_rdata;
  mmio_sink.rresp   <= mmio_rresp;


  -- Typical stimuli process:
  stimuli_proc : process is
    variable read_data        : std_logic_vector(31 downto 0) := X"DEADBEEF";
    variable read_data_masked : std_logic_vector(31 downto 0);
  begin
    mmio_source.awvalid <= '0';
    mmio_source.wvalid  <= '0';
    mmio_source.bready  <= '0';

    mmio_source.arvalid <= '0';
    mmio_source.rready  <= '0';

    wait until kcd_reset = '1' and bcd_reset = '1';

    -- 1. Reset the user core
    mmio_write32(REG_CONTROL, CONTROL_RESET, mmio_source, mmio_sink, bcd_clk, bcd_reset);

    -- 2. Write addresses of the arrow buffers in the SREC file.
    mmio_write32(68, X"00000000", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch000 in_offsets buffer address.
    mmio_write32(69, X"00000000", mmio_source, mmio_sink, bcd_clk, bcd_reset);
    mmio_write32(70, X"00000100", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch000 in_values buffer address.
    mmio_write32(71, X"00000000", mmio_source, mmio_sink, bcd_clk, bcd_reset);
    mmio_write32(72, X"00001500", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch001 in_offsets buffer address.
    mmio_write32(73, X"00000000", mmio_source, mmio_sink, bcd_clk, bcd_reset);
    mmio_write32(74, X"00001600", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch001 in_values buffer address.
    mmio_write32(75, X"00000000", mmio_source, mmio_sink, bcd_clk, bcd_reset);
    mmio_write32(76, X"00002a00", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch002 in_offsets buffer address.
    mmio_write32(77, X"00000000", mmio_source, mmio_sink, bcd_clk, bcd_reset);
    mmio_write32(78, X"00002b00", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch002 in_values buffer address.
    mmio_write32(79, X"00000000", mmio_source, mmio_sink, bcd_clk, bcd_reset);
    mmio_write32(80, X"00003ec0", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch003 in_offsets buffer address.
    mmio_write32(81, X"00000000", mmio_source, mmio_sink, bcd_clk, bcd_reset);
    mmio_write32(82, X"00003fc0", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch003 in_values buffer address.
    mmio_write32(83, X"00000000", mmio_source, mmio_sink, bcd_clk, bcd_reset);
    mmio_write32(84, X"00005380", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch004 in_offsets buffer address.
    mmio_write32(85, X"00000000", mmio_source, mmio_sink, bcd_clk, bcd_reset);
    mmio_write32(86, X"00005480", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch004 in_values buffer address.
    mmio_write32(87, X"00000000", mmio_source, mmio_sink, bcd_clk, bcd_reset);
    mmio_write32(88, X"00006880", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch005 in_offsets buffer address.
    mmio_write32(89, X"00000000", mmio_source, mmio_sink, bcd_clk, bcd_reset);
    mmio_write32(90, X"00006940", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch005 in_values buffer address.
    mmio_write32(91, X"00000000", mmio_source, mmio_sink, bcd_clk, bcd_reset);
    mmio_write32(92, X"00007d00", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch006 in_offsets buffer address.
    mmio_write32(93, X"00000000", mmio_source, mmio_sink, bcd_clk, bcd_reset);
    mmio_write32(94, X"00007e00", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch006 in_values buffer address.
    mmio_write32(95, X"00000000", mmio_source, mmio_sink, bcd_clk, bcd_reset);
    mmio_write32(96, X"00009200", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch007 in_offsets buffer address.
    mmio_write32(97, X"00000000", mmio_source, mmio_sink, bcd_clk, bcd_reset);
    mmio_write32(98, X"00009300", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch007 in_values buffer address.
    mmio_write32(99, X"00000000", mmio_source, mmio_sink, bcd_clk, bcd_reset);
    mmio_write32(100, X"0000a6c0", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch008 in_offsets buffer address.
    mmio_write32(101, X"00000000", mmio_source, mmio_sink, bcd_clk, bcd_reset);
    mmio_write32(102, X"0000a7c0", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch008 in_values buffer address.
    mmio_write32(103, X"00000000", mmio_source, mmio_sink, bcd_clk, bcd_reset);
    mmio_write32(104, X"0000bb80", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch009 in_offsets buffer address.
    mmio_write32(105, X"00000000", mmio_source, mmio_sink, bcd_clk, bcd_reset);
    mmio_write32(106, X"0000bc40", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch009 in_values buffer address.
    mmio_write32(107, X"00000000", mmio_source, mmio_sink, bcd_clk, bcd_reset);
    mmio_write32(108, X"0000d040", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch010 in_offsets buffer address.
    mmio_write32(109, X"00000000", mmio_source, mmio_sink, bcd_clk, bcd_reset);
    mmio_write32(110, X"0000d140", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch010 in_values buffer address.
    mmio_write32(111, X"00000000", mmio_source, mmio_sink, bcd_clk, bcd_reset);
    mmio_write32(112, X"0000e540", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch011 in_offsets buffer address.
    mmio_write32(113, X"00000000", mmio_source, mmio_sink, bcd_clk, bcd_reset);
    mmio_write32(114, X"0000e640", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch011 in_values buffer address.
    mmio_write32(115, X"00000000", mmio_source, mmio_sink, bcd_clk, bcd_reset);
    mmio_write32(116, X"0000fa00", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch012 in_offsets buffer address.
    mmio_write32(117, X"00000000", mmio_source, mmio_sink, bcd_clk, bcd_reset);
    mmio_write32(118, X"0000fb00", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch012 in_values buffer address.
    mmio_write32(119, X"00000000", mmio_source, mmio_sink, bcd_clk, bcd_reset);
    mmio_write32(120, X"00010ec0", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch013 in_offsets buffer address.
    mmio_write32(121, X"00000000", mmio_source, mmio_sink, bcd_clk, bcd_reset);
    mmio_write32(122, X"00010f80", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch013 in_values buffer address.
    mmio_write32(123, X"00000000", mmio_source, mmio_sink, bcd_clk, bcd_reset);
    mmio_write32(124, X"00012380", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch014 in_offsets buffer address.
    mmio_write32(125, X"00000000", mmio_source, mmio_sink, bcd_clk, bcd_reset);
    mmio_write32(126, X"00012480", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch014 in_values buffer address.
    mmio_write32(127, X"00000000", mmio_source, mmio_sink, bcd_clk, bcd_reset);
    mmio_write32(128, X"00013840", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch015 in_offsets buffer address.
    mmio_write32(129, X"00000000", mmio_source, mmio_sink, bcd_clk, bcd_reset);
    mmio_write32(130, X"00013940", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch015 in_values buffer address.
    mmio_write32(131, X"00000000", mmio_source, mmio_sink, bcd_clk, bcd_reset);
    mmio_write32(132, X"00014d80", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch000_taxi out_values buffer address.
    mmio_write32(133, X"00000000", mmio_source, mmio_sink, bcd_clk, bcd_reset);
    mmio_write32(134, X"00014e00", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch001_taxi out_values buffer address.
    mmio_write32(135, X"00000000", mmio_source, mmio_sink, bcd_clk, bcd_reset);
    mmio_write32(136, X"00014e80", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch002_taxi out_values buffer address.
    mmio_write32(137, X"00000000", mmio_source, mmio_sink, bcd_clk, bcd_reset);
    mmio_write32(138, X"00014f00", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch003_taxi out_values buffer address.
    mmio_write32(139, X"00000000", mmio_source, mmio_sink, bcd_clk, bcd_reset);
    mmio_write32(140, X"00014f80", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch004_taxi out_values buffer address.
    mmio_write32(141, X"00000000", mmio_source, mmio_sink, bcd_clk, bcd_reset);
    mmio_write32(142, X"00015000", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch005_taxi out_values buffer address.
    mmio_write32(143, X"00000000", mmio_source, mmio_sink, bcd_clk, bcd_reset);
    mmio_write32(144, X"00015080", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch006_taxi out_values buffer address.
    mmio_write32(145, X"00000000", mmio_source, mmio_sink, bcd_clk, bcd_reset);
    mmio_write32(146, X"00015140", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch007_taxi out_values buffer address.
    mmio_write32(147, X"00000000", mmio_source, mmio_sink, bcd_clk, bcd_reset);
    mmio_write32(148, X"000151c0", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch008_taxi out_values buffer address.
    mmio_write32(149, X"00000000", mmio_source, mmio_sink, bcd_clk, bcd_reset);
    mmio_write32(150, X"00015240", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch009_taxi out_values buffer address.
    mmio_write32(151, X"00000000", mmio_source, mmio_sink, bcd_clk, bcd_reset);
    mmio_write32(152, X"000152c0", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch010_taxi out_values buffer address.
    mmio_write32(153, X"00000000", mmio_source, mmio_sink, bcd_clk, bcd_reset);
    mmio_write32(154, X"00015340", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch011_taxi out_values buffer address.
    mmio_write32(155, X"00000000", mmio_source, mmio_sink, bcd_clk, bcd_reset);
    mmio_write32(156, X"000153c0", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch012_taxi out_values buffer address.
    mmio_write32(157, X"00000000", mmio_source, mmio_sink, bcd_clk, bcd_reset);
    mmio_write32(158, X"00015440", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch013_taxi out_values buffer address.
    mmio_write32(159, X"00000000", mmio_source, mmio_sink, bcd_clk, bcd_reset);
    mmio_write32(160, X"000154c0", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch014_taxi out_values buffer address.
    mmio_write32(161, X"00000000", mmio_source, mmio_sink, bcd_clk, bcd_reset);
    mmio_write32(162, X"00015540", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch015_taxi out_values buffer address.
    mmio_write32(163, X"00000000", mmio_source, mmio_sink, bcd_clk, bcd_reset);

    -- 3. Write recordbatch bounds.
    mmio_write32(4, X"00000000", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch000 first index.
    mmio_write32(5, X"00000034", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch000 last index.
    mmio_write32(6, X"00000000", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch001 first index.
    mmio_write32(7, X"00000032", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch001 last index.
    mmio_write32(8, X"00000000", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch002 first index.
    mmio_write32(9, X"00000031", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch002 last index.
    mmio_write32(10, X"00000000", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch003 first index.
    mmio_write32(11, X"00000036", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch003 last index.
    mmio_write32(12, X"00000000", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch004 first index.
    mmio_write32(13, X"00000034", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch004 last index.
    mmio_write32(14, X"00000000", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch005 first index.
    mmio_write32(15, X"0000002e", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch005 last index.
    mmio_write32(16, X"00000000", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch006 first index.
    mmio_write32(17, X"00000032", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch006 last index.
    mmio_write32(18, X"00000000", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch007 first index.
    mmio_write32(19, X"00000038", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch007 last index.
    mmio_write32(20, X"00000000", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch008 first index.
    mmio_write32(21, X"00000031", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch008 last index.
    mmio_write32(22, X"00000000", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch009 first index.
    mmio_write32(23, X"0000002d", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch009 last index.
    mmio_write32(24, X"00000000", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch010 first index.
    mmio_write32(25, X"00000036", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch010 last index.
    mmio_write32(26, X"00000000", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch011 first index.
    mmio_write32(27, X"00000034", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch011 last index.
    mmio_write32(28, X"00000000", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch012 first index.
    mmio_write32(29, X"00000037", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch012 last index.
    mmio_write32(30, X"00000000", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch013 first index.
    mmio_write32(31, X"0000002d", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch013 last index.
    mmio_write32(32, X"00000000", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch014 first index.
    mmio_write32(33, X"00000033", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch014 last index.
    mmio_write32(34, X"00000000", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch015 first index.
    mmio_write32(35, X"00000038", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch015 last index.
    mmio_write32(36, X"00000000", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch000_taxi first index.
    mmio_write32(37, X"0000001b", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch000_taxi last index.
    mmio_write32(38, X"00000000", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch001_taxi first index.
    mmio_write32(39, X"00000017", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch001_taxi last index.
    mmio_write32(40, X"00000000", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch002_taxi first index.
    mmio_write32(41, X"00000018", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch002_taxi last index.
    mmio_write32(42, X"00000000", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch003_taxi first index.
    mmio_write32(43, X"00000019", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch003_taxi last index.
    mmio_write32(44, X"00000000", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch004_taxi first index.
    mmio_write32(45, X"00000016", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch004_taxi last index.
    mmio_write32(46, X"00000000", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch005_taxi first index.
    mmio_write32(47, X"00000015", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch005_taxi last index.
    mmio_write32(48, X"00000000", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch006_taxi first index.
    mmio_write32(49, X"00000023", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch006_taxi last index.
    mmio_write32(50, X"00000000", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch007_taxi first index.
    mmio_write32(51, X"0000001e", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch007_taxi last index.
    mmio_write32(52, X"00000000", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch008_taxi first index.
    mmio_write32(53, X"00000016", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch008_taxi last index.
    mmio_write32(54, X"00000000", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch009_taxi first index.
    mmio_write32(55, X"00000014", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch009_taxi last index.
    mmio_write32(56, X"00000000", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch010_taxi first index.
    mmio_write32(57, X"0000001a", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch010_taxi last index.
    mmio_write32(58, X"00000000", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch011_taxi first index.
    mmio_write32(59, X"00000018", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch011_taxi last index.
    mmio_write32(60, X"00000000", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch012_taxi first index.
    mmio_write32(61, X"00000018", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch012_taxi last index.
    mmio_write32(62, X"00000000", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch013_taxi first index.
    mmio_write32(63, X"00000018", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch013_taxi last index.
    mmio_write32(64, X"00000000", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch014_taxi first index.
    mmio_write32(65, X"0000001a", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch014_taxi last index.
    mmio_write32(66, X"00000000", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch015_taxi first index.
    mmio_write32(67, X"00000018", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- rematch015_taxi last index.

    -- 4. Write any kernel-specific registers.

    -- 5. Start the kernel.
    mmio_write32(200, X"00000001", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- Start profiling.
    mmio_write32(REG_CONTROL, CONTROL_START, mmio_source, mmio_sink, bcd_clk, bcd_reset);

    -- 6. Poll for completion
    loop
      -- Wait a bunch of cycles.
      for I in 0 to 8 loop
        wait until rising_edge(bcd_clk);
      end loop;

      -- Read the status register.
      mmio_read32(REG_STATUS, read_data, mmio_source, mmio_sink, bcd_clk, bcd_reset);

      -- Check if we're done.
      read_data_masked := read_data and STATUS_DONE;
      exit when read_data_masked = STATUS_DONE;
    end loop;

    mmio_write32(200, X"00000000", mmio_source, mmio_sink, bcd_clk, bcd_reset); -- Stop profiling.

    -- 7. Read return register.

    mmio_read32(168, read_data, mmio_source, mmio_sink, bcd_clk, bcd_reset);
    println("Number of matches for taxi: " & integer'image(to_integer(unsigned(read_data))));
    assert to_integer(unsigned(read_data)) = 27
        report "unexpected number of matches for taxi; expected 27"
        severity failure;

    mmio_read32(170, read_data, mmio_source, mmio_sink, bcd_clk, bcd_reset);
    println("Number of matches for taxi: " & integer'image(to_integer(unsigned(read_data))));
    assert to_integer(unsigned(read_data)) = 23
        report "unexpected number of matches for taxi; expected 23"
        severity failure;

    mmio_read32(172, read_data, mmio_source, mmio_sink, bcd_clk, bcd_reset);
    println("Number of matches for taxi: " & integer'image(to_integer(unsigned(read_data))));
    assert to_integer(unsigned(read_data)) = 24
        report "unexpected number of matches for taxi; expected 24"
        severity failure;

    mmio_read32(174, read_data, mmio_source, mmio_sink, bcd_clk, bcd_reset);
    println("Number of matches for taxi: " & integer'image(to_integer(unsigned(read_data))));
    assert to_integer(unsigned(read_data)) = 25
        report "unexpected number of matches for taxi; expected 25"
        severity failure;

    mmio_read32(176, read_data, mmio_source, mmio_sink, bcd_clk, bcd_reset);
    println("Number of matches for taxi: " & integer'image(to_integer(unsigned(read_data))));
    assert to_integer(unsigned(read_data)) = 22
        report "unexpected number of matches for taxi; expected 22"
        severity failure;

    mmio_read32(178, read_data, mmio_source, mmio_sink, bcd_clk, bcd_reset);
    println("Number of matches for taxi: " & integer'image(to_integer(unsigned(read_data))));
    assert to_integer(unsigned(read_data)) = 21
        report "unexpected number of matches for taxi; expected 21"
        severity failure;

    mmio_read32(180, read_data, mmio_source, mmio_sink, bcd_clk, bcd_reset);
    println("Number of matches for taxi: " & integer'image(to_integer(unsigned(read_data))));
    assert to_integer(unsigned(read_data)) = 35
        report "unexpected number of matches for taxi; expected 35"
        severity failure;

    mmio_read32(182, read_data, mmio_source, mmio_sink, bcd_clk, bcd_reset);
    println("Number of matches for taxi: " & integer'image(to_integer(unsigned(read_data))));
    assert to_integer(unsigned(read_data)) = 30
        report "unexpected number of matches for taxi; expected 30"
        severity failure;

    mmio_read32(184, read_data, mmio_source, mmio_sink, bcd_clk, bcd_reset);
    println("Number of matches for taxi: " & integer'image(to_integer(unsigned(read_data))));
    assert to_integer(unsigned(read_data)) = 22
        report "unexpected number of matches for taxi; expected 22"
        severity failure;

    mmio_read32(186, read_data, mmio_source, mmio_sink, bcd_clk, bcd_reset);
    println("Number of matches for taxi: " & integer'image(to_integer(unsigned(read_data))));
    assert to_integer(unsigned(read_data)) = 20
        report "unexpected number of matches for taxi; expected 20"
        severity failure;

    mmio_read32(188, read_data, mmio_source, mmio_sink, bcd_clk, bcd_reset);
    println("Number of matches for taxi: " & integer'image(to_integer(unsigned(read_data))));
    assert to_integer(unsigned(read_data)) = 26
        report "unexpected number of matches for taxi; expected 26"
        severity failure;

    mmio_read32(190, read_data, mmio_source, mmio_sink, bcd_clk, bcd_reset);
    println("Number of matches for taxi: " & integer'image(to_integer(unsigned(read_data))));
    assert to_integer(unsigned(read_data)) = 24
        report "unexpected number of matches for taxi; expected 24"
        severity failure;

    mmio_read32(192, read_data, mmio_source, mmio_sink, bcd_clk, bcd_reset);
    println("Number of matches for taxi: " & integer'image(to_integer(unsigned(read_data))));
    assert to_integer(unsigned(read_data)) = 24
        report "unexpected number of matches for taxi; expected 24"
        severity failure;

    mmio_read32(194, read_data, mmio_source, mmio_sink, bcd_clk, bcd_reset);
    println("Number of matches for taxi: " & integer'image(to_integer(unsigned(read_data))));
    assert to_integer(unsigned(read_data)) = 24
        report "unexpected number of matches for taxi; expected 24"
        severity failure;

    mmio_read32(196, read_data, mmio_source, mmio_sink, bcd_clk, bcd_reset);
    println("Number of matches for taxi: " & integer'image(to_integer(unsigned(read_data))));
    assert to_integer(unsigned(read_data)) = 26
        report "unexpected number of matches for taxi; expected 26"
        severity failure;

    mmio_read32(198, read_data, mmio_source, mmio_sink, bcd_clk, bcd_reset);
    println("Number of matches for taxi: " & integer'image(to_integer(unsigned(read_data))));
    assert to_integer(unsigned(read_data)) = 24
        report "unexpected number of matches for taxi; expected 24"
        severity failure;

    -- 8. Read profile registers.

    -- 9. Finish and stop simulation.
    report "Stimuli done.";
    clock_stop <= true;

    wait;
  end process;

  clk_proc: process is
  begin
    if not clock_stop then
      kcd_clk <= '1';
      bcd_clk <= '1';
      wait for 5 ns;
      kcd_clk <= '0';
      bcd_clk <= '0';
      wait for 5 ns;
    else
      wait;
    end if;
  end process;

  reset_proc: process is
  begin
    kcd_reset <= '1';
    bcd_reset <= '1';
    wait for 50 ns;
    wait until rising_edge(kcd_clk);
    kcd_reset <= '0';
    bcd_reset <= '0';
    wait;
  end process;

  rmem_inst: BusReadSlaveMock
  generic map (
    BUS_ADDR_WIDTH              => BUS_ADDR_WIDTH,
    BUS_LEN_WIDTH               => BUS_LEN_WIDTH,
    BUS_DATA_WIDTH              => BUS_DATA_WIDTH,
    SEED                        => 1337,
    RANDOM_REQUEST_TIMING       => false,
    RANDOM_RESPONSE_TIMING      => false,
    SREC_FILE                   => "/work/akoshadnagy/wip/fletcher-alveo/examples/tidre/hw/gen/data.srec"
  )
  port map (
    clk                         => bcd_clk,
    reset                       => bcd_reset,
    rreq_valid                  => bus_rreq_valid,
    rreq_ready                  => bus_rreq_ready,
    rreq_addr                   => bus_rreq_addr,
    rreq_len                    => bus_rreq_len,
    rdat_valid                  => bus_rdat_valid,
    rdat_ready                  => bus_rdat_ready,
    rdat_data                   => bus_rdat_data,
    rdat_last                   => bus_rdat_last
  );


  wmem_inst: BusWriteSlaveMock
  generic map (
    BUS_ADDR_WIDTH              => BUS_ADDR_WIDTH,
    BUS_LEN_WIDTH               => BUS_LEN_WIDTH,
    BUS_DATA_WIDTH              => BUS_DATA_WIDTH,
    SEED                        => 1337,
    RANDOM_REQUEST_TIMING       => false,
    RANDOM_RESPONSE_TIMING      => false,
    SREC_FILE                   => ""
  )
  port map (
    clk                         => bcd_clk,
    reset                       => bcd_reset,
    wreq_valid                  => bus_wreq_valid,
    wreq_ready                  => bus_wreq_ready,
    wreq_addr                   => bus_wreq_addr,
    wreq_len                    => bus_wreq_len,
    wreq_last                   => bus_wreq_last,
    wdat_valid                  => bus_wdat_valid,
    wdat_ready                  => bus_wdat_ready,
    wdat_data                   => bus_wdat_data,
    wdat_strobe                 => bus_wdat_strobe,
    wdat_last                   => bus_wdat_last,
    wrep_valid                  => bus_wrep_valid,
    wrep_ready                  => bus_wrep_ready,
    wrep_ok                     => bus_wrep_ok
  );


  -----------------------------------------------------------------------------
  -- Fletcher generated wrapper
  -----------------------------------------------------------------------------
  Kernel_Mantle_inst : Kernel_Mantle
    generic map (
      BUS_ADDR_WIDTH            => BUS_ADDR_WIDTH,
      BUS_DATA_WIDTH            => BUS_DATA_WIDTH,
      BUS_BURST_STEP_LEN        => BUS_BURST_STEP_LEN,
      BUS_BURST_MAX_LEN         => BUS_ADDR_WIDTH,
      BUS_LEN_WIDTH             => BUS_LEN_WIDTH,
      INDEX_WIDTH               => INDEX_WIDTH,
      TAG_WIDTH                 => TAG_WIDTH
    )
    port map (
      kcd_clk                   => kcd_clk,
      kcd_reset                 => kcd_reset,
      bcd_clk                   => bcd_clk,
      bcd_reset                 => bcd_reset,

      rd_mst_rreq_valid         => bus_rreq_valid,
      rd_mst_rreq_ready         => bus_rreq_ready,
      rd_mst_rreq_addr          => bus_rreq_addr,
      rd_mst_rreq_len           => bus_rreq_len,
      rd_mst_rdat_valid         => bus_rdat_valid,
      rd_mst_rdat_ready         => bus_rdat_ready,
      rd_mst_rdat_data          => bus_rdat_data,
      rd_mst_rdat_last          => bus_rdat_last,

      wr_mst_wreq_valid         => bus_wreq_valid,
      wr_mst_wreq_ready         => bus_wreq_ready,
      wr_mst_wreq_addr          => bus_wreq_addr,
      wr_mst_wreq_len           => bus_wreq_len,
      wr_mst_wreq_last          => bus_wreq_last,
      wr_mst_wdat_valid         => bus_wdat_valid,
      wr_mst_wdat_ready         => bus_wdat_ready,
      wr_mst_wdat_data          => bus_wdat_data,
      wr_mst_wdat_strobe        => bus_wdat_strobe,
      wr_mst_wdat_last          => bus_wdat_last,
      wr_mst_wrep_valid         => bus_wrep_valid,
      wr_mst_wrep_ready         => bus_wrep_ready,
      wr_mst_wrep_ok            => bus_wrep_ok,
      mmio_awvalid              => mmio_awvalid,
      mmio_awready              => mmio_awready,
      mmio_awaddr               => mmio_awaddr,
      mmio_wvalid               => mmio_wvalid,
      mmio_wready               => mmio_wready,
      mmio_wdata                => mmio_wdata,
      mmio_wstrb                => mmio_wstrb,
      mmio_bvalid               => mmio_bvalid,
      mmio_bready               => mmio_bready,
      mmio_bresp                => mmio_bresp,
      mmio_arvalid              => mmio_arvalid,
      mmio_arready              => mmio_arready,
      mmio_araddr               => mmio_araddr,
      mmio_rvalid               => mmio_rvalid,
      mmio_rready               => mmio_rready,
      mmio_rdata                => mmio_rdata,
      mmio_rresp                => mmio_rresp
    );

end architecture;
