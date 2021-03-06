-- Generated by
--       _______     _             __
--      / _   __|   | |           / /
--     / / | | _  __| |_ __ ___  / /
--    / /  | || |/ _` | '__/ _ \/ /
--   / /   | || | (_| | | |  __/ /
--  /_/    |_||_|\__,_|_|  \____/
--
-- Copyright 2020 Teratide B.V.
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

library work;
use work.UtilInt_pkg.all;

entity SubKernel is
  generic (
    NUM_EPC                    : integer := 1;
    NUM_REGEX                  : integer := 1;
    INDEX_WIDTH                : integer := 32;
    TAG_WIDTH                  : integer := 1
  );
  port (
    kcd_clk                    : in  std_logic;
    kcd_reset                  : in  std_logic;

    -- Fletcher string reader interface.
    in_valid                   : in  std_logic;
    in_ready                   : out std_logic;
    in_dvalid                  : in  std_logic;
    in_last                    : in  std_logic;
    in_length                  : in  std_logic_vector(31 downto 0);
    in_count                   : in  std_logic_vector(0 downto 0);
    in_chars_valid             : in  std_logic;
    in_chars_ready             : out std_logic;
    in_chars_dvalid            : in  std_logic;
    in_chars_last              : in  std_logic;
    in_chars                   : in  std_logic_vector(NUM_EPC*8-1 downto 0);
    in_chars_count             : in  std_logic_vector(log2ceil(NUM_EPC+1)-1 downto 0);
    in_unl_valid               : in  std_logic;
    in_unl_ready               : out std_logic;
    in_unl_tag                 : in  std_logic_vector(TAG_WIDTH-1 downto 0);
    in_cmd_valid               : out std_logic;
    in_cmd_ready               : in  std_logic;
    in_cmd_firstIdx            : out std_logic_vector(INDEX_WIDTH-1 downto 0);
    in_cmd_lastIdx             : out std_logic_vector(INDEX_WIDTH-1 downto 0);
    in_cmd_tag                 : out std_logic_vector(TAG_WIDTH-1 downto 0);

    -- Fletcher index writer interface for taxi.
    re_taxi_out_valid        : out std_logic;
    re_taxi_out_ready        : in  std_logic;
    re_taxi_out_dvalid       : out std_logic;
    re_taxi_out_last         : out std_logic;
    re_taxi_out              : out std_logic_vector(31 downto 0);
    re_taxi_out_unl_valid    : in  std_logic;
    re_taxi_out_unl_ready    : out std_logic;
    re_taxi_out_unl_tag      : in  std_logic_vector(TAG_WIDTH-1 downto 0);
    re_taxi_out_cmd_valid    : out std_logic;
    re_taxi_out_cmd_ready    : in  std_logic;
    re_taxi_out_cmd_firstIdx : out std_logic_vector(INDEX_WIDTH-1 downto 0);
    re_taxi_out_cmd_lastIdx  : out std_logic_vector(INDEX_WIDTH-1 downto 0);
    re_taxi_out_cmd_tag      : out std_logic_vector(TAG_WIDTH-1 downto 0);

    -- MMIO control interface.
    mmio_start                 : in  std_logic;
    mmio_stop                  : in  std_logic;
    mmio_reset                 : in  std_logic;
    mmio_idle                  : out std_logic;
    mmio_busy                  : out std_logic;
    mmio_done                  : out std_logic;
    mmio_firstidx              : in  std_logic_vector(31 downto 0);
    mmio_lastidx               : in  std_logic_vector(31 downto 0);

    -- MMIO for taxi output buffer.
    mmio_re_taxi_firstidx : in  std_logic_vector(31 downto 0);
    mmio_re_taxi_lastidx  : in  std_logic_vector(31 downto 0);
    mmio_re_taxi_count    : out std_logic_vector(31 downto 0);

    -- UTF-8 error counter output.
    mmio_errors                : out std_logic_vector(31 downto 0)

  );
end entity;

architecture behavioral of SubKernel is

  signal m_in_valid   : std_logic;
  signal m_in_ready   : std_logic;
  signal m_in_mask    : std_logic_vector(NUM_EPC-1 downto 0);
  signal m_in_data    : std_logic_vector(NUM_EPC*8-1 downto 0);
  signal m_in_last    : std_logic;

  signal m_out_valid  : std_logic;
  signal m_out_ready  : std_logic;
  signal m_out_match  : std_logic_vector(NUM_REGEX-1 downto 0);
  signal m_out_error  : std_logic;

begin

  matcher: entity work.Matcher
    generic map (
      BPC                      => NUM_EPC
    )
    port map (
      clk                      => kcd_clk,
      reset                    => kcd_reset,
      in_valid                 => m_in_valid,
      in_ready                 => m_in_ready,
      in_mask                  => m_in_mask,
      in_data                  => m_in_data,
      in_last                  => m_in_last,
      out_valid                => m_out_valid,
      out_ready                => m_out_ready,
      out_match                => m_out_match,
      out_error                => m_out_error
    );

  proc: process (kcd_clk) is

    -- Command stream output holding registers.
    type cmd_type is record
      valid     : std_logic;
      tag       : std_logic_vector(TAG_WIDTH-1 downto 0);
      firstIdx  : std_logic_vector(INDEX_WIDTH-1 downto 0);
      lastIdx   : std_logic_vector(INDEX_WIDTH-1 downto 0);
    end record;
    variable cmd: cmd_type;
    variable cre_taxi : cmd_type;

    -- Unlock stream input holding registers.
    type unl_type is record
      valid     : std_logic;
      tag       : std_logic_vector(TAG_WIDTH-1 downto 0);
    end record;
    variable unl: unl_type;
    variable ure_taxi : unl_type;

    -- Length stream input holding register.
    type il_type is record
      valid     : std_logic;
      last      : std_logic;
      dvalid    : std_logic;
      length    : std_logic_vector(31 downto 0);
    end record;
    variable il : il_type;

    -- Character stream input holding register.
    type ic_type is record
      valid     : std_logic;
      last      : std_logic;
      dvalid    : std_logic;
      data      : std_logic_vector(NUM_EPC*8-1 downto 0);
      count     : std_logic_vector(log2ceil(NUM_EPC+1)-1 downto 0);
    end record;
    variable ic : ic_type;

    -- Matcher character stream output holding register.
    type mi_type is record
      valid     : std_logic;
      last      : std_logic;
      mask      : std_logic_vector(NUM_EPC-1 downto 0);
      data      : std_logic_vector(NUM_EPC*8-1 downto 0);
    end record;
    variable mi : mi_type;

    -- Matcher output stream input holding register.
    type mo_type is record
      valid     : std_logic;
      match     : std_logic_vector(NUM_REGEX-1 downto 0);
      err       : std_logic;
    end record;
    variable mo : mo_type;

    -- Matching index stream output holding registers.
    type dre_type is record
      valid     : std_logic;
      index     : std_logic_vector(31 downto 0);
      last      : std_logic;
    end record;
    variable dre_taxi : dre_type;

    -- FSM state.
    type state_type is (
      S_RESET,
      S_IDLE,
      S_WAIT_LAST,
      S_WAIT_DONE,
      S_WAIT_UNLOCK
    );
    variable state  : state_type;

    -- Number of outstanding strings between length stream and match output,
    -- diminished-one. MSB is set if there are no outstanding requests;
    -- counter is considered full when MSBs are 01.
    variable outst  : unsigned(7 downto 0);

    -- Match counters for each regex.
    variable cnt_re_taxi : unsigned(31 downto 0);
    variable cnt_errors : unsigned(31 downto 0);
    variable cnt_index  : unsigned(31 downto 0);

  begin
    if rising_edge(kcd_clk) then

      -- Boilerplate code for stream holding registers.
      if in_cmd_ready = '1' then
        cmd.valid := '0';
      end if;
      if re_taxi_out_cmd_ready = '1' then
        cre_taxi.valid := '0';
      end if;
      if unl.valid = '0' then
        unl.valid := in_unl_valid;
        unl.tag   := in_unl_tag;
      end if;
      if ure_taxi.valid = '0' then
        ure_taxi.valid := re_taxi_out_unl_valid;
        ure_taxi.tag   := re_taxi_out_unl_tag;
      end if;
      if il.valid = '0' then
        il.valid  := in_valid;
        il.last   := in_last;
        il.dvalid := in_dvalid;
        il.length := in_length;
      end if;
      if ic.valid = '0' then
        ic.valid  := in_chars_valid;
        ic.last   := in_chars_last;
        ic.dvalid := in_chars_dvalid;
        ic.data   := in_chars;
        ic.count  := in_chars_count;
      end if;
      if m_in_ready = '1' then
        mi.valid := '0';
      end if;
      if mo.valid = '0' then
        mo.valid  := m_out_valid;
        mo.match  := m_out_match;
        mo.err    := m_out_error;
      end if;
      if re_taxi_out_ready = '1' then
        dre_taxi.valid := '0';
      end if;

      -- Assign default values for non-register, non-stream output signals.
      mmio_idle <= '0';
      mmio_busy <= '0';

      -- Generate kernel state machine.
      case state is
        when S_RESET =>
          mmio_busy <= '1';
          state := S_IDLE;

        when S_IDLE =>
          mmio_idle <= '1';

          -- Wait for start signal.
          if mmio_start = '1' then
            if mmio_firstidx = mmio_lastidx then

              -- Empty range, so this subkernel has nothing to do for this
              -- run. Just set our done flag.
              mmio_done <= '1';

            else

              -- Send command to the reader to start streaming strings.
              cmd.tag := (others => '0');
              cmd.firstIdx := mmio_firstidx;
              cmd.lastIdx := mmio_lastidx;
              cmd.valid := '1';

              -- Send command to the taxi index writer.
              cre_taxi.tag := (others => '0');
              cre_taxi.firstIdx := mmio_re_taxi_firstidx;
              cre_taxi.lastIdx := mmio_re_taxi_lastidx;
              cre_taxi.valid := '1';

              -- Reset counters.
              cnt_re_taxi := (others => '0');
              cnt_errors := (others => '0');
              cnt_index := unsigned(mmio_firstidx);

              -- Start streaming.
              state := S_WAIT_LAST;

            end if;
          end if;

        when S_WAIT_LAST =>
          mmio_busy <= '1';

          -- Handle data from the length stream. Every transfer on this stream
          -- translates to a string that needs to be processed. We have to
          -- count how many of these strings we've seen on this stream but
          -- don't have a match result for yet in order to know when we're
          -- truly done. When we receive the last one, we move on to the next
          -- state.
          if il.valid = '1' and outst(7 downto 6) /= "01" then
            if il.dvalid = '1' then
              outst := outst + 1;
            end if;
            if il.last = '1' then
              state := S_WAIT_DONE;
            end if;
            il.valid := '0';
          end if;

        when S_WAIT_DONE =>
          mmio_busy <= '1';

          -- Wait for the outstanding string counter to reach zero (minus one)
          -- again.
          if outst(7) = '1' and dre_taxi.valid = '0' then
            dre_taxi.index := (others => '0');
            dre_taxi.last  := '1';
            dre_taxi.valid := '1';
            state := S_WAIT_UNLOCK;
          end if;

        when S_WAIT_UNLOCK =>
          mmio_busy <= '1';

          -- Wait for the unlock stream to signal that the Fletcher interface
          -- is done.
          if unl.valid = '1' and ure_taxi.valid = '1' then
            unl.valid := '0';
            ure_taxi.valid := '0';
            mmio_done <= '1';
            state := S_IDLE;
          end if;

      end case;

      -- Clear the done flag when the kernel reset flag is set.
      if mmio_reset = '1' then
        mmio_done <= '0';
      end if;

      -- Convert and propagate stream data from Fletcher to the regex matcher.
      if ic.valid = '1' and mi.valid = '0' then
        mi.last := ic.last;
        mi.data := ic.data;
        if ic.dvalid = '1' then
          for idx in 0 to NUM_EPC-1 loop
            if idx < unsigned(ic.count) then
              mi.mask(idx) := '1';
            else
              mi.mask(idx) := '0';
              -- pragma translate_off
              mi.data(idx*8+7 downto idx*8) := (others => '0');
              -- pragma translate_on
            end if;
          end loop;
        else
          mi.mask := (others => '0');
          -- pragma translate_off
          mi.data := (others => '0');
          -- pragma translate_on
        end if;
        mi.valid := '1';
        ic.valid := '0';
      end if;

      -- Handle matcher output. Every match result means one less outstanding
      -- string.
      if mo.valid = '1' and outst(7) = '0' and dre_taxi.valid = '0' then
        outst := outst - 1;
        if mo.match(0) = '1' then
          dre_taxi.index := std_logic_vector(cnt_index);
          dre_taxi.last  := '0';
          dre_taxi.valid := '1';
          cnt_re_taxi := cnt_re_taxi + 1;
        end if;
        if mo.err = '1' then
          cnt_errors := cnt_errors + 1;
        end if;
        cnt_index := cnt_index + 1;
        mo.valid := '0';
      end if;

      -- Handle reset.
      if kcd_reset = '1' then
        cmd.valid := '0';
        unl.valid := '0';
        il.valid  := '0';
        ic.valid  := '0';
        mi.valid  := '0';
        -- pragma translate_off
        mi.data   := (others => '0');
        -- pragma translate_on
        mo.valid  := '0';
        cre_taxi.valid := '0';
        ure_taxi.valid := '0';
        dre_taxi.valid := '0';
        cnt_re_taxi    := (others => '0');
        cnt_errors := (others => '0');
        cnt_index := (others => '0');
        state     := S_RESET;
        outst     := (others => '1');
        mmio_idle <= '0';
        mmio_busy <= '1';
        mmio_done <= '0';
      end if;

      -- Assign stream outputs.
      in_cmd_valid      <= cmd.valid;
      in_cmd_tag        <= cmd.tag;
      in_cmd_firstIdx   <= cmd.firstIdx;
      in_cmd_lastIdx    <= cmd.lastIdx;
      in_unl_ready      <= not unl.valid;
      in_ready          <= not il.valid;
      in_chars_ready    <= not ic.valid;
      m_in_valid        <= mi.valid;
      m_in_last         <= mi.last;
      m_in_mask         <= mi.mask;
      m_in_data         <= mi.data;
      m_out_ready       <= not mo.valid;
      mmio_errors       <= std_logic_vector(cnt_errors);

      re_taxi_out_cmd_valid    <= cre_taxi.valid;
      re_taxi_out_cmd_tag      <= cre_taxi.tag;
      re_taxi_out_cmd_firstIdx <= cre_taxi.firstIdx;
      re_taxi_out_cmd_lastIdx  <= cre_taxi.lastIdx;
      re_taxi_out_unl_ready    <= not ure_taxi.valid;
      re_taxi_out_valid        <= dre_taxi.valid;
      re_taxi_out_dvalid       <= '1';
      re_taxi_out_last         <= dre_taxi.last;
      re_taxi_out              <= dre_taxi.index;
      mmio_re_taxi_count       <= std_logic_vector(cnt_re_taxi);

    end if;
  end process;

end architecture;
