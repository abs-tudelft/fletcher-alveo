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

entity Kernel_rematch002_taxi is
  generic (
    INDEX_WIDTH                            : integer := 32;
    TAG_WIDTH                              : integer := 1;
    REMATCH002_TAXI_OUT_BUS_ADDR_WIDTH     : integer := 64;
    REMATCH002_TAXI_OUT_BUS_DATA_WIDTH     : integer := 512;
    REMATCH002_TAXI_OUT_BUS_LEN_WIDTH      : integer := 8;
    REMATCH002_TAXI_OUT_BUS_BURST_STEP_LEN : integer := 1;
    REMATCH002_TAXI_OUT_BUS_BURST_MAX_LEN  : integer := 16
  );
  port (
    bcd_clk                             : in  std_logic;
    bcd_reset                           : in  std_logic;
    kcd_clk                             : in  std_logic;
    kcd_reset                           : in  std_logic;
    rematch002_taxi_out_valid           : in  std_logic;
    rematch002_taxi_out_ready           : out std_logic;
    rematch002_taxi_out_dvalid          : in  std_logic;
    rematch002_taxi_out_last            : in  std_logic;
    rematch002_taxi_out                 : in  std_logic_vector(31 downto 0);
    rematch002_taxi_out_bus_wreq_valid  : out std_logic;
    rematch002_taxi_out_bus_wreq_ready  : in  std_logic;
    rematch002_taxi_out_bus_wreq_addr   : out std_logic_vector(REMATCH002_TAXI_OUT_BUS_ADDR_WIDTH-1 downto 0);
    rematch002_taxi_out_bus_wreq_len    : out std_logic_vector(REMATCH002_TAXI_OUT_BUS_LEN_WIDTH-1 downto 0);
    rematch002_taxi_out_bus_wreq_last   : out std_logic;
    rematch002_taxi_out_bus_wdat_valid  : out std_logic;
    rematch002_taxi_out_bus_wdat_ready  : in  std_logic;
    rematch002_taxi_out_bus_wdat_data   : out std_logic_vector(REMATCH002_TAXI_OUT_BUS_DATA_WIDTH-1 downto 0);
    rematch002_taxi_out_bus_wdat_strobe : out std_logic_vector(REMATCH002_TAXI_OUT_BUS_DATA_WIDTH/8-1 downto 0);
    rematch002_taxi_out_bus_wdat_last   : out std_logic;
    rematch002_taxi_out_bus_wrep_valid  : in  std_logic;
    rematch002_taxi_out_bus_wrep_ready  : out std_logic;
    rematch002_taxi_out_bus_wrep_ok     : in  std_logic;
    rematch002_taxi_out_cmd_valid       : in  std_logic;
    rematch002_taxi_out_cmd_ready       : out std_logic;
    rematch002_taxi_out_cmd_firstIdx    : in  std_logic_vector(INDEX_WIDTH-1 downto 0);
    rematch002_taxi_out_cmd_lastIdx     : in  std_logic_vector(INDEX_WIDTH-1 downto 0);
    rematch002_taxi_out_cmd_ctrl        : in  std_logic_vector(REMATCH002_TAXI_OUT_BUS_ADDR_WIDTH-1 downto 0);
    rematch002_taxi_out_cmd_tag         : in  std_logic_vector(TAG_WIDTH-1 downto 0);
    rematch002_taxi_out_unl_valid       : out std_logic;
    rematch002_taxi_out_unl_ready       : in  std_logic;
    rematch002_taxi_out_unl_tag         : out std_logic_vector(TAG_WIDTH-1 downto 0)
  );
end entity;

architecture Implementation of Kernel_rematch002_taxi is
  signal out_inst_cmd_valid       : std_logic;
  signal out_inst_cmd_ready       : std_logic;
  signal out_inst_cmd_firstIdx    : std_logic_vector(INDEX_WIDTH-1 downto 0);
  signal out_inst_cmd_lastIdx     : std_logic_vector(INDEX_WIDTH-1 downto 0);
  signal out_inst_cmd_ctrl        : std_logic_vector(REMATCH002_TAXI_OUT_BUS_ADDR_WIDTH-1 downto 0);
  signal out_inst_cmd_tag         : std_logic_vector(TAG_WIDTH-1 downto 0);

  signal out_inst_unl_valid       : std_logic;
  signal out_inst_unl_ready       : std_logic;
  signal out_inst_unl_tag         : std_logic_vector(TAG_WIDTH-1 downto 0);

  signal out_inst_bus_wreq_valid  : std_logic;
  signal out_inst_bus_wreq_ready  : std_logic;
  signal out_inst_bus_wreq_addr   : std_logic_vector(REMATCH002_TAXI_OUT_BUS_ADDR_WIDTH-1 downto 0);
  signal out_inst_bus_wreq_len    : std_logic_vector(REMATCH002_TAXI_OUT_BUS_LEN_WIDTH-1 downto 0);
  signal out_inst_bus_wreq_last   : std_logic;
  signal out_inst_bus_wdat_valid  : std_logic;
  signal out_inst_bus_wdat_ready  : std_logic;
  signal out_inst_bus_wdat_data   : std_logic_vector(REMATCH002_TAXI_OUT_BUS_DATA_WIDTH-1 downto 0);
  signal out_inst_bus_wdat_strobe : std_logic_vector(REMATCH002_TAXI_OUT_BUS_DATA_WIDTH/8-1 downto 0);
  signal out_inst_bus_wdat_last   : std_logic;
  signal out_inst_bus_wrep_valid  : std_logic;
  signal out_inst_bus_wrep_ready  : std_logic;
  signal out_inst_bus_wrep_ok     : std_logic;

  signal out_inst_in_valid        : std_logic_vector(0 downto 0);
  signal out_inst_in_ready        : std_logic_vector(0 downto 0);
  signal out_inst_in_data         : std_logic_vector(31 downto 0);
  signal out_inst_in_dvalid       : std_logic_vector(0 downto 0);
  signal out_inst_in_last         : std_logic_vector(0 downto 0);

begin
  out_inst : ArrayWriter
    generic map (
      BUS_ADDR_WIDTH     => REMATCH002_TAXI_OUT_BUS_ADDR_WIDTH,
      BUS_DATA_WIDTH     => REMATCH002_TAXI_OUT_BUS_DATA_WIDTH,
      BUS_LEN_WIDTH      => REMATCH002_TAXI_OUT_BUS_LEN_WIDTH,
      BUS_BURST_STEP_LEN => REMATCH002_TAXI_OUT_BUS_BURST_STEP_LEN,
      BUS_BURST_MAX_LEN  => REMATCH002_TAXI_OUT_BUS_BURST_MAX_LEN,
      INDEX_WIDTH        => INDEX_WIDTH,
      CFG                => "prim(32)",
      CMD_TAG_ENABLE     => true,
      CMD_TAG_WIDTH      => TAG_WIDTH
    )
    port map (
      bcd_clk         => bcd_clk,
      bcd_reset       => bcd_reset,
      kcd_clk         => kcd_clk,
      kcd_reset       => kcd_reset,
      cmd_valid       => out_inst_cmd_valid,
      cmd_ready       => out_inst_cmd_ready,
      cmd_firstIdx    => out_inst_cmd_firstIdx,
      cmd_lastIdx     => out_inst_cmd_lastIdx,
      cmd_ctrl        => out_inst_cmd_ctrl,
      cmd_tag         => out_inst_cmd_tag,
      unl_valid       => out_inst_unl_valid,
      unl_ready       => out_inst_unl_ready,
      unl_tag         => out_inst_unl_tag,
      bus_wreq_valid  => out_inst_bus_wreq_valid,
      bus_wreq_ready  => out_inst_bus_wreq_ready,
      bus_wreq_addr   => out_inst_bus_wreq_addr,
      bus_wreq_len    => out_inst_bus_wreq_len,
      bus_wreq_last   => out_inst_bus_wreq_last,
      bus_wdat_valid  => out_inst_bus_wdat_valid,
      bus_wdat_ready  => out_inst_bus_wdat_ready,
      bus_wdat_data   => out_inst_bus_wdat_data,
      bus_wdat_strobe => out_inst_bus_wdat_strobe,
      bus_wdat_last   => out_inst_bus_wdat_last,
      bus_wrep_valid  => out_inst_bus_wrep_valid,
      bus_wrep_ready  => out_inst_bus_wrep_ready,
      bus_wrep_ok     => out_inst_bus_wrep_ok,
      in_valid        => out_inst_in_valid,
      in_ready        => out_inst_in_ready,
      in_data         => out_inst_in_data,
      in_dvalid       => out_inst_in_dvalid,
      in_last         => out_inst_in_last
    );

  rematch002_taxi_out_bus_wreq_valid  <= out_inst_bus_wreq_valid;
  out_inst_bus_wreq_ready             <= rematch002_taxi_out_bus_wreq_ready;
  rematch002_taxi_out_bus_wreq_addr   <= out_inst_bus_wreq_addr;
  rematch002_taxi_out_bus_wreq_len    <= out_inst_bus_wreq_len;
  rematch002_taxi_out_bus_wreq_last   <= out_inst_bus_wreq_last;
  rematch002_taxi_out_bus_wdat_valid  <= out_inst_bus_wdat_valid;
  out_inst_bus_wdat_ready             <= rematch002_taxi_out_bus_wdat_ready;
  rematch002_taxi_out_bus_wdat_data   <= out_inst_bus_wdat_data;
  rematch002_taxi_out_bus_wdat_strobe <= out_inst_bus_wdat_strobe;
  rematch002_taxi_out_bus_wdat_last   <= out_inst_bus_wdat_last;
  out_inst_bus_wrep_valid             <= rematch002_taxi_out_bus_wrep_valid;
  rematch002_taxi_out_bus_wrep_ready  <= out_inst_bus_wrep_ready;
  out_inst_bus_wrep_ok                <= rematch002_taxi_out_bus_wrep_ok;

  rematch002_taxi_out_unl_valid       <= out_inst_unl_valid;
  out_inst_unl_ready                  <= rematch002_taxi_out_unl_ready;
  rematch002_taxi_out_unl_tag         <= out_inst_unl_tag;

  out_inst_cmd_valid            <= rematch002_taxi_out_cmd_valid;
  rematch002_taxi_out_cmd_ready <= out_inst_cmd_ready;
  out_inst_cmd_firstIdx         <= rematch002_taxi_out_cmd_firstIdx;
  out_inst_cmd_lastIdx          <= rematch002_taxi_out_cmd_lastIdx;
  out_inst_cmd_ctrl             <= rematch002_taxi_out_cmd_ctrl;
  out_inst_cmd_tag              <= rematch002_taxi_out_cmd_tag;

  out_inst_in_valid(0)          <= rematch002_taxi_out_valid;
  rematch002_taxi_out_ready     <= out_inst_in_ready(0);
  out_inst_in_data              <= rematch002_taxi_out;
  out_inst_in_dvalid(0)         <= rematch002_taxi_out_dvalid;
  out_inst_in_last(0)           <= rematch002_taxi_out_last;

end architecture;
