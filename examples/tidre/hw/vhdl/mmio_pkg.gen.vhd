-- Generated using vhdMMIO 0.0.3 (https://github.com/abs-tudelft/vhdmmio)

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;

library work;
use work.vhdmmio_pkg.all;

package mmio_pkg is

  -- Component declaration for mmio.
  component mmio is
    port (

      -- Clock sensitive to the rising edge and synchronous, active-high reset.
      kcd_clk : in std_logic;
      kcd_reset : in std_logic := '0';

      -- Interface for field start: start.
      f_start_data : out std_logic := '0';

      -- Interface for field stop: stop.
      f_stop_data : out std_logic := '0';

      -- Interface for field reset: reset.
      f_reset_data : out std_logic := '0';

      -- Interface for field idle: idle.
      f_idle_write_data : in std_logic := '0';

      -- Interface for field busy: busy.
      f_busy_write_data : in std_logic := '0';

      -- Interface for field done: done.
      f_done_write_data : in std_logic := '0';

      -- Interface for field result: result.
      f_result_write_data : in std_logic_vector(63 downto 0) := (others => '0');

      -- Interface for field rematch000_firstidx: rematch000_firstidx.
      f_rematch000_firstidx_data : out std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch000_lastidx: rematch000_lastidx.
      f_rematch000_lastidx_data : out std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch001_firstidx: rematch001_firstidx.
      f_rematch001_firstidx_data : out std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch001_lastidx: rematch001_lastidx.
      f_rematch001_lastidx_data : out std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch002_firstidx: rematch002_firstidx.
      f_rematch002_firstidx_data : out std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch002_lastidx: rematch002_lastidx.
      f_rematch002_lastidx_data : out std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch003_firstidx: rematch003_firstidx.
      f_rematch003_firstidx_data : out std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch003_lastidx: rematch003_lastidx.
      f_rematch003_lastidx_data : out std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch004_firstidx: rematch004_firstidx.
      f_rematch004_firstidx_data : out std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch004_lastidx: rematch004_lastidx.
      f_rematch004_lastidx_data : out std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch005_firstidx: rematch005_firstidx.
      f_rematch005_firstidx_data : out std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch005_lastidx: rematch005_lastidx.
      f_rematch005_lastidx_data : out std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch006_firstidx: rematch006_firstidx.
      f_rematch006_firstidx_data : out std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch006_lastidx: rematch006_lastidx.
      f_rematch006_lastidx_data : out std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch007_firstidx: rematch007_firstidx.
      f_rematch007_firstidx_data : out std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch007_lastidx: rematch007_lastidx.
      f_rematch007_lastidx_data : out std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch008_firstidx: rematch008_firstidx.
      f_rematch008_firstidx_data : out std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch008_lastidx: rematch008_lastidx.
      f_rematch008_lastidx_data : out std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch009_firstidx: rematch009_firstidx.
      f_rematch009_firstidx_data : out std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch009_lastidx: rematch009_lastidx.
      f_rematch009_lastidx_data : out std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch010_firstidx: rematch010_firstidx.
      f_rematch010_firstidx_data : out std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch010_lastidx: rematch010_lastidx.
      f_rematch010_lastidx_data : out std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch011_firstidx: rematch011_firstidx.
      f_rematch011_firstidx_data : out std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch011_lastidx: rematch011_lastidx.
      f_rematch011_lastidx_data : out std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch012_firstidx: rematch012_firstidx.
      f_rematch012_firstidx_data : out std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch012_lastidx: rematch012_lastidx.
      f_rematch012_lastidx_data : out std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch013_firstidx: rematch013_firstidx.
      f_rematch013_firstidx_data : out std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch013_lastidx: rematch013_lastidx.
      f_rematch013_lastidx_data : out std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch014_firstidx: rematch014_firstidx.
      f_rematch014_firstidx_data : out std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch014_lastidx: rematch014_lastidx.
      f_rematch014_lastidx_data : out std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch015_firstidx: rematch015_firstidx.
      f_rematch015_firstidx_data : out std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch015_lastidx: rematch015_lastidx.
      f_rematch015_lastidx_data : out std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch000_taxi_firstidx: rematch000_taxi_firstidx.
      f_rematch000_taxi_firstidx_data : out std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch000_taxi_lastidx: rematch000_taxi_lastidx.
      f_rematch000_taxi_lastidx_data : out std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch001_taxi_firstidx: rematch001_taxi_firstidx.
      f_rematch001_taxi_firstidx_data : out std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch001_taxi_lastidx: rematch001_taxi_lastidx.
      f_rematch001_taxi_lastidx_data : out std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch002_taxi_firstidx: rematch002_taxi_firstidx.
      f_rematch002_taxi_firstidx_data : out std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch002_taxi_lastidx: rematch002_taxi_lastidx.
      f_rematch002_taxi_lastidx_data : out std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch003_taxi_firstidx: rematch003_taxi_firstidx.
      f_rematch003_taxi_firstidx_data : out std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch003_taxi_lastidx: rematch003_taxi_lastidx.
      f_rematch003_taxi_lastidx_data : out std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch004_taxi_firstidx: rematch004_taxi_firstidx.
      f_rematch004_taxi_firstidx_data : out std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch004_taxi_lastidx: rematch004_taxi_lastidx.
      f_rematch004_taxi_lastidx_data : out std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch005_taxi_firstidx: rematch005_taxi_firstidx.
      f_rematch005_taxi_firstidx_data : out std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch005_taxi_lastidx: rematch005_taxi_lastidx.
      f_rematch005_taxi_lastidx_data : out std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch006_taxi_firstidx: rematch006_taxi_firstidx.
      f_rematch006_taxi_firstidx_data : out std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch006_taxi_lastidx: rematch006_taxi_lastidx.
      f_rematch006_taxi_lastidx_data : out std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch007_taxi_firstidx: rematch007_taxi_firstidx.
      f_rematch007_taxi_firstidx_data : out std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch007_taxi_lastidx: rematch007_taxi_lastidx.
      f_rematch007_taxi_lastidx_data : out std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch008_taxi_firstidx: rematch008_taxi_firstidx.
      f_rematch008_taxi_firstidx_data : out std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch008_taxi_lastidx: rematch008_taxi_lastidx.
      f_rematch008_taxi_lastidx_data : out std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch009_taxi_firstidx: rematch009_taxi_firstidx.
      f_rematch009_taxi_firstidx_data : out std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch009_taxi_lastidx: rematch009_taxi_lastidx.
      f_rematch009_taxi_lastidx_data : out std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch010_taxi_firstidx: rematch010_taxi_firstidx.
      f_rematch010_taxi_firstidx_data : out std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch010_taxi_lastidx: rematch010_taxi_lastidx.
      f_rematch010_taxi_lastidx_data : out std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch011_taxi_firstidx: rematch011_taxi_firstidx.
      f_rematch011_taxi_firstidx_data : out std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch011_taxi_lastidx: rematch011_taxi_lastidx.
      f_rematch011_taxi_lastidx_data : out std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch012_taxi_firstidx: rematch012_taxi_firstidx.
      f_rematch012_taxi_firstidx_data : out std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch012_taxi_lastidx: rematch012_taxi_lastidx.
      f_rematch012_taxi_lastidx_data : out std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch013_taxi_firstidx: rematch013_taxi_firstidx.
      f_rematch013_taxi_firstidx_data : out std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch013_taxi_lastidx: rematch013_taxi_lastidx.
      f_rematch013_taxi_lastidx_data : out std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch014_taxi_firstidx: rematch014_taxi_firstidx.
      f_rematch014_taxi_firstidx_data : out std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch014_taxi_lastidx: rematch014_taxi_lastidx.
      f_rematch014_taxi_lastidx_data : out std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch015_taxi_firstidx: rematch015_taxi_firstidx.
      f_rematch015_taxi_firstidx_data : out std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch015_taxi_lastidx: rematch015_taxi_lastidx.
      f_rematch015_taxi_lastidx_data : out std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch000_in_offsets: rematch000_in_offsets.
      f_rematch000_in_offsets_data : out std_logic_vector(63 downto 0)
          := (others => '0');

      -- Interface for field rematch000_in_values: rematch000_in_values.
      f_rematch000_in_values_data : out std_logic_vector(63 downto 0)
          := (others => '0');

      -- Interface for field rematch001_in_offsets: rematch001_in_offsets.
      f_rematch001_in_offsets_data : out std_logic_vector(63 downto 0)
          := (others => '0');

      -- Interface for field rematch001_in_values: rematch001_in_values.
      f_rematch001_in_values_data : out std_logic_vector(63 downto 0)
          := (others => '0');

      -- Interface for field rematch002_in_offsets: rematch002_in_offsets.
      f_rematch002_in_offsets_data : out std_logic_vector(63 downto 0)
          := (others => '0');

      -- Interface for field rematch002_in_values: rematch002_in_values.
      f_rematch002_in_values_data : out std_logic_vector(63 downto 0)
          := (others => '0');

      -- Interface for field rematch003_in_offsets: rematch003_in_offsets.
      f_rematch003_in_offsets_data : out std_logic_vector(63 downto 0)
          := (others => '0');

      -- Interface for field rematch003_in_values: rematch003_in_values.
      f_rematch003_in_values_data : out std_logic_vector(63 downto 0)
          := (others => '0');

      -- Interface for field rematch004_in_offsets: rematch004_in_offsets.
      f_rematch004_in_offsets_data : out std_logic_vector(63 downto 0)
          := (others => '0');

      -- Interface for field rematch004_in_values: rematch004_in_values.
      f_rematch004_in_values_data : out std_logic_vector(63 downto 0)
          := (others => '0');

      -- Interface for field rematch005_in_offsets: rematch005_in_offsets.
      f_rematch005_in_offsets_data : out std_logic_vector(63 downto 0)
          := (others => '0');

      -- Interface for field rematch005_in_values: rematch005_in_values.
      f_rematch005_in_values_data : out std_logic_vector(63 downto 0)
          := (others => '0');

      -- Interface for field rematch006_in_offsets: rematch006_in_offsets.
      f_rematch006_in_offsets_data : out std_logic_vector(63 downto 0)
          := (others => '0');

      -- Interface for field rematch006_in_values: rematch006_in_values.
      f_rematch006_in_values_data : out std_logic_vector(63 downto 0)
          := (others => '0');

      -- Interface for field rematch007_in_offsets: rematch007_in_offsets.
      f_rematch007_in_offsets_data : out std_logic_vector(63 downto 0)
          := (others => '0');

      -- Interface for field rematch007_in_values: rematch007_in_values.
      f_rematch007_in_values_data : out std_logic_vector(63 downto 0)
          := (others => '0');

      -- Interface for field rematch008_in_offsets: rematch008_in_offsets.
      f_rematch008_in_offsets_data : out std_logic_vector(63 downto 0)
          := (others => '0');

      -- Interface for field rematch008_in_values: rematch008_in_values.
      f_rematch008_in_values_data : out std_logic_vector(63 downto 0)
          := (others => '0');

      -- Interface for field rematch009_in_offsets: rematch009_in_offsets.
      f_rematch009_in_offsets_data : out std_logic_vector(63 downto 0)
          := (others => '0');

      -- Interface for field rematch009_in_values: rematch009_in_values.
      f_rematch009_in_values_data : out std_logic_vector(63 downto 0)
          := (others => '0');

      -- Interface for field rematch010_in_offsets: rematch010_in_offsets.
      f_rematch010_in_offsets_data : out std_logic_vector(63 downto 0)
          := (others => '0');

      -- Interface for field rematch010_in_values: rematch010_in_values.
      f_rematch010_in_values_data : out std_logic_vector(63 downto 0)
          := (others => '0');

      -- Interface for field rematch011_in_offsets: rematch011_in_offsets.
      f_rematch011_in_offsets_data : out std_logic_vector(63 downto 0)
          := (others => '0');

      -- Interface for field rematch011_in_values: rematch011_in_values.
      f_rematch011_in_values_data : out std_logic_vector(63 downto 0)
          := (others => '0');

      -- Interface for field rematch012_in_offsets: rematch012_in_offsets.
      f_rematch012_in_offsets_data : out std_logic_vector(63 downto 0)
          := (others => '0');

      -- Interface for field rematch012_in_values: rematch012_in_values.
      f_rematch012_in_values_data : out std_logic_vector(63 downto 0)
          := (others => '0');

      -- Interface for field rematch013_in_offsets: rematch013_in_offsets.
      f_rematch013_in_offsets_data : out std_logic_vector(63 downto 0)
          := (others => '0');

      -- Interface for field rematch013_in_values: rematch013_in_values.
      f_rematch013_in_values_data : out std_logic_vector(63 downto 0)
          := (others => '0');

      -- Interface for field rematch014_in_offsets: rematch014_in_offsets.
      f_rematch014_in_offsets_data : out std_logic_vector(63 downto 0)
          := (others => '0');

      -- Interface for field rematch014_in_values: rematch014_in_values.
      f_rematch014_in_values_data : out std_logic_vector(63 downto 0)
          := (others => '0');

      -- Interface for field rematch015_in_offsets: rematch015_in_offsets.
      f_rematch015_in_offsets_data : out std_logic_vector(63 downto 0)
          := (others => '0');

      -- Interface for field rematch015_in_values: rematch015_in_values.
      f_rematch015_in_values_data : out std_logic_vector(63 downto 0)
          := (others => '0');

      -- Interface for field rematch000_taxi_out_values:
      -- rematch000_taxi_out_values.
      f_rematch000_taxi_out_values_data : out std_logic_vector(63 downto 0)
          := (others => '0');

      -- Interface for field rematch001_taxi_out_values:
      -- rematch001_taxi_out_values.
      f_rematch001_taxi_out_values_data : out std_logic_vector(63 downto 0)
          := (others => '0');

      -- Interface for field rematch002_taxi_out_values:
      -- rematch002_taxi_out_values.
      f_rematch002_taxi_out_values_data : out std_logic_vector(63 downto 0)
          := (others => '0');

      -- Interface for field rematch003_taxi_out_values:
      -- rematch003_taxi_out_values.
      f_rematch003_taxi_out_values_data : out std_logic_vector(63 downto 0)
          := (others => '0');

      -- Interface for field rematch004_taxi_out_values:
      -- rematch004_taxi_out_values.
      f_rematch004_taxi_out_values_data : out std_logic_vector(63 downto 0)
          := (others => '0');

      -- Interface for field rematch005_taxi_out_values:
      -- rematch005_taxi_out_values.
      f_rematch005_taxi_out_values_data : out std_logic_vector(63 downto 0)
          := (others => '0');

      -- Interface for field rematch006_taxi_out_values:
      -- rematch006_taxi_out_values.
      f_rematch006_taxi_out_values_data : out std_logic_vector(63 downto 0)
          := (others => '0');

      -- Interface for field rematch007_taxi_out_values:
      -- rematch007_taxi_out_values.
      f_rematch007_taxi_out_values_data : out std_logic_vector(63 downto 0)
          := (others => '0');

      -- Interface for field rematch008_taxi_out_values:
      -- rematch008_taxi_out_values.
      f_rematch008_taxi_out_values_data : out std_logic_vector(63 downto 0)
          := (others => '0');

      -- Interface for field rematch009_taxi_out_values:
      -- rematch009_taxi_out_values.
      f_rematch009_taxi_out_values_data : out std_logic_vector(63 downto 0)
          := (others => '0');

      -- Interface for field rematch010_taxi_out_values:
      -- rematch010_taxi_out_values.
      f_rematch010_taxi_out_values_data : out std_logic_vector(63 downto 0)
          := (others => '0');

      -- Interface for field rematch011_taxi_out_values:
      -- rematch011_taxi_out_values.
      f_rematch011_taxi_out_values_data : out std_logic_vector(63 downto 0)
          := (others => '0');

      -- Interface for field rematch012_taxi_out_values:
      -- rematch012_taxi_out_values.
      f_rematch012_taxi_out_values_data : out std_logic_vector(63 downto 0)
          := (others => '0');

      -- Interface for field rematch013_taxi_out_values:
      -- rematch013_taxi_out_values.
      f_rematch013_taxi_out_values_data : out std_logic_vector(63 downto 0)
          := (others => '0');

      -- Interface for field rematch014_taxi_out_values:
      -- rematch014_taxi_out_values.
      f_rematch014_taxi_out_values_data : out std_logic_vector(63 downto 0)
          := (others => '0');

      -- Interface for field rematch015_taxi_out_values:
      -- rematch015_taxi_out_values.
      f_rematch015_taxi_out_values_data : out std_logic_vector(63 downto 0)
          := (others => '0');

      -- Interface for field rematch000_taxi_count: rematch000_taxi_count.
      f_rematch000_taxi_count_write_data : in std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch000_errors: rematch000_errors.
      f_rematch000_errors_write_data : in std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch001_taxi_count: rematch001_taxi_count.
      f_rematch001_taxi_count_write_data : in std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch001_errors: rematch001_errors.
      f_rematch001_errors_write_data : in std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch002_taxi_count: rematch002_taxi_count.
      f_rematch002_taxi_count_write_data : in std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch002_errors: rematch002_errors.
      f_rematch002_errors_write_data : in std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch003_taxi_count: rematch003_taxi_count.
      f_rematch003_taxi_count_write_data : in std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch003_errors: rematch003_errors.
      f_rematch003_errors_write_data : in std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch004_taxi_count: rematch004_taxi_count.
      f_rematch004_taxi_count_write_data : in std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch004_errors: rematch004_errors.
      f_rematch004_errors_write_data : in std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch005_taxi_count: rematch005_taxi_count.
      f_rematch005_taxi_count_write_data : in std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch005_errors: rematch005_errors.
      f_rematch005_errors_write_data : in std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch006_taxi_count: rematch006_taxi_count.
      f_rematch006_taxi_count_write_data : in std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch006_errors: rematch006_errors.
      f_rematch006_errors_write_data : in std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch007_taxi_count: rematch007_taxi_count.
      f_rematch007_taxi_count_write_data : in std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch007_errors: rematch007_errors.
      f_rematch007_errors_write_data : in std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch008_taxi_count: rematch008_taxi_count.
      f_rematch008_taxi_count_write_data : in std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch008_errors: rematch008_errors.
      f_rematch008_errors_write_data : in std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch009_taxi_count: rematch009_taxi_count.
      f_rematch009_taxi_count_write_data : in std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch009_errors: rematch009_errors.
      f_rematch009_errors_write_data : in std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch010_taxi_count: rematch010_taxi_count.
      f_rematch010_taxi_count_write_data : in std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch010_errors: rematch010_errors.
      f_rematch010_errors_write_data : in std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch011_taxi_count: rematch011_taxi_count.
      f_rematch011_taxi_count_write_data : in std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch011_errors: rematch011_errors.
      f_rematch011_errors_write_data : in std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch012_taxi_count: rematch012_taxi_count.
      f_rematch012_taxi_count_write_data : in std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch012_errors: rematch012_errors.
      f_rematch012_errors_write_data : in std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch013_taxi_count: rematch013_taxi_count.
      f_rematch013_taxi_count_write_data : in std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch013_errors: rematch013_errors.
      f_rematch013_errors_write_data : in std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch014_taxi_count: rematch014_taxi_count.
      f_rematch014_taxi_count_write_data : in std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch014_errors: rematch014_errors.
      f_rematch014_errors_write_data : in std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch015_taxi_count: rematch015_taxi_count.
      f_rematch015_taxi_count_write_data : in std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field rematch015_errors: rematch015_errors.
      f_rematch015_errors_write_data : in std_logic_vector(31 downto 0)
          := (others => '0');

      -- Interface for field Profile_enable: Profile_enable.
      f_Profile_enable_data : out std_logic := '0';

      -- Interface for field Profile_clear: Profile_clear.
      f_Profile_clear_data : out std_logic := '0';

      -- AXI4-lite + interrupt request bus to the master.
      mmio_awvalid : in  std_logic := '0';
      mmio_awready : out std_logic := '1';
      mmio_awaddr  : in  std_logic_vector(31 downto 0) := X"00000000";
      mmio_awprot  : in  std_logic_vector(2 downto 0) := "000";
      mmio_wvalid  : in  std_logic := '0';
      mmio_wready  : out std_logic := '1';
      mmio_wdata   : in  std_logic_vector(31 downto 0) := (others => '0');
      mmio_wstrb   : in  std_logic_vector(3 downto 0) := (others => '0');
      mmio_bvalid  : out std_logic := '0';
      mmio_bready  : in  std_logic := '1';
      mmio_bresp   : out std_logic_vector(1 downto 0) := "00";
      mmio_arvalid : in  std_logic := '0';
      mmio_arready : out std_logic := '1';
      mmio_araddr  : in  std_logic_vector(31 downto 0) := X"00000000";
      mmio_arprot  : in  std_logic_vector(2 downto 0) := "000";
      mmio_rvalid  : out std_logic := '0';
      mmio_rready  : in  std_logic := '1';
      mmio_rdata   : out std_logic_vector(31 downto 0) := (others => '0');
      mmio_rresp   : out std_logic_vector(1 downto 0) := "00";
      mmio_uirq    : out std_logic := '0'

    );
  end component;

end package mmio_pkg;
