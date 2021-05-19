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
--
-- This file was generated by Fletchgen. Modify this file at your own risk.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.Array_pkg.all;

entity Kernel_rematch014 is
  generic (
    INDEX_WIDTH                      : integer := 32;
    TAG_WIDTH                        : integer := 1;
    REMATCH014_IN_BUS_ADDR_WIDTH     : integer := 64;
    REMATCH014_IN_BUS_DATA_WIDTH     : integer := 512;
    REMATCH014_IN_BUS_LEN_WIDTH      : integer := 8;
    REMATCH014_IN_BUS_BURST_STEP_LEN : integer := 1;
    REMATCH014_IN_BUS_BURST_MAX_LEN  : integer := 16
  );
  port (
    bcd_clk                      : in  std_logic;
    bcd_reset                    : in  std_logic;
    kcd_clk                      : in  std_logic;
    kcd_reset                    : in  std_logic;
    rematch014_in_valid          : out std_logic;
    rematch014_in_ready          : in  std_logic;
    rematch014_in_dvalid         : out std_logic;
    rematch014_in_last           : out std_logic;
    rematch014_in_length         : out std_logic_vector(31 downto 0);
    rematch014_in_count          : out std_logic_vector(0 downto 0);
    rematch014_in_chars_valid    : out std_logic;
    rematch014_in_chars_ready    : in  std_logic;
    rematch014_in_chars_dvalid   : out std_logic;
    rematch014_in_chars_last     : out std_logic;
    rematch014_in_chars          : out std_logic_vector(31 downto 0);
    rematch014_in_chars_count    : out std_logic_vector(2 downto 0);
    rematch014_in_bus_rreq_valid : out std_logic;
    rematch014_in_bus_rreq_ready : in  std_logic;
    rematch014_in_bus_rreq_addr  : out std_logic_vector(REMATCH014_IN_BUS_ADDR_WIDTH-1 downto 0);
    rematch014_in_bus_rreq_len   : out std_logic_vector(REMATCH014_IN_BUS_LEN_WIDTH-1 downto 0);
    rematch014_in_bus_rdat_valid : in  std_logic;
    rematch014_in_bus_rdat_ready : out std_logic;
    rematch014_in_bus_rdat_data  : in  std_logic_vector(REMATCH014_IN_BUS_DATA_WIDTH-1 downto 0);
    rematch014_in_bus_rdat_last  : in  std_logic;
    rematch014_in_cmd_valid      : in  std_logic;
    rematch014_in_cmd_ready      : out std_logic;
    rematch014_in_cmd_firstIdx   : in  std_logic_vector(INDEX_WIDTH-1 downto 0);
    rematch014_in_cmd_lastIdx    : in  std_logic_vector(INDEX_WIDTH-1 downto 0);
    rematch014_in_cmd_ctrl       : in  std_logic_vector(REMATCH014_IN_BUS_ADDR_WIDTH*2-1 downto 0);
    rematch014_in_cmd_tag        : in  std_logic_vector(TAG_WIDTH-1 downto 0);
    rematch014_in_unl_valid      : out std_logic;
    rematch014_in_unl_ready      : in  std_logic;
    rematch014_in_unl_tag        : out std_logic_vector(TAG_WIDTH-1 downto 0)
  );
end entity;

architecture Implementation of Kernel_rematch014 is
  signal in_inst_cmd_valid      : std_logic;
  signal in_inst_cmd_ready      : std_logic;
  signal in_inst_cmd_firstIdx   : std_logic_vector(INDEX_WIDTH-1 downto 0);
  signal in_inst_cmd_lastIdx    : std_logic_vector(INDEX_WIDTH-1 downto 0);
  signal in_inst_cmd_ctrl       : std_logic_vector(REMATCH014_IN_BUS_ADDR_WIDTH*2-1 downto 0);
  signal in_inst_cmd_tag        : std_logic_vector(TAG_WIDTH-1 downto 0);

  signal in_inst_unl_valid      : std_logic;
  signal in_inst_unl_ready      : std_logic;
  signal in_inst_unl_tag        : std_logic_vector(TAG_WIDTH-1 downto 0);

  signal in_inst_bus_rreq_valid : std_logic;
  signal in_inst_bus_rreq_ready : std_logic;
  signal in_inst_bus_rreq_addr  : std_logic_vector(REMATCH014_IN_BUS_ADDR_WIDTH-1 downto 0);
  signal in_inst_bus_rreq_len   : std_logic_vector(REMATCH014_IN_BUS_LEN_WIDTH-1 downto 0);
  signal in_inst_bus_rdat_valid : std_logic;
  signal in_inst_bus_rdat_ready : std_logic;
  signal in_inst_bus_rdat_data  : std_logic_vector(REMATCH014_IN_BUS_DATA_WIDTH-1 downto 0);
  signal in_inst_bus_rdat_last  : std_logic;

  signal in_inst_out_valid      : std_logic_vector(1 downto 0);
  signal in_inst_out_ready      : std_logic_vector(1 downto 0);
  signal in_inst_out_data       : std_logic_vector(67 downto 0);
  signal in_inst_out_dvalid     : std_logic_vector(1 downto 0);
  signal in_inst_out_last       : std_logic_vector(1 downto 0);

begin
  in_inst : ArrayReader
    generic map (
      BUS_ADDR_WIDTH     => REMATCH014_IN_BUS_ADDR_WIDTH,
      BUS_DATA_WIDTH     => REMATCH014_IN_BUS_DATA_WIDTH,
      BUS_LEN_WIDTH      => REMATCH014_IN_BUS_LEN_WIDTH,
      BUS_BURST_STEP_LEN => REMATCH014_IN_BUS_BURST_STEP_LEN,
      BUS_BURST_MAX_LEN  => REMATCH014_IN_BUS_BURST_MAX_LEN,
      INDEX_WIDTH        => INDEX_WIDTH,
      CFG                => "listprim(8;epc=4)",
      CMD_TAG_ENABLE     => true,
      CMD_TAG_WIDTH      => TAG_WIDTH
    )
    port map (
      bcd_clk        => bcd_clk,
      bcd_reset      => bcd_reset,
      kcd_clk        => kcd_clk,
      kcd_reset      => kcd_reset,
      cmd_valid      => in_inst_cmd_valid,
      cmd_ready      => in_inst_cmd_ready,
      cmd_firstIdx   => in_inst_cmd_firstIdx,
      cmd_lastIdx    => in_inst_cmd_lastIdx,
      cmd_ctrl       => in_inst_cmd_ctrl,
      cmd_tag        => in_inst_cmd_tag,
      unl_valid      => in_inst_unl_valid,
      unl_ready      => in_inst_unl_ready,
      unl_tag        => in_inst_unl_tag,
      bus_rreq_valid => in_inst_bus_rreq_valid,
      bus_rreq_ready => in_inst_bus_rreq_ready,
      bus_rreq_addr  => in_inst_bus_rreq_addr,
      bus_rreq_len   => in_inst_bus_rreq_len,
      bus_rdat_valid => in_inst_bus_rdat_valid,
      bus_rdat_ready => in_inst_bus_rdat_ready,
      bus_rdat_data  => in_inst_bus_rdat_data,
      bus_rdat_last  => in_inst_bus_rdat_last,
      out_valid      => in_inst_out_valid,
      out_ready      => in_inst_out_ready,
      out_data       => in_inst_out_data,
      out_dvalid     => in_inst_out_dvalid,
      out_last       => in_inst_out_last
    );

  rematch014_in_valid          <= in_inst_out_valid(0);
  rematch014_in_chars_valid    <= in_inst_out_valid(1);
  in_inst_out_ready(0)         <= rematch014_in_ready;
  in_inst_out_ready(1)         <= rematch014_in_chars_ready;
  rematch014_in_dvalid         <= in_inst_out_dvalid(0);
  rematch014_in_chars_dvalid   <= in_inst_out_dvalid(1);
  rematch014_in_last           <= in_inst_out_last(0);
  rematch014_in_chars_last     <= in_inst_out_last(1);
  rematch014_in_length         <= in_inst_out_data(31 downto 0);
  rematch014_in_count          <= in_inst_out_data(32 downto 32);
  rematch014_in_chars          <= in_inst_out_data(64 downto 33);
  rematch014_in_chars_count    <= in_inst_out_data(67 downto 65);

  rematch014_in_bus_rreq_valid <= in_inst_bus_rreq_valid;
  in_inst_bus_rreq_ready       <= rematch014_in_bus_rreq_ready;
  rematch014_in_bus_rreq_addr  <= in_inst_bus_rreq_addr;
  rematch014_in_bus_rreq_len   <= in_inst_bus_rreq_len;
  in_inst_bus_rdat_valid       <= rematch014_in_bus_rdat_valid;
  rematch014_in_bus_rdat_ready <= in_inst_bus_rdat_ready;
  in_inst_bus_rdat_data        <= rematch014_in_bus_rdat_data;
  in_inst_bus_rdat_last        <= rematch014_in_bus_rdat_last;

  rematch014_in_unl_valid      <= in_inst_unl_valid;
  in_inst_unl_ready            <= rematch014_in_unl_ready;
  rematch014_in_unl_tag        <= in_inst_unl_tag;

  in_inst_cmd_valid       <= rematch014_in_cmd_valid;
  rematch014_in_cmd_ready <= in_inst_cmd_ready;
  in_inst_cmd_firstIdx    <= rematch014_in_cmd_firstIdx;
  in_inst_cmd_lastIdx     <= rematch014_in_cmd_lastIdx;
  in_inst_cmd_ctrl        <= rematch014_in_cmd_ctrl;
  in_inst_cmd_tag         <= rematch014_in_cmd_tag;

end architecture;
