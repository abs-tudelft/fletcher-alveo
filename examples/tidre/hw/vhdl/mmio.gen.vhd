-- Generated using vhdMMIO 0.0.3 (https://github.com/abs-tudelft/vhdmmio)

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;

library work;
use work.vhdmmio_pkg.all;
use work.mmio_pkg.all;

entity mmio is
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
end mmio;

architecture behavioral of mmio is
begin
  reg_proc: process (kcd_clk) is

    -- Convenience function for unsigned accumulation with differing vector
    -- widths.
    procedure accum_add(
      accum: inout std_logic_vector;
      addend: std_logic_vector) is
    begin
      accum := std_logic_vector(
        unsigned(accum) + resize(unsigned(addend), accum'length));
    end procedure accum_add;

    -- Convenience function for unsigned subtraction with differing vector
    -- widths.
    procedure accum_sub(
      accum: inout std_logic_vector;
      addend: std_logic_vector) is
    begin
      accum := std_logic_vector(
        unsigned(accum) - resize(unsigned(addend), accum'length));
    end procedure accum_sub;

    -- Internal alias for the reset input.
    variable reset : std_logic;

    -- Bus response output register.
    variable bus_v : axi4l32_s2m_type := AXI4L32_S2M_RESET; -- reg

    -- Holding registers for the AXI4-lite request channels. Having these
    -- allows us to make the accompanying ready signals register outputs
    -- without sacrificing a cycle's worth of delay for every transaction.
    variable awl : axi4la_type := AXI4LA_RESET; -- reg
    variable wl  : axi4lw32_type := AXI4LW32_RESET; -- reg
    variable arl : axi4la_type := AXI4LA_RESET; -- reg

    -- Request flags for the register logic. When asserted, a request is
    -- present in awl/wl/arl, and the response can be returned immediately.
    -- This is used by simple registers.
    variable w_req : boolean := false;
    variable r_req : boolean := false;

    -- As above, but asserted when there is a request that can NOT be returned
    -- immediately for whatever reason, but CAN be started already if deferral
    -- is supported by the targeted block. Abbreviation for lookahead request.
    -- Note that *_lreq implies *_req.
    variable w_lreq : boolean := false;
    variable r_lreq : boolean := false;

    -- Request signals. w_strb is a validity bit for each data bit; it actually
    -- always has byte granularity but encoding it this way makes the code a
    -- lot nicer (and it should be optimized to the same thing by any sane
    -- synthesizer).
    variable w_addr : std_logic_vector(31 downto 0);
    variable w_data : std_logic_vector(31 downto 0) := (others => '0');
    variable w_strb : std_logic_vector(31 downto 0) := (others => '0');
    constant w_prot : std_logic_vector(2 downto 0) := (others => '0');
    variable r_addr : std_logic_vector(31 downto 0);
    constant r_prot : std_logic_vector(2 downto 0) := (others => '0');

    -- Logical write data holding registers. For multi-word registers, write
    -- data is held in w_hold and w_hstb until the last subregister is written,
    -- at which point their entire contents are written at once.
    variable w_hold : std_logic_vector(63 downto 0) := (others => '0'); -- reg
    variable w_hstb : std_logic_vector(63 downto 0) := (others => '0'); -- reg

    -- Between the first and last access to a multiword register, the multi
    -- bit will be set. If it is set while a request with a different *_prot is
    -- received, the interrupting request is rejected if it is A) non-secure
    -- while the interrupted request is secure or B) unprivileged while the
    -- interrupted request is privileged. If it is not rejected, previously
    -- buffered data is cleared and masked. Within the same security level, it
    -- is up to the bus master to not mess up its own access pattern. The last
    -- access to a multiword register clears the bit; for the read end r_hold
    -- is also cleared in this case to prevent data leaks.
    variable w_multi : std_logic := '0'; -- reg
    variable r_multi : std_logic := '0'; -- reg

    -- Response flags. When *_req is set and *_addr matches a register, it must
    -- set at least one of these flags; when *_rreq is set and *_rtag matches a
    -- register, it must also set at least one of these, except it cannot set
    -- *_defer. A decode error can be generated by intentionally NOT setting
    -- any of these flags, but this should only be done by registers that
    -- contain only one field (usually, these would be AXI-lite passthrough
    -- "registers"). The action taken by the non-register-specific logic is as
    -- follows (priority decoder):
    --
    --  - if *_defer is set, push *_dtag into the deferal FIFO;
    --  - if *_block is set, do nothing;
    --  - otherwise, if *_nack is set, send a slave error response;
    --  - otherwise, if *_ack is set, send a positive response;
    --  - otherwise, send a decode error response.
    --
    -- In addition to the above, the request stream(s) will be handshaked if
    -- *_req was set and a response is sent or the response is deferred.
    -- Likewise, the deferal FIFO will be popped if *_rreq was set and a
    -- response is sent.
    --
    -- The valid states can be summarized as follows:
    --
    -- .----------------------------------------------------------------------------------.
    -- | req | lreq | rreq || ack | nack | block | defer || request | response | defer    |
    -- |-----+------+------||-----+------+-------+-------||---------+----------+----------|
    -- |  0  |  0   |  0   ||  0  |  0   |   0   |   0   ||         |          |          | Idle.
    -- |-----+------+------||-----+------+-------+-------||---------+----------+----------|
    -- |  0  |  0   |  1   ||  0  |  0   |   0   |   0   ||         | dec_err  | pop      | Completing
    -- |  0  |  0   |  1   ||  1  |  0   |   0   |   0   ||         | ack      | pop      | previous,
    -- |  0  |  0   |  1   ||  -  |  1   |   0   |   0   ||         | slv_err  | pop      | no
    -- |  0  |  0   |  1   ||  -  |  -   |   1   |   0   ||         |          |          | lookahead.
    -- |-----+------+------||-----+------+-------+-------||---------+----------+----------|
    -- |  1  |  0   |  0   ||  0  |  0   |   0   |   0   || accept  | dec_err  |          | Responding
    -- |  1  |  0   |  0   ||  1  |  0   |   0   |   0   || accept  | ack      |          | immediately
    -- |  1  |  0   |  0   ||  -  |  1   |   0   |   0   || accept  | slv_err  |          | to incoming
    -- |  1  |  0   |  0   ||  -  |  -   |   1   |   0   ||         |          |          | request.
    -- |-----+------+------||-----+------+-------+-------||---------+----------+----------|
    -- |  1  |  0   |  0   ||  0  |  0   |   0   |   1   || accept  |          | push     | Deferring.
    -- |  0  |  1   |  0   ||  0  |  0   |   0   |   1   || accept  |          | push     | Deferring.
    -- |-----+------+------||-----+------+-------+-------||---------+----------+----------|
    -- |  0  |  1   |  1   ||  0  |  0   |   0   |   0   ||         | dec_err  | pop      | Completing
    -- |  0  |  1   |  1   ||  1  |  0   |   0   |   0   ||         | ack      | pop      | previous,
    -- |  0  |  1   |  1   ||  -  |  1   |   0   |   0   ||         | slv_err  | pop      | ignoring
    -- |  0  |  1   |  1   ||  -  |  -   |   1   |   0   ||         |          |          | lookahead.
    -- |-----+------+------||-----+------+-------+-------||---------+----------+----------|
    -- |  0  |  1   |  1   ||  0  |  0   |   0   |   1   || accept  | dec_err  | pop+push | Completing
    -- |  0  |  1   |  1   ||  1  |  0   |   0   |   1   || accept  | ack      | pop+push | previous,
    -- |  0  |  1   |  1   ||  -  |  1   |   0   |   1   || accept  | slv_err  | pop+push | deferring
    -- |  0  |  1   |  1   ||  -  |  -   |   1   |   1   || accept  |          | push     | lookahead.
    -- '----------------------------------------------------------------------------------'
    --
    -- This can be simplified to the following:
    --
    -- .----------------------------------------------------------------------------------.
    -- | req | lreq | rreq || ack | nack | block | defer || request | response | defer    |
    -- |-----+------+------||-----+------+-------+-------||---------+----------+----------|
    -- |  -  |  -   |  -   ||  -  |  -   |   1   |   -   ||         |          |          |
    -- |-----+------+------||-----+------+-------+-------||---------+----------+----------|
    -- |  -  |  -   |  1   ||  -  |  1   |   0   |   -   ||         | slv_err  | pop      |
    -- |  1  |  -   |  0   ||  -  |  1   |   0   |   -   || accept  | slv_err  |          |
    -- |-----+------+------||-----+------+-------+-------||---------+----------+----------|
    -- |  -  |  -   |  1   ||  1  |  0   |   0   |   -   ||         | ack      | pop      |
    -- |  1  |  -   |  0   ||  1  |  0   |   0   |   -   || accept  | ack      |          |
    -- |-----+------+------||-----+------+-------+-------||---------+----------+----------|
    -- |  -  |  -   |  1   ||  0  |  0   |   0   |   -   ||         | dec_err  | pop      |
    -- |  1  |  -   |  0   ||  0  |  0   |   0   |   -   || accept  | dec_err  |          |
    -- |-----+------+------||-----+------+-------+-------||---------+----------+----------|
    -- |  -  |  -   |  -   ||  -  |  -   |   -   |   1   || accept  |          | push     |
    -- '----------------------------------------------------------------------------------'
    --
    variable w_block : boolean := false;
    variable r_block : boolean := false;
    variable w_nack  : boolean := false;
    variable r_nack  : boolean := false;
    variable w_ack   : boolean := false;
    variable r_ack   : boolean := false;

    -- Logical read data holding register. This is set when r_ack is set during
    -- an access to the first physical register of a logical register for all
    -- fields in the logical register.
    variable r_hold  : std_logic_vector(63 downto 0) := (others => '0'); -- reg

    -- Physical read data. This is taken from r_hold based on which physical
    -- subregister is being read.
    variable r_data  : std_logic_vector(31 downto 0);

    -- Subaddress variables, used to index within large fields like memories and
    -- AXI passthroughs.
    variable subaddr_none         : std_logic_vector(0 downto 0);

    -- Private declarations for field start: start.
    type f_start_r_type is record
      d : std_logic;
      v : std_logic;
      inval : std_logic;
    end record;
    constant F_START_R_RESET : f_start_r_type := (
      d => '0',
      v => '0',
      inval => '0'
    );
    type f_start_r_array is array (natural range <>) of f_start_r_type;
    variable f_start_r : f_start_r_array(0 to 0) := (others => F_START_R_RESET);

    -- Private declarations for field stop: stop.
    type f_stop_r_type is record
      d : std_logic;
      v : std_logic;
      inval : std_logic;
    end record;
    constant F_STOP_R_RESET : f_stop_r_type := (
      d => '0',
      v => '0',
      inval => '0'
    );
    type f_stop_r_array is array (natural range <>) of f_stop_r_type;
    variable f_stop_r : f_stop_r_array(0 to 0) := (others => F_STOP_R_RESET);

    -- Private declarations for field reset: reset.
    type f_reset_r_type is record
      d : std_logic;
      v : std_logic;
      inval : std_logic;
    end record;
    constant F_RESET_R_RESET : f_reset_r_type := (
      d => '0',
      v => '0',
      inval => '0'
    );
    type f_reset_r_array is array (natural range <>) of f_reset_r_type;
    variable f_reset_r : f_reset_r_array(0 to 0) := (others => F_RESET_R_RESET);

    -- Private declarations for field idle: idle.
    type f_idle_r_type is record
      d : std_logic;
      v : std_logic;
    end record;
    constant F_IDLE_R_RESET : f_idle_r_type := (
      d => '0',
      v => '0'
    );
    type f_idle_r_array is array (natural range <>) of f_idle_r_type;
    variable f_idle_r : f_idle_r_array(0 to 0) := (others => F_IDLE_R_RESET);

    -- Private declarations for field busy: busy.
    type f_busy_r_type is record
      d : std_logic;
      v : std_logic;
    end record;
    constant F_BUSY_R_RESET : f_busy_r_type := (
      d => '0',
      v => '0'
    );
    type f_busy_r_array is array (natural range <>) of f_busy_r_type;
    variable f_busy_r : f_busy_r_array(0 to 0) := (others => F_BUSY_R_RESET);

    -- Private declarations for field done: done.
    type f_done_r_type is record
      d : std_logic;
      v : std_logic;
    end record;
    constant F_DONE_R_RESET : f_done_r_type := (
      d => '0',
      v => '0'
    );
    type f_done_r_array is array (natural range <>) of f_done_r_type;
    variable f_done_r : f_done_r_array(0 to 0) := (others => F_DONE_R_RESET);

    -- Private declarations for field result: result.
    type f_result_r_type is record
      d : std_logic_vector(63 downto 0);
      v : std_logic;
    end record;
    constant F_RESULT_R_RESET : f_result_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_result_r_array is array (natural range <>) of f_result_r_type;
    variable f_result_r : f_result_r_array(0 to 0)
        := (others => F_RESULT_R_RESET);

    -- Private declarations for field rematch000_firstidx: rematch000_firstidx.
    type f_rematch000_firstidx_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH000_FIRSTIDX_R_RESET : f_rematch000_firstidx_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch000_firstidx_r_array is array (natural range <>) of f_rematch000_firstidx_r_type;
    variable f_rematch000_firstidx_r : f_rematch000_firstidx_r_array(0 to 0)
        := (others => F_REMATCH000_FIRSTIDX_R_RESET);

    -- Private declarations for field rematch000_lastidx: rematch000_lastidx.
    type f_rematch000_lastidx_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH000_LASTIDX_R_RESET : f_rematch000_lastidx_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch000_lastidx_r_array is array (natural range <>) of f_rematch000_lastidx_r_type;
    variable f_rematch000_lastidx_r : f_rematch000_lastidx_r_array(0 to 0)
        := (others => F_REMATCH000_LASTIDX_R_RESET);

    -- Private declarations for field rematch001_firstidx: rematch001_firstidx.
    type f_rematch001_firstidx_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH001_FIRSTIDX_R_RESET : f_rematch001_firstidx_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch001_firstidx_r_array is array (natural range <>) of f_rematch001_firstidx_r_type;
    variable f_rematch001_firstidx_r : f_rematch001_firstidx_r_array(0 to 0)
        := (others => F_REMATCH001_FIRSTIDX_R_RESET);

    -- Private declarations for field rematch001_lastidx: rematch001_lastidx.
    type f_rematch001_lastidx_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH001_LASTIDX_R_RESET : f_rematch001_lastidx_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch001_lastidx_r_array is array (natural range <>) of f_rematch001_lastidx_r_type;
    variable f_rematch001_lastidx_r : f_rematch001_lastidx_r_array(0 to 0)
        := (others => F_REMATCH001_LASTIDX_R_RESET);

    -- Private declarations for field rematch002_firstidx: rematch002_firstidx.
    type f_rematch002_firstidx_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH002_FIRSTIDX_R_RESET : f_rematch002_firstidx_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch002_firstidx_r_array is array (natural range <>) of f_rematch002_firstidx_r_type;
    variable f_rematch002_firstidx_r : f_rematch002_firstidx_r_array(0 to 0)
        := (others => F_REMATCH002_FIRSTIDX_R_RESET);

    -- Private declarations for field rematch002_lastidx: rematch002_lastidx.
    type f_rematch002_lastidx_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH002_LASTIDX_R_RESET : f_rematch002_lastidx_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch002_lastidx_r_array is array (natural range <>) of f_rematch002_lastidx_r_type;
    variable f_rematch002_lastidx_r : f_rematch002_lastidx_r_array(0 to 0)
        := (others => F_REMATCH002_LASTIDX_R_RESET);

    -- Private declarations for field rematch003_firstidx: rematch003_firstidx.
    type f_rematch003_firstidx_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH003_FIRSTIDX_R_RESET : f_rematch003_firstidx_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch003_firstidx_r_array is array (natural range <>) of f_rematch003_firstidx_r_type;
    variable f_rematch003_firstidx_r : f_rematch003_firstidx_r_array(0 to 0)
        := (others => F_REMATCH003_FIRSTIDX_R_RESET);

    -- Private declarations for field rematch003_lastidx: rematch003_lastidx.
    type f_rematch003_lastidx_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH003_LASTIDX_R_RESET : f_rematch003_lastidx_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch003_lastidx_r_array is array (natural range <>) of f_rematch003_lastidx_r_type;
    variable f_rematch003_lastidx_r : f_rematch003_lastidx_r_array(0 to 0)
        := (others => F_REMATCH003_LASTIDX_R_RESET);

    -- Private declarations for field rematch004_firstidx: rematch004_firstidx.
    type f_rematch004_firstidx_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH004_FIRSTIDX_R_RESET : f_rematch004_firstidx_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch004_firstidx_r_array is array (natural range <>) of f_rematch004_firstidx_r_type;
    variable f_rematch004_firstidx_r : f_rematch004_firstidx_r_array(0 to 0)
        := (others => F_REMATCH004_FIRSTIDX_R_RESET);

    -- Private declarations for field rematch004_lastidx: rematch004_lastidx.
    type f_rematch004_lastidx_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH004_LASTIDX_R_RESET : f_rematch004_lastidx_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch004_lastidx_r_array is array (natural range <>) of f_rematch004_lastidx_r_type;
    variable f_rematch004_lastidx_r : f_rematch004_lastidx_r_array(0 to 0)
        := (others => F_REMATCH004_LASTIDX_R_RESET);

    -- Private declarations for field rematch005_firstidx: rematch005_firstidx.
    type f_rematch005_firstidx_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH005_FIRSTIDX_R_RESET : f_rematch005_firstidx_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch005_firstidx_r_array is array (natural range <>) of f_rematch005_firstidx_r_type;
    variable f_rematch005_firstidx_r : f_rematch005_firstidx_r_array(0 to 0)
        := (others => F_REMATCH005_FIRSTIDX_R_RESET);

    -- Private declarations for field rematch005_lastidx: rematch005_lastidx.
    type f_rematch005_lastidx_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH005_LASTIDX_R_RESET : f_rematch005_lastidx_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch005_lastidx_r_array is array (natural range <>) of f_rematch005_lastidx_r_type;
    variable f_rematch005_lastidx_r : f_rematch005_lastidx_r_array(0 to 0)
        := (others => F_REMATCH005_LASTIDX_R_RESET);

    -- Private declarations for field rematch006_firstidx: rematch006_firstidx.
    type f_rematch006_firstidx_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH006_FIRSTIDX_R_RESET : f_rematch006_firstidx_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch006_firstidx_r_array is array (natural range <>) of f_rematch006_firstidx_r_type;
    variable f_rematch006_firstidx_r : f_rematch006_firstidx_r_array(0 to 0)
        := (others => F_REMATCH006_FIRSTIDX_R_RESET);

    -- Private declarations for field rematch006_lastidx: rematch006_lastidx.
    type f_rematch006_lastidx_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH006_LASTIDX_R_RESET : f_rematch006_lastidx_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch006_lastidx_r_array is array (natural range <>) of f_rematch006_lastidx_r_type;
    variable f_rematch006_lastidx_r : f_rematch006_lastidx_r_array(0 to 0)
        := (others => F_REMATCH006_LASTIDX_R_RESET);

    -- Private declarations for field rematch007_firstidx: rematch007_firstidx.
    type f_rematch007_firstidx_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH007_FIRSTIDX_R_RESET : f_rematch007_firstidx_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch007_firstidx_r_array is array (natural range <>) of f_rematch007_firstidx_r_type;
    variable f_rematch007_firstidx_r : f_rematch007_firstidx_r_array(0 to 0)
        := (others => F_REMATCH007_FIRSTIDX_R_RESET);

    -- Private declarations for field rematch007_lastidx: rematch007_lastidx.
    type f_rematch007_lastidx_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH007_LASTIDX_R_RESET : f_rematch007_lastidx_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch007_lastidx_r_array is array (natural range <>) of f_rematch007_lastidx_r_type;
    variable f_rematch007_lastidx_r : f_rematch007_lastidx_r_array(0 to 0)
        := (others => F_REMATCH007_LASTIDX_R_RESET);

    -- Private declarations for field rematch008_firstidx: rematch008_firstidx.
    type f_rematch008_firstidx_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH008_FIRSTIDX_R_RESET : f_rematch008_firstidx_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch008_firstidx_r_array is array (natural range <>) of f_rematch008_firstidx_r_type;
    variable f_rematch008_firstidx_r : f_rematch008_firstidx_r_array(0 to 0)
        := (others => F_REMATCH008_FIRSTIDX_R_RESET);

    -- Private declarations for field rematch008_lastidx: rematch008_lastidx.
    type f_rematch008_lastidx_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH008_LASTIDX_R_RESET : f_rematch008_lastidx_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch008_lastidx_r_array is array (natural range <>) of f_rematch008_lastidx_r_type;
    variable f_rematch008_lastidx_r : f_rematch008_lastidx_r_array(0 to 0)
        := (others => F_REMATCH008_LASTIDX_R_RESET);

    -- Private declarations for field rematch009_firstidx: rematch009_firstidx.
    type f_rematch009_firstidx_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH009_FIRSTIDX_R_RESET : f_rematch009_firstidx_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch009_firstidx_r_array is array (natural range <>) of f_rematch009_firstidx_r_type;
    variable f_rematch009_firstidx_r : f_rematch009_firstidx_r_array(0 to 0)
        := (others => F_REMATCH009_FIRSTIDX_R_RESET);

    -- Private declarations for field rematch009_lastidx: rematch009_lastidx.
    type f_rematch009_lastidx_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH009_LASTIDX_R_RESET : f_rematch009_lastidx_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch009_lastidx_r_array is array (natural range <>) of f_rematch009_lastidx_r_type;
    variable f_rematch009_lastidx_r : f_rematch009_lastidx_r_array(0 to 0)
        := (others => F_REMATCH009_LASTIDX_R_RESET);

    -- Private declarations for field rematch010_firstidx: rematch010_firstidx.
    type f_rematch010_firstidx_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH010_FIRSTIDX_R_RESET : f_rematch010_firstidx_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch010_firstidx_r_array is array (natural range <>) of f_rematch010_firstidx_r_type;
    variable f_rematch010_firstidx_r : f_rematch010_firstidx_r_array(0 to 0)
        := (others => F_REMATCH010_FIRSTIDX_R_RESET);

    -- Private declarations for field rematch010_lastidx: rematch010_lastidx.
    type f_rematch010_lastidx_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH010_LASTIDX_R_RESET : f_rematch010_lastidx_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch010_lastidx_r_array is array (natural range <>) of f_rematch010_lastidx_r_type;
    variable f_rematch010_lastidx_r : f_rematch010_lastidx_r_array(0 to 0)
        := (others => F_REMATCH010_LASTIDX_R_RESET);

    -- Private declarations for field rematch011_firstidx: rematch011_firstidx.
    type f_rematch011_firstidx_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH011_FIRSTIDX_R_RESET : f_rematch011_firstidx_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch011_firstidx_r_array is array (natural range <>) of f_rematch011_firstidx_r_type;
    variable f_rematch011_firstidx_r : f_rematch011_firstidx_r_array(0 to 0)
        := (others => F_REMATCH011_FIRSTIDX_R_RESET);

    -- Private declarations for field rematch011_lastidx: rematch011_lastidx.
    type f_rematch011_lastidx_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH011_LASTIDX_R_RESET : f_rematch011_lastidx_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch011_lastidx_r_array is array (natural range <>) of f_rematch011_lastidx_r_type;
    variable f_rematch011_lastidx_r : f_rematch011_lastidx_r_array(0 to 0)
        := (others => F_REMATCH011_LASTIDX_R_RESET);

    -- Private declarations for field rematch012_firstidx: rematch012_firstidx.
    type f_rematch012_firstidx_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH012_FIRSTIDX_R_RESET : f_rematch012_firstidx_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch012_firstidx_r_array is array (natural range <>) of f_rematch012_firstidx_r_type;
    variable f_rematch012_firstidx_r : f_rematch012_firstidx_r_array(0 to 0)
        := (others => F_REMATCH012_FIRSTIDX_R_RESET);

    -- Private declarations for field rematch012_lastidx: rematch012_lastidx.
    type f_rematch012_lastidx_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH012_LASTIDX_R_RESET : f_rematch012_lastidx_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch012_lastidx_r_array is array (natural range <>) of f_rematch012_lastidx_r_type;
    variable f_rematch012_lastidx_r : f_rematch012_lastidx_r_array(0 to 0)
        := (others => F_REMATCH012_LASTIDX_R_RESET);

    -- Private declarations for field rematch013_firstidx: rematch013_firstidx.
    type f_rematch013_firstidx_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH013_FIRSTIDX_R_RESET : f_rematch013_firstidx_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch013_firstidx_r_array is array (natural range <>) of f_rematch013_firstidx_r_type;
    variable f_rematch013_firstidx_r : f_rematch013_firstidx_r_array(0 to 0)
        := (others => F_REMATCH013_FIRSTIDX_R_RESET);

    -- Private declarations for field rematch013_lastidx: rematch013_lastidx.
    type f_rematch013_lastidx_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH013_LASTIDX_R_RESET : f_rematch013_lastidx_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch013_lastidx_r_array is array (natural range <>) of f_rematch013_lastidx_r_type;
    variable f_rematch013_lastidx_r : f_rematch013_lastidx_r_array(0 to 0)
        := (others => F_REMATCH013_LASTIDX_R_RESET);

    -- Private declarations for field rematch014_firstidx: rematch014_firstidx.
    type f_rematch014_firstidx_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH014_FIRSTIDX_R_RESET : f_rematch014_firstidx_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch014_firstidx_r_array is array (natural range <>) of f_rematch014_firstidx_r_type;
    variable f_rematch014_firstidx_r : f_rematch014_firstidx_r_array(0 to 0)
        := (others => F_REMATCH014_FIRSTIDX_R_RESET);

    -- Private declarations for field rematch014_lastidx: rematch014_lastidx.
    type f_rematch014_lastidx_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH014_LASTIDX_R_RESET : f_rematch014_lastidx_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch014_lastidx_r_array is array (natural range <>) of f_rematch014_lastidx_r_type;
    variable f_rematch014_lastidx_r : f_rematch014_lastidx_r_array(0 to 0)
        := (others => F_REMATCH014_LASTIDX_R_RESET);

    -- Private declarations for field rematch015_firstidx: rematch015_firstidx.
    type f_rematch015_firstidx_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH015_FIRSTIDX_R_RESET : f_rematch015_firstidx_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch015_firstidx_r_array is array (natural range <>) of f_rematch015_firstidx_r_type;
    variable f_rematch015_firstidx_r : f_rematch015_firstidx_r_array(0 to 0)
        := (others => F_REMATCH015_FIRSTIDX_R_RESET);

    -- Private declarations for field rematch015_lastidx: rematch015_lastidx.
    type f_rematch015_lastidx_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH015_LASTIDX_R_RESET : f_rematch015_lastidx_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch015_lastidx_r_array is array (natural range <>) of f_rematch015_lastidx_r_type;
    variable f_rematch015_lastidx_r : f_rematch015_lastidx_r_array(0 to 0)
        := (others => F_REMATCH015_LASTIDX_R_RESET);

    -- Private declarations for field rematch000_taxi_firstidx:
    -- rematch000_taxi_firstidx.
    type f_rematch000_taxi_firstidx_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH000_TAXI_FIRSTIDX_R_RESET : f_rematch000_taxi_firstidx_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch000_taxi_firstidx_r_array is array (natural range <>) of f_rematch000_taxi_firstidx_r_type;
    variable f_rematch000_taxi_firstidx_r : f_rematch000_taxi_firstidx_r_array(0 to 0)
        := (others => F_REMATCH000_TAXI_FIRSTIDX_R_RESET);

    -- Private declarations for field rematch000_taxi_lastidx:
    -- rematch000_taxi_lastidx.
    type f_rematch000_taxi_lastidx_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH000_TAXI_LASTIDX_R_RESET : f_rematch000_taxi_lastidx_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch000_taxi_lastidx_r_array is array (natural range <>) of f_rematch000_taxi_lastidx_r_type;
    variable f_rematch000_taxi_lastidx_r : f_rematch000_taxi_lastidx_r_array(0 to 0)
        := (others => F_REMATCH000_TAXI_LASTIDX_R_RESET);

    -- Private declarations for field rematch001_taxi_firstidx:
    -- rematch001_taxi_firstidx.
    type f_rematch001_taxi_firstidx_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH001_TAXI_FIRSTIDX_R_RESET : f_rematch001_taxi_firstidx_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch001_taxi_firstidx_r_array is array (natural range <>) of f_rematch001_taxi_firstidx_r_type;
    variable f_rematch001_taxi_firstidx_r : f_rematch001_taxi_firstidx_r_array(0 to 0)
        := (others => F_REMATCH001_TAXI_FIRSTIDX_R_RESET);

    -- Private declarations for field rematch001_taxi_lastidx:
    -- rematch001_taxi_lastidx.
    type f_rematch001_taxi_lastidx_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH001_TAXI_LASTIDX_R_RESET : f_rematch001_taxi_lastidx_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch001_taxi_lastidx_r_array is array (natural range <>) of f_rematch001_taxi_lastidx_r_type;
    variable f_rematch001_taxi_lastidx_r : f_rematch001_taxi_lastidx_r_array(0 to 0)
        := (others => F_REMATCH001_TAXI_LASTIDX_R_RESET);

    -- Private declarations for field rematch002_taxi_firstidx:
    -- rematch002_taxi_firstidx.
    type f_rematch002_taxi_firstidx_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH002_TAXI_FIRSTIDX_R_RESET : f_rematch002_taxi_firstidx_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch002_taxi_firstidx_r_array is array (natural range <>) of f_rematch002_taxi_firstidx_r_type;
    variable f_rematch002_taxi_firstidx_r : f_rematch002_taxi_firstidx_r_array(0 to 0)
        := (others => F_REMATCH002_TAXI_FIRSTIDX_R_RESET);

    -- Private declarations for field rematch002_taxi_lastidx:
    -- rematch002_taxi_lastidx.
    type f_rematch002_taxi_lastidx_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH002_TAXI_LASTIDX_R_RESET : f_rematch002_taxi_lastidx_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch002_taxi_lastidx_r_array is array (natural range <>) of f_rematch002_taxi_lastidx_r_type;
    variable f_rematch002_taxi_lastidx_r : f_rematch002_taxi_lastidx_r_array(0 to 0)
        := (others => F_REMATCH002_TAXI_LASTIDX_R_RESET);

    -- Private declarations for field rematch003_taxi_firstidx:
    -- rematch003_taxi_firstidx.
    type f_rematch003_taxi_firstidx_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH003_TAXI_FIRSTIDX_R_RESET : f_rematch003_taxi_firstidx_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch003_taxi_firstidx_r_array is array (natural range <>) of f_rematch003_taxi_firstidx_r_type;
    variable f_rematch003_taxi_firstidx_r : f_rematch003_taxi_firstidx_r_array(0 to 0)
        := (others => F_REMATCH003_TAXI_FIRSTIDX_R_RESET);

    -- Private declarations for field rematch003_taxi_lastidx:
    -- rematch003_taxi_lastidx.
    type f_rematch003_taxi_lastidx_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH003_TAXI_LASTIDX_R_RESET : f_rematch003_taxi_lastidx_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch003_taxi_lastidx_r_array is array (natural range <>) of f_rematch003_taxi_lastidx_r_type;
    variable f_rematch003_taxi_lastidx_r : f_rematch003_taxi_lastidx_r_array(0 to 0)
        := (others => F_REMATCH003_TAXI_LASTIDX_R_RESET);

    -- Private declarations for field rematch004_taxi_firstidx:
    -- rematch004_taxi_firstidx.
    type f_rematch004_taxi_firstidx_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH004_TAXI_FIRSTIDX_R_RESET : f_rematch004_taxi_firstidx_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch004_taxi_firstidx_r_array is array (natural range <>) of f_rematch004_taxi_firstidx_r_type;
    variable f_rematch004_taxi_firstidx_r : f_rematch004_taxi_firstidx_r_array(0 to 0)
        := (others => F_REMATCH004_TAXI_FIRSTIDX_R_RESET);

    -- Private declarations for field rematch004_taxi_lastidx:
    -- rematch004_taxi_lastidx.
    type f_rematch004_taxi_lastidx_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH004_TAXI_LASTIDX_R_RESET : f_rematch004_taxi_lastidx_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch004_taxi_lastidx_r_array is array (natural range <>) of f_rematch004_taxi_lastidx_r_type;
    variable f_rematch004_taxi_lastidx_r : f_rematch004_taxi_lastidx_r_array(0 to 0)
        := (others => F_REMATCH004_TAXI_LASTIDX_R_RESET);

    -- Private declarations for field rematch005_taxi_firstidx:
    -- rematch005_taxi_firstidx.
    type f_rematch005_taxi_firstidx_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH005_TAXI_FIRSTIDX_R_RESET : f_rematch005_taxi_firstidx_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch005_taxi_firstidx_r_array is array (natural range <>) of f_rematch005_taxi_firstidx_r_type;
    variable f_rematch005_taxi_firstidx_r : f_rematch005_taxi_firstidx_r_array(0 to 0)
        := (others => F_REMATCH005_TAXI_FIRSTIDX_R_RESET);

    -- Private declarations for field rematch005_taxi_lastidx:
    -- rematch005_taxi_lastidx.
    type f_rematch005_taxi_lastidx_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH005_TAXI_LASTIDX_R_RESET : f_rematch005_taxi_lastidx_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch005_taxi_lastidx_r_array is array (natural range <>) of f_rematch005_taxi_lastidx_r_type;
    variable f_rematch005_taxi_lastidx_r : f_rematch005_taxi_lastidx_r_array(0 to 0)
        := (others => F_REMATCH005_TAXI_LASTIDX_R_RESET);

    -- Private declarations for field rematch006_taxi_firstidx:
    -- rematch006_taxi_firstidx.
    type f_rematch006_taxi_firstidx_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH006_TAXI_FIRSTIDX_R_RESET : f_rematch006_taxi_firstidx_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch006_taxi_firstidx_r_array is array (natural range <>) of f_rematch006_taxi_firstidx_r_type;
    variable f_rematch006_taxi_firstidx_r : f_rematch006_taxi_firstidx_r_array(0 to 0)
        := (others => F_REMATCH006_TAXI_FIRSTIDX_R_RESET);

    -- Private declarations for field rematch006_taxi_lastidx:
    -- rematch006_taxi_lastidx.
    type f_rematch006_taxi_lastidx_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH006_TAXI_LASTIDX_R_RESET : f_rematch006_taxi_lastidx_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch006_taxi_lastidx_r_array is array (natural range <>) of f_rematch006_taxi_lastidx_r_type;
    variable f_rematch006_taxi_lastidx_r : f_rematch006_taxi_lastidx_r_array(0 to 0)
        := (others => F_REMATCH006_TAXI_LASTIDX_R_RESET);

    -- Private declarations for field rematch007_taxi_firstidx:
    -- rematch007_taxi_firstidx.
    type f_rematch007_taxi_firstidx_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH007_TAXI_FIRSTIDX_R_RESET : f_rematch007_taxi_firstidx_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch007_taxi_firstidx_r_array is array (natural range <>) of f_rematch007_taxi_firstidx_r_type;
    variable f_rematch007_taxi_firstidx_r : f_rematch007_taxi_firstidx_r_array(0 to 0)
        := (others => F_REMATCH007_TAXI_FIRSTIDX_R_RESET);

    -- Private declarations for field rematch007_taxi_lastidx:
    -- rematch007_taxi_lastidx.
    type f_rematch007_taxi_lastidx_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH007_TAXI_LASTIDX_R_RESET : f_rematch007_taxi_lastidx_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch007_taxi_lastidx_r_array is array (natural range <>) of f_rematch007_taxi_lastidx_r_type;
    variable f_rematch007_taxi_lastidx_r : f_rematch007_taxi_lastidx_r_array(0 to 0)
        := (others => F_REMATCH007_TAXI_LASTIDX_R_RESET);

    -- Private declarations for field rematch008_taxi_firstidx:
    -- rematch008_taxi_firstidx.
    type f_rematch008_taxi_firstidx_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH008_TAXI_FIRSTIDX_R_RESET : f_rematch008_taxi_firstidx_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch008_taxi_firstidx_r_array is array (natural range <>) of f_rematch008_taxi_firstidx_r_type;
    variable f_rematch008_taxi_firstidx_r : f_rematch008_taxi_firstidx_r_array(0 to 0)
        := (others => F_REMATCH008_TAXI_FIRSTIDX_R_RESET);

    -- Private declarations for field rematch008_taxi_lastidx:
    -- rematch008_taxi_lastidx.
    type f_rematch008_taxi_lastidx_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH008_TAXI_LASTIDX_R_RESET : f_rematch008_taxi_lastidx_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch008_taxi_lastidx_r_array is array (natural range <>) of f_rematch008_taxi_lastidx_r_type;
    variable f_rematch008_taxi_lastidx_r : f_rematch008_taxi_lastidx_r_array(0 to 0)
        := (others => F_REMATCH008_TAXI_LASTIDX_R_RESET);

    -- Private declarations for field rematch009_taxi_firstidx:
    -- rematch009_taxi_firstidx.
    type f_rematch009_taxi_firstidx_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH009_TAXI_FIRSTIDX_R_RESET : f_rematch009_taxi_firstidx_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch009_taxi_firstidx_r_array is array (natural range <>) of f_rematch009_taxi_firstidx_r_type;
    variable f_rematch009_taxi_firstidx_r : f_rematch009_taxi_firstidx_r_array(0 to 0)
        := (others => F_REMATCH009_TAXI_FIRSTIDX_R_RESET);

    -- Private declarations for field rematch009_taxi_lastidx:
    -- rematch009_taxi_lastidx.
    type f_rematch009_taxi_lastidx_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH009_TAXI_LASTIDX_R_RESET : f_rematch009_taxi_lastidx_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch009_taxi_lastidx_r_array is array (natural range <>) of f_rematch009_taxi_lastidx_r_type;
    variable f_rematch009_taxi_lastidx_r : f_rematch009_taxi_lastidx_r_array(0 to 0)
        := (others => F_REMATCH009_TAXI_LASTIDX_R_RESET);

    -- Private declarations for field rematch010_taxi_firstidx:
    -- rematch010_taxi_firstidx.
    type f_rematch010_taxi_firstidx_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH010_TAXI_FIRSTIDX_R_RESET : f_rematch010_taxi_firstidx_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch010_taxi_firstidx_r_array is array (natural range <>) of f_rematch010_taxi_firstidx_r_type;
    variable f_rematch010_taxi_firstidx_r : f_rematch010_taxi_firstidx_r_array(0 to 0)
        := (others => F_REMATCH010_TAXI_FIRSTIDX_R_RESET);

    -- Private declarations for field rematch010_taxi_lastidx:
    -- rematch010_taxi_lastidx.
    type f_rematch010_taxi_lastidx_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH010_TAXI_LASTIDX_R_RESET : f_rematch010_taxi_lastidx_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch010_taxi_lastidx_r_array is array (natural range <>) of f_rematch010_taxi_lastidx_r_type;
    variable f_rematch010_taxi_lastidx_r : f_rematch010_taxi_lastidx_r_array(0 to 0)
        := (others => F_REMATCH010_TAXI_LASTIDX_R_RESET);

    -- Private declarations for field rematch011_taxi_firstidx:
    -- rematch011_taxi_firstidx.
    type f_rematch011_taxi_firstidx_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH011_TAXI_FIRSTIDX_R_RESET : f_rematch011_taxi_firstidx_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch011_taxi_firstidx_r_array is array (natural range <>) of f_rematch011_taxi_firstidx_r_type;
    variable f_rematch011_taxi_firstidx_r : f_rematch011_taxi_firstidx_r_array(0 to 0)
        := (others => F_REMATCH011_TAXI_FIRSTIDX_R_RESET);

    -- Private declarations for field rematch011_taxi_lastidx:
    -- rematch011_taxi_lastidx.
    type f_rematch011_taxi_lastidx_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH011_TAXI_LASTIDX_R_RESET : f_rematch011_taxi_lastidx_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch011_taxi_lastidx_r_array is array (natural range <>) of f_rematch011_taxi_lastidx_r_type;
    variable f_rematch011_taxi_lastidx_r : f_rematch011_taxi_lastidx_r_array(0 to 0)
        := (others => F_REMATCH011_TAXI_LASTIDX_R_RESET);

    -- Private declarations for field rematch012_taxi_firstidx:
    -- rematch012_taxi_firstidx.
    type f_rematch012_taxi_firstidx_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH012_TAXI_FIRSTIDX_R_RESET : f_rematch012_taxi_firstidx_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch012_taxi_firstidx_r_array is array (natural range <>) of f_rematch012_taxi_firstidx_r_type;
    variable f_rematch012_taxi_firstidx_r : f_rematch012_taxi_firstidx_r_array(0 to 0)
        := (others => F_REMATCH012_TAXI_FIRSTIDX_R_RESET);

    -- Private declarations for field rematch012_taxi_lastidx:
    -- rematch012_taxi_lastidx.
    type f_rematch012_taxi_lastidx_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH012_TAXI_LASTIDX_R_RESET : f_rematch012_taxi_lastidx_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch012_taxi_lastidx_r_array is array (natural range <>) of f_rematch012_taxi_lastidx_r_type;
    variable f_rematch012_taxi_lastidx_r : f_rematch012_taxi_lastidx_r_array(0 to 0)
        := (others => F_REMATCH012_TAXI_LASTIDX_R_RESET);

    -- Private declarations for field rematch013_taxi_firstidx:
    -- rematch013_taxi_firstidx.
    type f_rematch013_taxi_firstidx_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH013_TAXI_FIRSTIDX_R_RESET : f_rematch013_taxi_firstidx_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch013_taxi_firstidx_r_array is array (natural range <>) of f_rematch013_taxi_firstidx_r_type;
    variable f_rematch013_taxi_firstidx_r : f_rematch013_taxi_firstidx_r_array(0 to 0)
        := (others => F_REMATCH013_TAXI_FIRSTIDX_R_RESET);

    -- Private declarations for field rematch013_taxi_lastidx:
    -- rematch013_taxi_lastidx.
    type f_rematch013_taxi_lastidx_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH013_TAXI_LASTIDX_R_RESET : f_rematch013_taxi_lastidx_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch013_taxi_lastidx_r_array is array (natural range <>) of f_rematch013_taxi_lastidx_r_type;
    variable f_rematch013_taxi_lastidx_r : f_rematch013_taxi_lastidx_r_array(0 to 0)
        := (others => F_REMATCH013_TAXI_LASTIDX_R_RESET);

    -- Private declarations for field rematch014_taxi_firstidx:
    -- rematch014_taxi_firstidx.
    type f_rematch014_taxi_firstidx_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH014_TAXI_FIRSTIDX_R_RESET : f_rematch014_taxi_firstidx_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch014_taxi_firstidx_r_array is array (natural range <>) of f_rematch014_taxi_firstidx_r_type;
    variable f_rematch014_taxi_firstidx_r : f_rematch014_taxi_firstidx_r_array(0 to 0)
        := (others => F_REMATCH014_TAXI_FIRSTIDX_R_RESET);

    -- Private declarations for field rematch014_taxi_lastidx:
    -- rematch014_taxi_lastidx.
    type f_rematch014_taxi_lastidx_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH014_TAXI_LASTIDX_R_RESET : f_rematch014_taxi_lastidx_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch014_taxi_lastidx_r_array is array (natural range <>) of f_rematch014_taxi_lastidx_r_type;
    variable f_rematch014_taxi_lastidx_r : f_rematch014_taxi_lastidx_r_array(0 to 0)
        := (others => F_REMATCH014_TAXI_LASTIDX_R_RESET);

    -- Private declarations for field rematch015_taxi_firstidx:
    -- rematch015_taxi_firstidx.
    type f_rematch015_taxi_firstidx_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH015_TAXI_FIRSTIDX_R_RESET : f_rematch015_taxi_firstidx_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch015_taxi_firstidx_r_array is array (natural range <>) of f_rematch015_taxi_firstidx_r_type;
    variable f_rematch015_taxi_firstidx_r : f_rematch015_taxi_firstidx_r_array(0 to 0)
        := (others => F_REMATCH015_TAXI_FIRSTIDX_R_RESET);

    -- Private declarations for field rematch015_taxi_lastidx:
    -- rematch015_taxi_lastidx.
    type f_rematch015_taxi_lastidx_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH015_TAXI_LASTIDX_R_RESET : f_rematch015_taxi_lastidx_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch015_taxi_lastidx_r_array is array (natural range <>) of f_rematch015_taxi_lastidx_r_type;
    variable f_rematch015_taxi_lastidx_r : f_rematch015_taxi_lastidx_r_array(0 to 0)
        := (others => F_REMATCH015_TAXI_LASTIDX_R_RESET);

    -- Private declarations for field rematch000_in_offsets:
    -- rematch000_in_offsets.
    type f_rematch000_in_offsets_r_type is record
      d : std_logic_vector(63 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH000_IN_OFFSETS_R_RESET : f_rematch000_in_offsets_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch000_in_offsets_r_array is array (natural range <>) of f_rematch000_in_offsets_r_type;
    variable f_rematch000_in_offsets_r : f_rematch000_in_offsets_r_array(0 to 0)
        := (others => F_REMATCH000_IN_OFFSETS_R_RESET);

    -- Private declarations for field rematch000_in_values:
    -- rematch000_in_values.
    type f_rematch000_in_values_r_type is record
      d : std_logic_vector(63 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH000_IN_VALUES_R_RESET : f_rematch000_in_values_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch000_in_values_r_array is array (natural range <>) of f_rematch000_in_values_r_type;
    variable f_rematch000_in_values_r : f_rematch000_in_values_r_array(0 to 0)
        := (others => F_REMATCH000_IN_VALUES_R_RESET);

    -- Private declarations for field rematch001_in_offsets:
    -- rematch001_in_offsets.
    type f_rematch001_in_offsets_r_type is record
      d : std_logic_vector(63 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH001_IN_OFFSETS_R_RESET : f_rematch001_in_offsets_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch001_in_offsets_r_array is array (natural range <>) of f_rematch001_in_offsets_r_type;
    variable f_rematch001_in_offsets_r : f_rematch001_in_offsets_r_array(0 to 0)
        := (others => F_REMATCH001_IN_OFFSETS_R_RESET);

    -- Private declarations for field rematch001_in_values:
    -- rematch001_in_values.
    type f_rematch001_in_values_r_type is record
      d : std_logic_vector(63 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH001_IN_VALUES_R_RESET : f_rematch001_in_values_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch001_in_values_r_array is array (natural range <>) of f_rematch001_in_values_r_type;
    variable f_rematch001_in_values_r : f_rematch001_in_values_r_array(0 to 0)
        := (others => F_REMATCH001_IN_VALUES_R_RESET);

    -- Private declarations for field rematch002_in_offsets:
    -- rematch002_in_offsets.
    type f_rematch002_in_offsets_r_type is record
      d : std_logic_vector(63 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH002_IN_OFFSETS_R_RESET : f_rematch002_in_offsets_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch002_in_offsets_r_array is array (natural range <>) of f_rematch002_in_offsets_r_type;
    variable f_rematch002_in_offsets_r : f_rematch002_in_offsets_r_array(0 to 0)
        := (others => F_REMATCH002_IN_OFFSETS_R_RESET);

    -- Private declarations for field rematch002_in_values:
    -- rematch002_in_values.
    type f_rematch002_in_values_r_type is record
      d : std_logic_vector(63 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH002_IN_VALUES_R_RESET : f_rematch002_in_values_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch002_in_values_r_array is array (natural range <>) of f_rematch002_in_values_r_type;
    variable f_rematch002_in_values_r : f_rematch002_in_values_r_array(0 to 0)
        := (others => F_REMATCH002_IN_VALUES_R_RESET);

    -- Private declarations for field rematch003_in_offsets:
    -- rematch003_in_offsets.
    type f_rematch003_in_offsets_r_type is record
      d : std_logic_vector(63 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH003_IN_OFFSETS_R_RESET : f_rematch003_in_offsets_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch003_in_offsets_r_array is array (natural range <>) of f_rematch003_in_offsets_r_type;
    variable f_rematch003_in_offsets_r : f_rematch003_in_offsets_r_array(0 to 0)
        := (others => F_REMATCH003_IN_OFFSETS_R_RESET);

    -- Private declarations for field rematch003_in_values:
    -- rematch003_in_values.
    type f_rematch003_in_values_r_type is record
      d : std_logic_vector(63 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH003_IN_VALUES_R_RESET : f_rematch003_in_values_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch003_in_values_r_array is array (natural range <>) of f_rematch003_in_values_r_type;
    variable f_rematch003_in_values_r : f_rematch003_in_values_r_array(0 to 0)
        := (others => F_REMATCH003_IN_VALUES_R_RESET);

    -- Private declarations for field rematch004_in_offsets:
    -- rematch004_in_offsets.
    type f_rematch004_in_offsets_r_type is record
      d : std_logic_vector(63 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH004_IN_OFFSETS_R_RESET : f_rematch004_in_offsets_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch004_in_offsets_r_array is array (natural range <>) of f_rematch004_in_offsets_r_type;
    variable f_rematch004_in_offsets_r : f_rematch004_in_offsets_r_array(0 to 0)
        := (others => F_REMATCH004_IN_OFFSETS_R_RESET);

    -- Private declarations for field rematch004_in_values:
    -- rematch004_in_values.
    type f_rematch004_in_values_r_type is record
      d : std_logic_vector(63 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH004_IN_VALUES_R_RESET : f_rematch004_in_values_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch004_in_values_r_array is array (natural range <>) of f_rematch004_in_values_r_type;
    variable f_rematch004_in_values_r : f_rematch004_in_values_r_array(0 to 0)
        := (others => F_REMATCH004_IN_VALUES_R_RESET);

    -- Private declarations for field rematch005_in_offsets:
    -- rematch005_in_offsets.
    type f_rematch005_in_offsets_r_type is record
      d : std_logic_vector(63 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH005_IN_OFFSETS_R_RESET : f_rematch005_in_offsets_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch005_in_offsets_r_array is array (natural range <>) of f_rematch005_in_offsets_r_type;
    variable f_rematch005_in_offsets_r : f_rematch005_in_offsets_r_array(0 to 0)
        := (others => F_REMATCH005_IN_OFFSETS_R_RESET);

    -- Private declarations for field rematch005_in_values:
    -- rematch005_in_values.
    type f_rematch005_in_values_r_type is record
      d : std_logic_vector(63 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH005_IN_VALUES_R_RESET : f_rematch005_in_values_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch005_in_values_r_array is array (natural range <>) of f_rematch005_in_values_r_type;
    variable f_rematch005_in_values_r : f_rematch005_in_values_r_array(0 to 0)
        := (others => F_REMATCH005_IN_VALUES_R_RESET);

    -- Private declarations for field rematch006_in_offsets:
    -- rematch006_in_offsets.
    type f_rematch006_in_offsets_r_type is record
      d : std_logic_vector(63 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH006_IN_OFFSETS_R_RESET : f_rematch006_in_offsets_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch006_in_offsets_r_array is array (natural range <>) of f_rematch006_in_offsets_r_type;
    variable f_rematch006_in_offsets_r : f_rematch006_in_offsets_r_array(0 to 0)
        := (others => F_REMATCH006_IN_OFFSETS_R_RESET);

    -- Private declarations for field rematch006_in_values:
    -- rematch006_in_values.
    type f_rematch006_in_values_r_type is record
      d : std_logic_vector(63 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH006_IN_VALUES_R_RESET : f_rematch006_in_values_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch006_in_values_r_array is array (natural range <>) of f_rematch006_in_values_r_type;
    variable f_rematch006_in_values_r : f_rematch006_in_values_r_array(0 to 0)
        := (others => F_REMATCH006_IN_VALUES_R_RESET);

    -- Private declarations for field rematch007_in_offsets:
    -- rematch007_in_offsets.
    type f_rematch007_in_offsets_r_type is record
      d : std_logic_vector(63 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH007_IN_OFFSETS_R_RESET : f_rematch007_in_offsets_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch007_in_offsets_r_array is array (natural range <>) of f_rematch007_in_offsets_r_type;
    variable f_rematch007_in_offsets_r : f_rematch007_in_offsets_r_array(0 to 0)
        := (others => F_REMATCH007_IN_OFFSETS_R_RESET);

    -- Private declarations for field rematch007_in_values:
    -- rematch007_in_values.
    type f_rematch007_in_values_r_type is record
      d : std_logic_vector(63 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH007_IN_VALUES_R_RESET : f_rematch007_in_values_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch007_in_values_r_array is array (natural range <>) of f_rematch007_in_values_r_type;
    variable f_rematch007_in_values_r : f_rematch007_in_values_r_array(0 to 0)
        := (others => F_REMATCH007_IN_VALUES_R_RESET);

    -- Private declarations for field rematch008_in_offsets:
    -- rematch008_in_offsets.
    type f_rematch008_in_offsets_r_type is record
      d : std_logic_vector(63 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH008_IN_OFFSETS_R_RESET : f_rematch008_in_offsets_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch008_in_offsets_r_array is array (natural range <>) of f_rematch008_in_offsets_r_type;
    variable f_rematch008_in_offsets_r : f_rematch008_in_offsets_r_array(0 to 0)
        := (others => F_REMATCH008_IN_OFFSETS_R_RESET);

    -- Private declarations for field rematch008_in_values:
    -- rematch008_in_values.
    type f_rematch008_in_values_r_type is record
      d : std_logic_vector(63 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH008_IN_VALUES_R_RESET : f_rematch008_in_values_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch008_in_values_r_array is array (natural range <>) of f_rematch008_in_values_r_type;
    variable f_rematch008_in_values_r : f_rematch008_in_values_r_array(0 to 0)
        := (others => F_REMATCH008_IN_VALUES_R_RESET);

    -- Private declarations for field rematch009_in_offsets:
    -- rematch009_in_offsets.
    type f_rematch009_in_offsets_r_type is record
      d : std_logic_vector(63 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH009_IN_OFFSETS_R_RESET : f_rematch009_in_offsets_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch009_in_offsets_r_array is array (natural range <>) of f_rematch009_in_offsets_r_type;
    variable f_rematch009_in_offsets_r : f_rematch009_in_offsets_r_array(0 to 0)
        := (others => F_REMATCH009_IN_OFFSETS_R_RESET);

    -- Private declarations for field rematch009_in_values:
    -- rematch009_in_values.
    type f_rematch009_in_values_r_type is record
      d : std_logic_vector(63 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH009_IN_VALUES_R_RESET : f_rematch009_in_values_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch009_in_values_r_array is array (natural range <>) of f_rematch009_in_values_r_type;
    variable f_rematch009_in_values_r : f_rematch009_in_values_r_array(0 to 0)
        := (others => F_REMATCH009_IN_VALUES_R_RESET);

    -- Private declarations for field rematch010_in_offsets:
    -- rematch010_in_offsets.
    type f_rematch010_in_offsets_r_type is record
      d : std_logic_vector(63 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH010_IN_OFFSETS_R_RESET : f_rematch010_in_offsets_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch010_in_offsets_r_array is array (natural range <>) of f_rematch010_in_offsets_r_type;
    variable f_rematch010_in_offsets_r : f_rematch010_in_offsets_r_array(0 to 0)
        := (others => F_REMATCH010_IN_OFFSETS_R_RESET);

    -- Private declarations for field rematch010_in_values:
    -- rematch010_in_values.
    type f_rematch010_in_values_r_type is record
      d : std_logic_vector(63 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH010_IN_VALUES_R_RESET : f_rematch010_in_values_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch010_in_values_r_array is array (natural range <>) of f_rematch010_in_values_r_type;
    variable f_rematch010_in_values_r : f_rematch010_in_values_r_array(0 to 0)
        := (others => F_REMATCH010_IN_VALUES_R_RESET);

    -- Private declarations for field rematch011_in_offsets:
    -- rematch011_in_offsets.
    type f_rematch011_in_offsets_r_type is record
      d : std_logic_vector(63 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH011_IN_OFFSETS_R_RESET : f_rematch011_in_offsets_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch011_in_offsets_r_array is array (natural range <>) of f_rematch011_in_offsets_r_type;
    variable f_rematch011_in_offsets_r : f_rematch011_in_offsets_r_array(0 to 0)
        := (others => F_REMATCH011_IN_OFFSETS_R_RESET);

    -- Private declarations for field rematch011_in_values:
    -- rematch011_in_values.
    type f_rematch011_in_values_r_type is record
      d : std_logic_vector(63 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH011_IN_VALUES_R_RESET : f_rematch011_in_values_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch011_in_values_r_array is array (natural range <>) of f_rematch011_in_values_r_type;
    variable f_rematch011_in_values_r : f_rematch011_in_values_r_array(0 to 0)
        := (others => F_REMATCH011_IN_VALUES_R_RESET);

    -- Private declarations for field rematch012_in_offsets:
    -- rematch012_in_offsets.
    type f_rematch012_in_offsets_r_type is record
      d : std_logic_vector(63 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH012_IN_OFFSETS_R_RESET : f_rematch012_in_offsets_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch012_in_offsets_r_array is array (natural range <>) of f_rematch012_in_offsets_r_type;
    variable f_rematch012_in_offsets_r : f_rematch012_in_offsets_r_array(0 to 0)
        := (others => F_REMATCH012_IN_OFFSETS_R_RESET);

    -- Private declarations for field rematch012_in_values:
    -- rematch012_in_values.
    type f_rematch012_in_values_r_type is record
      d : std_logic_vector(63 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH012_IN_VALUES_R_RESET : f_rematch012_in_values_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch012_in_values_r_array is array (natural range <>) of f_rematch012_in_values_r_type;
    variable f_rematch012_in_values_r : f_rematch012_in_values_r_array(0 to 0)
        := (others => F_REMATCH012_IN_VALUES_R_RESET);

    -- Private declarations for field rematch013_in_offsets:
    -- rematch013_in_offsets.
    type f_rematch013_in_offsets_r_type is record
      d : std_logic_vector(63 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH013_IN_OFFSETS_R_RESET : f_rematch013_in_offsets_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch013_in_offsets_r_array is array (natural range <>) of f_rematch013_in_offsets_r_type;
    variable f_rematch013_in_offsets_r : f_rematch013_in_offsets_r_array(0 to 0)
        := (others => F_REMATCH013_IN_OFFSETS_R_RESET);

    -- Private declarations for field rematch013_in_values:
    -- rematch013_in_values.
    type f_rematch013_in_values_r_type is record
      d : std_logic_vector(63 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH013_IN_VALUES_R_RESET : f_rematch013_in_values_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch013_in_values_r_array is array (natural range <>) of f_rematch013_in_values_r_type;
    variable f_rematch013_in_values_r : f_rematch013_in_values_r_array(0 to 0)
        := (others => F_REMATCH013_IN_VALUES_R_RESET);

    -- Private declarations for field rematch014_in_offsets:
    -- rematch014_in_offsets.
    type f_rematch014_in_offsets_r_type is record
      d : std_logic_vector(63 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH014_IN_OFFSETS_R_RESET : f_rematch014_in_offsets_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch014_in_offsets_r_array is array (natural range <>) of f_rematch014_in_offsets_r_type;
    variable f_rematch014_in_offsets_r : f_rematch014_in_offsets_r_array(0 to 0)
        := (others => F_REMATCH014_IN_OFFSETS_R_RESET);

    -- Private declarations for field rematch014_in_values:
    -- rematch014_in_values.
    type f_rematch014_in_values_r_type is record
      d : std_logic_vector(63 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH014_IN_VALUES_R_RESET : f_rematch014_in_values_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch014_in_values_r_array is array (natural range <>) of f_rematch014_in_values_r_type;
    variable f_rematch014_in_values_r : f_rematch014_in_values_r_array(0 to 0)
        := (others => F_REMATCH014_IN_VALUES_R_RESET);

    -- Private declarations for field rematch015_in_offsets:
    -- rematch015_in_offsets.
    type f_rematch015_in_offsets_r_type is record
      d : std_logic_vector(63 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH015_IN_OFFSETS_R_RESET : f_rematch015_in_offsets_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch015_in_offsets_r_array is array (natural range <>) of f_rematch015_in_offsets_r_type;
    variable f_rematch015_in_offsets_r : f_rematch015_in_offsets_r_array(0 to 0)
        := (others => F_REMATCH015_IN_OFFSETS_R_RESET);

    -- Private declarations for field rematch015_in_values:
    -- rematch015_in_values.
    type f_rematch015_in_values_r_type is record
      d : std_logic_vector(63 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH015_IN_VALUES_R_RESET : f_rematch015_in_values_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch015_in_values_r_array is array (natural range <>) of f_rematch015_in_values_r_type;
    variable f_rematch015_in_values_r : f_rematch015_in_values_r_array(0 to 0)
        := (others => F_REMATCH015_IN_VALUES_R_RESET);

    -- Private declarations for field rematch000_taxi_out_values:
    -- rematch000_taxi_out_values.
    type f_rematch000_taxi_out_values_r_type is record
      d : std_logic_vector(63 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH000_TAXI_OUT_VALUES_R_RESET : f_rematch000_taxi_out_values_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch000_taxi_out_values_r_array is array (natural range <>) of f_rematch000_taxi_out_values_r_type;
    variable f_rematch000_taxi_out_values_r : f_rematch000_taxi_out_values_r_array(0 to 0)
        := (others => F_REMATCH000_TAXI_OUT_VALUES_R_RESET);

    -- Private declarations for field rematch001_taxi_out_values:
    -- rematch001_taxi_out_values.
    type f_rematch001_taxi_out_values_r_type is record
      d : std_logic_vector(63 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH001_TAXI_OUT_VALUES_R_RESET : f_rematch001_taxi_out_values_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch001_taxi_out_values_r_array is array (natural range <>) of f_rematch001_taxi_out_values_r_type;
    variable f_rematch001_taxi_out_values_r : f_rematch001_taxi_out_values_r_array(0 to 0)
        := (others => F_REMATCH001_TAXI_OUT_VALUES_R_RESET);

    -- Private declarations for field rematch002_taxi_out_values:
    -- rematch002_taxi_out_values.
    type f_rematch002_taxi_out_values_r_type is record
      d : std_logic_vector(63 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH002_TAXI_OUT_VALUES_R_RESET : f_rematch002_taxi_out_values_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch002_taxi_out_values_r_array is array (natural range <>) of f_rematch002_taxi_out_values_r_type;
    variable f_rematch002_taxi_out_values_r : f_rematch002_taxi_out_values_r_array(0 to 0)
        := (others => F_REMATCH002_TAXI_OUT_VALUES_R_RESET);

    -- Private declarations for field rematch003_taxi_out_values:
    -- rematch003_taxi_out_values.
    type f_rematch003_taxi_out_values_r_type is record
      d : std_logic_vector(63 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH003_TAXI_OUT_VALUES_R_RESET : f_rematch003_taxi_out_values_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch003_taxi_out_values_r_array is array (natural range <>) of f_rematch003_taxi_out_values_r_type;
    variable f_rematch003_taxi_out_values_r : f_rematch003_taxi_out_values_r_array(0 to 0)
        := (others => F_REMATCH003_TAXI_OUT_VALUES_R_RESET);

    -- Private declarations for field rematch004_taxi_out_values:
    -- rematch004_taxi_out_values.
    type f_rematch004_taxi_out_values_r_type is record
      d : std_logic_vector(63 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH004_TAXI_OUT_VALUES_R_RESET : f_rematch004_taxi_out_values_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch004_taxi_out_values_r_array is array (natural range <>) of f_rematch004_taxi_out_values_r_type;
    variable f_rematch004_taxi_out_values_r : f_rematch004_taxi_out_values_r_array(0 to 0)
        := (others => F_REMATCH004_TAXI_OUT_VALUES_R_RESET);

    -- Private declarations for field rematch005_taxi_out_values:
    -- rematch005_taxi_out_values.
    type f_rematch005_taxi_out_values_r_type is record
      d : std_logic_vector(63 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH005_TAXI_OUT_VALUES_R_RESET : f_rematch005_taxi_out_values_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch005_taxi_out_values_r_array is array (natural range <>) of f_rematch005_taxi_out_values_r_type;
    variable f_rematch005_taxi_out_values_r : f_rematch005_taxi_out_values_r_array(0 to 0)
        := (others => F_REMATCH005_TAXI_OUT_VALUES_R_RESET);

    -- Private declarations for field rematch006_taxi_out_values:
    -- rematch006_taxi_out_values.
    type f_rematch006_taxi_out_values_r_type is record
      d : std_logic_vector(63 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH006_TAXI_OUT_VALUES_R_RESET : f_rematch006_taxi_out_values_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch006_taxi_out_values_r_array is array (natural range <>) of f_rematch006_taxi_out_values_r_type;
    variable f_rematch006_taxi_out_values_r : f_rematch006_taxi_out_values_r_array(0 to 0)
        := (others => F_REMATCH006_TAXI_OUT_VALUES_R_RESET);

    -- Private declarations for field rematch007_taxi_out_values:
    -- rematch007_taxi_out_values.
    type f_rematch007_taxi_out_values_r_type is record
      d : std_logic_vector(63 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH007_TAXI_OUT_VALUES_R_RESET : f_rematch007_taxi_out_values_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch007_taxi_out_values_r_array is array (natural range <>) of f_rematch007_taxi_out_values_r_type;
    variable f_rematch007_taxi_out_values_r : f_rematch007_taxi_out_values_r_array(0 to 0)
        := (others => F_REMATCH007_TAXI_OUT_VALUES_R_RESET);

    -- Private declarations for field rematch008_taxi_out_values:
    -- rematch008_taxi_out_values.
    type f_rematch008_taxi_out_values_r_type is record
      d : std_logic_vector(63 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH008_TAXI_OUT_VALUES_R_RESET : f_rematch008_taxi_out_values_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch008_taxi_out_values_r_array is array (natural range <>) of f_rematch008_taxi_out_values_r_type;
    variable f_rematch008_taxi_out_values_r : f_rematch008_taxi_out_values_r_array(0 to 0)
        := (others => F_REMATCH008_TAXI_OUT_VALUES_R_RESET);

    -- Private declarations for field rematch009_taxi_out_values:
    -- rematch009_taxi_out_values.
    type f_rematch009_taxi_out_values_r_type is record
      d : std_logic_vector(63 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH009_TAXI_OUT_VALUES_R_RESET : f_rematch009_taxi_out_values_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch009_taxi_out_values_r_array is array (natural range <>) of f_rematch009_taxi_out_values_r_type;
    variable f_rematch009_taxi_out_values_r : f_rematch009_taxi_out_values_r_array(0 to 0)
        := (others => F_REMATCH009_TAXI_OUT_VALUES_R_RESET);

    -- Private declarations for field rematch010_taxi_out_values:
    -- rematch010_taxi_out_values.
    type f_rematch010_taxi_out_values_r_type is record
      d : std_logic_vector(63 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH010_TAXI_OUT_VALUES_R_RESET : f_rematch010_taxi_out_values_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch010_taxi_out_values_r_array is array (natural range <>) of f_rematch010_taxi_out_values_r_type;
    variable f_rematch010_taxi_out_values_r : f_rematch010_taxi_out_values_r_array(0 to 0)
        := (others => F_REMATCH010_TAXI_OUT_VALUES_R_RESET);

    -- Private declarations for field rematch011_taxi_out_values:
    -- rematch011_taxi_out_values.
    type f_rematch011_taxi_out_values_r_type is record
      d : std_logic_vector(63 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH011_TAXI_OUT_VALUES_R_RESET : f_rematch011_taxi_out_values_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch011_taxi_out_values_r_array is array (natural range <>) of f_rematch011_taxi_out_values_r_type;
    variable f_rematch011_taxi_out_values_r : f_rematch011_taxi_out_values_r_array(0 to 0)
        := (others => F_REMATCH011_TAXI_OUT_VALUES_R_RESET);

    -- Private declarations for field rematch012_taxi_out_values:
    -- rematch012_taxi_out_values.
    type f_rematch012_taxi_out_values_r_type is record
      d : std_logic_vector(63 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH012_TAXI_OUT_VALUES_R_RESET : f_rematch012_taxi_out_values_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch012_taxi_out_values_r_array is array (natural range <>) of f_rematch012_taxi_out_values_r_type;
    variable f_rematch012_taxi_out_values_r : f_rematch012_taxi_out_values_r_array(0 to 0)
        := (others => F_REMATCH012_TAXI_OUT_VALUES_R_RESET);

    -- Private declarations for field rematch013_taxi_out_values:
    -- rematch013_taxi_out_values.
    type f_rematch013_taxi_out_values_r_type is record
      d : std_logic_vector(63 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH013_TAXI_OUT_VALUES_R_RESET : f_rematch013_taxi_out_values_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch013_taxi_out_values_r_array is array (natural range <>) of f_rematch013_taxi_out_values_r_type;
    variable f_rematch013_taxi_out_values_r : f_rematch013_taxi_out_values_r_array(0 to 0)
        := (others => F_REMATCH013_TAXI_OUT_VALUES_R_RESET);

    -- Private declarations for field rematch014_taxi_out_values:
    -- rematch014_taxi_out_values.
    type f_rematch014_taxi_out_values_r_type is record
      d : std_logic_vector(63 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH014_TAXI_OUT_VALUES_R_RESET : f_rematch014_taxi_out_values_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch014_taxi_out_values_r_array is array (natural range <>) of f_rematch014_taxi_out_values_r_type;
    variable f_rematch014_taxi_out_values_r : f_rematch014_taxi_out_values_r_array(0 to 0)
        := (others => F_REMATCH014_TAXI_OUT_VALUES_R_RESET);

    -- Private declarations for field rematch015_taxi_out_values:
    -- rematch015_taxi_out_values.
    type f_rematch015_taxi_out_values_r_type is record
      d : std_logic_vector(63 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH015_TAXI_OUT_VALUES_R_RESET : f_rematch015_taxi_out_values_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch015_taxi_out_values_r_array is array (natural range <>) of f_rematch015_taxi_out_values_r_type;
    variable f_rematch015_taxi_out_values_r : f_rematch015_taxi_out_values_r_array(0 to 0)
        := (others => F_REMATCH015_TAXI_OUT_VALUES_R_RESET);

    -- Private declarations for field rematch000_taxi_count:
    -- rematch000_taxi_count.
    type f_rematch000_taxi_count_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH000_TAXI_COUNT_R_RESET : f_rematch000_taxi_count_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch000_taxi_count_r_array is array (natural range <>) of f_rematch000_taxi_count_r_type;
    variable f_rematch000_taxi_count_r : f_rematch000_taxi_count_r_array(0 to 0)
        := (others => F_REMATCH000_TAXI_COUNT_R_RESET);

    -- Private declarations for field rematch000_errors: rematch000_errors.
    type f_rematch000_errors_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH000_ERRORS_R_RESET : f_rematch000_errors_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch000_errors_r_array is array (natural range <>) of f_rematch000_errors_r_type;
    variable f_rematch000_errors_r : f_rematch000_errors_r_array(0 to 0)
        := (others => F_REMATCH000_ERRORS_R_RESET);

    -- Private declarations for field rematch001_taxi_count:
    -- rematch001_taxi_count.
    type f_rematch001_taxi_count_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH001_TAXI_COUNT_R_RESET : f_rematch001_taxi_count_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch001_taxi_count_r_array is array (natural range <>) of f_rematch001_taxi_count_r_type;
    variable f_rematch001_taxi_count_r : f_rematch001_taxi_count_r_array(0 to 0)
        := (others => F_REMATCH001_TAXI_COUNT_R_RESET);

    -- Private declarations for field rematch001_errors: rematch001_errors.
    type f_rematch001_errors_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH001_ERRORS_R_RESET : f_rematch001_errors_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch001_errors_r_array is array (natural range <>) of f_rematch001_errors_r_type;
    variable f_rematch001_errors_r : f_rematch001_errors_r_array(0 to 0)
        := (others => F_REMATCH001_ERRORS_R_RESET);

    -- Private declarations for field rematch002_taxi_count:
    -- rematch002_taxi_count.
    type f_rematch002_taxi_count_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH002_TAXI_COUNT_R_RESET : f_rematch002_taxi_count_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch002_taxi_count_r_array is array (natural range <>) of f_rematch002_taxi_count_r_type;
    variable f_rematch002_taxi_count_r : f_rematch002_taxi_count_r_array(0 to 0)
        := (others => F_REMATCH002_TAXI_COUNT_R_RESET);

    -- Private declarations for field rematch002_errors: rematch002_errors.
    type f_rematch002_errors_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH002_ERRORS_R_RESET : f_rematch002_errors_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch002_errors_r_array is array (natural range <>) of f_rematch002_errors_r_type;
    variable f_rematch002_errors_r : f_rematch002_errors_r_array(0 to 0)
        := (others => F_REMATCH002_ERRORS_R_RESET);

    -- Private declarations for field rematch003_taxi_count:
    -- rematch003_taxi_count.
    type f_rematch003_taxi_count_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH003_TAXI_COUNT_R_RESET : f_rematch003_taxi_count_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch003_taxi_count_r_array is array (natural range <>) of f_rematch003_taxi_count_r_type;
    variable f_rematch003_taxi_count_r : f_rematch003_taxi_count_r_array(0 to 0)
        := (others => F_REMATCH003_TAXI_COUNT_R_RESET);

    -- Private declarations for field rematch003_errors: rematch003_errors.
    type f_rematch003_errors_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH003_ERRORS_R_RESET : f_rematch003_errors_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch003_errors_r_array is array (natural range <>) of f_rematch003_errors_r_type;
    variable f_rematch003_errors_r : f_rematch003_errors_r_array(0 to 0)
        := (others => F_REMATCH003_ERRORS_R_RESET);

    -- Private declarations for field rematch004_taxi_count:
    -- rematch004_taxi_count.
    type f_rematch004_taxi_count_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH004_TAXI_COUNT_R_RESET : f_rematch004_taxi_count_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch004_taxi_count_r_array is array (natural range <>) of f_rematch004_taxi_count_r_type;
    variable f_rematch004_taxi_count_r : f_rematch004_taxi_count_r_array(0 to 0)
        := (others => F_REMATCH004_TAXI_COUNT_R_RESET);

    -- Private declarations for field rematch004_errors: rematch004_errors.
    type f_rematch004_errors_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH004_ERRORS_R_RESET : f_rematch004_errors_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch004_errors_r_array is array (natural range <>) of f_rematch004_errors_r_type;
    variable f_rematch004_errors_r : f_rematch004_errors_r_array(0 to 0)
        := (others => F_REMATCH004_ERRORS_R_RESET);

    -- Private declarations for field rematch005_taxi_count:
    -- rematch005_taxi_count.
    type f_rematch005_taxi_count_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH005_TAXI_COUNT_R_RESET : f_rematch005_taxi_count_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch005_taxi_count_r_array is array (natural range <>) of f_rematch005_taxi_count_r_type;
    variable f_rematch005_taxi_count_r : f_rematch005_taxi_count_r_array(0 to 0)
        := (others => F_REMATCH005_TAXI_COUNT_R_RESET);

    -- Private declarations for field rematch005_errors: rematch005_errors.
    type f_rematch005_errors_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH005_ERRORS_R_RESET : f_rematch005_errors_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch005_errors_r_array is array (natural range <>) of f_rematch005_errors_r_type;
    variable f_rematch005_errors_r : f_rematch005_errors_r_array(0 to 0)
        := (others => F_REMATCH005_ERRORS_R_RESET);

    -- Private declarations for field rematch006_taxi_count:
    -- rematch006_taxi_count.
    type f_rematch006_taxi_count_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH006_TAXI_COUNT_R_RESET : f_rematch006_taxi_count_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch006_taxi_count_r_array is array (natural range <>) of f_rematch006_taxi_count_r_type;
    variable f_rematch006_taxi_count_r : f_rematch006_taxi_count_r_array(0 to 0)
        := (others => F_REMATCH006_TAXI_COUNT_R_RESET);

    -- Private declarations for field rematch006_errors: rematch006_errors.
    type f_rematch006_errors_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH006_ERRORS_R_RESET : f_rematch006_errors_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch006_errors_r_array is array (natural range <>) of f_rematch006_errors_r_type;
    variable f_rematch006_errors_r : f_rematch006_errors_r_array(0 to 0)
        := (others => F_REMATCH006_ERRORS_R_RESET);

    -- Private declarations for field rematch007_taxi_count:
    -- rematch007_taxi_count.
    type f_rematch007_taxi_count_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH007_TAXI_COUNT_R_RESET : f_rematch007_taxi_count_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch007_taxi_count_r_array is array (natural range <>) of f_rematch007_taxi_count_r_type;
    variable f_rematch007_taxi_count_r : f_rematch007_taxi_count_r_array(0 to 0)
        := (others => F_REMATCH007_TAXI_COUNT_R_RESET);

    -- Private declarations for field rematch007_errors: rematch007_errors.
    type f_rematch007_errors_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH007_ERRORS_R_RESET : f_rematch007_errors_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch007_errors_r_array is array (natural range <>) of f_rematch007_errors_r_type;
    variable f_rematch007_errors_r : f_rematch007_errors_r_array(0 to 0)
        := (others => F_REMATCH007_ERRORS_R_RESET);

    -- Private declarations for field rematch008_taxi_count:
    -- rematch008_taxi_count.
    type f_rematch008_taxi_count_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH008_TAXI_COUNT_R_RESET : f_rematch008_taxi_count_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch008_taxi_count_r_array is array (natural range <>) of f_rematch008_taxi_count_r_type;
    variable f_rematch008_taxi_count_r : f_rematch008_taxi_count_r_array(0 to 0)
        := (others => F_REMATCH008_TAXI_COUNT_R_RESET);

    -- Private declarations for field rematch008_errors: rematch008_errors.
    type f_rematch008_errors_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH008_ERRORS_R_RESET : f_rematch008_errors_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch008_errors_r_array is array (natural range <>) of f_rematch008_errors_r_type;
    variable f_rematch008_errors_r : f_rematch008_errors_r_array(0 to 0)
        := (others => F_REMATCH008_ERRORS_R_RESET);

    -- Private declarations for field rematch009_taxi_count:
    -- rematch009_taxi_count.
    type f_rematch009_taxi_count_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH009_TAXI_COUNT_R_RESET : f_rematch009_taxi_count_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch009_taxi_count_r_array is array (natural range <>) of f_rematch009_taxi_count_r_type;
    variable f_rematch009_taxi_count_r : f_rematch009_taxi_count_r_array(0 to 0)
        := (others => F_REMATCH009_TAXI_COUNT_R_RESET);

    -- Private declarations for field rematch009_errors: rematch009_errors.
    type f_rematch009_errors_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH009_ERRORS_R_RESET : f_rematch009_errors_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch009_errors_r_array is array (natural range <>) of f_rematch009_errors_r_type;
    variable f_rematch009_errors_r : f_rematch009_errors_r_array(0 to 0)
        := (others => F_REMATCH009_ERRORS_R_RESET);

    -- Private declarations for field rematch010_taxi_count:
    -- rematch010_taxi_count.
    type f_rematch010_taxi_count_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH010_TAXI_COUNT_R_RESET : f_rematch010_taxi_count_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch010_taxi_count_r_array is array (natural range <>) of f_rematch010_taxi_count_r_type;
    variable f_rematch010_taxi_count_r : f_rematch010_taxi_count_r_array(0 to 0)
        := (others => F_REMATCH010_TAXI_COUNT_R_RESET);

    -- Private declarations for field rematch010_errors: rematch010_errors.
    type f_rematch010_errors_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH010_ERRORS_R_RESET : f_rematch010_errors_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch010_errors_r_array is array (natural range <>) of f_rematch010_errors_r_type;
    variable f_rematch010_errors_r : f_rematch010_errors_r_array(0 to 0)
        := (others => F_REMATCH010_ERRORS_R_RESET);

    -- Private declarations for field rematch011_taxi_count:
    -- rematch011_taxi_count.
    type f_rematch011_taxi_count_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH011_TAXI_COUNT_R_RESET : f_rematch011_taxi_count_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch011_taxi_count_r_array is array (natural range <>) of f_rematch011_taxi_count_r_type;
    variable f_rematch011_taxi_count_r : f_rematch011_taxi_count_r_array(0 to 0)
        := (others => F_REMATCH011_TAXI_COUNT_R_RESET);

    -- Private declarations for field rematch011_errors: rematch011_errors.
    type f_rematch011_errors_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH011_ERRORS_R_RESET : f_rematch011_errors_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch011_errors_r_array is array (natural range <>) of f_rematch011_errors_r_type;
    variable f_rematch011_errors_r : f_rematch011_errors_r_array(0 to 0)
        := (others => F_REMATCH011_ERRORS_R_RESET);

    -- Private declarations for field rematch012_taxi_count:
    -- rematch012_taxi_count.
    type f_rematch012_taxi_count_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH012_TAXI_COUNT_R_RESET : f_rematch012_taxi_count_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch012_taxi_count_r_array is array (natural range <>) of f_rematch012_taxi_count_r_type;
    variable f_rematch012_taxi_count_r : f_rematch012_taxi_count_r_array(0 to 0)
        := (others => F_REMATCH012_TAXI_COUNT_R_RESET);

    -- Private declarations for field rematch012_errors: rematch012_errors.
    type f_rematch012_errors_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH012_ERRORS_R_RESET : f_rematch012_errors_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch012_errors_r_array is array (natural range <>) of f_rematch012_errors_r_type;
    variable f_rematch012_errors_r : f_rematch012_errors_r_array(0 to 0)
        := (others => F_REMATCH012_ERRORS_R_RESET);

    -- Private declarations for field rematch013_taxi_count:
    -- rematch013_taxi_count.
    type f_rematch013_taxi_count_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH013_TAXI_COUNT_R_RESET : f_rematch013_taxi_count_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch013_taxi_count_r_array is array (natural range <>) of f_rematch013_taxi_count_r_type;
    variable f_rematch013_taxi_count_r : f_rematch013_taxi_count_r_array(0 to 0)
        := (others => F_REMATCH013_TAXI_COUNT_R_RESET);

    -- Private declarations for field rematch013_errors: rematch013_errors.
    type f_rematch013_errors_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH013_ERRORS_R_RESET : f_rematch013_errors_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch013_errors_r_array is array (natural range <>) of f_rematch013_errors_r_type;
    variable f_rematch013_errors_r : f_rematch013_errors_r_array(0 to 0)
        := (others => F_REMATCH013_ERRORS_R_RESET);

    -- Private declarations for field rematch014_taxi_count:
    -- rematch014_taxi_count.
    type f_rematch014_taxi_count_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH014_TAXI_COUNT_R_RESET : f_rematch014_taxi_count_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch014_taxi_count_r_array is array (natural range <>) of f_rematch014_taxi_count_r_type;
    variable f_rematch014_taxi_count_r : f_rematch014_taxi_count_r_array(0 to 0)
        := (others => F_REMATCH014_TAXI_COUNT_R_RESET);

    -- Private declarations for field rematch014_errors: rematch014_errors.
    type f_rematch014_errors_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH014_ERRORS_R_RESET : f_rematch014_errors_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch014_errors_r_array is array (natural range <>) of f_rematch014_errors_r_type;
    variable f_rematch014_errors_r : f_rematch014_errors_r_array(0 to 0)
        := (others => F_REMATCH014_ERRORS_R_RESET);

    -- Private declarations for field rematch015_taxi_count:
    -- rematch015_taxi_count.
    type f_rematch015_taxi_count_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH015_TAXI_COUNT_R_RESET : f_rematch015_taxi_count_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch015_taxi_count_r_array is array (natural range <>) of f_rematch015_taxi_count_r_type;
    variable f_rematch015_taxi_count_r : f_rematch015_taxi_count_r_array(0 to 0)
        := (others => F_REMATCH015_TAXI_COUNT_R_RESET);

    -- Private declarations for field rematch015_errors: rematch015_errors.
    type f_rematch015_errors_r_type is record
      d : std_logic_vector(31 downto 0);
      v : std_logic;
    end record;
    constant F_REMATCH015_ERRORS_R_RESET : f_rematch015_errors_r_type := (
      d => (others => '0'),
      v => '0'
    );
    type f_rematch015_errors_r_array is array (natural range <>) of f_rematch015_errors_r_type;
    variable f_rematch015_errors_r : f_rematch015_errors_r_array(0 to 0)
        := (others => F_REMATCH015_ERRORS_R_RESET);

    -- Private declarations for field Profile_enable: Profile_enable.
    type f_Profile_enable_r_type is record
      d : std_logic;
      v : std_logic;
    end record;
    constant F_PROFILE_ENABLE_R_RESET : f_Profile_enable_r_type := (
      d => '0',
      v => '0'
    );
    type f_Profile_enable_r_array is array (natural range <>) of f_Profile_enable_r_type;
    variable f_Profile_enable_r : f_Profile_enable_r_array(0 to 0)
        := (others => F_PROFILE_ENABLE_R_RESET);

    -- Private declarations for field Profile_clear: Profile_clear.
    type f_Profile_clear_r_type is record
      d : std_logic;
      v : std_logic;
      inval : std_logic;
    end record;
    constant F_PROFILE_CLEAR_R_RESET : f_Profile_clear_r_type := (
      d => '0',
      v => '0',
      inval => '0'
    );
    type f_Profile_clear_r_array is array (natural range <>) of f_Profile_clear_r_type;
    variable f_Profile_clear_r : f_Profile_clear_r_array(0 to 0)
        := (others => F_PROFILE_CLEAR_R_RESET);

    -- Temporary variables for the field templates.
    variable tmp_data    : std_logic;
    variable tmp_strb    : std_logic;
    variable tmp_data32  : std_logic_vector(31 downto 0);
    variable tmp_strb32  : std_logic_vector(31 downto 0);
    variable tmp_data64  : std_logic_vector(63 downto 0);
    variable tmp_strb64  : std_logic_vector(63 downto 0);

  begin
    if rising_edge(kcd_clk) then

      -- Reset variables that shouldn't become registers to default values.
      reset   := kcd_reset;
      w_req   := false;
      r_req   := false;
      w_lreq  := false;
      r_lreq  := false;
      w_addr  := (others => '0');
      w_data  := (others => '0');
      w_strb  := (others => '0');
      r_addr  := (others => '0');
      w_block := false;
      r_block := false;
      w_nack  := false;
      r_nack  := false;
      w_ack   := false;
      r_ack   := false;
      r_data  := (others => '0');

      -------------------------------------------------------------------------
      -- Finish up the previous cycle
      -------------------------------------------------------------------------
      -- Invalidate responses that were acknowledged by the master in the
      -- previous cycle.
      if mmio_bready = '1' then
        bus_v.b.valid := '0';
      end if;
      if mmio_rready = '1' then
        bus_v.r.valid := '0';
      end if;

      -- If we indicated to the master that we were ready for a transaction on
      -- any of the incoming channels, we must latch any incoming requests. If
      -- we're ready but there is no incoming request this becomes don't-care.
      if bus_v.aw.ready = '1' then
        awl.valid := mmio_awvalid;
        awl.addr  := mmio_awaddr;
        awl.prot  := mmio_awprot;
      end if;
      if bus_v.w.ready = '1' then
        wl.valid := mmio_wvalid;
        wl.data  := mmio_wdata;
        wl.strb  := mmio_wstrb;
      end if;
      if bus_v.ar.ready = '1' then
        arl.valid := mmio_arvalid;
        arl.addr  := mmio_araddr;
        arl.prot  := mmio_arprot;
      end if;

      -------------------------------------------------------------------------
      -- Handle interrupts
      -------------------------------------------------------------------------
      -- No incoming interrupts; request signal is always released.
      bus_v.u.irq := '0';

      -------------------------------------------------------------------------
      -- Handle MMIO fields
      -------------------------------------------------------------------------
      -- We're ready for a write/read when all the respective channels (or
      -- their holding registers) are ready/waiting for us.
      if awl.valid = '1' and wl.valid = '1' then
        if bus_v.b.valid = '0' then
          w_req := true; -- Request valid and response register empty.
        else
          w_lreq := true; -- Request valid, but response register is busy.
        end if;
      end if;
      if arl.valid = '1' then
        if bus_v.r.valid = '0' then
          r_req := true; -- Request valid and response register empty.
        else
          r_lreq := true; -- Request valid, but response register is busy.
        end if;
      end if;

      -- Capture request inputs into more consistently named variables.
      w_addr := awl.addr;
      for b in w_strb'range loop
        w_strb(b) := wl.strb(b / 8);
      end loop;
      w_data := wl.data and w_strb;
      r_addr := arl.addr;

      -------------------------------------------------------------------------
      -- Generated field logic
      -------------------------------------------------------------------------

      -- Pre-bus logic for field start: start.

      -- Handle post-write invalidation for field start one cycle after the
      -- write occurs.
      if f_start_r((0)).inval = '1' then
        f_start_r((0)).d := '0';
        f_start_r((0)).v := '0';
      end if;
      f_start_r((0)).inval := '0';

      -- Pre-bus logic for field stop: stop.

      -- Handle post-write invalidation for field stop one cycle after the write
      -- occurs.
      if f_stop_r((0)).inval = '1' then
        f_stop_r((0)).d := '0';
        f_stop_r((0)).v := '0';
      end if;
      f_stop_r((0)).inval := '0';

      -- Pre-bus logic for field reset: reset.

      -- Handle post-write invalidation for field reset one cycle after the
      -- write occurs.
      if f_reset_r((0)).inval = '1' then
        f_reset_r((0)).d := '0';
        f_reset_r((0)).v := '0';
      end if;
      f_reset_r((0)).inval := '0';

      -- Pre-bus logic for field idle: idle.

      -- Handle hardware write for field idle: status.
      f_idle_r((0)).d := f_idle_write_data;
      f_idle_r((0)).v := '1';

      -- Pre-bus logic for field busy: busy.

      -- Handle hardware write for field busy: status.
      f_busy_r((0)).d := f_busy_write_data;
      f_busy_r((0)).v := '1';

      -- Pre-bus logic for field done: done.

      -- Handle hardware write for field done: status.
      f_done_r((0)).d := f_done_write_data;
      f_done_r((0)).v := '1';

      -- Pre-bus logic for field result: result.

      -- Handle hardware write for field result: status.
      f_result_r((0)).d := f_result_write_data;
      f_result_r((0)).v := '1';

      -- Pre-bus logic for field rematch000_taxi_count: rematch000_taxi_count.

      -- Handle hardware write for field rematch000_taxi_count: status.
      f_rematch000_taxi_count_r((0)).d := f_rematch000_taxi_count_write_data;
      f_rematch000_taxi_count_r((0)).v := '1';

      -- Pre-bus logic for field rematch000_errors: rematch000_errors.

      -- Handle hardware write for field rematch000_errors: status.
      f_rematch000_errors_r((0)).d := f_rematch000_errors_write_data;
      f_rematch000_errors_r((0)).v := '1';

      -- Pre-bus logic for field rematch001_taxi_count: rematch001_taxi_count.

      -- Handle hardware write for field rematch001_taxi_count: status.
      f_rematch001_taxi_count_r((0)).d := f_rematch001_taxi_count_write_data;
      f_rematch001_taxi_count_r((0)).v := '1';

      -- Pre-bus logic for field rematch001_errors: rematch001_errors.

      -- Handle hardware write for field rematch001_errors: status.
      f_rematch001_errors_r((0)).d := f_rematch001_errors_write_data;
      f_rematch001_errors_r((0)).v := '1';

      -- Pre-bus logic for field rematch002_taxi_count: rematch002_taxi_count.

      -- Handle hardware write for field rematch002_taxi_count: status.
      f_rematch002_taxi_count_r((0)).d := f_rematch002_taxi_count_write_data;
      f_rematch002_taxi_count_r((0)).v := '1';

      -- Pre-bus logic for field rematch002_errors: rematch002_errors.

      -- Handle hardware write for field rematch002_errors: status.
      f_rematch002_errors_r((0)).d := f_rematch002_errors_write_data;
      f_rematch002_errors_r((0)).v := '1';

      -- Pre-bus logic for field rematch003_taxi_count: rematch003_taxi_count.

      -- Handle hardware write for field rematch003_taxi_count: status.
      f_rematch003_taxi_count_r((0)).d := f_rematch003_taxi_count_write_data;
      f_rematch003_taxi_count_r((0)).v := '1';

      -- Pre-bus logic for field rematch003_errors: rematch003_errors.

      -- Handle hardware write for field rematch003_errors: status.
      f_rematch003_errors_r((0)).d := f_rematch003_errors_write_data;
      f_rematch003_errors_r((0)).v := '1';

      -- Pre-bus logic for field rematch004_taxi_count: rematch004_taxi_count.

      -- Handle hardware write for field rematch004_taxi_count: status.
      f_rematch004_taxi_count_r((0)).d := f_rematch004_taxi_count_write_data;
      f_rematch004_taxi_count_r((0)).v := '1';

      -- Pre-bus logic for field rematch004_errors: rematch004_errors.

      -- Handle hardware write for field rematch004_errors: status.
      f_rematch004_errors_r((0)).d := f_rematch004_errors_write_data;
      f_rematch004_errors_r((0)).v := '1';

      -- Pre-bus logic for field rematch005_taxi_count: rematch005_taxi_count.

      -- Handle hardware write for field rematch005_taxi_count: status.
      f_rematch005_taxi_count_r((0)).d := f_rematch005_taxi_count_write_data;
      f_rematch005_taxi_count_r((0)).v := '1';

      -- Pre-bus logic for field rematch005_errors: rematch005_errors.

      -- Handle hardware write for field rematch005_errors: status.
      f_rematch005_errors_r((0)).d := f_rematch005_errors_write_data;
      f_rematch005_errors_r((0)).v := '1';

      -- Pre-bus logic for field rematch006_taxi_count: rematch006_taxi_count.

      -- Handle hardware write for field rematch006_taxi_count: status.
      f_rematch006_taxi_count_r((0)).d := f_rematch006_taxi_count_write_data;
      f_rematch006_taxi_count_r((0)).v := '1';

      -- Pre-bus logic for field rematch006_errors: rematch006_errors.

      -- Handle hardware write for field rematch006_errors: status.
      f_rematch006_errors_r((0)).d := f_rematch006_errors_write_data;
      f_rematch006_errors_r((0)).v := '1';

      -- Pre-bus logic for field rematch007_taxi_count: rematch007_taxi_count.

      -- Handle hardware write for field rematch007_taxi_count: status.
      f_rematch007_taxi_count_r((0)).d := f_rematch007_taxi_count_write_data;
      f_rematch007_taxi_count_r((0)).v := '1';

      -- Pre-bus logic for field rematch007_errors: rematch007_errors.

      -- Handle hardware write for field rematch007_errors: status.
      f_rematch007_errors_r((0)).d := f_rematch007_errors_write_data;
      f_rematch007_errors_r((0)).v := '1';

      -- Pre-bus logic for field rematch008_taxi_count: rematch008_taxi_count.

      -- Handle hardware write for field rematch008_taxi_count: status.
      f_rematch008_taxi_count_r((0)).d := f_rematch008_taxi_count_write_data;
      f_rematch008_taxi_count_r((0)).v := '1';

      -- Pre-bus logic for field rematch008_errors: rematch008_errors.

      -- Handle hardware write for field rematch008_errors: status.
      f_rematch008_errors_r((0)).d := f_rematch008_errors_write_data;
      f_rematch008_errors_r((0)).v := '1';

      -- Pre-bus logic for field rematch009_taxi_count: rematch009_taxi_count.

      -- Handle hardware write for field rematch009_taxi_count: status.
      f_rematch009_taxi_count_r((0)).d := f_rematch009_taxi_count_write_data;
      f_rematch009_taxi_count_r((0)).v := '1';

      -- Pre-bus logic for field rematch009_errors: rematch009_errors.

      -- Handle hardware write for field rematch009_errors: status.
      f_rematch009_errors_r((0)).d := f_rematch009_errors_write_data;
      f_rematch009_errors_r((0)).v := '1';

      -- Pre-bus logic for field rematch010_taxi_count: rematch010_taxi_count.

      -- Handle hardware write for field rematch010_taxi_count: status.
      f_rematch010_taxi_count_r((0)).d := f_rematch010_taxi_count_write_data;
      f_rematch010_taxi_count_r((0)).v := '1';

      -- Pre-bus logic for field rematch010_errors: rematch010_errors.

      -- Handle hardware write for field rematch010_errors: status.
      f_rematch010_errors_r((0)).d := f_rematch010_errors_write_data;
      f_rematch010_errors_r((0)).v := '1';

      -- Pre-bus logic for field rematch011_taxi_count: rematch011_taxi_count.

      -- Handle hardware write for field rematch011_taxi_count: status.
      f_rematch011_taxi_count_r((0)).d := f_rematch011_taxi_count_write_data;
      f_rematch011_taxi_count_r((0)).v := '1';

      -- Pre-bus logic for field rematch011_errors: rematch011_errors.

      -- Handle hardware write for field rematch011_errors: status.
      f_rematch011_errors_r((0)).d := f_rematch011_errors_write_data;
      f_rematch011_errors_r((0)).v := '1';

      -- Pre-bus logic for field rematch012_taxi_count: rematch012_taxi_count.

      -- Handle hardware write for field rematch012_taxi_count: status.
      f_rematch012_taxi_count_r((0)).d := f_rematch012_taxi_count_write_data;
      f_rematch012_taxi_count_r((0)).v := '1';

      -- Pre-bus logic for field rematch012_errors: rematch012_errors.

      -- Handle hardware write for field rematch012_errors: status.
      f_rematch012_errors_r((0)).d := f_rematch012_errors_write_data;
      f_rematch012_errors_r((0)).v := '1';

      -- Pre-bus logic for field rematch013_taxi_count: rematch013_taxi_count.

      -- Handle hardware write for field rematch013_taxi_count: status.
      f_rematch013_taxi_count_r((0)).d := f_rematch013_taxi_count_write_data;
      f_rematch013_taxi_count_r((0)).v := '1';

      -- Pre-bus logic for field rematch013_errors: rematch013_errors.

      -- Handle hardware write for field rematch013_errors: status.
      f_rematch013_errors_r((0)).d := f_rematch013_errors_write_data;
      f_rematch013_errors_r((0)).v := '1';

      -- Pre-bus logic for field rematch014_taxi_count: rematch014_taxi_count.

      -- Handle hardware write for field rematch014_taxi_count: status.
      f_rematch014_taxi_count_r((0)).d := f_rematch014_taxi_count_write_data;
      f_rematch014_taxi_count_r((0)).v := '1';

      -- Pre-bus logic for field rematch014_errors: rematch014_errors.

      -- Handle hardware write for field rematch014_errors: status.
      f_rematch014_errors_r((0)).d := f_rematch014_errors_write_data;
      f_rematch014_errors_r((0)).v := '1';

      -- Pre-bus logic for field rematch015_taxi_count: rematch015_taxi_count.

      -- Handle hardware write for field rematch015_taxi_count: status.
      f_rematch015_taxi_count_r((0)).d := f_rematch015_taxi_count_write_data;
      f_rematch015_taxi_count_r((0)).v := '1';

      -- Pre-bus logic for field rematch015_errors: rematch015_errors.

      -- Handle hardware write for field rematch015_errors: status.
      f_rematch015_errors_r((0)).d := f_rematch015_errors_write_data;
      f_rematch015_errors_r((0)).v := '1';

      -- Pre-bus logic for field Profile_clear: Profile_clear.

      -- Handle post-write invalidation for field Profile_clear one cycle after
      -- the write occurs.
      if f_Profile_clear_r((0)).inval = '1' then
        f_Profile_clear_r((0)).d := '0';
        f_Profile_clear_r((0)).v := '0';
      end if;
      f_Profile_clear_r((0)).inval := '0';

      -------------------------------------------------------------------------
      -- Bus read logic
      -------------------------------------------------------------------------

      -- Construct the subaddresses for read mode.
      subaddr_none(0) := '0';

      -- Read address decoder.
      case r_addr(9 downto 2) is
        when "00000101" =>
          -- r_addr = 000000000000000000000000000101--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field idle: idle.

          if r_req then
            tmp_data := r_hold(0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data := f_idle_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(0) := tmp_data;
          end if;

          -- Read logic for field busy: busy.

          if r_req then
            tmp_data := r_hold(1);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data := f_busy_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(1) := tmp_data;
          end if;

          -- Read logic for field done: done.

          if r_req then
            tmp_data := r_hold(2);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data := f_done_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(2) := tmp_data;
          end if;

          -- Read logic for block idle_reg: block containing bits 31..0 of
          -- register `idle_reg` (`IDLE`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "00000110" =>
          -- r_addr = 000000000000000000000000000110--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field result: result.

          if r_req then
            tmp_data64 := r_hold(63 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data64 := f_result_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(63 downto 0) := tmp_data64;
          end if;

          -- Read logic for block result_reg_low: block containing bits 31..0 of
          -- register `result_reg` (`RESULT`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '1';

          end if;

        when "00000111" =>
          -- r_addr = 000000000000000000000000000111--

          -- Read logic for block result_reg_high: block containing bits 63..32
          -- of register `result_reg` (`RESULT`).
          if r_req then

            r_data := r_hold(63 downto 32);
            if r_multi = '1' then
              r_ack := true;
            else
              r_nack := true;
            end if;
            r_multi := '0';

          end if;

        when "00001000" =>
          -- r_addr = 000000000000000000000000001000--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch000_firstidx: rematch000_firstidx.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch000_firstidx_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch000_firstidx_reg: block containing bits
          -- 31..0 of register `rematch000_firstidx_reg`
          -- (`REMATCH000_FIRSTIDX`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "00001001" =>
          -- r_addr = 000000000000000000000000001001--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch000_lastidx: rematch000_lastidx.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch000_lastidx_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch000_lastidx_reg: block containing bits
          -- 31..0 of register `rematch000_lastidx_reg` (`REMATCH000_LASTIDX`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "00001010" =>
          -- r_addr = 000000000000000000000000001010--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch001_firstidx: rematch001_firstidx.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch001_firstidx_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch001_firstidx_reg: block containing bits
          -- 31..0 of register `rematch001_firstidx_reg`
          -- (`REMATCH001_FIRSTIDX`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "00001011" =>
          -- r_addr = 000000000000000000000000001011--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch001_lastidx: rematch001_lastidx.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch001_lastidx_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch001_lastidx_reg: block containing bits
          -- 31..0 of register `rematch001_lastidx_reg` (`REMATCH001_LASTIDX`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "00001100" =>
          -- r_addr = 000000000000000000000000001100--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch002_firstidx: rematch002_firstidx.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch002_firstidx_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch002_firstidx_reg: block containing bits
          -- 31..0 of register `rematch002_firstidx_reg`
          -- (`REMATCH002_FIRSTIDX`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "00001101" =>
          -- r_addr = 000000000000000000000000001101--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch002_lastidx: rematch002_lastidx.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch002_lastidx_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch002_lastidx_reg: block containing bits
          -- 31..0 of register `rematch002_lastidx_reg` (`REMATCH002_LASTIDX`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "00001110" =>
          -- r_addr = 000000000000000000000000001110--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch003_firstidx: rematch003_firstidx.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch003_firstidx_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch003_firstidx_reg: block containing bits
          -- 31..0 of register `rematch003_firstidx_reg`
          -- (`REMATCH003_FIRSTIDX`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "00001111" =>
          -- r_addr = 000000000000000000000000001111--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch003_lastidx: rematch003_lastidx.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch003_lastidx_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch003_lastidx_reg: block containing bits
          -- 31..0 of register `rematch003_lastidx_reg` (`REMATCH003_LASTIDX`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "00010000" =>
          -- r_addr = 000000000000000000000000010000--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch004_firstidx: rematch004_firstidx.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch004_firstidx_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch004_firstidx_reg: block containing bits
          -- 31..0 of register `rematch004_firstidx_reg`
          -- (`REMATCH004_FIRSTIDX`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "00010001" =>
          -- r_addr = 000000000000000000000000010001--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch004_lastidx: rematch004_lastidx.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch004_lastidx_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch004_lastidx_reg: block containing bits
          -- 31..0 of register `rematch004_lastidx_reg` (`REMATCH004_LASTIDX`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "00010010" =>
          -- r_addr = 000000000000000000000000010010--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch005_firstidx: rematch005_firstidx.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch005_firstidx_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch005_firstidx_reg: block containing bits
          -- 31..0 of register `rematch005_firstidx_reg`
          -- (`REMATCH005_FIRSTIDX`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "00010011" =>
          -- r_addr = 000000000000000000000000010011--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch005_lastidx: rematch005_lastidx.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch005_lastidx_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch005_lastidx_reg: block containing bits
          -- 31..0 of register `rematch005_lastidx_reg` (`REMATCH005_LASTIDX`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "00010100" =>
          -- r_addr = 000000000000000000000000010100--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch006_firstidx: rematch006_firstidx.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch006_firstidx_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch006_firstidx_reg: block containing bits
          -- 31..0 of register `rematch006_firstidx_reg`
          -- (`REMATCH006_FIRSTIDX`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "00010101" =>
          -- r_addr = 000000000000000000000000010101--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch006_lastidx: rematch006_lastidx.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch006_lastidx_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch006_lastidx_reg: block containing bits
          -- 31..0 of register `rematch006_lastidx_reg` (`REMATCH006_LASTIDX`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "00010110" =>
          -- r_addr = 000000000000000000000000010110--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch007_firstidx: rematch007_firstidx.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch007_firstidx_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch007_firstidx_reg: block containing bits
          -- 31..0 of register `rematch007_firstidx_reg`
          -- (`REMATCH007_FIRSTIDX`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "00010111" =>
          -- r_addr = 000000000000000000000000010111--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch007_lastidx: rematch007_lastidx.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch007_lastidx_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch007_lastidx_reg: block containing bits
          -- 31..0 of register `rematch007_lastidx_reg` (`REMATCH007_LASTIDX`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "00011000" =>
          -- r_addr = 000000000000000000000000011000--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch008_firstidx: rematch008_firstidx.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch008_firstidx_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch008_firstidx_reg: block containing bits
          -- 31..0 of register `rematch008_firstidx_reg`
          -- (`REMATCH008_FIRSTIDX`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "00011001" =>
          -- r_addr = 000000000000000000000000011001--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch008_lastidx: rematch008_lastidx.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch008_lastidx_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch008_lastidx_reg: block containing bits
          -- 31..0 of register `rematch008_lastidx_reg` (`REMATCH008_LASTIDX`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "00011010" =>
          -- r_addr = 000000000000000000000000011010--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch009_firstidx: rematch009_firstidx.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch009_firstidx_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch009_firstidx_reg: block containing bits
          -- 31..0 of register `rematch009_firstidx_reg`
          -- (`REMATCH009_FIRSTIDX`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "00011011" =>
          -- r_addr = 000000000000000000000000011011--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch009_lastidx: rematch009_lastidx.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch009_lastidx_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch009_lastidx_reg: block containing bits
          -- 31..0 of register `rematch009_lastidx_reg` (`REMATCH009_LASTIDX`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "00011100" =>
          -- r_addr = 000000000000000000000000011100--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch010_firstidx: rematch010_firstidx.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch010_firstidx_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch010_firstidx_reg: block containing bits
          -- 31..0 of register `rematch010_firstidx_reg`
          -- (`REMATCH010_FIRSTIDX`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "00011101" =>
          -- r_addr = 000000000000000000000000011101--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch010_lastidx: rematch010_lastidx.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch010_lastidx_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch010_lastidx_reg: block containing bits
          -- 31..0 of register `rematch010_lastidx_reg` (`REMATCH010_LASTIDX`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "00011110" =>
          -- r_addr = 000000000000000000000000011110--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch011_firstidx: rematch011_firstidx.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch011_firstidx_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch011_firstidx_reg: block containing bits
          -- 31..0 of register `rematch011_firstidx_reg`
          -- (`REMATCH011_FIRSTIDX`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "00011111" =>
          -- r_addr = 000000000000000000000000011111--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch011_lastidx: rematch011_lastidx.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch011_lastidx_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch011_lastidx_reg: block containing bits
          -- 31..0 of register `rematch011_lastidx_reg` (`REMATCH011_LASTIDX`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "00100000" =>
          -- r_addr = 000000000000000000000000100000--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch012_firstidx: rematch012_firstidx.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch012_firstidx_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch012_firstidx_reg: block containing bits
          -- 31..0 of register `rematch012_firstidx_reg`
          -- (`REMATCH012_FIRSTIDX`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "00100001" =>
          -- r_addr = 000000000000000000000000100001--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch012_lastidx: rematch012_lastidx.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch012_lastidx_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch012_lastidx_reg: block containing bits
          -- 31..0 of register `rematch012_lastidx_reg` (`REMATCH012_LASTIDX`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "00100010" =>
          -- r_addr = 000000000000000000000000100010--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch013_firstidx: rematch013_firstidx.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch013_firstidx_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch013_firstidx_reg: block containing bits
          -- 31..0 of register `rematch013_firstidx_reg`
          -- (`REMATCH013_FIRSTIDX`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "00100011" =>
          -- r_addr = 000000000000000000000000100011--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch013_lastidx: rematch013_lastidx.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch013_lastidx_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch013_lastidx_reg: block containing bits
          -- 31..0 of register `rematch013_lastidx_reg` (`REMATCH013_LASTIDX`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "00100100" =>
          -- r_addr = 000000000000000000000000100100--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch014_firstidx: rematch014_firstidx.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch014_firstidx_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch014_firstidx_reg: block containing bits
          -- 31..0 of register `rematch014_firstidx_reg`
          -- (`REMATCH014_FIRSTIDX`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "00100101" =>
          -- r_addr = 000000000000000000000000100101--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch014_lastidx: rematch014_lastidx.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch014_lastidx_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch014_lastidx_reg: block containing bits
          -- 31..0 of register `rematch014_lastidx_reg` (`REMATCH014_LASTIDX`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "00100110" =>
          -- r_addr = 000000000000000000000000100110--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch015_firstidx: rematch015_firstidx.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch015_firstidx_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch015_firstidx_reg: block containing bits
          -- 31..0 of register `rematch015_firstidx_reg`
          -- (`REMATCH015_FIRSTIDX`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "00100111" =>
          -- r_addr = 000000000000000000000000100111--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch015_lastidx: rematch015_lastidx.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch015_lastidx_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch015_lastidx_reg: block containing bits
          -- 31..0 of register `rematch015_lastidx_reg` (`REMATCH015_LASTIDX`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "00101000" =>
          -- r_addr = 000000000000000000000000101000--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch000_taxi_firstidx:
          -- rematch000_taxi_firstidx.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch000_taxi_firstidx_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch000_taxi_firstidx_reg: block containing
          -- bits 31..0 of register `rematch000_taxi_firstidx_reg`
          -- (`REMATCH000_TAXI_FIRSTIDX`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "00101001" =>
          -- r_addr = 000000000000000000000000101001--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch000_taxi_lastidx:
          -- rematch000_taxi_lastidx.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch000_taxi_lastidx_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch000_taxi_lastidx_reg: block containing
          -- bits 31..0 of register `rematch000_taxi_lastidx_reg`
          -- (`REMATCH000_TAXI_LASTIDX`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "00101010" =>
          -- r_addr = 000000000000000000000000101010--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch001_taxi_firstidx:
          -- rematch001_taxi_firstidx.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch001_taxi_firstidx_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch001_taxi_firstidx_reg: block containing
          -- bits 31..0 of register `rematch001_taxi_firstidx_reg`
          -- (`REMATCH001_TAXI_FIRSTIDX`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "00101011" =>
          -- r_addr = 000000000000000000000000101011--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch001_taxi_lastidx:
          -- rematch001_taxi_lastidx.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch001_taxi_lastidx_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch001_taxi_lastidx_reg: block containing
          -- bits 31..0 of register `rematch001_taxi_lastidx_reg`
          -- (`REMATCH001_TAXI_LASTIDX`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "00101100" =>
          -- r_addr = 000000000000000000000000101100--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch002_taxi_firstidx:
          -- rematch002_taxi_firstidx.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch002_taxi_firstidx_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch002_taxi_firstidx_reg: block containing
          -- bits 31..0 of register `rematch002_taxi_firstidx_reg`
          -- (`REMATCH002_TAXI_FIRSTIDX`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "00101101" =>
          -- r_addr = 000000000000000000000000101101--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch002_taxi_lastidx:
          -- rematch002_taxi_lastidx.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch002_taxi_lastidx_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch002_taxi_lastidx_reg: block containing
          -- bits 31..0 of register `rematch002_taxi_lastidx_reg`
          -- (`REMATCH002_TAXI_LASTIDX`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "00101110" =>
          -- r_addr = 000000000000000000000000101110--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch003_taxi_firstidx:
          -- rematch003_taxi_firstidx.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch003_taxi_firstidx_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch003_taxi_firstidx_reg: block containing
          -- bits 31..0 of register `rematch003_taxi_firstidx_reg`
          -- (`REMATCH003_TAXI_FIRSTIDX`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "00101111" =>
          -- r_addr = 000000000000000000000000101111--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch003_taxi_lastidx:
          -- rematch003_taxi_lastidx.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch003_taxi_lastidx_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch003_taxi_lastidx_reg: block containing
          -- bits 31..0 of register `rematch003_taxi_lastidx_reg`
          -- (`REMATCH003_TAXI_LASTIDX`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "00110000" =>
          -- r_addr = 000000000000000000000000110000--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch004_taxi_firstidx:
          -- rematch004_taxi_firstidx.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch004_taxi_firstidx_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch004_taxi_firstidx_reg: block containing
          -- bits 31..0 of register `rematch004_taxi_firstidx_reg`
          -- (`REMATCH004_TAXI_FIRSTIDX`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "00110001" =>
          -- r_addr = 000000000000000000000000110001--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch004_taxi_lastidx:
          -- rematch004_taxi_lastidx.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch004_taxi_lastidx_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch004_taxi_lastidx_reg: block containing
          -- bits 31..0 of register `rematch004_taxi_lastidx_reg`
          -- (`REMATCH004_TAXI_LASTIDX`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "00110010" =>
          -- r_addr = 000000000000000000000000110010--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch005_taxi_firstidx:
          -- rematch005_taxi_firstidx.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch005_taxi_firstidx_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch005_taxi_firstidx_reg: block containing
          -- bits 31..0 of register `rematch005_taxi_firstidx_reg`
          -- (`REMATCH005_TAXI_FIRSTIDX`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "00110011" =>
          -- r_addr = 000000000000000000000000110011--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch005_taxi_lastidx:
          -- rematch005_taxi_lastidx.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch005_taxi_lastidx_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch005_taxi_lastidx_reg: block containing
          -- bits 31..0 of register `rematch005_taxi_lastidx_reg`
          -- (`REMATCH005_TAXI_LASTIDX`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "00110100" =>
          -- r_addr = 000000000000000000000000110100--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch006_taxi_firstidx:
          -- rematch006_taxi_firstidx.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch006_taxi_firstidx_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch006_taxi_firstidx_reg: block containing
          -- bits 31..0 of register `rematch006_taxi_firstidx_reg`
          -- (`REMATCH006_TAXI_FIRSTIDX`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "00110101" =>
          -- r_addr = 000000000000000000000000110101--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch006_taxi_lastidx:
          -- rematch006_taxi_lastidx.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch006_taxi_lastidx_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch006_taxi_lastidx_reg: block containing
          -- bits 31..0 of register `rematch006_taxi_lastidx_reg`
          -- (`REMATCH006_TAXI_LASTIDX`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "00110110" =>
          -- r_addr = 000000000000000000000000110110--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch007_taxi_firstidx:
          -- rematch007_taxi_firstidx.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch007_taxi_firstidx_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch007_taxi_firstidx_reg: block containing
          -- bits 31..0 of register `rematch007_taxi_firstidx_reg`
          -- (`REMATCH007_TAXI_FIRSTIDX`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "00110111" =>
          -- r_addr = 000000000000000000000000110111--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch007_taxi_lastidx:
          -- rematch007_taxi_lastidx.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch007_taxi_lastidx_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch007_taxi_lastidx_reg: block containing
          -- bits 31..0 of register `rematch007_taxi_lastidx_reg`
          -- (`REMATCH007_TAXI_LASTIDX`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "00111000" =>
          -- r_addr = 000000000000000000000000111000--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch008_taxi_firstidx:
          -- rematch008_taxi_firstidx.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch008_taxi_firstidx_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch008_taxi_firstidx_reg: block containing
          -- bits 31..0 of register `rematch008_taxi_firstidx_reg`
          -- (`REMATCH008_TAXI_FIRSTIDX`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "00111001" =>
          -- r_addr = 000000000000000000000000111001--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch008_taxi_lastidx:
          -- rematch008_taxi_lastidx.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch008_taxi_lastidx_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch008_taxi_lastidx_reg: block containing
          -- bits 31..0 of register `rematch008_taxi_lastidx_reg`
          -- (`REMATCH008_TAXI_LASTIDX`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "00111010" =>
          -- r_addr = 000000000000000000000000111010--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch009_taxi_firstidx:
          -- rematch009_taxi_firstidx.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch009_taxi_firstidx_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch009_taxi_firstidx_reg: block containing
          -- bits 31..0 of register `rematch009_taxi_firstidx_reg`
          -- (`REMATCH009_TAXI_FIRSTIDX`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "00111011" =>
          -- r_addr = 000000000000000000000000111011--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch009_taxi_lastidx:
          -- rematch009_taxi_lastidx.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch009_taxi_lastidx_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch009_taxi_lastidx_reg: block containing
          -- bits 31..0 of register `rematch009_taxi_lastidx_reg`
          -- (`REMATCH009_TAXI_LASTIDX`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "00111100" =>
          -- r_addr = 000000000000000000000000111100--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch010_taxi_firstidx:
          -- rematch010_taxi_firstidx.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch010_taxi_firstidx_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch010_taxi_firstidx_reg: block containing
          -- bits 31..0 of register `rematch010_taxi_firstidx_reg`
          -- (`REMATCH010_TAXI_FIRSTIDX`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "00111101" =>
          -- r_addr = 000000000000000000000000111101--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch010_taxi_lastidx:
          -- rematch010_taxi_lastidx.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch010_taxi_lastidx_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch010_taxi_lastidx_reg: block containing
          -- bits 31..0 of register `rematch010_taxi_lastidx_reg`
          -- (`REMATCH010_TAXI_LASTIDX`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "00111110" =>
          -- r_addr = 000000000000000000000000111110--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch011_taxi_firstidx:
          -- rematch011_taxi_firstidx.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch011_taxi_firstidx_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch011_taxi_firstidx_reg: block containing
          -- bits 31..0 of register `rematch011_taxi_firstidx_reg`
          -- (`REMATCH011_TAXI_FIRSTIDX`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "00111111" =>
          -- r_addr = 000000000000000000000000111111--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch011_taxi_lastidx:
          -- rematch011_taxi_lastidx.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch011_taxi_lastidx_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch011_taxi_lastidx_reg: block containing
          -- bits 31..0 of register `rematch011_taxi_lastidx_reg`
          -- (`REMATCH011_TAXI_LASTIDX`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "01000000" =>
          -- r_addr = 000000000000000000000001000000--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch012_taxi_firstidx:
          -- rematch012_taxi_firstidx.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch012_taxi_firstidx_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch012_taxi_firstidx_reg: block containing
          -- bits 31..0 of register `rematch012_taxi_firstidx_reg`
          -- (`REMATCH012_TAXI_FIRSTIDX`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "01000001" =>
          -- r_addr = 000000000000000000000001000001--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch012_taxi_lastidx:
          -- rematch012_taxi_lastidx.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch012_taxi_lastidx_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch012_taxi_lastidx_reg: block containing
          -- bits 31..0 of register `rematch012_taxi_lastidx_reg`
          -- (`REMATCH012_TAXI_LASTIDX`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "01000010" =>
          -- r_addr = 000000000000000000000001000010--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch013_taxi_firstidx:
          -- rematch013_taxi_firstidx.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch013_taxi_firstidx_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch013_taxi_firstidx_reg: block containing
          -- bits 31..0 of register `rematch013_taxi_firstidx_reg`
          -- (`REMATCH013_TAXI_FIRSTIDX`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "01000011" =>
          -- r_addr = 000000000000000000000001000011--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch013_taxi_lastidx:
          -- rematch013_taxi_lastidx.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch013_taxi_lastidx_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch013_taxi_lastidx_reg: block containing
          -- bits 31..0 of register `rematch013_taxi_lastidx_reg`
          -- (`REMATCH013_TAXI_LASTIDX`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "01000100" =>
          -- r_addr = 000000000000000000000001000100--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch014_taxi_firstidx:
          -- rematch014_taxi_firstidx.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch014_taxi_firstidx_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch014_taxi_firstidx_reg: block containing
          -- bits 31..0 of register `rematch014_taxi_firstidx_reg`
          -- (`REMATCH014_TAXI_FIRSTIDX`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "01000101" =>
          -- r_addr = 000000000000000000000001000101--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch014_taxi_lastidx:
          -- rematch014_taxi_lastidx.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch014_taxi_lastidx_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch014_taxi_lastidx_reg: block containing
          -- bits 31..0 of register `rematch014_taxi_lastidx_reg`
          -- (`REMATCH014_TAXI_LASTIDX`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "01000110" =>
          -- r_addr = 000000000000000000000001000110--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch015_taxi_firstidx:
          -- rematch015_taxi_firstidx.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch015_taxi_firstidx_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch015_taxi_firstidx_reg: block containing
          -- bits 31..0 of register `rematch015_taxi_firstidx_reg`
          -- (`REMATCH015_TAXI_FIRSTIDX`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "01000111" =>
          -- r_addr = 000000000000000000000001000111--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch015_taxi_lastidx:
          -- rematch015_taxi_lastidx.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch015_taxi_lastidx_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch015_taxi_lastidx_reg: block containing
          -- bits 31..0 of register `rematch015_taxi_lastidx_reg`
          -- (`REMATCH015_TAXI_LASTIDX`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "01001000" =>
          -- r_addr = 000000000000000000000001001000--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch000_in_offsets: rematch000_in_offsets.

          if r_req then
            tmp_data64 := r_hold(63 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data64 := f_rematch000_in_offsets_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(63 downto 0) := tmp_data64;
          end if;

          -- Read logic for block rematch000_in_offsets_reg_low: block
          -- containing bits 31..0 of register `rematch000_in_offsets_reg`
          -- (`REMATCH000_IN_OFFSETS`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '1';

          end if;

        when "01001001" =>
          -- r_addr = 000000000000000000000001001001--

          -- Read logic for block rematch000_in_offsets_reg_high: block
          -- containing bits 63..32 of register `rematch000_in_offsets_reg`
          -- (`REMATCH000_IN_OFFSETS`).
          if r_req then

            r_data := r_hold(63 downto 32);
            if r_multi = '1' then
              r_ack := true;
            else
              r_nack := true;
            end if;
            r_multi := '0';

          end if;

        when "01001010" =>
          -- r_addr = 000000000000000000000001001010--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch000_in_values: rematch000_in_values.

          if r_req then
            tmp_data64 := r_hold(63 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data64 := f_rematch000_in_values_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(63 downto 0) := tmp_data64;
          end if;

          -- Read logic for block rematch000_in_values_reg_low: block containing
          -- bits 31..0 of register `rematch000_in_values_reg`
          -- (`REMATCH000_IN_VALUES`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '1';

          end if;

        when "01001011" =>
          -- r_addr = 000000000000000000000001001011--

          -- Read logic for block rematch000_in_values_reg_high: block
          -- containing bits 63..32 of register `rematch000_in_values_reg`
          -- (`REMATCH000_IN_VALUES`).
          if r_req then

            r_data := r_hold(63 downto 32);
            if r_multi = '1' then
              r_ack := true;
            else
              r_nack := true;
            end if;
            r_multi := '0';

          end if;

        when "01001100" =>
          -- r_addr = 000000000000000000000001001100--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch001_in_offsets: rematch001_in_offsets.

          if r_req then
            tmp_data64 := r_hold(63 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data64 := f_rematch001_in_offsets_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(63 downto 0) := tmp_data64;
          end if;

          -- Read logic for block rematch001_in_offsets_reg_low: block
          -- containing bits 31..0 of register `rematch001_in_offsets_reg`
          -- (`REMATCH001_IN_OFFSETS`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '1';

          end if;

        when "01001101" =>
          -- r_addr = 000000000000000000000001001101--

          -- Read logic for block rematch001_in_offsets_reg_high: block
          -- containing bits 63..32 of register `rematch001_in_offsets_reg`
          -- (`REMATCH001_IN_OFFSETS`).
          if r_req then

            r_data := r_hold(63 downto 32);
            if r_multi = '1' then
              r_ack := true;
            else
              r_nack := true;
            end if;
            r_multi := '0';

          end if;

        when "01001110" =>
          -- r_addr = 000000000000000000000001001110--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch001_in_values: rematch001_in_values.

          if r_req then
            tmp_data64 := r_hold(63 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data64 := f_rematch001_in_values_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(63 downto 0) := tmp_data64;
          end if;

          -- Read logic for block rematch001_in_values_reg_low: block containing
          -- bits 31..0 of register `rematch001_in_values_reg`
          -- (`REMATCH001_IN_VALUES`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '1';

          end if;

        when "01001111" =>
          -- r_addr = 000000000000000000000001001111--

          -- Read logic for block rematch001_in_values_reg_high: block
          -- containing bits 63..32 of register `rematch001_in_values_reg`
          -- (`REMATCH001_IN_VALUES`).
          if r_req then

            r_data := r_hold(63 downto 32);
            if r_multi = '1' then
              r_ack := true;
            else
              r_nack := true;
            end if;
            r_multi := '0';

          end if;

        when "01010000" =>
          -- r_addr = 000000000000000000000001010000--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch002_in_offsets: rematch002_in_offsets.

          if r_req then
            tmp_data64 := r_hold(63 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data64 := f_rematch002_in_offsets_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(63 downto 0) := tmp_data64;
          end if;

          -- Read logic for block rematch002_in_offsets_reg_low: block
          -- containing bits 31..0 of register `rematch002_in_offsets_reg`
          -- (`REMATCH002_IN_OFFSETS`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '1';

          end if;

        when "01010001" =>
          -- r_addr = 000000000000000000000001010001--

          -- Read logic for block rematch002_in_offsets_reg_high: block
          -- containing bits 63..32 of register `rematch002_in_offsets_reg`
          -- (`REMATCH002_IN_OFFSETS`).
          if r_req then

            r_data := r_hold(63 downto 32);
            if r_multi = '1' then
              r_ack := true;
            else
              r_nack := true;
            end if;
            r_multi := '0';

          end if;

        when "01010010" =>
          -- r_addr = 000000000000000000000001010010--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch002_in_values: rematch002_in_values.

          if r_req then
            tmp_data64 := r_hold(63 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data64 := f_rematch002_in_values_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(63 downto 0) := tmp_data64;
          end if;

          -- Read logic for block rematch002_in_values_reg_low: block containing
          -- bits 31..0 of register `rematch002_in_values_reg`
          -- (`REMATCH002_IN_VALUES`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '1';

          end if;

        when "01010011" =>
          -- r_addr = 000000000000000000000001010011--

          -- Read logic for block rematch002_in_values_reg_high: block
          -- containing bits 63..32 of register `rematch002_in_values_reg`
          -- (`REMATCH002_IN_VALUES`).
          if r_req then

            r_data := r_hold(63 downto 32);
            if r_multi = '1' then
              r_ack := true;
            else
              r_nack := true;
            end if;
            r_multi := '0';

          end if;

        when "01010100" =>
          -- r_addr = 000000000000000000000001010100--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch003_in_offsets: rematch003_in_offsets.

          if r_req then
            tmp_data64 := r_hold(63 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data64 := f_rematch003_in_offsets_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(63 downto 0) := tmp_data64;
          end if;

          -- Read logic for block rematch003_in_offsets_reg_low: block
          -- containing bits 31..0 of register `rematch003_in_offsets_reg`
          -- (`REMATCH003_IN_OFFSETS`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '1';

          end if;

        when "01010101" =>
          -- r_addr = 000000000000000000000001010101--

          -- Read logic for block rematch003_in_offsets_reg_high: block
          -- containing bits 63..32 of register `rematch003_in_offsets_reg`
          -- (`REMATCH003_IN_OFFSETS`).
          if r_req then

            r_data := r_hold(63 downto 32);
            if r_multi = '1' then
              r_ack := true;
            else
              r_nack := true;
            end if;
            r_multi := '0';

          end if;

        when "01010110" =>
          -- r_addr = 000000000000000000000001010110--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch003_in_values: rematch003_in_values.

          if r_req then
            tmp_data64 := r_hold(63 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data64 := f_rematch003_in_values_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(63 downto 0) := tmp_data64;
          end if;

          -- Read logic for block rematch003_in_values_reg_low: block containing
          -- bits 31..0 of register `rematch003_in_values_reg`
          -- (`REMATCH003_IN_VALUES`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '1';

          end if;

        when "01010111" =>
          -- r_addr = 000000000000000000000001010111--

          -- Read logic for block rematch003_in_values_reg_high: block
          -- containing bits 63..32 of register `rematch003_in_values_reg`
          -- (`REMATCH003_IN_VALUES`).
          if r_req then

            r_data := r_hold(63 downto 32);
            if r_multi = '1' then
              r_ack := true;
            else
              r_nack := true;
            end if;
            r_multi := '0';

          end if;

        when "01011000" =>
          -- r_addr = 000000000000000000000001011000--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch004_in_offsets: rematch004_in_offsets.

          if r_req then
            tmp_data64 := r_hold(63 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data64 := f_rematch004_in_offsets_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(63 downto 0) := tmp_data64;
          end if;

          -- Read logic for block rematch004_in_offsets_reg_low: block
          -- containing bits 31..0 of register `rematch004_in_offsets_reg`
          -- (`REMATCH004_IN_OFFSETS`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '1';

          end if;

        when "01011001" =>
          -- r_addr = 000000000000000000000001011001--

          -- Read logic for block rematch004_in_offsets_reg_high: block
          -- containing bits 63..32 of register `rematch004_in_offsets_reg`
          -- (`REMATCH004_IN_OFFSETS`).
          if r_req then

            r_data := r_hold(63 downto 32);
            if r_multi = '1' then
              r_ack := true;
            else
              r_nack := true;
            end if;
            r_multi := '0';

          end if;

        when "01011010" =>
          -- r_addr = 000000000000000000000001011010--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch004_in_values: rematch004_in_values.

          if r_req then
            tmp_data64 := r_hold(63 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data64 := f_rematch004_in_values_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(63 downto 0) := tmp_data64;
          end if;

          -- Read logic for block rematch004_in_values_reg_low: block containing
          -- bits 31..0 of register `rematch004_in_values_reg`
          -- (`REMATCH004_IN_VALUES`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '1';

          end if;

        when "01011011" =>
          -- r_addr = 000000000000000000000001011011--

          -- Read logic for block rematch004_in_values_reg_high: block
          -- containing bits 63..32 of register `rematch004_in_values_reg`
          -- (`REMATCH004_IN_VALUES`).
          if r_req then

            r_data := r_hold(63 downto 32);
            if r_multi = '1' then
              r_ack := true;
            else
              r_nack := true;
            end if;
            r_multi := '0';

          end if;

        when "01011100" =>
          -- r_addr = 000000000000000000000001011100--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch005_in_offsets: rematch005_in_offsets.

          if r_req then
            tmp_data64 := r_hold(63 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data64 := f_rematch005_in_offsets_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(63 downto 0) := tmp_data64;
          end if;

          -- Read logic for block rematch005_in_offsets_reg_low: block
          -- containing bits 31..0 of register `rematch005_in_offsets_reg`
          -- (`REMATCH005_IN_OFFSETS`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '1';

          end if;

        when "01011101" =>
          -- r_addr = 000000000000000000000001011101--

          -- Read logic for block rematch005_in_offsets_reg_high: block
          -- containing bits 63..32 of register `rematch005_in_offsets_reg`
          -- (`REMATCH005_IN_OFFSETS`).
          if r_req then

            r_data := r_hold(63 downto 32);
            if r_multi = '1' then
              r_ack := true;
            else
              r_nack := true;
            end if;
            r_multi := '0';

          end if;

        when "01011110" =>
          -- r_addr = 000000000000000000000001011110--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch005_in_values: rematch005_in_values.

          if r_req then
            tmp_data64 := r_hold(63 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data64 := f_rematch005_in_values_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(63 downto 0) := tmp_data64;
          end if;

          -- Read logic for block rematch005_in_values_reg_low: block containing
          -- bits 31..0 of register `rematch005_in_values_reg`
          -- (`REMATCH005_IN_VALUES`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '1';

          end if;

        when "01011111" =>
          -- r_addr = 000000000000000000000001011111--

          -- Read logic for block rematch005_in_values_reg_high: block
          -- containing bits 63..32 of register `rematch005_in_values_reg`
          -- (`REMATCH005_IN_VALUES`).
          if r_req then

            r_data := r_hold(63 downto 32);
            if r_multi = '1' then
              r_ack := true;
            else
              r_nack := true;
            end if;
            r_multi := '0';

          end if;

        when "01100000" =>
          -- r_addr = 000000000000000000000001100000--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch006_in_offsets: rematch006_in_offsets.

          if r_req then
            tmp_data64 := r_hold(63 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data64 := f_rematch006_in_offsets_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(63 downto 0) := tmp_data64;
          end if;

          -- Read logic for block rematch006_in_offsets_reg_low: block
          -- containing bits 31..0 of register `rematch006_in_offsets_reg`
          -- (`REMATCH006_IN_OFFSETS`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '1';

          end if;

        when "01100001" =>
          -- r_addr = 000000000000000000000001100001--

          -- Read logic for block rematch006_in_offsets_reg_high: block
          -- containing bits 63..32 of register `rematch006_in_offsets_reg`
          -- (`REMATCH006_IN_OFFSETS`).
          if r_req then

            r_data := r_hold(63 downto 32);
            if r_multi = '1' then
              r_ack := true;
            else
              r_nack := true;
            end if;
            r_multi := '0';

          end if;

        when "01100010" =>
          -- r_addr = 000000000000000000000001100010--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch006_in_values: rematch006_in_values.

          if r_req then
            tmp_data64 := r_hold(63 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data64 := f_rematch006_in_values_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(63 downto 0) := tmp_data64;
          end if;

          -- Read logic for block rematch006_in_values_reg_low: block containing
          -- bits 31..0 of register `rematch006_in_values_reg`
          -- (`REMATCH006_IN_VALUES`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '1';

          end if;

        when "01100011" =>
          -- r_addr = 000000000000000000000001100011--

          -- Read logic for block rematch006_in_values_reg_high: block
          -- containing bits 63..32 of register `rematch006_in_values_reg`
          -- (`REMATCH006_IN_VALUES`).
          if r_req then

            r_data := r_hold(63 downto 32);
            if r_multi = '1' then
              r_ack := true;
            else
              r_nack := true;
            end if;
            r_multi := '0';

          end if;

        when "01100100" =>
          -- r_addr = 000000000000000000000001100100--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch007_in_offsets: rematch007_in_offsets.

          if r_req then
            tmp_data64 := r_hold(63 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data64 := f_rematch007_in_offsets_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(63 downto 0) := tmp_data64;
          end if;

          -- Read logic for block rematch007_in_offsets_reg_low: block
          -- containing bits 31..0 of register `rematch007_in_offsets_reg`
          -- (`REMATCH007_IN_OFFSETS`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '1';

          end if;

        when "01100101" =>
          -- r_addr = 000000000000000000000001100101--

          -- Read logic for block rematch007_in_offsets_reg_high: block
          -- containing bits 63..32 of register `rematch007_in_offsets_reg`
          -- (`REMATCH007_IN_OFFSETS`).
          if r_req then

            r_data := r_hold(63 downto 32);
            if r_multi = '1' then
              r_ack := true;
            else
              r_nack := true;
            end if;
            r_multi := '0';

          end if;

        when "01100110" =>
          -- r_addr = 000000000000000000000001100110--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch007_in_values: rematch007_in_values.

          if r_req then
            tmp_data64 := r_hold(63 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data64 := f_rematch007_in_values_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(63 downto 0) := tmp_data64;
          end if;

          -- Read logic for block rematch007_in_values_reg_low: block containing
          -- bits 31..0 of register `rematch007_in_values_reg`
          -- (`REMATCH007_IN_VALUES`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '1';

          end if;

        when "01100111" =>
          -- r_addr = 000000000000000000000001100111--

          -- Read logic for block rematch007_in_values_reg_high: block
          -- containing bits 63..32 of register `rematch007_in_values_reg`
          -- (`REMATCH007_IN_VALUES`).
          if r_req then

            r_data := r_hold(63 downto 32);
            if r_multi = '1' then
              r_ack := true;
            else
              r_nack := true;
            end if;
            r_multi := '0';

          end if;

        when "01101000" =>
          -- r_addr = 000000000000000000000001101000--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch008_in_offsets: rematch008_in_offsets.

          if r_req then
            tmp_data64 := r_hold(63 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data64 := f_rematch008_in_offsets_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(63 downto 0) := tmp_data64;
          end if;

          -- Read logic for block rematch008_in_offsets_reg_low: block
          -- containing bits 31..0 of register `rematch008_in_offsets_reg`
          -- (`REMATCH008_IN_OFFSETS`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '1';

          end if;

        when "01101001" =>
          -- r_addr = 000000000000000000000001101001--

          -- Read logic for block rematch008_in_offsets_reg_high: block
          -- containing bits 63..32 of register `rematch008_in_offsets_reg`
          -- (`REMATCH008_IN_OFFSETS`).
          if r_req then

            r_data := r_hold(63 downto 32);
            if r_multi = '1' then
              r_ack := true;
            else
              r_nack := true;
            end if;
            r_multi := '0';

          end if;

        when "01101010" =>
          -- r_addr = 000000000000000000000001101010--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch008_in_values: rematch008_in_values.

          if r_req then
            tmp_data64 := r_hold(63 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data64 := f_rematch008_in_values_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(63 downto 0) := tmp_data64;
          end if;

          -- Read logic for block rematch008_in_values_reg_low: block containing
          -- bits 31..0 of register `rematch008_in_values_reg`
          -- (`REMATCH008_IN_VALUES`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '1';

          end if;

        when "01101011" =>
          -- r_addr = 000000000000000000000001101011--

          -- Read logic for block rematch008_in_values_reg_high: block
          -- containing bits 63..32 of register `rematch008_in_values_reg`
          -- (`REMATCH008_IN_VALUES`).
          if r_req then

            r_data := r_hold(63 downto 32);
            if r_multi = '1' then
              r_ack := true;
            else
              r_nack := true;
            end if;
            r_multi := '0';

          end if;

        when "01101100" =>
          -- r_addr = 000000000000000000000001101100--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch009_in_offsets: rematch009_in_offsets.

          if r_req then
            tmp_data64 := r_hold(63 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data64 := f_rematch009_in_offsets_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(63 downto 0) := tmp_data64;
          end if;

          -- Read logic for block rematch009_in_offsets_reg_low: block
          -- containing bits 31..0 of register `rematch009_in_offsets_reg`
          -- (`REMATCH009_IN_OFFSETS`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '1';

          end if;

        when "01101101" =>
          -- r_addr = 000000000000000000000001101101--

          -- Read logic for block rematch009_in_offsets_reg_high: block
          -- containing bits 63..32 of register `rematch009_in_offsets_reg`
          -- (`REMATCH009_IN_OFFSETS`).
          if r_req then

            r_data := r_hold(63 downto 32);
            if r_multi = '1' then
              r_ack := true;
            else
              r_nack := true;
            end if;
            r_multi := '0';

          end if;

        when "01101110" =>
          -- r_addr = 000000000000000000000001101110--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch009_in_values: rematch009_in_values.

          if r_req then
            tmp_data64 := r_hold(63 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data64 := f_rematch009_in_values_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(63 downto 0) := tmp_data64;
          end if;

          -- Read logic for block rematch009_in_values_reg_low: block containing
          -- bits 31..0 of register `rematch009_in_values_reg`
          -- (`REMATCH009_IN_VALUES`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '1';

          end if;

        when "01101111" =>
          -- r_addr = 000000000000000000000001101111--

          -- Read logic for block rematch009_in_values_reg_high: block
          -- containing bits 63..32 of register `rematch009_in_values_reg`
          -- (`REMATCH009_IN_VALUES`).
          if r_req then

            r_data := r_hold(63 downto 32);
            if r_multi = '1' then
              r_ack := true;
            else
              r_nack := true;
            end if;
            r_multi := '0';

          end if;

        when "01110000" =>
          -- r_addr = 000000000000000000000001110000--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch010_in_offsets: rematch010_in_offsets.

          if r_req then
            tmp_data64 := r_hold(63 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data64 := f_rematch010_in_offsets_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(63 downto 0) := tmp_data64;
          end if;

          -- Read logic for block rematch010_in_offsets_reg_low: block
          -- containing bits 31..0 of register `rematch010_in_offsets_reg`
          -- (`REMATCH010_IN_OFFSETS`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '1';

          end if;

        when "01110001" =>
          -- r_addr = 000000000000000000000001110001--

          -- Read logic for block rematch010_in_offsets_reg_high: block
          -- containing bits 63..32 of register `rematch010_in_offsets_reg`
          -- (`REMATCH010_IN_OFFSETS`).
          if r_req then

            r_data := r_hold(63 downto 32);
            if r_multi = '1' then
              r_ack := true;
            else
              r_nack := true;
            end if;
            r_multi := '0';

          end if;

        when "01110010" =>
          -- r_addr = 000000000000000000000001110010--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch010_in_values: rematch010_in_values.

          if r_req then
            tmp_data64 := r_hold(63 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data64 := f_rematch010_in_values_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(63 downto 0) := tmp_data64;
          end if;

          -- Read logic for block rematch010_in_values_reg_low: block containing
          -- bits 31..0 of register `rematch010_in_values_reg`
          -- (`REMATCH010_IN_VALUES`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '1';

          end if;

        when "01110011" =>
          -- r_addr = 000000000000000000000001110011--

          -- Read logic for block rematch010_in_values_reg_high: block
          -- containing bits 63..32 of register `rematch010_in_values_reg`
          -- (`REMATCH010_IN_VALUES`).
          if r_req then

            r_data := r_hold(63 downto 32);
            if r_multi = '1' then
              r_ack := true;
            else
              r_nack := true;
            end if;
            r_multi := '0';

          end if;

        when "01110100" =>
          -- r_addr = 000000000000000000000001110100--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch011_in_offsets: rematch011_in_offsets.

          if r_req then
            tmp_data64 := r_hold(63 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data64 := f_rematch011_in_offsets_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(63 downto 0) := tmp_data64;
          end if;

          -- Read logic for block rematch011_in_offsets_reg_low: block
          -- containing bits 31..0 of register `rematch011_in_offsets_reg`
          -- (`REMATCH011_IN_OFFSETS`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '1';

          end if;

        when "01110101" =>
          -- r_addr = 000000000000000000000001110101--

          -- Read logic for block rematch011_in_offsets_reg_high: block
          -- containing bits 63..32 of register `rematch011_in_offsets_reg`
          -- (`REMATCH011_IN_OFFSETS`).
          if r_req then

            r_data := r_hold(63 downto 32);
            if r_multi = '1' then
              r_ack := true;
            else
              r_nack := true;
            end if;
            r_multi := '0';

          end if;

        when "01110110" =>
          -- r_addr = 000000000000000000000001110110--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch011_in_values: rematch011_in_values.

          if r_req then
            tmp_data64 := r_hold(63 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data64 := f_rematch011_in_values_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(63 downto 0) := tmp_data64;
          end if;

          -- Read logic for block rematch011_in_values_reg_low: block containing
          -- bits 31..0 of register `rematch011_in_values_reg`
          -- (`REMATCH011_IN_VALUES`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '1';

          end if;

        when "01110111" =>
          -- r_addr = 000000000000000000000001110111--

          -- Read logic for block rematch011_in_values_reg_high: block
          -- containing bits 63..32 of register `rematch011_in_values_reg`
          -- (`REMATCH011_IN_VALUES`).
          if r_req then

            r_data := r_hold(63 downto 32);
            if r_multi = '1' then
              r_ack := true;
            else
              r_nack := true;
            end if;
            r_multi := '0';

          end if;

        when "01111000" =>
          -- r_addr = 000000000000000000000001111000--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch012_in_offsets: rematch012_in_offsets.

          if r_req then
            tmp_data64 := r_hold(63 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data64 := f_rematch012_in_offsets_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(63 downto 0) := tmp_data64;
          end if;

          -- Read logic for block rematch012_in_offsets_reg_low: block
          -- containing bits 31..0 of register `rematch012_in_offsets_reg`
          -- (`REMATCH012_IN_OFFSETS`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '1';

          end if;

        when "01111001" =>
          -- r_addr = 000000000000000000000001111001--

          -- Read logic for block rematch012_in_offsets_reg_high: block
          -- containing bits 63..32 of register `rematch012_in_offsets_reg`
          -- (`REMATCH012_IN_OFFSETS`).
          if r_req then

            r_data := r_hold(63 downto 32);
            if r_multi = '1' then
              r_ack := true;
            else
              r_nack := true;
            end if;
            r_multi := '0';

          end if;

        when "01111010" =>
          -- r_addr = 000000000000000000000001111010--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch012_in_values: rematch012_in_values.

          if r_req then
            tmp_data64 := r_hold(63 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data64 := f_rematch012_in_values_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(63 downto 0) := tmp_data64;
          end if;

          -- Read logic for block rematch012_in_values_reg_low: block containing
          -- bits 31..0 of register `rematch012_in_values_reg`
          -- (`REMATCH012_IN_VALUES`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '1';

          end if;

        when "01111011" =>
          -- r_addr = 000000000000000000000001111011--

          -- Read logic for block rematch012_in_values_reg_high: block
          -- containing bits 63..32 of register `rematch012_in_values_reg`
          -- (`REMATCH012_IN_VALUES`).
          if r_req then

            r_data := r_hold(63 downto 32);
            if r_multi = '1' then
              r_ack := true;
            else
              r_nack := true;
            end if;
            r_multi := '0';

          end if;

        when "01111100" =>
          -- r_addr = 000000000000000000000001111100--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch013_in_offsets: rematch013_in_offsets.

          if r_req then
            tmp_data64 := r_hold(63 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data64 := f_rematch013_in_offsets_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(63 downto 0) := tmp_data64;
          end if;

          -- Read logic for block rematch013_in_offsets_reg_low: block
          -- containing bits 31..0 of register `rematch013_in_offsets_reg`
          -- (`REMATCH013_IN_OFFSETS`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '1';

          end if;

        when "01111101" =>
          -- r_addr = 000000000000000000000001111101--

          -- Read logic for block rematch013_in_offsets_reg_high: block
          -- containing bits 63..32 of register `rematch013_in_offsets_reg`
          -- (`REMATCH013_IN_OFFSETS`).
          if r_req then

            r_data := r_hold(63 downto 32);
            if r_multi = '1' then
              r_ack := true;
            else
              r_nack := true;
            end if;
            r_multi := '0';

          end if;

        when "01111110" =>
          -- r_addr = 000000000000000000000001111110--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch013_in_values: rematch013_in_values.

          if r_req then
            tmp_data64 := r_hold(63 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data64 := f_rematch013_in_values_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(63 downto 0) := tmp_data64;
          end if;

          -- Read logic for block rematch013_in_values_reg_low: block containing
          -- bits 31..0 of register `rematch013_in_values_reg`
          -- (`REMATCH013_IN_VALUES`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '1';

          end if;

        when "01111111" =>
          -- r_addr = 000000000000000000000001111111--

          -- Read logic for block rematch013_in_values_reg_high: block
          -- containing bits 63..32 of register `rematch013_in_values_reg`
          -- (`REMATCH013_IN_VALUES`).
          if r_req then

            r_data := r_hold(63 downto 32);
            if r_multi = '1' then
              r_ack := true;
            else
              r_nack := true;
            end if;
            r_multi := '0';

          end if;

        when "10000000" =>
          -- r_addr = 000000000000000000000010000000--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch014_in_offsets: rematch014_in_offsets.

          if r_req then
            tmp_data64 := r_hold(63 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data64 := f_rematch014_in_offsets_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(63 downto 0) := tmp_data64;
          end if;

          -- Read logic for block rematch014_in_offsets_reg_low: block
          -- containing bits 31..0 of register `rematch014_in_offsets_reg`
          -- (`REMATCH014_IN_OFFSETS`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '1';

          end if;

        when "10000001" =>
          -- r_addr = 000000000000000000000010000001--

          -- Read logic for block rematch014_in_offsets_reg_high: block
          -- containing bits 63..32 of register `rematch014_in_offsets_reg`
          -- (`REMATCH014_IN_OFFSETS`).
          if r_req then

            r_data := r_hold(63 downto 32);
            if r_multi = '1' then
              r_ack := true;
            else
              r_nack := true;
            end if;
            r_multi := '0';

          end if;

        when "10000010" =>
          -- r_addr = 000000000000000000000010000010--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch014_in_values: rematch014_in_values.

          if r_req then
            tmp_data64 := r_hold(63 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data64 := f_rematch014_in_values_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(63 downto 0) := tmp_data64;
          end if;

          -- Read logic for block rematch014_in_values_reg_low: block containing
          -- bits 31..0 of register `rematch014_in_values_reg`
          -- (`REMATCH014_IN_VALUES`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '1';

          end if;

        when "10000011" =>
          -- r_addr = 000000000000000000000010000011--

          -- Read logic for block rematch014_in_values_reg_high: block
          -- containing bits 63..32 of register `rematch014_in_values_reg`
          -- (`REMATCH014_IN_VALUES`).
          if r_req then

            r_data := r_hold(63 downto 32);
            if r_multi = '1' then
              r_ack := true;
            else
              r_nack := true;
            end if;
            r_multi := '0';

          end if;

        when "10000100" =>
          -- r_addr = 000000000000000000000010000100--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch015_in_offsets: rematch015_in_offsets.

          if r_req then
            tmp_data64 := r_hold(63 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data64 := f_rematch015_in_offsets_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(63 downto 0) := tmp_data64;
          end if;

          -- Read logic for block rematch015_in_offsets_reg_low: block
          -- containing bits 31..0 of register `rematch015_in_offsets_reg`
          -- (`REMATCH015_IN_OFFSETS`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '1';

          end if;

        when "10000101" =>
          -- r_addr = 000000000000000000000010000101--

          -- Read logic for block rematch015_in_offsets_reg_high: block
          -- containing bits 63..32 of register `rematch015_in_offsets_reg`
          -- (`REMATCH015_IN_OFFSETS`).
          if r_req then

            r_data := r_hold(63 downto 32);
            if r_multi = '1' then
              r_ack := true;
            else
              r_nack := true;
            end if;
            r_multi := '0';

          end if;

        when "10000110" =>
          -- r_addr = 000000000000000000000010000110--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch015_in_values: rematch015_in_values.

          if r_req then
            tmp_data64 := r_hold(63 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data64 := f_rematch015_in_values_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(63 downto 0) := tmp_data64;
          end if;

          -- Read logic for block rematch015_in_values_reg_low: block containing
          -- bits 31..0 of register `rematch015_in_values_reg`
          -- (`REMATCH015_IN_VALUES`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '1';

          end if;

        when "10000111" =>
          -- r_addr = 000000000000000000000010000111--

          -- Read logic for block rematch015_in_values_reg_high: block
          -- containing bits 63..32 of register `rematch015_in_values_reg`
          -- (`REMATCH015_IN_VALUES`).
          if r_req then

            r_data := r_hold(63 downto 32);
            if r_multi = '1' then
              r_ack := true;
            else
              r_nack := true;
            end if;
            r_multi := '0';

          end if;

        when "10001000" =>
          -- r_addr = 000000000000000000000010001000--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch000_taxi_out_values:
          -- rematch000_taxi_out_values.

          if r_req then
            tmp_data64 := r_hold(63 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data64 := f_rematch000_taxi_out_values_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(63 downto 0) := tmp_data64;
          end if;

          -- Read logic for block rematch000_taxi_out_values_reg_low: block
          -- containing bits 31..0 of register `rematch000_taxi_out_values_reg`
          -- (`REMATCH000_TAXI_OUT_VALUES`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '1';

          end if;

        when "10001001" =>
          -- r_addr = 000000000000000000000010001001--

          -- Read logic for block rematch000_taxi_out_values_reg_high: block
          -- containing bits 63..32 of register `rematch000_taxi_out_values_reg`
          -- (`REMATCH000_TAXI_OUT_VALUES`).
          if r_req then

            r_data := r_hold(63 downto 32);
            if r_multi = '1' then
              r_ack := true;
            else
              r_nack := true;
            end if;
            r_multi := '0';

          end if;

        when "10001010" =>
          -- r_addr = 000000000000000000000010001010--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch001_taxi_out_values:
          -- rematch001_taxi_out_values.

          if r_req then
            tmp_data64 := r_hold(63 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data64 := f_rematch001_taxi_out_values_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(63 downto 0) := tmp_data64;
          end if;

          -- Read logic for block rematch001_taxi_out_values_reg_low: block
          -- containing bits 31..0 of register `rematch001_taxi_out_values_reg`
          -- (`REMATCH001_TAXI_OUT_VALUES`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '1';

          end if;

        when "10001011" =>
          -- r_addr = 000000000000000000000010001011--

          -- Read logic for block rematch001_taxi_out_values_reg_high: block
          -- containing bits 63..32 of register `rematch001_taxi_out_values_reg`
          -- (`REMATCH001_TAXI_OUT_VALUES`).
          if r_req then

            r_data := r_hold(63 downto 32);
            if r_multi = '1' then
              r_ack := true;
            else
              r_nack := true;
            end if;
            r_multi := '0';

          end if;

        when "10001100" =>
          -- r_addr = 000000000000000000000010001100--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch002_taxi_out_values:
          -- rematch002_taxi_out_values.

          if r_req then
            tmp_data64 := r_hold(63 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data64 := f_rematch002_taxi_out_values_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(63 downto 0) := tmp_data64;
          end if;

          -- Read logic for block rematch002_taxi_out_values_reg_low: block
          -- containing bits 31..0 of register `rematch002_taxi_out_values_reg`
          -- (`REMATCH002_TAXI_OUT_VALUES`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '1';

          end if;

        when "10001101" =>
          -- r_addr = 000000000000000000000010001101--

          -- Read logic for block rematch002_taxi_out_values_reg_high: block
          -- containing bits 63..32 of register `rematch002_taxi_out_values_reg`
          -- (`REMATCH002_TAXI_OUT_VALUES`).
          if r_req then

            r_data := r_hold(63 downto 32);
            if r_multi = '1' then
              r_ack := true;
            else
              r_nack := true;
            end if;
            r_multi := '0';

          end if;

        when "10001110" =>
          -- r_addr = 000000000000000000000010001110--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch003_taxi_out_values:
          -- rematch003_taxi_out_values.

          if r_req then
            tmp_data64 := r_hold(63 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data64 := f_rematch003_taxi_out_values_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(63 downto 0) := tmp_data64;
          end if;

          -- Read logic for block rematch003_taxi_out_values_reg_low: block
          -- containing bits 31..0 of register `rematch003_taxi_out_values_reg`
          -- (`REMATCH003_TAXI_OUT_VALUES`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '1';

          end if;

        when "10001111" =>
          -- r_addr = 000000000000000000000010001111--

          -- Read logic for block rematch003_taxi_out_values_reg_high: block
          -- containing bits 63..32 of register `rematch003_taxi_out_values_reg`
          -- (`REMATCH003_TAXI_OUT_VALUES`).
          if r_req then

            r_data := r_hold(63 downto 32);
            if r_multi = '1' then
              r_ack := true;
            else
              r_nack := true;
            end if;
            r_multi := '0';

          end if;

        when "10010000" =>
          -- r_addr = 000000000000000000000010010000--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch004_taxi_out_values:
          -- rematch004_taxi_out_values.

          if r_req then
            tmp_data64 := r_hold(63 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data64 := f_rematch004_taxi_out_values_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(63 downto 0) := tmp_data64;
          end if;

          -- Read logic for block rematch004_taxi_out_values_reg_low: block
          -- containing bits 31..0 of register `rematch004_taxi_out_values_reg`
          -- (`REMATCH004_TAXI_OUT_VALUES`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '1';

          end if;

        when "10010001" =>
          -- r_addr = 000000000000000000000010010001--

          -- Read logic for block rematch004_taxi_out_values_reg_high: block
          -- containing bits 63..32 of register `rematch004_taxi_out_values_reg`
          -- (`REMATCH004_TAXI_OUT_VALUES`).
          if r_req then

            r_data := r_hold(63 downto 32);
            if r_multi = '1' then
              r_ack := true;
            else
              r_nack := true;
            end if;
            r_multi := '0';

          end if;

        when "10010010" =>
          -- r_addr = 000000000000000000000010010010--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch005_taxi_out_values:
          -- rematch005_taxi_out_values.

          if r_req then
            tmp_data64 := r_hold(63 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data64 := f_rematch005_taxi_out_values_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(63 downto 0) := tmp_data64;
          end if;

          -- Read logic for block rematch005_taxi_out_values_reg_low: block
          -- containing bits 31..0 of register `rematch005_taxi_out_values_reg`
          -- (`REMATCH005_TAXI_OUT_VALUES`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '1';

          end if;

        when "10010011" =>
          -- r_addr = 000000000000000000000010010011--

          -- Read logic for block rematch005_taxi_out_values_reg_high: block
          -- containing bits 63..32 of register `rematch005_taxi_out_values_reg`
          -- (`REMATCH005_TAXI_OUT_VALUES`).
          if r_req then

            r_data := r_hold(63 downto 32);
            if r_multi = '1' then
              r_ack := true;
            else
              r_nack := true;
            end if;
            r_multi := '0';

          end if;

        when "10010100" =>
          -- r_addr = 000000000000000000000010010100--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch006_taxi_out_values:
          -- rematch006_taxi_out_values.

          if r_req then
            tmp_data64 := r_hold(63 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data64 := f_rematch006_taxi_out_values_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(63 downto 0) := tmp_data64;
          end if;

          -- Read logic for block rematch006_taxi_out_values_reg_low: block
          -- containing bits 31..0 of register `rematch006_taxi_out_values_reg`
          -- (`REMATCH006_TAXI_OUT_VALUES`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '1';

          end if;

        when "10010101" =>
          -- r_addr = 000000000000000000000010010101--

          -- Read logic for block rematch006_taxi_out_values_reg_high: block
          -- containing bits 63..32 of register `rematch006_taxi_out_values_reg`
          -- (`REMATCH006_TAXI_OUT_VALUES`).
          if r_req then

            r_data := r_hold(63 downto 32);
            if r_multi = '1' then
              r_ack := true;
            else
              r_nack := true;
            end if;
            r_multi := '0';

          end if;

        when "10010110" =>
          -- r_addr = 000000000000000000000010010110--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch007_taxi_out_values:
          -- rematch007_taxi_out_values.

          if r_req then
            tmp_data64 := r_hold(63 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data64 := f_rematch007_taxi_out_values_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(63 downto 0) := tmp_data64;
          end if;

          -- Read logic for block rematch007_taxi_out_values_reg_low: block
          -- containing bits 31..0 of register `rematch007_taxi_out_values_reg`
          -- (`REMATCH007_TAXI_OUT_VALUES`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '1';

          end if;

        when "10010111" =>
          -- r_addr = 000000000000000000000010010111--

          -- Read logic for block rematch007_taxi_out_values_reg_high: block
          -- containing bits 63..32 of register `rematch007_taxi_out_values_reg`
          -- (`REMATCH007_TAXI_OUT_VALUES`).
          if r_req then

            r_data := r_hold(63 downto 32);
            if r_multi = '1' then
              r_ack := true;
            else
              r_nack := true;
            end if;
            r_multi := '0';

          end if;

        when "10011000" =>
          -- r_addr = 000000000000000000000010011000--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch008_taxi_out_values:
          -- rematch008_taxi_out_values.

          if r_req then
            tmp_data64 := r_hold(63 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data64 := f_rematch008_taxi_out_values_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(63 downto 0) := tmp_data64;
          end if;

          -- Read logic for block rematch008_taxi_out_values_reg_low: block
          -- containing bits 31..0 of register `rematch008_taxi_out_values_reg`
          -- (`REMATCH008_TAXI_OUT_VALUES`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '1';

          end if;

        when "10011001" =>
          -- r_addr = 000000000000000000000010011001--

          -- Read logic for block rematch008_taxi_out_values_reg_high: block
          -- containing bits 63..32 of register `rematch008_taxi_out_values_reg`
          -- (`REMATCH008_TAXI_OUT_VALUES`).
          if r_req then

            r_data := r_hold(63 downto 32);
            if r_multi = '1' then
              r_ack := true;
            else
              r_nack := true;
            end if;
            r_multi := '0';

          end if;

        when "10011010" =>
          -- r_addr = 000000000000000000000010011010--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch009_taxi_out_values:
          -- rematch009_taxi_out_values.

          if r_req then
            tmp_data64 := r_hold(63 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data64 := f_rematch009_taxi_out_values_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(63 downto 0) := tmp_data64;
          end if;

          -- Read logic for block rematch009_taxi_out_values_reg_low: block
          -- containing bits 31..0 of register `rematch009_taxi_out_values_reg`
          -- (`REMATCH009_TAXI_OUT_VALUES`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '1';

          end if;

        when "10011011" =>
          -- r_addr = 000000000000000000000010011011--

          -- Read logic for block rematch009_taxi_out_values_reg_high: block
          -- containing bits 63..32 of register `rematch009_taxi_out_values_reg`
          -- (`REMATCH009_TAXI_OUT_VALUES`).
          if r_req then

            r_data := r_hold(63 downto 32);
            if r_multi = '1' then
              r_ack := true;
            else
              r_nack := true;
            end if;
            r_multi := '0';

          end if;

        when "10011100" =>
          -- r_addr = 000000000000000000000010011100--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch010_taxi_out_values:
          -- rematch010_taxi_out_values.

          if r_req then
            tmp_data64 := r_hold(63 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data64 := f_rematch010_taxi_out_values_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(63 downto 0) := tmp_data64;
          end if;

          -- Read logic for block rematch010_taxi_out_values_reg_low: block
          -- containing bits 31..0 of register `rematch010_taxi_out_values_reg`
          -- (`REMATCH010_TAXI_OUT_VALUES`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '1';

          end if;

        when "10011101" =>
          -- r_addr = 000000000000000000000010011101--

          -- Read logic for block rematch010_taxi_out_values_reg_high: block
          -- containing bits 63..32 of register `rematch010_taxi_out_values_reg`
          -- (`REMATCH010_TAXI_OUT_VALUES`).
          if r_req then

            r_data := r_hold(63 downto 32);
            if r_multi = '1' then
              r_ack := true;
            else
              r_nack := true;
            end if;
            r_multi := '0';

          end if;

        when "10011110" =>
          -- r_addr = 000000000000000000000010011110--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch011_taxi_out_values:
          -- rematch011_taxi_out_values.

          if r_req then
            tmp_data64 := r_hold(63 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data64 := f_rematch011_taxi_out_values_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(63 downto 0) := tmp_data64;
          end if;

          -- Read logic for block rematch011_taxi_out_values_reg_low: block
          -- containing bits 31..0 of register `rematch011_taxi_out_values_reg`
          -- (`REMATCH011_TAXI_OUT_VALUES`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '1';

          end if;

        when "10011111" =>
          -- r_addr = 000000000000000000000010011111--

          -- Read logic for block rematch011_taxi_out_values_reg_high: block
          -- containing bits 63..32 of register `rematch011_taxi_out_values_reg`
          -- (`REMATCH011_TAXI_OUT_VALUES`).
          if r_req then

            r_data := r_hold(63 downto 32);
            if r_multi = '1' then
              r_ack := true;
            else
              r_nack := true;
            end if;
            r_multi := '0';

          end if;

        when "10100000" =>
          -- r_addr = 000000000000000000000010100000--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch012_taxi_out_values:
          -- rematch012_taxi_out_values.

          if r_req then
            tmp_data64 := r_hold(63 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data64 := f_rematch012_taxi_out_values_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(63 downto 0) := tmp_data64;
          end if;

          -- Read logic for block rematch012_taxi_out_values_reg_low: block
          -- containing bits 31..0 of register `rematch012_taxi_out_values_reg`
          -- (`REMATCH012_TAXI_OUT_VALUES`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '1';

          end if;

        when "10100001" =>
          -- r_addr = 000000000000000000000010100001--

          -- Read logic for block rematch012_taxi_out_values_reg_high: block
          -- containing bits 63..32 of register `rematch012_taxi_out_values_reg`
          -- (`REMATCH012_TAXI_OUT_VALUES`).
          if r_req then

            r_data := r_hold(63 downto 32);
            if r_multi = '1' then
              r_ack := true;
            else
              r_nack := true;
            end if;
            r_multi := '0';

          end if;

        when "10100010" =>
          -- r_addr = 000000000000000000000010100010--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch013_taxi_out_values:
          -- rematch013_taxi_out_values.

          if r_req then
            tmp_data64 := r_hold(63 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data64 := f_rematch013_taxi_out_values_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(63 downto 0) := tmp_data64;
          end if;

          -- Read logic for block rematch013_taxi_out_values_reg_low: block
          -- containing bits 31..0 of register `rematch013_taxi_out_values_reg`
          -- (`REMATCH013_TAXI_OUT_VALUES`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '1';

          end if;

        when "10100011" =>
          -- r_addr = 000000000000000000000010100011--

          -- Read logic for block rematch013_taxi_out_values_reg_high: block
          -- containing bits 63..32 of register `rematch013_taxi_out_values_reg`
          -- (`REMATCH013_TAXI_OUT_VALUES`).
          if r_req then

            r_data := r_hold(63 downto 32);
            if r_multi = '1' then
              r_ack := true;
            else
              r_nack := true;
            end if;
            r_multi := '0';

          end if;

        when "10100100" =>
          -- r_addr = 000000000000000000000010100100--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch014_taxi_out_values:
          -- rematch014_taxi_out_values.

          if r_req then
            tmp_data64 := r_hold(63 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data64 := f_rematch014_taxi_out_values_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(63 downto 0) := tmp_data64;
          end if;

          -- Read logic for block rematch014_taxi_out_values_reg_low: block
          -- containing bits 31..0 of register `rematch014_taxi_out_values_reg`
          -- (`REMATCH014_TAXI_OUT_VALUES`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '1';

          end if;

        when "10100101" =>
          -- r_addr = 000000000000000000000010100101--

          -- Read logic for block rematch014_taxi_out_values_reg_high: block
          -- containing bits 63..32 of register `rematch014_taxi_out_values_reg`
          -- (`REMATCH014_TAXI_OUT_VALUES`).
          if r_req then

            r_data := r_hold(63 downto 32);
            if r_multi = '1' then
              r_ack := true;
            else
              r_nack := true;
            end if;
            r_multi := '0';

          end if;

        when "10100110" =>
          -- r_addr = 000000000000000000000010100110--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch015_taxi_out_values:
          -- rematch015_taxi_out_values.

          if r_req then
            tmp_data64 := r_hold(63 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data64 := f_rematch015_taxi_out_values_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(63 downto 0) := tmp_data64;
          end if;

          -- Read logic for block rematch015_taxi_out_values_reg_low: block
          -- containing bits 31..0 of register `rematch015_taxi_out_values_reg`
          -- (`REMATCH015_TAXI_OUT_VALUES`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '1';

          end if;

        when "10100111" =>
          -- r_addr = 000000000000000000000010100111--

          -- Read logic for block rematch015_taxi_out_values_reg_high: block
          -- containing bits 63..32 of register `rematch015_taxi_out_values_reg`
          -- (`REMATCH015_TAXI_OUT_VALUES`).
          if r_req then

            r_data := r_hold(63 downto 32);
            if r_multi = '1' then
              r_ack := true;
            else
              r_nack := true;
            end if;
            r_multi := '0';

          end if;

        when "10101000" =>
          -- r_addr = 000000000000000000000010101000--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch000_taxi_count: rematch000_taxi_count.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch000_taxi_count_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch000_taxi_count_reg: block containing
          -- bits 31..0 of register `rematch000_taxi_count_reg`
          -- (`REMATCH000_TAXI_COUNT`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "10101001" =>
          -- r_addr = 000000000000000000000010101001--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch000_errors: rematch000_errors.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch000_errors_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch000_errors_reg: block containing bits
          -- 31..0 of register `rematch000_errors_reg` (`REMATCH000_ERRORS`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "10101010" =>
          -- r_addr = 000000000000000000000010101010--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch001_taxi_count: rematch001_taxi_count.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch001_taxi_count_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch001_taxi_count_reg: block containing
          -- bits 31..0 of register `rematch001_taxi_count_reg`
          -- (`REMATCH001_TAXI_COUNT`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "10101011" =>
          -- r_addr = 000000000000000000000010101011--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch001_errors: rematch001_errors.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch001_errors_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch001_errors_reg: block containing bits
          -- 31..0 of register `rematch001_errors_reg` (`REMATCH001_ERRORS`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "10101100" =>
          -- r_addr = 000000000000000000000010101100--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch002_taxi_count: rematch002_taxi_count.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch002_taxi_count_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch002_taxi_count_reg: block containing
          -- bits 31..0 of register `rematch002_taxi_count_reg`
          -- (`REMATCH002_TAXI_COUNT`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "10101101" =>
          -- r_addr = 000000000000000000000010101101--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch002_errors: rematch002_errors.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch002_errors_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch002_errors_reg: block containing bits
          -- 31..0 of register `rematch002_errors_reg` (`REMATCH002_ERRORS`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "10101110" =>
          -- r_addr = 000000000000000000000010101110--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch003_taxi_count: rematch003_taxi_count.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch003_taxi_count_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch003_taxi_count_reg: block containing
          -- bits 31..0 of register `rematch003_taxi_count_reg`
          -- (`REMATCH003_TAXI_COUNT`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "10101111" =>
          -- r_addr = 000000000000000000000010101111--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch003_errors: rematch003_errors.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch003_errors_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch003_errors_reg: block containing bits
          -- 31..0 of register `rematch003_errors_reg` (`REMATCH003_ERRORS`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "10110000" =>
          -- r_addr = 000000000000000000000010110000--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch004_taxi_count: rematch004_taxi_count.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch004_taxi_count_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch004_taxi_count_reg: block containing
          -- bits 31..0 of register `rematch004_taxi_count_reg`
          -- (`REMATCH004_TAXI_COUNT`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "10110001" =>
          -- r_addr = 000000000000000000000010110001--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch004_errors: rematch004_errors.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch004_errors_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch004_errors_reg: block containing bits
          -- 31..0 of register `rematch004_errors_reg` (`REMATCH004_ERRORS`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "10110010" =>
          -- r_addr = 000000000000000000000010110010--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch005_taxi_count: rematch005_taxi_count.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch005_taxi_count_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch005_taxi_count_reg: block containing
          -- bits 31..0 of register `rematch005_taxi_count_reg`
          -- (`REMATCH005_TAXI_COUNT`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "10110011" =>
          -- r_addr = 000000000000000000000010110011--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch005_errors: rematch005_errors.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch005_errors_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch005_errors_reg: block containing bits
          -- 31..0 of register `rematch005_errors_reg` (`REMATCH005_ERRORS`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "10110100" =>
          -- r_addr = 000000000000000000000010110100--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch006_taxi_count: rematch006_taxi_count.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch006_taxi_count_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch006_taxi_count_reg: block containing
          -- bits 31..0 of register `rematch006_taxi_count_reg`
          -- (`REMATCH006_TAXI_COUNT`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "10110101" =>
          -- r_addr = 000000000000000000000010110101--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch006_errors: rematch006_errors.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch006_errors_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch006_errors_reg: block containing bits
          -- 31..0 of register `rematch006_errors_reg` (`REMATCH006_ERRORS`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "10110110" =>
          -- r_addr = 000000000000000000000010110110--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch007_taxi_count: rematch007_taxi_count.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch007_taxi_count_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch007_taxi_count_reg: block containing
          -- bits 31..0 of register `rematch007_taxi_count_reg`
          -- (`REMATCH007_TAXI_COUNT`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "10110111" =>
          -- r_addr = 000000000000000000000010110111--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch007_errors: rematch007_errors.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch007_errors_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch007_errors_reg: block containing bits
          -- 31..0 of register `rematch007_errors_reg` (`REMATCH007_ERRORS`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "10111000" =>
          -- r_addr = 000000000000000000000010111000--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch008_taxi_count: rematch008_taxi_count.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch008_taxi_count_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch008_taxi_count_reg: block containing
          -- bits 31..0 of register `rematch008_taxi_count_reg`
          -- (`REMATCH008_TAXI_COUNT`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "10111001" =>
          -- r_addr = 000000000000000000000010111001--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch008_errors: rematch008_errors.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch008_errors_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch008_errors_reg: block containing bits
          -- 31..0 of register `rematch008_errors_reg` (`REMATCH008_ERRORS`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "10111010" =>
          -- r_addr = 000000000000000000000010111010--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch009_taxi_count: rematch009_taxi_count.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch009_taxi_count_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch009_taxi_count_reg: block containing
          -- bits 31..0 of register `rematch009_taxi_count_reg`
          -- (`REMATCH009_TAXI_COUNT`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "10111011" =>
          -- r_addr = 000000000000000000000010111011--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch009_errors: rematch009_errors.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch009_errors_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch009_errors_reg: block containing bits
          -- 31..0 of register `rematch009_errors_reg` (`REMATCH009_ERRORS`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "10111100" =>
          -- r_addr = 000000000000000000000010111100--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch010_taxi_count: rematch010_taxi_count.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch010_taxi_count_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch010_taxi_count_reg: block containing
          -- bits 31..0 of register `rematch010_taxi_count_reg`
          -- (`REMATCH010_TAXI_COUNT`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "10111101" =>
          -- r_addr = 000000000000000000000010111101--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch010_errors: rematch010_errors.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch010_errors_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch010_errors_reg: block containing bits
          -- 31..0 of register `rematch010_errors_reg` (`REMATCH010_ERRORS`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "10111110" =>
          -- r_addr = 000000000000000000000010111110--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch011_taxi_count: rematch011_taxi_count.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch011_taxi_count_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch011_taxi_count_reg: block containing
          -- bits 31..0 of register `rematch011_taxi_count_reg`
          -- (`REMATCH011_TAXI_COUNT`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "10111111" =>
          -- r_addr = 000000000000000000000010111111--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch011_errors: rematch011_errors.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch011_errors_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch011_errors_reg: block containing bits
          -- 31..0 of register `rematch011_errors_reg` (`REMATCH011_ERRORS`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "11000000" =>
          -- r_addr = 000000000000000000000011000000--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch012_taxi_count: rematch012_taxi_count.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch012_taxi_count_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch012_taxi_count_reg: block containing
          -- bits 31..0 of register `rematch012_taxi_count_reg`
          -- (`REMATCH012_TAXI_COUNT`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "11000001" =>
          -- r_addr = 000000000000000000000011000001--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch012_errors: rematch012_errors.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch012_errors_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch012_errors_reg: block containing bits
          -- 31..0 of register `rematch012_errors_reg` (`REMATCH012_ERRORS`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "11000010" =>
          -- r_addr = 000000000000000000000011000010--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch013_taxi_count: rematch013_taxi_count.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch013_taxi_count_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch013_taxi_count_reg: block containing
          -- bits 31..0 of register `rematch013_taxi_count_reg`
          -- (`REMATCH013_TAXI_COUNT`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "11000011" =>
          -- r_addr = 000000000000000000000011000011--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch013_errors: rematch013_errors.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch013_errors_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch013_errors_reg: block containing bits
          -- 31..0 of register `rematch013_errors_reg` (`REMATCH013_ERRORS`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "11000100" =>
          -- r_addr = 000000000000000000000011000100--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch014_taxi_count: rematch014_taxi_count.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch014_taxi_count_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch014_taxi_count_reg: block containing
          -- bits 31..0 of register `rematch014_taxi_count_reg`
          -- (`REMATCH014_TAXI_COUNT`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "11000101" =>
          -- r_addr = 000000000000000000000011000101--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch014_errors: rematch014_errors.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch014_errors_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch014_errors_reg: block containing bits
          -- 31..0 of register `rematch014_errors_reg` (`REMATCH014_ERRORS`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "11000110" =>
          -- r_addr = 000000000000000000000011000110--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch015_taxi_count: rematch015_taxi_count.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch015_taxi_count_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch015_taxi_count_reg: block containing
          -- bits 31..0 of register `rematch015_taxi_count_reg`
          -- (`REMATCH015_TAXI_COUNT`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when "11000111" =>
          -- r_addr = 000000000000000000000011000111--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field rematch015_errors: rematch015_errors.

          if r_req then
            tmp_data32 := r_hold(31 downto 0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data32 := f_rematch015_errors_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(31 downto 0) := tmp_data32;
          end if;

          -- Read logic for block rematch015_errors_reg: block containing bits
          -- 31..0 of register `rematch015_errors_reg` (`REMATCH015_ERRORS`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

        when others => -- "11001000"
          -- r_addr = 000000000000000000000011001000--

          if r_req then

            -- Clear holding register location prior to read.
            r_hold := (others => '0');

          end if;

          -- Read logic for field Profile_enable: Profile_enable.

          if r_req then
            tmp_data := r_hold(0);
          end if;
          if r_req then

            -- Regular access logic. Read mode: enabled.
            tmp_data := f_Profile_enable_r((0)).d;
            r_ack := true;

          end if;
          if r_req then
            r_hold(0) := tmp_data;
          end if;

          -- Read logic for block Profile_enable_reg: block containing bits
          -- 31..0 of register `Profile_enable_reg` (`PROFILE_ENABLE`).
          if r_req then

            r_data := r_hold(31 downto 0);
            r_multi := '0';

          end if;

      end case;

      -------------------------------------------------------------------------
      -- Bus write logic
      -------------------------------------------------------------------------

      -- Construct the subaddresses for write mode.
      subaddr_none(0) := '0';

      -- Write address decoder.
      case w_addr(9 downto 2) is
        when "00000100" =>
          -- w_addr = 000000000000000000000000000100--

          -- Write logic for block start_reg: block containing bits 31..0 of
          -- register `start_reg` (`START`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field start: start.

          tmp_data := w_hold(0);
          tmp_strb := w_hstb(0);
          if w_req then

            -- Regular access logic. Write mode: enabled.

            f_start_r((0)).d := tmp_data;
            w_ack := true;

            -- Handle post-write operation: invalidate.
            f_start_r((0)).v := '1';
            f_start_r((0)).inval := '1';

          end if;

          -- Write logic for field stop: stop.

          tmp_data := w_hold(1);
          tmp_strb := w_hstb(1);
          if w_req then

            -- Regular access logic. Write mode: enabled.

            f_stop_r((0)).d := tmp_data;
            w_ack := true;

            -- Handle post-write operation: invalidate.
            f_stop_r((0)).v := '1';
            f_stop_r((0)).inval := '1';

          end if;

          -- Write logic for field reset: reset.

          tmp_data := w_hold(2);
          tmp_strb := w_hstb(2);
          if w_req then

            -- Regular access logic. Write mode: enabled.

            f_reset_r((0)).d := tmp_data;
            w_ack := true;

            -- Handle post-write operation: invalidate.
            f_reset_r((0)).v := '1';
            f_reset_r((0)).inval := '1';

          end if;

        when "00001000" =>
          -- w_addr = 000000000000000000000000001000--

          -- Write logic for block rematch000_firstidx_reg: block containing
          -- bits 31..0 of register `rematch000_firstidx_reg`
          -- (`REMATCH000_FIRSTIDX`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch000_firstidx: rematch000_firstidx.

          tmp_data32 := w_hold(31 downto 0);
          tmp_strb32 := w_hstb(31 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch000_firstidx_r((0)).d
                := (f_rematch000_firstidx_r((0)).d and not tmp_strb32)
                or tmp_data32;
            w_ack := true;

          end if;

        when "00001001" =>
          -- w_addr = 000000000000000000000000001001--

          -- Write logic for block rematch000_lastidx_reg: block containing bits
          -- 31..0 of register `rematch000_lastidx_reg` (`REMATCH000_LASTIDX`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch000_lastidx: rematch000_lastidx.

          tmp_data32 := w_hold(31 downto 0);
          tmp_strb32 := w_hstb(31 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch000_lastidx_r((0)).d
                := (f_rematch000_lastidx_r((0)).d and not tmp_strb32)
                or tmp_data32;
            w_ack := true;

          end if;

        when "00001010" =>
          -- w_addr = 000000000000000000000000001010--

          -- Write logic for block rematch001_firstidx_reg: block containing
          -- bits 31..0 of register `rematch001_firstidx_reg`
          -- (`REMATCH001_FIRSTIDX`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch001_firstidx: rematch001_firstidx.

          tmp_data32 := w_hold(31 downto 0);
          tmp_strb32 := w_hstb(31 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch001_firstidx_r((0)).d
                := (f_rematch001_firstidx_r((0)).d and not tmp_strb32)
                or tmp_data32;
            w_ack := true;

          end if;

        when "00001011" =>
          -- w_addr = 000000000000000000000000001011--

          -- Write logic for block rematch001_lastidx_reg: block containing bits
          -- 31..0 of register `rematch001_lastidx_reg` (`REMATCH001_LASTIDX`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch001_lastidx: rematch001_lastidx.

          tmp_data32 := w_hold(31 downto 0);
          tmp_strb32 := w_hstb(31 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch001_lastidx_r((0)).d
                := (f_rematch001_lastidx_r((0)).d and not tmp_strb32)
                or tmp_data32;
            w_ack := true;

          end if;

        when "00001100" =>
          -- w_addr = 000000000000000000000000001100--

          -- Write logic for block rematch002_firstidx_reg: block containing
          -- bits 31..0 of register `rematch002_firstidx_reg`
          -- (`REMATCH002_FIRSTIDX`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch002_firstidx: rematch002_firstidx.

          tmp_data32 := w_hold(31 downto 0);
          tmp_strb32 := w_hstb(31 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch002_firstidx_r((0)).d
                := (f_rematch002_firstidx_r((0)).d and not tmp_strb32)
                or tmp_data32;
            w_ack := true;

          end if;

        when "00001101" =>
          -- w_addr = 000000000000000000000000001101--

          -- Write logic for block rematch002_lastidx_reg: block containing bits
          -- 31..0 of register `rematch002_lastidx_reg` (`REMATCH002_LASTIDX`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch002_lastidx: rematch002_lastidx.

          tmp_data32 := w_hold(31 downto 0);
          tmp_strb32 := w_hstb(31 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch002_lastidx_r((0)).d
                := (f_rematch002_lastidx_r((0)).d and not tmp_strb32)
                or tmp_data32;
            w_ack := true;

          end if;

        when "00001110" =>
          -- w_addr = 000000000000000000000000001110--

          -- Write logic for block rematch003_firstidx_reg: block containing
          -- bits 31..0 of register `rematch003_firstidx_reg`
          -- (`REMATCH003_FIRSTIDX`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch003_firstidx: rematch003_firstidx.

          tmp_data32 := w_hold(31 downto 0);
          tmp_strb32 := w_hstb(31 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch003_firstidx_r((0)).d
                := (f_rematch003_firstidx_r((0)).d and not tmp_strb32)
                or tmp_data32;
            w_ack := true;

          end if;

        when "00001111" =>
          -- w_addr = 000000000000000000000000001111--

          -- Write logic for block rematch003_lastidx_reg: block containing bits
          -- 31..0 of register `rematch003_lastidx_reg` (`REMATCH003_LASTIDX`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch003_lastidx: rematch003_lastidx.

          tmp_data32 := w_hold(31 downto 0);
          tmp_strb32 := w_hstb(31 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch003_lastidx_r((0)).d
                := (f_rematch003_lastidx_r((0)).d and not tmp_strb32)
                or tmp_data32;
            w_ack := true;

          end if;

        when "00010000" =>
          -- w_addr = 000000000000000000000000010000--

          -- Write logic for block rematch004_firstidx_reg: block containing
          -- bits 31..0 of register `rematch004_firstidx_reg`
          -- (`REMATCH004_FIRSTIDX`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch004_firstidx: rematch004_firstidx.

          tmp_data32 := w_hold(31 downto 0);
          tmp_strb32 := w_hstb(31 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch004_firstidx_r((0)).d
                := (f_rematch004_firstidx_r((0)).d and not tmp_strb32)
                or tmp_data32;
            w_ack := true;

          end if;

        when "00010001" =>
          -- w_addr = 000000000000000000000000010001--

          -- Write logic for block rematch004_lastidx_reg: block containing bits
          -- 31..0 of register `rematch004_lastidx_reg` (`REMATCH004_LASTIDX`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch004_lastidx: rematch004_lastidx.

          tmp_data32 := w_hold(31 downto 0);
          tmp_strb32 := w_hstb(31 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch004_lastidx_r((0)).d
                := (f_rematch004_lastidx_r((0)).d and not tmp_strb32)
                or tmp_data32;
            w_ack := true;

          end if;

        when "00010010" =>
          -- w_addr = 000000000000000000000000010010--

          -- Write logic for block rematch005_firstidx_reg: block containing
          -- bits 31..0 of register `rematch005_firstidx_reg`
          -- (`REMATCH005_FIRSTIDX`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch005_firstidx: rematch005_firstidx.

          tmp_data32 := w_hold(31 downto 0);
          tmp_strb32 := w_hstb(31 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch005_firstidx_r((0)).d
                := (f_rematch005_firstidx_r((0)).d and not tmp_strb32)
                or tmp_data32;
            w_ack := true;

          end if;

        when "00010011" =>
          -- w_addr = 000000000000000000000000010011--

          -- Write logic for block rematch005_lastidx_reg: block containing bits
          -- 31..0 of register `rematch005_lastidx_reg` (`REMATCH005_LASTIDX`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch005_lastidx: rematch005_lastidx.

          tmp_data32 := w_hold(31 downto 0);
          tmp_strb32 := w_hstb(31 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch005_lastidx_r((0)).d
                := (f_rematch005_lastidx_r((0)).d and not tmp_strb32)
                or tmp_data32;
            w_ack := true;

          end if;

        when "00010100" =>
          -- w_addr = 000000000000000000000000010100--

          -- Write logic for block rematch006_firstidx_reg: block containing
          -- bits 31..0 of register `rematch006_firstidx_reg`
          -- (`REMATCH006_FIRSTIDX`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch006_firstidx: rematch006_firstidx.

          tmp_data32 := w_hold(31 downto 0);
          tmp_strb32 := w_hstb(31 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch006_firstidx_r((0)).d
                := (f_rematch006_firstidx_r((0)).d and not tmp_strb32)
                or tmp_data32;
            w_ack := true;

          end if;

        when "00010101" =>
          -- w_addr = 000000000000000000000000010101--

          -- Write logic for block rematch006_lastidx_reg: block containing bits
          -- 31..0 of register `rematch006_lastidx_reg` (`REMATCH006_LASTIDX`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch006_lastidx: rematch006_lastidx.

          tmp_data32 := w_hold(31 downto 0);
          tmp_strb32 := w_hstb(31 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch006_lastidx_r((0)).d
                := (f_rematch006_lastidx_r((0)).d and not tmp_strb32)
                or tmp_data32;
            w_ack := true;

          end if;

        when "00010110" =>
          -- w_addr = 000000000000000000000000010110--

          -- Write logic for block rematch007_firstidx_reg: block containing
          -- bits 31..0 of register `rematch007_firstidx_reg`
          -- (`REMATCH007_FIRSTIDX`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch007_firstidx: rematch007_firstidx.

          tmp_data32 := w_hold(31 downto 0);
          tmp_strb32 := w_hstb(31 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch007_firstidx_r((0)).d
                := (f_rematch007_firstidx_r((0)).d and not tmp_strb32)
                or tmp_data32;
            w_ack := true;

          end if;

        when "00010111" =>
          -- w_addr = 000000000000000000000000010111--

          -- Write logic for block rematch007_lastidx_reg: block containing bits
          -- 31..0 of register `rematch007_lastidx_reg` (`REMATCH007_LASTIDX`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch007_lastidx: rematch007_lastidx.

          tmp_data32 := w_hold(31 downto 0);
          tmp_strb32 := w_hstb(31 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch007_lastidx_r((0)).d
                := (f_rematch007_lastidx_r((0)).d and not tmp_strb32)
                or tmp_data32;
            w_ack := true;

          end if;

        when "00011000" =>
          -- w_addr = 000000000000000000000000011000--

          -- Write logic for block rematch008_firstidx_reg: block containing
          -- bits 31..0 of register `rematch008_firstidx_reg`
          -- (`REMATCH008_FIRSTIDX`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch008_firstidx: rematch008_firstidx.

          tmp_data32 := w_hold(31 downto 0);
          tmp_strb32 := w_hstb(31 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch008_firstidx_r((0)).d
                := (f_rematch008_firstidx_r((0)).d and not tmp_strb32)
                or tmp_data32;
            w_ack := true;

          end if;

        when "00011001" =>
          -- w_addr = 000000000000000000000000011001--

          -- Write logic for block rematch008_lastidx_reg: block containing bits
          -- 31..0 of register `rematch008_lastidx_reg` (`REMATCH008_LASTIDX`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch008_lastidx: rematch008_lastidx.

          tmp_data32 := w_hold(31 downto 0);
          tmp_strb32 := w_hstb(31 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch008_lastidx_r((0)).d
                := (f_rematch008_lastidx_r((0)).d and not tmp_strb32)
                or tmp_data32;
            w_ack := true;

          end if;

        when "00011010" =>
          -- w_addr = 000000000000000000000000011010--

          -- Write logic for block rematch009_firstidx_reg: block containing
          -- bits 31..0 of register `rematch009_firstidx_reg`
          -- (`REMATCH009_FIRSTIDX`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch009_firstidx: rematch009_firstidx.

          tmp_data32 := w_hold(31 downto 0);
          tmp_strb32 := w_hstb(31 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch009_firstidx_r((0)).d
                := (f_rematch009_firstidx_r((0)).d and not tmp_strb32)
                or tmp_data32;
            w_ack := true;

          end if;

        when "00011011" =>
          -- w_addr = 000000000000000000000000011011--

          -- Write logic for block rematch009_lastidx_reg: block containing bits
          -- 31..0 of register `rematch009_lastidx_reg` (`REMATCH009_LASTIDX`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch009_lastidx: rematch009_lastidx.

          tmp_data32 := w_hold(31 downto 0);
          tmp_strb32 := w_hstb(31 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch009_lastidx_r((0)).d
                := (f_rematch009_lastidx_r((0)).d and not tmp_strb32)
                or tmp_data32;
            w_ack := true;

          end if;

        when "00011100" =>
          -- w_addr = 000000000000000000000000011100--

          -- Write logic for block rematch010_firstidx_reg: block containing
          -- bits 31..0 of register `rematch010_firstidx_reg`
          -- (`REMATCH010_FIRSTIDX`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch010_firstidx: rematch010_firstidx.

          tmp_data32 := w_hold(31 downto 0);
          tmp_strb32 := w_hstb(31 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch010_firstidx_r((0)).d
                := (f_rematch010_firstidx_r((0)).d and not tmp_strb32)
                or tmp_data32;
            w_ack := true;

          end if;

        when "00011101" =>
          -- w_addr = 000000000000000000000000011101--

          -- Write logic for block rematch010_lastidx_reg: block containing bits
          -- 31..0 of register `rematch010_lastidx_reg` (`REMATCH010_LASTIDX`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch010_lastidx: rematch010_lastidx.

          tmp_data32 := w_hold(31 downto 0);
          tmp_strb32 := w_hstb(31 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch010_lastidx_r((0)).d
                := (f_rematch010_lastidx_r((0)).d and not tmp_strb32)
                or tmp_data32;
            w_ack := true;

          end if;

        when "00011110" =>
          -- w_addr = 000000000000000000000000011110--

          -- Write logic for block rematch011_firstidx_reg: block containing
          -- bits 31..0 of register `rematch011_firstidx_reg`
          -- (`REMATCH011_FIRSTIDX`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch011_firstidx: rematch011_firstidx.

          tmp_data32 := w_hold(31 downto 0);
          tmp_strb32 := w_hstb(31 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch011_firstidx_r((0)).d
                := (f_rematch011_firstidx_r((0)).d and not tmp_strb32)
                or tmp_data32;
            w_ack := true;

          end if;

        when "00011111" =>
          -- w_addr = 000000000000000000000000011111--

          -- Write logic for block rematch011_lastidx_reg: block containing bits
          -- 31..0 of register `rematch011_lastidx_reg` (`REMATCH011_LASTIDX`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch011_lastidx: rematch011_lastidx.

          tmp_data32 := w_hold(31 downto 0);
          tmp_strb32 := w_hstb(31 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch011_lastidx_r((0)).d
                := (f_rematch011_lastidx_r((0)).d and not tmp_strb32)
                or tmp_data32;
            w_ack := true;

          end if;

        when "00100000" =>
          -- w_addr = 000000000000000000000000100000--

          -- Write logic for block rematch012_firstidx_reg: block containing
          -- bits 31..0 of register `rematch012_firstidx_reg`
          -- (`REMATCH012_FIRSTIDX`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch012_firstidx: rematch012_firstidx.

          tmp_data32 := w_hold(31 downto 0);
          tmp_strb32 := w_hstb(31 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch012_firstidx_r((0)).d
                := (f_rematch012_firstidx_r((0)).d and not tmp_strb32)
                or tmp_data32;
            w_ack := true;

          end if;

        when "00100001" =>
          -- w_addr = 000000000000000000000000100001--

          -- Write logic for block rematch012_lastidx_reg: block containing bits
          -- 31..0 of register `rematch012_lastidx_reg` (`REMATCH012_LASTIDX`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch012_lastidx: rematch012_lastidx.

          tmp_data32 := w_hold(31 downto 0);
          tmp_strb32 := w_hstb(31 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch012_lastidx_r((0)).d
                := (f_rematch012_lastidx_r((0)).d and not tmp_strb32)
                or tmp_data32;
            w_ack := true;

          end if;

        when "00100010" =>
          -- w_addr = 000000000000000000000000100010--

          -- Write logic for block rematch013_firstidx_reg: block containing
          -- bits 31..0 of register `rematch013_firstidx_reg`
          -- (`REMATCH013_FIRSTIDX`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch013_firstidx: rematch013_firstidx.

          tmp_data32 := w_hold(31 downto 0);
          tmp_strb32 := w_hstb(31 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch013_firstidx_r((0)).d
                := (f_rematch013_firstidx_r((0)).d and not tmp_strb32)
                or tmp_data32;
            w_ack := true;

          end if;

        when "00100011" =>
          -- w_addr = 000000000000000000000000100011--

          -- Write logic for block rematch013_lastidx_reg: block containing bits
          -- 31..0 of register `rematch013_lastidx_reg` (`REMATCH013_LASTIDX`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch013_lastidx: rematch013_lastidx.

          tmp_data32 := w_hold(31 downto 0);
          tmp_strb32 := w_hstb(31 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch013_lastidx_r((0)).d
                := (f_rematch013_lastidx_r((0)).d and not tmp_strb32)
                or tmp_data32;
            w_ack := true;

          end if;

        when "00100100" =>
          -- w_addr = 000000000000000000000000100100--

          -- Write logic for block rematch014_firstidx_reg: block containing
          -- bits 31..0 of register `rematch014_firstidx_reg`
          -- (`REMATCH014_FIRSTIDX`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch014_firstidx: rematch014_firstidx.

          tmp_data32 := w_hold(31 downto 0);
          tmp_strb32 := w_hstb(31 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch014_firstidx_r((0)).d
                := (f_rematch014_firstidx_r((0)).d and not tmp_strb32)
                or tmp_data32;
            w_ack := true;

          end if;

        when "00100101" =>
          -- w_addr = 000000000000000000000000100101--

          -- Write logic for block rematch014_lastidx_reg: block containing bits
          -- 31..0 of register `rematch014_lastidx_reg` (`REMATCH014_LASTIDX`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch014_lastidx: rematch014_lastidx.

          tmp_data32 := w_hold(31 downto 0);
          tmp_strb32 := w_hstb(31 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch014_lastidx_r((0)).d
                := (f_rematch014_lastidx_r((0)).d and not tmp_strb32)
                or tmp_data32;
            w_ack := true;

          end if;

        when "00100110" =>
          -- w_addr = 000000000000000000000000100110--

          -- Write logic for block rematch015_firstidx_reg: block containing
          -- bits 31..0 of register `rematch015_firstidx_reg`
          -- (`REMATCH015_FIRSTIDX`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch015_firstidx: rematch015_firstidx.

          tmp_data32 := w_hold(31 downto 0);
          tmp_strb32 := w_hstb(31 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch015_firstidx_r((0)).d
                := (f_rematch015_firstidx_r((0)).d and not tmp_strb32)
                or tmp_data32;
            w_ack := true;

          end if;

        when "00100111" =>
          -- w_addr = 000000000000000000000000100111--

          -- Write logic for block rematch015_lastidx_reg: block containing bits
          -- 31..0 of register `rematch015_lastidx_reg` (`REMATCH015_LASTIDX`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch015_lastidx: rematch015_lastidx.

          tmp_data32 := w_hold(31 downto 0);
          tmp_strb32 := w_hstb(31 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch015_lastidx_r((0)).d
                := (f_rematch015_lastidx_r((0)).d and not tmp_strb32)
                or tmp_data32;
            w_ack := true;

          end if;

        when "00101000" =>
          -- w_addr = 000000000000000000000000101000--

          -- Write logic for block rematch000_taxi_firstidx_reg: block
          -- containing bits 31..0 of register `rematch000_taxi_firstidx_reg`
          -- (`REMATCH000_TAXI_FIRSTIDX`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch000_taxi_firstidx:
          -- rematch000_taxi_firstidx.

          tmp_data32 := w_hold(31 downto 0);
          tmp_strb32 := w_hstb(31 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch000_taxi_firstidx_r((0)).d
                := (f_rematch000_taxi_firstidx_r((0)).d and not tmp_strb32)
                or tmp_data32;
            w_ack := true;

          end if;

        when "00101001" =>
          -- w_addr = 000000000000000000000000101001--

          -- Write logic for block rematch000_taxi_lastidx_reg: block containing
          -- bits 31..0 of register `rematch000_taxi_lastidx_reg`
          -- (`REMATCH000_TAXI_LASTIDX`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch000_taxi_lastidx:
          -- rematch000_taxi_lastidx.

          tmp_data32 := w_hold(31 downto 0);
          tmp_strb32 := w_hstb(31 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch000_taxi_lastidx_r((0)).d
                := (f_rematch000_taxi_lastidx_r((0)).d and not tmp_strb32)
                or tmp_data32;
            w_ack := true;

          end if;

        when "00101010" =>
          -- w_addr = 000000000000000000000000101010--

          -- Write logic for block rematch001_taxi_firstidx_reg: block
          -- containing bits 31..0 of register `rematch001_taxi_firstidx_reg`
          -- (`REMATCH001_TAXI_FIRSTIDX`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch001_taxi_firstidx:
          -- rematch001_taxi_firstidx.

          tmp_data32 := w_hold(31 downto 0);
          tmp_strb32 := w_hstb(31 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch001_taxi_firstidx_r((0)).d
                := (f_rematch001_taxi_firstidx_r((0)).d and not tmp_strb32)
                or tmp_data32;
            w_ack := true;

          end if;

        when "00101011" =>
          -- w_addr = 000000000000000000000000101011--

          -- Write logic for block rematch001_taxi_lastidx_reg: block containing
          -- bits 31..0 of register `rematch001_taxi_lastidx_reg`
          -- (`REMATCH001_TAXI_LASTIDX`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch001_taxi_lastidx:
          -- rematch001_taxi_lastidx.

          tmp_data32 := w_hold(31 downto 0);
          tmp_strb32 := w_hstb(31 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch001_taxi_lastidx_r((0)).d
                := (f_rematch001_taxi_lastidx_r((0)).d and not tmp_strb32)
                or tmp_data32;
            w_ack := true;

          end if;

        when "00101100" =>
          -- w_addr = 000000000000000000000000101100--

          -- Write logic for block rematch002_taxi_firstidx_reg: block
          -- containing bits 31..0 of register `rematch002_taxi_firstidx_reg`
          -- (`REMATCH002_TAXI_FIRSTIDX`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch002_taxi_firstidx:
          -- rematch002_taxi_firstidx.

          tmp_data32 := w_hold(31 downto 0);
          tmp_strb32 := w_hstb(31 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch002_taxi_firstidx_r((0)).d
                := (f_rematch002_taxi_firstidx_r((0)).d and not tmp_strb32)
                or tmp_data32;
            w_ack := true;

          end if;

        when "00101101" =>
          -- w_addr = 000000000000000000000000101101--

          -- Write logic for block rematch002_taxi_lastidx_reg: block containing
          -- bits 31..0 of register `rematch002_taxi_lastidx_reg`
          -- (`REMATCH002_TAXI_LASTIDX`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch002_taxi_lastidx:
          -- rematch002_taxi_lastidx.

          tmp_data32 := w_hold(31 downto 0);
          tmp_strb32 := w_hstb(31 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch002_taxi_lastidx_r((0)).d
                := (f_rematch002_taxi_lastidx_r((0)).d and not tmp_strb32)
                or tmp_data32;
            w_ack := true;

          end if;

        when "00101110" =>
          -- w_addr = 000000000000000000000000101110--

          -- Write logic for block rematch003_taxi_firstidx_reg: block
          -- containing bits 31..0 of register `rematch003_taxi_firstidx_reg`
          -- (`REMATCH003_TAXI_FIRSTIDX`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch003_taxi_firstidx:
          -- rematch003_taxi_firstidx.

          tmp_data32 := w_hold(31 downto 0);
          tmp_strb32 := w_hstb(31 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch003_taxi_firstidx_r((0)).d
                := (f_rematch003_taxi_firstidx_r((0)).d and not tmp_strb32)
                or tmp_data32;
            w_ack := true;

          end if;

        when "00101111" =>
          -- w_addr = 000000000000000000000000101111--

          -- Write logic for block rematch003_taxi_lastidx_reg: block containing
          -- bits 31..0 of register `rematch003_taxi_lastidx_reg`
          -- (`REMATCH003_TAXI_LASTIDX`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch003_taxi_lastidx:
          -- rematch003_taxi_lastidx.

          tmp_data32 := w_hold(31 downto 0);
          tmp_strb32 := w_hstb(31 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch003_taxi_lastidx_r((0)).d
                := (f_rematch003_taxi_lastidx_r((0)).d and not tmp_strb32)
                or tmp_data32;
            w_ack := true;

          end if;

        when "00110000" =>
          -- w_addr = 000000000000000000000000110000--

          -- Write logic for block rematch004_taxi_firstidx_reg: block
          -- containing bits 31..0 of register `rematch004_taxi_firstidx_reg`
          -- (`REMATCH004_TAXI_FIRSTIDX`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch004_taxi_firstidx:
          -- rematch004_taxi_firstidx.

          tmp_data32 := w_hold(31 downto 0);
          tmp_strb32 := w_hstb(31 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch004_taxi_firstidx_r((0)).d
                := (f_rematch004_taxi_firstidx_r((0)).d and not tmp_strb32)
                or tmp_data32;
            w_ack := true;

          end if;

        when "00110001" =>
          -- w_addr = 000000000000000000000000110001--

          -- Write logic for block rematch004_taxi_lastidx_reg: block containing
          -- bits 31..0 of register `rematch004_taxi_lastidx_reg`
          -- (`REMATCH004_TAXI_LASTIDX`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch004_taxi_lastidx:
          -- rematch004_taxi_lastidx.

          tmp_data32 := w_hold(31 downto 0);
          tmp_strb32 := w_hstb(31 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch004_taxi_lastidx_r((0)).d
                := (f_rematch004_taxi_lastidx_r((0)).d and not tmp_strb32)
                or tmp_data32;
            w_ack := true;

          end if;

        when "00110010" =>
          -- w_addr = 000000000000000000000000110010--

          -- Write logic for block rematch005_taxi_firstidx_reg: block
          -- containing bits 31..0 of register `rematch005_taxi_firstidx_reg`
          -- (`REMATCH005_TAXI_FIRSTIDX`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch005_taxi_firstidx:
          -- rematch005_taxi_firstidx.

          tmp_data32 := w_hold(31 downto 0);
          tmp_strb32 := w_hstb(31 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch005_taxi_firstidx_r((0)).d
                := (f_rematch005_taxi_firstidx_r((0)).d and not tmp_strb32)
                or tmp_data32;
            w_ack := true;

          end if;

        when "00110011" =>
          -- w_addr = 000000000000000000000000110011--

          -- Write logic for block rematch005_taxi_lastidx_reg: block containing
          -- bits 31..0 of register `rematch005_taxi_lastidx_reg`
          -- (`REMATCH005_TAXI_LASTIDX`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch005_taxi_lastidx:
          -- rematch005_taxi_lastidx.

          tmp_data32 := w_hold(31 downto 0);
          tmp_strb32 := w_hstb(31 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch005_taxi_lastidx_r((0)).d
                := (f_rematch005_taxi_lastidx_r((0)).d and not tmp_strb32)
                or tmp_data32;
            w_ack := true;

          end if;

        when "00110100" =>
          -- w_addr = 000000000000000000000000110100--

          -- Write logic for block rematch006_taxi_firstidx_reg: block
          -- containing bits 31..0 of register `rematch006_taxi_firstidx_reg`
          -- (`REMATCH006_TAXI_FIRSTIDX`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch006_taxi_firstidx:
          -- rematch006_taxi_firstidx.

          tmp_data32 := w_hold(31 downto 0);
          tmp_strb32 := w_hstb(31 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch006_taxi_firstidx_r((0)).d
                := (f_rematch006_taxi_firstidx_r((0)).d and not tmp_strb32)
                or tmp_data32;
            w_ack := true;

          end if;

        when "00110101" =>
          -- w_addr = 000000000000000000000000110101--

          -- Write logic for block rematch006_taxi_lastidx_reg: block containing
          -- bits 31..0 of register `rematch006_taxi_lastidx_reg`
          -- (`REMATCH006_TAXI_LASTIDX`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch006_taxi_lastidx:
          -- rematch006_taxi_lastidx.

          tmp_data32 := w_hold(31 downto 0);
          tmp_strb32 := w_hstb(31 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch006_taxi_lastidx_r((0)).d
                := (f_rematch006_taxi_lastidx_r((0)).d and not tmp_strb32)
                or tmp_data32;
            w_ack := true;

          end if;

        when "00110110" =>
          -- w_addr = 000000000000000000000000110110--

          -- Write logic for block rematch007_taxi_firstidx_reg: block
          -- containing bits 31..0 of register `rematch007_taxi_firstidx_reg`
          -- (`REMATCH007_TAXI_FIRSTIDX`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch007_taxi_firstidx:
          -- rematch007_taxi_firstidx.

          tmp_data32 := w_hold(31 downto 0);
          tmp_strb32 := w_hstb(31 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch007_taxi_firstidx_r((0)).d
                := (f_rematch007_taxi_firstidx_r((0)).d and not tmp_strb32)
                or tmp_data32;
            w_ack := true;

          end if;

        when "00110111" =>
          -- w_addr = 000000000000000000000000110111--

          -- Write logic for block rematch007_taxi_lastidx_reg: block containing
          -- bits 31..0 of register `rematch007_taxi_lastidx_reg`
          -- (`REMATCH007_TAXI_LASTIDX`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch007_taxi_lastidx:
          -- rematch007_taxi_lastidx.

          tmp_data32 := w_hold(31 downto 0);
          tmp_strb32 := w_hstb(31 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch007_taxi_lastidx_r((0)).d
                := (f_rematch007_taxi_lastidx_r((0)).d and not tmp_strb32)
                or tmp_data32;
            w_ack := true;

          end if;

        when "00111000" =>
          -- w_addr = 000000000000000000000000111000--

          -- Write logic for block rematch008_taxi_firstidx_reg: block
          -- containing bits 31..0 of register `rematch008_taxi_firstidx_reg`
          -- (`REMATCH008_TAXI_FIRSTIDX`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch008_taxi_firstidx:
          -- rematch008_taxi_firstidx.

          tmp_data32 := w_hold(31 downto 0);
          tmp_strb32 := w_hstb(31 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch008_taxi_firstidx_r((0)).d
                := (f_rematch008_taxi_firstidx_r((0)).d and not tmp_strb32)
                or tmp_data32;
            w_ack := true;

          end if;

        when "00111001" =>
          -- w_addr = 000000000000000000000000111001--

          -- Write logic for block rematch008_taxi_lastidx_reg: block containing
          -- bits 31..0 of register `rematch008_taxi_lastidx_reg`
          -- (`REMATCH008_TAXI_LASTIDX`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch008_taxi_lastidx:
          -- rematch008_taxi_lastidx.

          tmp_data32 := w_hold(31 downto 0);
          tmp_strb32 := w_hstb(31 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch008_taxi_lastidx_r((0)).d
                := (f_rematch008_taxi_lastidx_r((0)).d and not tmp_strb32)
                or tmp_data32;
            w_ack := true;

          end if;

        when "00111010" =>
          -- w_addr = 000000000000000000000000111010--

          -- Write logic for block rematch009_taxi_firstidx_reg: block
          -- containing bits 31..0 of register `rematch009_taxi_firstidx_reg`
          -- (`REMATCH009_TAXI_FIRSTIDX`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch009_taxi_firstidx:
          -- rematch009_taxi_firstidx.

          tmp_data32 := w_hold(31 downto 0);
          tmp_strb32 := w_hstb(31 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch009_taxi_firstidx_r((0)).d
                := (f_rematch009_taxi_firstidx_r((0)).d and not tmp_strb32)
                or tmp_data32;
            w_ack := true;

          end if;

        when "00111011" =>
          -- w_addr = 000000000000000000000000111011--

          -- Write logic for block rematch009_taxi_lastidx_reg: block containing
          -- bits 31..0 of register `rematch009_taxi_lastidx_reg`
          -- (`REMATCH009_TAXI_LASTIDX`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch009_taxi_lastidx:
          -- rematch009_taxi_lastidx.

          tmp_data32 := w_hold(31 downto 0);
          tmp_strb32 := w_hstb(31 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch009_taxi_lastidx_r((0)).d
                := (f_rematch009_taxi_lastidx_r((0)).d and not tmp_strb32)
                or tmp_data32;
            w_ack := true;

          end if;

        when "00111100" =>
          -- w_addr = 000000000000000000000000111100--

          -- Write logic for block rematch010_taxi_firstidx_reg: block
          -- containing bits 31..0 of register `rematch010_taxi_firstidx_reg`
          -- (`REMATCH010_TAXI_FIRSTIDX`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch010_taxi_firstidx:
          -- rematch010_taxi_firstidx.

          tmp_data32 := w_hold(31 downto 0);
          tmp_strb32 := w_hstb(31 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch010_taxi_firstidx_r((0)).d
                := (f_rematch010_taxi_firstidx_r((0)).d and not tmp_strb32)
                or tmp_data32;
            w_ack := true;

          end if;

        when "00111101" =>
          -- w_addr = 000000000000000000000000111101--

          -- Write logic for block rematch010_taxi_lastidx_reg: block containing
          -- bits 31..0 of register `rematch010_taxi_lastidx_reg`
          -- (`REMATCH010_TAXI_LASTIDX`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch010_taxi_lastidx:
          -- rematch010_taxi_lastidx.

          tmp_data32 := w_hold(31 downto 0);
          tmp_strb32 := w_hstb(31 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch010_taxi_lastidx_r((0)).d
                := (f_rematch010_taxi_lastidx_r((0)).d and not tmp_strb32)
                or tmp_data32;
            w_ack := true;

          end if;

        when "00111110" =>
          -- w_addr = 000000000000000000000000111110--

          -- Write logic for block rematch011_taxi_firstidx_reg: block
          -- containing bits 31..0 of register `rematch011_taxi_firstidx_reg`
          -- (`REMATCH011_TAXI_FIRSTIDX`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch011_taxi_firstidx:
          -- rematch011_taxi_firstidx.

          tmp_data32 := w_hold(31 downto 0);
          tmp_strb32 := w_hstb(31 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch011_taxi_firstidx_r((0)).d
                := (f_rematch011_taxi_firstidx_r((0)).d and not tmp_strb32)
                or tmp_data32;
            w_ack := true;

          end if;

        when "00111111" =>
          -- w_addr = 000000000000000000000000111111--

          -- Write logic for block rematch011_taxi_lastidx_reg: block containing
          -- bits 31..0 of register `rematch011_taxi_lastidx_reg`
          -- (`REMATCH011_TAXI_LASTIDX`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch011_taxi_lastidx:
          -- rematch011_taxi_lastidx.

          tmp_data32 := w_hold(31 downto 0);
          tmp_strb32 := w_hstb(31 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch011_taxi_lastidx_r((0)).d
                := (f_rematch011_taxi_lastidx_r((0)).d and not tmp_strb32)
                or tmp_data32;
            w_ack := true;

          end if;

        when "01000000" =>
          -- w_addr = 000000000000000000000001000000--

          -- Write logic for block rematch012_taxi_firstidx_reg: block
          -- containing bits 31..0 of register `rematch012_taxi_firstidx_reg`
          -- (`REMATCH012_TAXI_FIRSTIDX`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch012_taxi_firstidx:
          -- rematch012_taxi_firstidx.

          tmp_data32 := w_hold(31 downto 0);
          tmp_strb32 := w_hstb(31 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch012_taxi_firstidx_r((0)).d
                := (f_rematch012_taxi_firstidx_r((0)).d and not tmp_strb32)
                or tmp_data32;
            w_ack := true;

          end if;

        when "01000001" =>
          -- w_addr = 000000000000000000000001000001--

          -- Write logic for block rematch012_taxi_lastidx_reg: block containing
          -- bits 31..0 of register `rematch012_taxi_lastidx_reg`
          -- (`REMATCH012_TAXI_LASTIDX`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch012_taxi_lastidx:
          -- rematch012_taxi_lastidx.

          tmp_data32 := w_hold(31 downto 0);
          tmp_strb32 := w_hstb(31 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch012_taxi_lastidx_r((0)).d
                := (f_rematch012_taxi_lastidx_r((0)).d and not tmp_strb32)
                or tmp_data32;
            w_ack := true;

          end if;

        when "01000010" =>
          -- w_addr = 000000000000000000000001000010--

          -- Write logic for block rematch013_taxi_firstidx_reg: block
          -- containing bits 31..0 of register `rematch013_taxi_firstidx_reg`
          -- (`REMATCH013_TAXI_FIRSTIDX`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch013_taxi_firstidx:
          -- rematch013_taxi_firstidx.

          tmp_data32 := w_hold(31 downto 0);
          tmp_strb32 := w_hstb(31 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch013_taxi_firstidx_r((0)).d
                := (f_rematch013_taxi_firstidx_r((0)).d and not tmp_strb32)
                or tmp_data32;
            w_ack := true;

          end if;

        when "01000011" =>
          -- w_addr = 000000000000000000000001000011--

          -- Write logic for block rematch013_taxi_lastidx_reg: block containing
          -- bits 31..0 of register `rematch013_taxi_lastidx_reg`
          -- (`REMATCH013_TAXI_LASTIDX`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch013_taxi_lastidx:
          -- rematch013_taxi_lastidx.

          tmp_data32 := w_hold(31 downto 0);
          tmp_strb32 := w_hstb(31 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch013_taxi_lastidx_r((0)).d
                := (f_rematch013_taxi_lastidx_r((0)).d and not tmp_strb32)
                or tmp_data32;
            w_ack := true;

          end if;

        when "01000100" =>
          -- w_addr = 000000000000000000000001000100--

          -- Write logic for block rematch014_taxi_firstidx_reg: block
          -- containing bits 31..0 of register `rematch014_taxi_firstidx_reg`
          -- (`REMATCH014_TAXI_FIRSTIDX`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch014_taxi_firstidx:
          -- rematch014_taxi_firstidx.

          tmp_data32 := w_hold(31 downto 0);
          tmp_strb32 := w_hstb(31 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch014_taxi_firstidx_r((0)).d
                := (f_rematch014_taxi_firstidx_r((0)).d and not tmp_strb32)
                or tmp_data32;
            w_ack := true;

          end if;

        when "01000101" =>
          -- w_addr = 000000000000000000000001000101--

          -- Write logic for block rematch014_taxi_lastidx_reg: block containing
          -- bits 31..0 of register `rematch014_taxi_lastidx_reg`
          -- (`REMATCH014_TAXI_LASTIDX`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch014_taxi_lastidx:
          -- rematch014_taxi_lastidx.

          tmp_data32 := w_hold(31 downto 0);
          tmp_strb32 := w_hstb(31 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch014_taxi_lastidx_r((0)).d
                := (f_rematch014_taxi_lastidx_r((0)).d and not tmp_strb32)
                or tmp_data32;
            w_ack := true;

          end if;

        when "01000110" =>
          -- w_addr = 000000000000000000000001000110--

          -- Write logic for block rematch015_taxi_firstidx_reg: block
          -- containing bits 31..0 of register `rematch015_taxi_firstidx_reg`
          -- (`REMATCH015_TAXI_FIRSTIDX`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch015_taxi_firstidx:
          -- rematch015_taxi_firstidx.

          tmp_data32 := w_hold(31 downto 0);
          tmp_strb32 := w_hstb(31 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch015_taxi_firstidx_r((0)).d
                := (f_rematch015_taxi_firstidx_r((0)).d and not tmp_strb32)
                or tmp_data32;
            w_ack := true;

          end if;

        when "01000111" =>
          -- w_addr = 000000000000000000000001000111--

          -- Write logic for block rematch015_taxi_lastidx_reg: block containing
          -- bits 31..0 of register `rematch015_taxi_lastidx_reg`
          -- (`REMATCH015_TAXI_LASTIDX`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch015_taxi_lastidx:
          -- rematch015_taxi_lastidx.

          tmp_data32 := w_hold(31 downto 0);
          tmp_strb32 := w_hstb(31 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch015_taxi_lastidx_r((0)).d
                := (f_rematch015_taxi_lastidx_r((0)).d and not tmp_strb32)
                or tmp_data32;
            w_ack := true;

          end if;

        when "01001000" =>
          -- w_addr = 000000000000000000000001001000--

          -- Write logic for block rematch000_in_offsets_reg_low: block
          -- containing bits 31..0 of register `rematch000_in_offsets_reg`
          -- (`REMATCH000_IN_OFFSETS`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '1';
          end if;
          if w_req then
            w_ack := true;
          end if;

        when "01001001" =>
          -- w_addr = 000000000000000000000001001001--

          -- Write logic for block rematch000_in_offsets_reg_high: block
          -- containing bits 63..32 of register `rematch000_in_offsets_reg`
          -- (`REMATCH000_IN_OFFSETS`).
          if w_req or w_lreq then
            w_hold(63 downto 32) := w_data;
            w_hstb(63 downto 32) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch000_in_offsets: rematch000_in_offsets.

          tmp_data64 := w_hold(63 downto 0);
          tmp_strb64 := w_hstb(63 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch000_in_offsets_r((0)).d
                := (f_rematch000_in_offsets_r((0)).d and not tmp_strb64)
                or tmp_data64;
            w_ack := true;

          end if;

        when "01001010" =>
          -- w_addr = 000000000000000000000001001010--

          -- Write logic for block rematch000_in_values_reg_low: block
          -- containing bits 31..0 of register `rematch000_in_values_reg`
          -- (`REMATCH000_IN_VALUES`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '1';
          end if;
          if w_req then
            w_ack := true;
          end if;

        when "01001011" =>
          -- w_addr = 000000000000000000000001001011--

          -- Write logic for block rematch000_in_values_reg_high: block
          -- containing bits 63..32 of register `rematch000_in_values_reg`
          -- (`REMATCH000_IN_VALUES`).
          if w_req or w_lreq then
            w_hold(63 downto 32) := w_data;
            w_hstb(63 downto 32) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch000_in_values: rematch000_in_values.

          tmp_data64 := w_hold(63 downto 0);
          tmp_strb64 := w_hstb(63 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch000_in_values_r((0)).d
                := (f_rematch000_in_values_r((0)).d and not tmp_strb64)
                or tmp_data64;
            w_ack := true;

          end if;

        when "01001100" =>
          -- w_addr = 000000000000000000000001001100--

          -- Write logic for block rematch001_in_offsets_reg_low: block
          -- containing bits 31..0 of register `rematch001_in_offsets_reg`
          -- (`REMATCH001_IN_OFFSETS`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '1';
          end if;
          if w_req then
            w_ack := true;
          end if;

        when "01001101" =>
          -- w_addr = 000000000000000000000001001101--

          -- Write logic for block rematch001_in_offsets_reg_high: block
          -- containing bits 63..32 of register `rematch001_in_offsets_reg`
          -- (`REMATCH001_IN_OFFSETS`).
          if w_req or w_lreq then
            w_hold(63 downto 32) := w_data;
            w_hstb(63 downto 32) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch001_in_offsets: rematch001_in_offsets.

          tmp_data64 := w_hold(63 downto 0);
          tmp_strb64 := w_hstb(63 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch001_in_offsets_r((0)).d
                := (f_rematch001_in_offsets_r((0)).d and not tmp_strb64)
                or tmp_data64;
            w_ack := true;

          end if;

        when "01001110" =>
          -- w_addr = 000000000000000000000001001110--

          -- Write logic for block rematch001_in_values_reg_low: block
          -- containing bits 31..0 of register `rematch001_in_values_reg`
          -- (`REMATCH001_IN_VALUES`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '1';
          end if;
          if w_req then
            w_ack := true;
          end if;

        when "01001111" =>
          -- w_addr = 000000000000000000000001001111--

          -- Write logic for block rematch001_in_values_reg_high: block
          -- containing bits 63..32 of register `rematch001_in_values_reg`
          -- (`REMATCH001_IN_VALUES`).
          if w_req or w_lreq then
            w_hold(63 downto 32) := w_data;
            w_hstb(63 downto 32) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch001_in_values: rematch001_in_values.

          tmp_data64 := w_hold(63 downto 0);
          tmp_strb64 := w_hstb(63 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch001_in_values_r((0)).d
                := (f_rematch001_in_values_r((0)).d and not tmp_strb64)
                or tmp_data64;
            w_ack := true;

          end if;

        when "01010000" =>
          -- w_addr = 000000000000000000000001010000--

          -- Write logic for block rematch002_in_offsets_reg_low: block
          -- containing bits 31..0 of register `rematch002_in_offsets_reg`
          -- (`REMATCH002_IN_OFFSETS`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '1';
          end if;
          if w_req then
            w_ack := true;
          end if;

        when "01010001" =>
          -- w_addr = 000000000000000000000001010001--

          -- Write logic for block rematch002_in_offsets_reg_high: block
          -- containing bits 63..32 of register `rematch002_in_offsets_reg`
          -- (`REMATCH002_IN_OFFSETS`).
          if w_req or w_lreq then
            w_hold(63 downto 32) := w_data;
            w_hstb(63 downto 32) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch002_in_offsets: rematch002_in_offsets.

          tmp_data64 := w_hold(63 downto 0);
          tmp_strb64 := w_hstb(63 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch002_in_offsets_r((0)).d
                := (f_rematch002_in_offsets_r((0)).d and not tmp_strb64)
                or tmp_data64;
            w_ack := true;

          end if;

        when "01010010" =>
          -- w_addr = 000000000000000000000001010010--

          -- Write logic for block rematch002_in_values_reg_low: block
          -- containing bits 31..0 of register `rematch002_in_values_reg`
          -- (`REMATCH002_IN_VALUES`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '1';
          end if;
          if w_req then
            w_ack := true;
          end if;

        when "01010011" =>
          -- w_addr = 000000000000000000000001010011--

          -- Write logic for block rematch002_in_values_reg_high: block
          -- containing bits 63..32 of register `rematch002_in_values_reg`
          -- (`REMATCH002_IN_VALUES`).
          if w_req or w_lreq then
            w_hold(63 downto 32) := w_data;
            w_hstb(63 downto 32) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch002_in_values: rematch002_in_values.

          tmp_data64 := w_hold(63 downto 0);
          tmp_strb64 := w_hstb(63 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch002_in_values_r((0)).d
                := (f_rematch002_in_values_r((0)).d and not tmp_strb64)
                or tmp_data64;
            w_ack := true;

          end if;

        when "01010100" =>
          -- w_addr = 000000000000000000000001010100--

          -- Write logic for block rematch003_in_offsets_reg_low: block
          -- containing bits 31..0 of register `rematch003_in_offsets_reg`
          -- (`REMATCH003_IN_OFFSETS`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '1';
          end if;
          if w_req then
            w_ack := true;
          end if;

        when "01010101" =>
          -- w_addr = 000000000000000000000001010101--

          -- Write logic for block rematch003_in_offsets_reg_high: block
          -- containing bits 63..32 of register `rematch003_in_offsets_reg`
          -- (`REMATCH003_IN_OFFSETS`).
          if w_req or w_lreq then
            w_hold(63 downto 32) := w_data;
            w_hstb(63 downto 32) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch003_in_offsets: rematch003_in_offsets.

          tmp_data64 := w_hold(63 downto 0);
          tmp_strb64 := w_hstb(63 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch003_in_offsets_r((0)).d
                := (f_rematch003_in_offsets_r((0)).d and not tmp_strb64)
                or tmp_data64;
            w_ack := true;

          end if;

        when "01010110" =>
          -- w_addr = 000000000000000000000001010110--

          -- Write logic for block rematch003_in_values_reg_low: block
          -- containing bits 31..0 of register `rematch003_in_values_reg`
          -- (`REMATCH003_IN_VALUES`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '1';
          end if;
          if w_req then
            w_ack := true;
          end if;

        when "01010111" =>
          -- w_addr = 000000000000000000000001010111--

          -- Write logic for block rematch003_in_values_reg_high: block
          -- containing bits 63..32 of register `rematch003_in_values_reg`
          -- (`REMATCH003_IN_VALUES`).
          if w_req or w_lreq then
            w_hold(63 downto 32) := w_data;
            w_hstb(63 downto 32) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch003_in_values: rematch003_in_values.

          tmp_data64 := w_hold(63 downto 0);
          tmp_strb64 := w_hstb(63 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch003_in_values_r((0)).d
                := (f_rematch003_in_values_r((0)).d and not tmp_strb64)
                or tmp_data64;
            w_ack := true;

          end if;

        when "01011000" =>
          -- w_addr = 000000000000000000000001011000--

          -- Write logic for block rematch004_in_offsets_reg_low: block
          -- containing bits 31..0 of register `rematch004_in_offsets_reg`
          -- (`REMATCH004_IN_OFFSETS`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '1';
          end if;
          if w_req then
            w_ack := true;
          end if;

        when "01011001" =>
          -- w_addr = 000000000000000000000001011001--

          -- Write logic for block rematch004_in_offsets_reg_high: block
          -- containing bits 63..32 of register `rematch004_in_offsets_reg`
          -- (`REMATCH004_IN_OFFSETS`).
          if w_req or w_lreq then
            w_hold(63 downto 32) := w_data;
            w_hstb(63 downto 32) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch004_in_offsets: rematch004_in_offsets.

          tmp_data64 := w_hold(63 downto 0);
          tmp_strb64 := w_hstb(63 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch004_in_offsets_r((0)).d
                := (f_rematch004_in_offsets_r((0)).d and not tmp_strb64)
                or tmp_data64;
            w_ack := true;

          end if;

        when "01011010" =>
          -- w_addr = 000000000000000000000001011010--

          -- Write logic for block rematch004_in_values_reg_low: block
          -- containing bits 31..0 of register `rematch004_in_values_reg`
          -- (`REMATCH004_IN_VALUES`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '1';
          end if;
          if w_req then
            w_ack := true;
          end if;

        when "01011011" =>
          -- w_addr = 000000000000000000000001011011--

          -- Write logic for block rematch004_in_values_reg_high: block
          -- containing bits 63..32 of register `rematch004_in_values_reg`
          -- (`REMATCH004_IN_VALUES`).
          if w_req or w_lreq then
            w_hold(63 downto 32) := w_data;
            w_hstb(63 downto 32) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch004_in_values: rematch004_in_values.

          tmp_data64 := w_hold(63 downto 0);
          tmp_strb64 := w_hstb(63 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch004_in_values_r((0)).d
                := (f_rematch004_in_values_r((0)).d and not tmp_strb64)
                or tmp_data64;
            w_ack := true;

          end if;

        when "01011100" =>
          -- w_addr = 000000000000000000000001011100--

          -- Write logic for block rematch005_in_offsets_reg_low: block
          -- containing bits 31..0 of register `rematch005_in_offsets_reg`
          -- (`REMATCH005_IN_OFFSETS`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '1';
          end if;
          if w_req then
            w_ack := true;
          end if;

        when "01011101" =>
          -- w_addr = 000000000000000000000001011101--

          -- Write logic for block rematch005_in_offsets_reg_high: block
          -- containing bits 63..32 of register `rematch005_in_offsets_reg`
          -- (`REMATCH005_IN_OFFSETS`).
          if w_req or w_lreq then
            w_hold(63 downto 32) := w_data;
            w_hstb(63 downto 32) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch005_in_offsets: rematch005_in_offsets.

          tmp_data64 := w_hold(63 downto 0);
          tmp_strb64 := w_hstb(63 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch005_in_offsets_r((0)).d
                := (f_rematch005_in_offsets_r((0)).d and not tmp_strb64)
                or tmp_data64;
            w_ack := true;

          end if;

        when "01011110" =>
          -- w_addr = 000000000000000000000001011110--

          -- Write logic for block rematch005_in_values_reg_low: block
          -- containing bits 31..0 of register `rematch005_in_values_reg`
          -- (`REMATCH005_IN_VALUES`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '1';
          end if;
          if w_req then
            w_ack := true;
          end if;

        when "01011111" =>
          -- w_addr = 000000000000000000000001011111--

          -- Write logic for block rematch005_in_values_reg_high: block
          -- containing bits 63..32 of register `rematch005_in_values_reg`
          -- (`REMATCH005_IN_VALUES`).
          if w_req or w_lreq then
            w_hold(63 downto 32) := w_data;
            w_hstb(63 downto 32) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch005_in_values: rematch005_in_values.

          tmp_data64 := w_hold(63 downto 0);
          tmp_strb64 := w_hstb(63 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch005_in_values_r((0)).d
                := (f_rematch005_in_values_r((0)).d and not tmp_strb64)
                or tmp_data64;
            w_ack := true;

          end if;

        when "01100000" =>
          -- w_addr = 000000000000000000000001100000--

          -- Write logic for block rematch006_in_offsets_reg_low: block
          -- containing bits 31..0 of register `rematch006_in_offsets_reg`
          -- (`REMATCH006_IN_OFFSETS`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '1';
          end if;
          if w_req then
            w_ack := true;
          end if;

        when "01100001" =>
          -- w_addr = 000000000000000000000001100001--

          -- Write logic for block rematch006_in_offsets_reg_high: block
          -- containing bits 63..32 of register `rematch006_in_offsets_reg`
          -- (`REMATCH006_IN_OFFSETS`).
          if w_req or w_lreq then
            w_hold(63 downto 32) := w_data;
            w_hstb(63 downto 32) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch006_in_offsets: rematch006_in_offsets.

          tmp_data64 := w_hold(63 downto 0);
          tmp_strb64 := w_hstb(63 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch006_in_offsets_r((0)).d
                := (f_rematch006_in_offsets_r((0)).d and not tmp_strb64)
                or tmp_data64;
            w_ack := true;

          end if;

        when "01100010" =>
          -- w_addr = 000000000000000000000001100010--

          -- Write logic for block rematch006_in_values_reg_low: block
          -- containing bits 31..0 of register `rematch006_in_values_reg`
          -- (`REMATCH006_IN_VALUES`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '1';
          end if;
          if w_req then
            w_ack := true;
          end if;

        when "01100011" =>
          -- w_addr = 000000000000000000000001100011--

          -- Write logic for block rematch006_in_values_reg_high: block
          -- containing bits 63..32 of register `rematch006_in_values_reg`
          -- (`REMATCH006_IN_VALUES`).
          if w_req or w_lreq then
            w_hold(63 downto 32) := w_data;
            w_hstb(63 downto 32) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch006_in_values: rematch006_in_values.

          tmp_data64 := w_hold(63 downto 0);
          tmp_strb64 := w_hstb(63 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch006_in_values_r((0)).d
                := (f_rematch006_in_values_r((0)).d and not tmp_strb64)
                or tmp_data64;
            w_ack := true;

          end if;

        when "01100100" =>
          -- w_addr = 000000000000000000000001100100--

          -- Write logic for block rematch007_in_offsets_reg_low: block
          -- containing bits 31..0 of register `rematch007_in_offsets_reg`
          -- (`REMATCH007_IN_OFFSETS`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '1';
          end if;
          if w_req then
            w_ack := true;
          end if;

        when "01100101" =>
          -- w_addr = 000000000000000000000001100101--

          -- Write logic for block rematch007_in_offsets_reg_high: block
          -- containing bits 63..32 of register `rematch007_in_offsets_reg`
          -- (`REMATCH007_IN_OFFSETS`).
          if w_req or w_lreq then
            w_hold(63 downto 32) := w_data;
            w_hstb(63 downto 32) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch007_in_offsets: rematch007_in_offsets.

          tmp_data64 := w_hold(63 downto 0);
          tmp_strb64 := w_hstb(63 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch007_in_offsets_r((0)).d
                := (f_rematch007_in_offsets_r((0)).d and not tmp_strb64)
                or tmp_data64;
            w_ack := true;

          end if;

        when "01100110" =>
          -- w_addr = 000000000000000000000001100110--

          -- Write logic for block rematch007_in_values_reg_low: block
          -- containing bits 31..0 of register `rematch007_in_values_reg`
          -- (`REMATCH007_IN_VALUES`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '1';
          end if;
          if w_req then
            w_ack := true;
          end if;

        when "01100111" =>
          -- w_addr = 000000000000000000000001100111--

          -- Write logic for block rematch007_in_values_reg_high: block
          -- containing bits 63..32 of register `rematch007_in_values_reg`
          -- (`REMATCH007_IN_VALUES`).
          if w_req or w_lreq then
            w_hold(63 downto 32) := w_data;
            w_hstb(63 downto 32) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch007_in_values: rematch007_in_values.

          tmp_data64 := w_hold(63 downto 0);
          tmp_strb64 := w_hstb(63 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch007_in_values_r((0)).d
                := (f_rematch007_in_values_r((0)).d and not tmp_strb64)
                or tmp_data64;
            w_ack := true;

          end if;

        when "01101000" =>
          -- w_addr = 000000000000000000000001101000--

          -- Write logic for block rematch008_in_offsets_reg_low: block
          -- containing bits 31..0 of register `rematch008_in_offsets_reg`
          -- (`REMATCH008_IN_OFFSETS`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '1';
          end if;
          if w_req then
            w_ack := true;
          end if;

        when "01101001" =>
          -- w_addr = 000000000000000000000001101001--

          -- Write logic for block rematch008_in_offsets_reg_high: block
          -- containing bits 63..32 of register `rematch008_in_offsets_reg`
          -- (`REMATCH008_IN_OFFSETS`).
          if w_req or w_lreq then
            w_hold(63 downto 32) := w_data;
            w_hstb(63 downto 32) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch008_in_offsets: rematch008_in_offsets.

          tmp_data64 := w_hold(63 downto 0);
          tmp_strb64 := w_hstb(63 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch008_in_offsets_r((0)).d
                := (f_rematch008_in_offsets_r((0)).d and not tmp_strb64)
                or tmp_data64;
            w_ack := true;

          end if;

        when "01101010" =>
          -- w_addr = 000000000000000000000001101010--

          -- Write logic for block rematch008_in_values_reg_low: block
          -- containing bits 31..0 of register `rematch008_in_values_reg`
          -- (`REMATCH008_IN_VALUES`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '1';
          end if;
          if w_req then
            w_ack := true;
          end if;

        when "01101011" =>
          -- w_addr = 000000000000000000000001101011--

          -- Write logic for block rematch008_in_values_reg_high: block
          -- containing bits 63..32 of register `rematch008_in_values_reg`
          -- (`REMATCH008_IN_VALUES`).
          if w_req or w_lreq then
            w_hold(63 downto 32) := w_data;
            w_hstb(63 downto 32) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch008_in_values: rematch008_in_values.

          tmp_data64 := w_hold(63 downto 0);
          tmp_strb64 := w_hstb(63 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch008_in_values_r((0)).d
                := (f_rematch008_in_values_r((0)).d and not tmp_strb64)
                or tmp_data64;
            w_ack := true;

          end if;

        when "01101100" =>
          -- w_addr = 000000000000000000000001101100--

          -- Write logic for block rematch009_in_offsets_reg_low: block
          -- containing bits 31..0 of register `rematch009_in_offsets_reg`
          -- (`REMATCH009_IN_OFFSETS`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '1';
          end if;
          if w_req then
            w_ack := true;
          end if;

        when "01101101" =>
          -- w_addr = 000000000000000000000001101101--

          -- Write logic for block rematch009_in_offsets_reg_high: block
          -- containing bits 63..32 of register `rematch009_in_offsets_reg`
          -- (`REMATCH009_IN_OFFSETS`).
          if w_req or w_lreq then
            w_hold(63 downto 32) := w_data;
            w_hstb(63 downto 32) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch009_in_offsets: rematch009_in_offsets.

          tmp_data64 := w_hold(63 downto 0);
          tmp_strb64 := w_hstb(63 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch009_in_offsets_r((0)).d
                := (f_rematch009_in_offsets_r((0)).d and not tmp_strb64)
                or tmp_data64;
            w_ack := true;

          end if;

        when "01101110" =>
          -- w_addr = 000000000000000000000001101110--

          -- Write logic for block rematch009_in_values_reg_low: block
          -- containing bits 31..0 of register `rematch009_in_values_reg`
          -- (`REMATCH009_IN_VALUES`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '1';
          end if;
          if w_req then
            w_ack := true;
          end if;

        when "01101111" =>
          -- w_addr = 000000000000000000000001101111--

          -- Write logic for block rematch009_in_values_reg_high: block
          -- containing bits 63..32 of register `rematch009_in_values_reg`
          -- (`REMATCH009_IN_VALUES`).
          if w_req or w_lreq then
            w_hold(63 downto 32) := w_data;
            w_hstb(63 downto 32) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch009_in_values: rematch009_in_values.

          tmp_data64 := w_hold(63 downto 0);
          tmp_strb64 := w_hstb(63 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch009_in_values_r((0)).d
                := (f_rematch009_in_values_r((0)).d and not tmp_strb64)
                or tmp_data64;
            w_ack := true;

          end if;

        when "01110000" =>
          -- w_addr = 000000000000000000000001110000--

          -- Write logic for block rematch010_in_offsets_reg_low: block
          -- containing bits 31..0 of register `rematch010_in_offsets_reg`
          -- (`REMATCH010_IN_OFFSETS`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '1';
          end if;
          if w_req then
            w_ack := true;
          end if;

        when "01110001" =>
          -- w_addr = 000000000000000000000001110001--

          -- Write logic for block rematch010_in_offsets_reg_high: block
          -- containing bits 63..32 of register `rematch010_in_offsets_reg`
          -- (`REMATCH010_IN_OFFSETS`).
          if w_req or w_lreq then
            w_hold(63 downto 32) := w_data;
            w_hstb(63 downto 32) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch010_in_offsets: rematch010_in_offsets.

          tmp_data64 := w_hold(63 downto 0);
          tmp_strb64 := w_hstb(63 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch010_in_offsets_r((0)).d
                := (f_rematch010_in_offsets_r((0)).d and not tmp_strb64)
                or tmp_data64;
            w_ack := true;

          end if;

        when "01110010" =>
          -- w_addr = 000000000000000000000001110010--

          -- Write logic for block rematch010_in_values_reg_low: block
          -- containing bits 31..0 of register `rematch010_in_values_reg`
          -- (`REMATCH010_IN_VALUES`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '1';
          end if;
          if w_req then
            w_ack := true;
          end if;

        when "01110011" =>
          -- w_addr = 000000000000000000000001110011--

          -- Write logic for block rematch010_in_values_reg_high: block
          -- containing bits 63..32 of register `rematch010_in_values_reg`
          -- (`REMATCH010_IN_VALUES`).
          if w_req or w_lreq then
            w_hold(63 downto 32) := w_data;
            w_hstb(63 downto 32) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch010_in_values: rematch010_in_values.

          tmp_data64 := w_hold(63 downto 0);
          tmp_strb64 := w_hstb(63 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch010_in_values_r((0)).d
                := (f_rematch010_in_values_r((0)).d and not tmp_strb64)
                or tmp_data64;
            w_ack := true;

          end if;

        when "01110100" =>
          -- w_addr = 000000000000000000000001110100--

          -- Write logic for block rematch011_in_offsets_reg_low: block
          -- containing bits 31..0 of register `rematch011_in_offsets_reg`
          -- (`REMATCH011_IN_OFFSETS`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '1';
          end if;
          if w_req then
            w_ack := true;
          end if;

        when "01110101" =>
          -- w_addr = 000000000000000000000001110101--

          -- Write logic for block rematch011_in_offsets_reg_high: block
          -- containing bits 63..32 of register `rematch011_in_offsets_reg`
          -- (`REMATCH011_IN_OFFSETS`).
          if w_req or w_lreq then
            w_hold(63 downto 32) := w_data;
            w_hstb(63 downto 32) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch011_in_offsets: rematch011_in_offsets.

          tmp_data64 := w_hold(63 downto 0);
          tmp_strb64 := w_hstb(63 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch011_in_offsets_r((0)).d
                := (f_rematch011_in_offsets_r((0)).d and not tmp_strb64)
                or tmp_data64;
            w_ack := true;

          end if;

        when "01110110" =>
          -- w_addr = 000000000000000000000001110110--

          -- Write logic for block rematch011_in_values_reg_low: block
          -- containing bits 31..0 of register `rematch011_in_values_reg`
          -- (`REMATCH011_IN_VALUES`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '1';
          end if;
          if w_req then
            w_ack := true;
          end if;

        when "01110111" =>
          -- w_addr = 000000000000000000000001110111--

          -- Write logic for block rematch011_in_values_reg_high: block
          -- containing bits 63..32 of register `rematch011_in_values_reg`
          -- (`REMATCH011_IN_VALUES`).
          if w_req or w_lreq then
            w_hold(63 downto 32) := w_data;
            w_hstb(63 downto 32) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch011_in_values: rematch011_in_values.

          tmp_data64 := w_hold(63 downto 0);
          tmp_strb64 := w_hstb(63 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch011_in_values_r((0)).d
                := (f_rematch011_in_values_r((0)).d and not tmp_strb64)
                or tmp_data64;
            w_ack := true;

          end if;

        when "01111000" =>
          -- w_addr = 000000000000000000000001111000--

          -- Write logic for block rematch012_in_offsets_reg_low: block
          -- containing bits 31..0 of register `rematch012_in_offsets_reg`
          -- (`REMATCH012_IN_OFFSETS`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '1';
          end if;
          if w_req then
            w_ack := true;
          end if;

        when "01111001" =>
          -- w_addr = 000000000000000000000001111001--

          -- Write logic for block rematch012_in_offsets_reg_high: block
          -- containing bits 63..32 of register `rematch012_in_offsets_reg`
          -- (`REMATCH012_IN_OFFSETS`).
          if w_req or w_lreq then
            w_hold(63 downto 32) := w_data;
            w_hstb(63 downto 32) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch012_in_offsets: rematch012_in_offsets.

          tmp_data64 := w_hold(63 downto 0);
          tmp_strb64 := w_hstb(63 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch012_in_offsets_r((0)).d
                := (f_rematch012_in_offsets_r((0)).d and not tmp_strb64)
                or tmp_data64;
            w_ack := true;

          end if;

        when "01111010" =>
          -- w_addr = 000000000000000000000001111010--

          -- Write logic for block rematch012_in_values_reg_low: block
          -- containing bits 31..0 of register `rematch012_in_values_reg`
          -- (`REMATCH012_IN_VALUES`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '1';
          end if;
          if w_req then
            w_ack := true;
          end if;

        when "01111011" =>
          -- w_addr = 000000000000000000000001111011--

          -- Write logic for block rematch012_in_values_reg_high: block
          -- containing bits 63..32 of register `rematch012_in_values_reg`
          -- (`REMATCH012_IN_VALUES`).
          if w_req or w_lreq then
            w_hold(63 downto 32) := w_data;
            w_hstb(63 downto 32) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch012_in_values: rematch012_in_values.

          tmp_data64 := w_hold(63 downto 0);
          tmp_strb64 := w_hstb(63 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch012_in_values_r((0)).d
                := (f_rematch012_in_values_r((0)).d and not tmp_strb64)
                or tmp_data64;
            w_ack := true;

          end if;

        when "01111100" =>
          -- w_addr = 000000000000000000000001111100--

          -- Write logic for block rematch013_in_offsets_reg_low: block
          -- containing bits 31..0 of register `rematch013_in_offsets_reg`
          -- (`REMATCH013_IN_OFFSETS`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '1';
          end if;
          if w_req then
            w_ack := true;
          end if;

        when "01111101" =>
          -- w_addr = 000000000000000000000001111101--

          -- Write logic for block rematch013_in_offsets_reg_high: block
          -- containing bits 63..32 of register `rematch013_in_offsets_reg`
          -- (`REMATCH013_IN_OFFSETS`).
          if w_req or w_lreq then
            w_hold(63 downto 32) := w_data;
            w_hstb(63 downto 32) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch013_in_offsets: rematch013_in_offsets.

          tmp_data64 := w_hold(63 downto 0);
          tmp_strb64 := w_hstb(63 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch013_in_offsets_r((0)).d
                := (f_rematch013_in_offsets_r((0)).d and not tmp_strb64)
                or tmp_data64;
            w_ack := true;

          end if;

        when "01111110" =>
          -- w_addr = 000000000000000000000001111110--

          -- Write logic for block rematch013_in_values_reg_low: block
          -- containing bits 31..0 of register `rematch013_in_values_reg`
          -- (`REMATCH013_IN_VALUES`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '1';
          end if;
          if w_req then
            w_ack := true;
          end if;

        when "01111111" =>
          -- w_addr = 000000000000000000000001111111--

          -- Write logic for block rematch013_in_values_reg_high: block
          -- containing bits 63..32 of register `rematch013_in_values_reg`
          -- (`REMATCH013_IN_VALUES`).
          if w_req or w_lreq then
            w_hold(63 downto 32) := w_data;
            w_hstb(63 downto 32) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch013_in_values: rematch013_in_values.

          tmp_data64 := w_hold(63 downto 0);
          tmp_strb64 := w_hstb(63 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch013_in_values_r((0)).d
                := (f_rematch013_in_values_r((0)).d and not tmp_strb64)
                or tmp_data64;
            w_ack := true;

          end if;

        when "10000000" =>
          -- w_addr = 000000000000000000000010000000--

          -- Write logic for block rematch014_in_offsets_reg_low: block
          -- containing bits 31..0 of register `rematch014_in_offsets_reg`
          -- (`REMATCH014_IN_OFFSETS`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '1';
          end if;
          if w_req then
            w_ack := true;
          end if;

        when "10000001" =>
          -- w_addr = 000000000000000000000010000001--

          -- Write logic for block rematch014_in_offsets_reg_high: block
          -- containing bits 63..32 of register `rematch014_in_offsets_reg`
          -- (`REMATCH014_IN_OFFSETS`).
          if w_req or w_lreq then
            w_hold(63 downto 32) := w_data;
            w_hstb(63 downto 32) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch014_in_offsets: rematch014_in_offsets.

          tmp_data64 := w_hold(63 downto 0);
          tmp_strb64 := w_hstb(63 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch014_in_offsets_r((0)).d
                := (f_rematch014_in_offsets_r((0)).d and not tmp_strb64)
                or tmp_data64;
            w_ack := true;

          end if;

        when "10000010" =>
          -- w_addr = 000000000000000000000010000010--

          -- Write logic for block rematch014_in_values_reg_low: block
          -- containing bits 31..0 of register `rematch014_in_values_reg`
          -- (`REMATCH014_IN_VALUES`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '1';
          end if;
          if w_req then
            w_ack := true;
          end if;

        when "10000011" =>
          -- w_addr = 000000000000000000000010000011--

          -- Write logic for block rematch014_in_values_reg_high: block
          -- containing bits 63..32 of register `rematch014_in_values_reg`
          -- (`REMATCH014_IN_VALUES`).
          if w_req or w_lreq then
            w_hold(63 downto 32) := w_data;
            w_hstb(63 downto 32) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch014_in_values: rematch014_in_values.

          tmp_data64 := w_hold(63 downto 0);
          tmp_strb64 := w_hstb(63 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch014_in_values_r((0)).d
                := (f_rematch014_in_values_r((0)).d and not tmp_strb64)
                or tmp_data64;
            w_ack := true;

          end if;

        when "10000100" =>
          -- w_addr = 000000000000000000000010000100--

          -- Write logic for block rematch015_in_offsets_reg_low: block
          -- containing bits 31..0 of register `rematch015_in_offsets_reg`
          -- (`REMATCH015_IN_OFFSETS`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '1';
          end if;
          if w_req then
            w_ack := true;
          end if;

        when "10000101" =>
          -- w_addr = 000000000000000000000010000101--

          -- Write logic for block rematch015_in_offsets_reg_high: block
          -- containing bits 63..32 of register `rematch015_in_offsets_reg`
          -- (`REMATCH015_IN_OFFSETS`).
          if w_req or w_lreq then
            w_hold(63 downto 32) := w_data;
            w_hstb(63 downto 32) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch015_in_offsets: rematch015_in_offsets.

          tmp_data64 := w_hold(63 downto 0);
          tmp_strb64 := w_hstb(63 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch015_in_offsets_r((0)).d
                := (f_rematch015_in_offsets_r((0)).d and not tmp_strb64)
                or tmp_data64;
            w_ack := true;

          end if;

        when "10000110" =>
          -- w_addr = 000000000000000000000010000110--

          -- Write logic for block rematch015_in_values_reg_low: block
          -- containing bits 31..0 of register `rematch015_in_values_reg`
          -- (`REMATCH015_IN_VALUES`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '1';
          end if;
          if w_req then
            w_ack := true;
          end if;

        when "10000111" =>
          -- w_addr = 000000000000000000000010000111--

          -- Write logic for block rematch015_in_values_reg_high: block
          -- containing bits 63..32 of register `rematch015_in_values_reg`
          -- (`REMATCH015_IN_VALUES`).
          if w_req or w_lreq then
            w_hold(63 downto 32) := w_data;
            w_hstb(63 downto 32) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch015_in_values: rematch015_in_values.

          tmp_data64 := w_hold(63 downto 0);
          tmp_strb64 := w_hstb(63 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch015_in_values_r((0)).d
                := (f_rematch015_in_values_r((0)).d and not tmp_strb64)
                or tmp_data64;
            w_ack := true;

          end if;

        when "10001000" =>
          -- w_addr = 000000000000000000000010001000--

          -- Write logic for block rematch000_taxi_out_values_reg_low: block
          -- containing bits 31..0 of register `rematch000_taxi_out_values_reg`
          -- (`REMATCH000_TAXI_OUT_VALUES`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '1';
          end if;
          if w_req then
            w_ack := true;
          end if;

        when "10001001" =>
          -- w_addr = 000000000000000000000010001001--

          -- Write logic for block rematch000_taxi_out_values_reg_high: block
          -- containing bits 63..32 of register `rematch000_taxi_out_values_reg`
          -- (`REMATCH000_TAXI_OUT_VALUES`).
          if w_req or w_lreq then
            w_hold(63 downto 32) := w_data;
            w_hstb(63 downto 32) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch000_taxi_out_values:
          -- rematch000_taxi_out_values.

          tmp_data64 := w_hold(63 downto 0);
          tmp_strb64 := w_hstb(63 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch000_taxi_out_values_r((0)).d
                := (f_rematch000_taxi_out_values_r((0)).d and not tmp_strb64)
                or tmp_data64;
            w_ack := true;

          end if;

        when "10001010" =>
          -- w_addr = 000000000000000000000010001010--

          -- Write logic for block rematch001_taxi_out_values_reg_low: block
          -- containing bits 31..0 of register `rematch001_taxi_out_values_reg`
          -- (`REMATCH001_TAXI_OUT_VALUES`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '1';
          end if;
          if w_req then
            w_ack := true;
          end if;

        when "10001011" =>
          -- w_addr = 000000000000000000000010001011--

          -- Write logic for block rematch001_taxi_out_values_reg_high: block
          -- containing bits 63..32 of register `rematch001_taxi_out_values_reg`
          -- (`REMATCH001_TAXI_OUT_VALUES`).
          if w_req or w_lreq then
            w_hold(63 downto 32) := w_data;
            w_hstb(63 downto 32) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch001_taxi_out_values:
          -- rematch001_taxi_out_values.

          tmp_data64 := w_hold(63 downto 0);
          tmp_strb64 := w_hstb(63 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch001_taxi_out_values_r((0)).d
                := (f_rematch001_taxi_out_values_r((0)).d and not tmp_strb64)
                or tmp_data64;
            w_ack := true;

          end if;

        when "10001100" =>
          -- w_addr = 000000000000000000000010001100--

          -- Write logic for block rematch002_taxi_out_values_reg_low: block
          -- containing bits 31..0 of register `rematch002_taxi_out_values_reg`
          -- (`REMATCH002_TAXI_OUT_VALUES`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '1';
          end if;
          if w_req then
            w_ack := true;
          end if;

        when "10001101" =>
          -- w_addr = 000000000000000000000010001101--

          -- Write logic for block rematch002_taxi_out_values_reg_high: block
          -- containing bits 63..32 of register `rematch002_taxi_out_values_reg`
          -- (`REMATCH002_TAXI_OUT_VALUES`).
          if w_req or w_lreq then
            w_hold(63 downto 32) := w_data;
            w_hstb(63 downto 32) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch002_taxi_out_values:
          -- rematch002_taxi_out_values.

          tmp_data64 := w_hold(63 downto 0);
          tmp_strb64 := w_hstb(63 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch002_taxi_out_values_r((0)).d
                := (f_rematch002_taxi_out_values_r((0)).d and not tmp_strb64)
                or tmp_data64;
            w_ack := true;

          end if;

        when "10001110" =>
          -- w_addr = 000000000000000000000010001110--

          -- Write logic for block rematch003_taxi_out_values_reg_low: block
          -- containing bits 31..0 of register `rematch003_taxi_out_values_reg`
          -- (`REMATCH003_TAXI_OUT_VALUES`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '1';
          end if;
          if w_req then
            w_ack := true;
          end if;

        when "10001111" =>
          -- w_addr = 000000000000000000000010001111--

          -- Write logic for block rematch003_taxi_out_values_reg_high: block
          -- containing bits 63..32 of register `rematch003_taxi_out_values_reg`
          -- (`REMATCH003_TAXI_OUT_VALUES`).
          if w_req or w_lreq then
            w_hold(63 downto 32) := w_data;
            w_hstb(63 downto 32) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch003_taxi_out_values:
          -- rematch003_taxi_out_values.

          tmp_data64 := w_hold(63 downto 0);
          tmp_strb64 := w_hstb(63 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch003_taxi_out_values_r((0)).d
                := (f_rematch003_taxi_out_values_r((0)).d and not tmp_strb64)
                or tmp_data64;
            w_ack := true;

          end if;

        when "10010000" =>
          -- w_addr = 000000000000000000000010010000--

          -- Write logic for block rematch004_taxi_out_values_reg_low: block
          -- containing bits 31..0 of register `rematch004_taxi_out_values_reg`
          -- (`REMATCH004_TAXI_OUT_VALUES`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '1';
          end if;
          if w_req then
            w_ack := true;
          end if;

        when "10010001" =>
          -- w_addr = 000000000000000000000010010001--

          -- Write logic for block rematch004_taxi_out_values_reg_high: block
          -- containing bits 63..32 of register `rematch004_taxi_out_values_reg`
          -- (`REMATCH004_TAXI_OUT_VALUES`).
          if w_req or w_lreq then
            w_hold(63 downto 32) := w_data;
            w_hstb(63 downto 32) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch004_taxi_out_values:
          -- rematch004_taxi_out_values.

          tmp_data64 := w_hold(63 downto 0);
          tmp_strb64 := w_hstb(63 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch004_taxi_out_values_r((0)).d
                := (f_rematch004_taxi_out_values_r((0)).d and not tmp_strb64)
                or tmp_data64;
            w_ack := true;

          end if;

        when "10010010" =>
          -- w_addr = 000000000000000000000010010010--

          -- Write logic for block rematch005_taxi_out_values_reg_low: block
          -- containing bits 31..0 of register `rematch005_taxi_out_values_reg`
          -- (`REMATCH005_TAXI_OUT_VALUES`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '1';
          end if;
          if w_req then
            w_ack := true;
          end if;

        when "10010011" =>
          -- w_addr = 000000000000000000000010010011--

          -- Write logic for block rematch005_taxi_out_values_reg_high: block
          -- containing bits 63..32 of register `rematch005_taxi_out_values_reg`
          -- (`REMATCH005_TAXI_OUT_VALUES`).
          if w_req or w_lreq then
            w_hold(63 downto 32) := w_data;
            w_hstb(63 downto 32) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch005_taxi_out_values:
          -- rematch005_taxi_out_values.

          tmp_data64 := w_hold(63 downto 0);
          tmp_strb64 := w_hstb(63 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch005_taxi_out_values_r((0)).d
                := (f_rematch005_taxi_out_values_r((0)).d and not tmp_strb64)
                or tmp_data64;
            w_ack := true;

          end if;

        when "10010100" =>
          -- w_addr = 000000000000000000000010010100--

          -- Write logic for block rematch006_taxi_out_values_reg_low: block
          -- containing bits 31..0 of register `rematch006_taxi_out_values_reg`
          -- (`REMATCH006_TAXI_OUT_VALUES`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '1';
          end if;
          if w_req then
            w_ack := true;
          end if;

        when "10010101" =>
          -- w_addr = 000000000000000000000010010101--

          -- Write logic for block rematch006_taxi_out_values_reg_high: block
          -- containing bits 63..32 of register `rematch006_taxi_out_values_reg`
          -- (`REMATCH006_TAXI_OUT_VALUES`).
          if w_req or w_lreq then
            w_hold(63 downto 32) := w_data;
            w_hstb(63 downto 32) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch006_taxi_out_values:
          -- rematch006_taxi_out_values.

          tmp_data64 := w_hold(63 downto 0);
          tmp_strb64 := w_hstb(63 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch006_taxi_out_values_r((0)).d
                := (f_rematch006_taxi_out_values_r((0)).d and not tmp_strb64)
                or tmp_data64;
            w_ack := true;

          end if;

        when "10010110" =>
          -- w_addr = 000000000000000000000010010110--

          -- Write logic for block rematch007_taxi_out_values_reg_low: block
          -- containing bits 31..0 of register `rematch007_taxi_out_values_reg`
          -- (`REMATCH007_TAXI_OUT_VALUES`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '1';
          end if;
          if w_req then
            w_ack := true;
          end if;

        when "10010111" =>
          -- w_addr = 000000000000000000000010010111--

          -- Write logic for block rematch007_taxi_out_values_reg_high: block
          -- containing bits 63..32 of register `rematch007_taxi_out_values_reg`
          -- (`REMATCH007_TAXI_OUT_VALUES`).
          if w_req or w_lreq then
            w_hold(63 downto 32) := w_data;
            w_hstb(63 downto 32) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch007_taxi_out_values:
          -- rematch007_taxi_out_values.

          tmp_data64 := w_hold(63 downto 0);
          tmp_strb64 := w_hstb(63 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch007_taxi_out_values_r((0)).d
                := (f_rematch007_taxi_out_values_r((0)).d and not tmp_strb64)
                or tmp_data64;
            w_ack := true;

          end if;

        when "10011000" =>
          -- w_addr = 000000000000000000000010011000--

          -- Write logic for block rematch008_taxi_out_values_reg_low: block
          -- containing bits 31..0 of register `rematch008_taxi_out_values_reg`
          -- (`REMATCH008_TAXI_OUT_VALUES`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '1';
          end if;
          if w_req then
            w_ack := true;
          end if;

        when "10011001" =>
          -- w_addr = 000000000000000000000010011001--

          -- Write logic for block rematch008_taxi_out_values_reg_high: block
          -- containing bits 63..32 of register `rematch008_taxi_out_values_reg`
          -- (`REMATCH008_TAXI_OUT_VALUES`).
          if w_req or w_lreq then
            w_hold(63 downto 32) := w_data;
            w_hstb(63 downto 32) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch008_taxi_out_values:
          -- rematch008_taxi_out_values.

          tmp_data64 := w_hold(63 downto 0);
          tmp_strb64 := w_hstb(63 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch008_taxi_out_values_r((0)).d
                := (f_rematch008_taxi_out_values_r((0)).d and not tmp_strb64)
                or tmp_data64;
            w_ack := true;

          end if;

        when "10011010" =>
          -- w_addr = 000000000000000000000010011010--

          -- Write logic for block rematch009_taxi_out_values_reg_low: block
          -- containing bits 31..0 of register `rematch009_taxi_out_values_reg`
          -- (`REMATCH009_TAXI_OUT_VALUES`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '1';
          end if;
          if w_req then
            w_ack := true;
          end if;

        when "10011011" =>
          -- w_addr = 000000000000000000000010011011--

          -- Write logic for block rematch009_taxi_out_values_reg_high: block
          -- containing bits 63..32 of register `rematch009_taxi_out_values_reg`
          -- (`REMATCH009_TAXI_OUT_VALUES`).
          if w_req or w_lreq then
            w_hold(63 downto 32) := w_data;
            w_hstb(63 downto 32) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch009_taxi_out_values:
          -- rematch009_taxi_out_values.

          tmp_data64 := w_hold(63 downto 0);
          tmp_strb64 := w_hstb(63 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch009_taxi_out_values_r((0)).d
                := (f_rematch009_taxi_out_values_r((0)).d and not tmp_strb64)
                or tmp_data64;
            w_ack := true;

          end if;

        when "10011100" =>
          -- w_addr = 000000000000000000000010011100--

          -- Write logic for block rematch010_taxi_out_values_reg_low: block
          -- containing bits 31..0 of register `rematch010_taxi_out_values_reg`
          -- (`REMATCH010_TAXI_OUT_VALUES`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '1';
          end if;
          if w_req then
            w_ack := true;
          end if;

        when "10011101" =>
          -- w_addr = 000000000000000000000010011101--

          -- Write logic for block rematch010_taxi_out_values_reg_high: block
          -- containing bits 63..32 of register `rematch010_taxi_out_values_reg`
          -- (`REMATCH010_TAXI_OUT_VALUES`).
          if w_req or w_lreq then
            w_hold(63 downto 32) := w_data;
            w_hstb(63 downto 32) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch010_taxi_out_values:
          -- rematch010_taxi_out_values.

          tmp_data64 := w_hold(63 downto 0);
          tmp_strb64 := w_hstb(63 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch010_taxi_out_values_r((0)).d
                := (f_rematch010_taxi_out_values_r((0)).d and not tmp_strb64)
                or tmp_data64;
            w_ack := true;

          end if;

        when "10011110" =>
          -- w_addr = 000000000000000000000010011110--

          -- Write logic for block rematch011_taxi_out_values_reg_low: block
          -- containing bits 31..0 of register `rematch011_taxi_out_values_reg`
          -- (`REMATCH011_TAXI_OUT_VALUES`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '1';
          end if;
          if w_req then
            w_ack := true;
          end if;

        when "10011111" =>
          -- w_addr = 000000000000000000000010011111--

          -- Write logic for block rematch011_taxi_out_values_reg_high: block
          -- containing bits 63..32 of register `rematch011_taxi_out_values_reg`
          -- (`REMATCH011_TAXI_OUT_VALUES`).
          if w_req or w_lreq then
            w_hold(63 downto 32) := w_data;
            w_hstb(63 downto 32) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch011_taxi_out_values:
          -- rematch011_taxi_out_values.

          tmp_data64 := w_hold(63 downto 0);
          tmp_strb64 := w_hstb(63 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch011_taxi_out_values_r((0)).d
                := (f_rematch011_taxi_out_values_r((0)).d and not tmp_strb64)
                or tmp_data64;
            w_ack := true;

          end if;

        when "10100000" =>
          -- w_addr = 000000000000000000000010100000--

          -- Write logic for block rematch012_taxi_out_values_reg_low: block
          -- containing bits 31..0 of register `rematch012_taxi_out_values_reg`
          -- (`REMATCH012_TAXI_OUT_VALUES`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '1';
          end if;
          if w_req then
            w_ack := true;
          end if;

        when "10100001" =>
          -- w_addr = 000000000000000000000010100001--

          -- Write logic for block rematch012_taxi_out_values_reg_high: block
          -- containing bits 63..32 of register `rematch012_taxi_out_values_reg`
          -- (`REMATCH012_TAXI_OUT_VALUES`).
          if w_req or w_lreq then
            w_hold(63 downto 32) := w_data;
            w_hstb(63 downto 32) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch012_taxi_out_values:
          -- rematch012_taxi_out_values.

          tmp_data64 := w_hold(63 downto 0);
          tmp_strb64 := w_hstb(63 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch012_taxi_out_values_r((0)).d
                := (f_rematch012_taxi_out_values_r((0)).d and not tmp_strb64)
                or tmp_data64;
            w_ack := true;

          end if;

        when "10100010" =>
          -- w_addr = 000000000000000000000010100010--

          -- Write logic for block rematch013_taxi_out_values_reg_low: block
          -- containing bits 31..0 of register `rematch013_taxi_out_values_reg`
          -- (`REMATCH013_TAXI_OUT_VALUES`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '1';
          end if;
          if w_req then
            w_ack := true;
          end if;

        when "10100011" =>
          -- w_addr = 000000000000000000000010100011--

          -- Write logic for block rematch013_taxi_out_values_reg_high: block
          -- containing bits 63..32 of register `rematch013_taxi_out_values_reg`
          -- (`REMATCH013_TAXI_OUT_VALUES`).
          if w_req or w_lreq then
            w_hold(63 downto 32) := w_data;
            w_hstb(63 downto 32) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch013_taxi_out_values:
          -- rematch013_taxi_out_values.

          tmp_data64 := w_hold(63 downto 0);
          tmp_strb64 := w_hstb(63 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch013_taxi_out_values_r((0)).d
                := (f_rematch013_taxi_out_values_r((0)).d and not tmp_strb64)
                or tmp_data64;
            w_ack := true;

          end if;

        when "10100100" =>
          -- w_addr = 000000000000000000000010100100--

          -- Write logic for block rematch014_taxi_out_values_reg_low: block
          -- containing bits 31..0 of register `rematch014_taxi_out_values_reg`
          -- (`REMATCH014_TAXI_OUT_VALUES`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '1';
          end if;
          if w_req then
            w_ack := true;
          end if;

        when "10100101" =>
          -- w_addr = 000000000000000000000010100101--

          -- Write logic for block rematch014_taxi_out_values_reg_high: block
          -- containing bits 63..32 of register `rematch014_taxi_out_values_reg`
          -- (`REMATCH014_TAXI_OUT_VALUES`).
          if w_req or w_lreq then
            w_hold(63 downto 32) := w_data;
            w_hstb(63 downto 32) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch014_taxi_out_values:
          -- rematch014_taxi_out_values.

          tmp_data64 := w_hold(63 downto 0);
          tmp_strb64 := w_hstb(63 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch014_taxi_out_values_r((0)).d
                := (f_rematch014_taxi_out_values_r((0)).d and not tmp_strb64)
                or tmp_data64;
            w_ack := true;

          end if;

        when "10100110" =>
          -- w_addr = 000000000000000000000010100110--

          -- Write logic for block rematch015_taxi_out_values_reg_low: block
          -- containing bits 31..0 of register `rematch015_taxi_out_values_reg`
          -- (`REMATCH015_TAXI_OUT_VALUES`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '1';
          end if;
          if w_req then
            w_ack := true;
          end if;

        when "10100111" =>
          -- w_addr = 000000000000000000000010100111--

          -- Write logic for block rematch015_taxi_out_values_reg_high: block
          -- containing bits 63..32 of register `rematch015_taxi_out_values_reg`
          -- (`REMATCH015_TAXI_OUT_VALUES`).
          if w_req or w_lreq then
            w_hold(63 downto 32) := w_data;
            w_hstb(63 downto 32) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field rematch015_taxi_out_values:
          -- rematch015_taxi_out_values.

          tmp_data64 := w_hold(63 downto 0);
          tmp_strb64 := w_hstb(63 downto 0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_rematch015_taxi_out_values_r((0)).d
                := (f_rematch015_taxi_out_values_r((0)).d and not tmp_strb64)
                or tmp_data64;
            w_ack := true;

          end if;

        when "11001000" =>
          -- w_addr = 000000000000000000000011001000--

          -- Write logic for block Profile_enable_reg: block containing bits
          -- 31..0 of register `Profile_enable_reg` (`PROFILE_ENABLE`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field Profile_enable: Profile_enable.

          tmp_data := w_hold(0);
          tmp_strb := w_hstb(0);
          if w_req then

            -- Regular access logic. Write mode: masked.

            f_Profile_enable_r((0)).d
                := (f_Profile_enable_r((0)).d and not tmp_strb) or tmp_data;
            w_ack := true;

          end if;

        when others => -- "11001001"
          -- w_addr = 000000000000000000000011001001--

          -- Write logic for block Profile_clear_reg: block containing bits
          -- 31..0 of register `Profile_clear_reg` (`PROFILE_CLEAR`).
          if w_req or w_lreq then
            w_hold(31 downto 0) := w_data;
            w_hstb(31 downto 0) := w_strb;
            w_multi := '0';
          end if;

          -- Write logic for field Profile_clear: Profile_clear.

          tmp_data := w_hold(0);
          tmp_strb := w_hstb(0);
          if w_req then

            -- Regular access logic. Write mode: enabled.

            f_Profile_clear_r((0)).d := tmp_data;
            w_ack := true;

            -- Handle post-write operation: invalidate.
            f_Profile_clear_r((0)).v := '1';
            f_Profile_clear_r((0)).inval := '1';

          end if;

      end case;

      -------------------------------------------------------------------------
      -- Generated field logic
      -------------------------------------------------------------------------

      -- Post-bus logic for field start: start.

      -- Handle reset for field start.
      if reset = '1' then
        f_start_r((0)).d := '0';
        f_start_r((0)).v := '1';
        f_start_r((0)).inval := '0';
      end if;
      -- Assign the read outputs for field start.
      f_start_data <= f_start_r((0)).d;

      -- Post-bus logic for field stop: stop.

      -- Handle reset for field stop.
      if reset = '1' then
        f_stop_r((0)).d := '0';
        f_stop_r((0)).v := '1';
        f_stop_r((0)).inval := '0';
      end if;
      -- Assign the read outputs for field stop.
      f_stop_data <= f_stop_r((0)).d;

      -- Post-bus logic for field reset: reset.

      -- Handle reset for field reset.
      if reset = '1' then
        f_reset_r((0)).d := '0';
        f_reset_r((0)).v := '1';
        f_reset_r((0)).inval := '0';
      end if;
      -- Assign the read outputs for field reset.
      f_reset_data <= f_reset_r((0)).d;

      -- Post-bus logic for field rematch000_firstidx: rematch000_firstidx.

      -- Handle reset for field rematch000_firstidx.
      if reset = '1' then
        f_rematch000_firstidx_r((0)).d := (others => '0');
        f_rematch000_firstidx_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch000_firstidx.
      f_rematch000_firstidx_data <= f_rematch000_firstidx_r((0)).d;

      -- Post-bus logic for field rematch000_lastidx: rematch000_lastidx.

      -- Handle reset for field rematch000_lastidx.
      if reset = '1' then
        f_rematch000_lastidx_r((0)).d := (others => '0');
        f_rematch000_lastidx_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch000_lastidx.
      f_rematch000_lastidx_data <= f_rematch000_lastidx_r((0)).d;

      -- Post-bus logic for field rematch001_firstidx: rematch001_firstidx.

      -- Handle reset for field rematch001_firstidx.
      if reset = '1' then
        f_rematch001_firstidx_r((0)).d := (others => '0');
        f_rematch001_firstidx_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch001_firstidx.
      f_rematch001_firstidx_data <= f_rematch001_firstidx_r((0)).d;

      -- Post-bus logic for field rematch001_lastidx: rematch001_lastidx.

      -- Handle reset for field rematch001_lastidx.
      if reset = '1' then
        f_rematch001_lastidx_r((0)).d := (others => '0');
        f_rematch001_lastidx_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch001_lastidx.
      f_rematch001_lastidx_data <= f_rematch001_lastidx_r((0)).d;

      -- Post-bus logic for field rematch002_firstidx: rematch002_firstidx.

      -- Handle reset for field rematch002_firstidx.
      if reset = '1' then
        f_rematch002_firstidx_r((0)).d := (others => '0');
        f_rematch002_firstidx_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch002_firstidx.
      f_rematch002_firstidx_data <= f_rematch002_firstidx_r((0)).d;

      -- Post-bus logic for field rematch002_lastidx: rematch002_lastidx.

      -- Handle reset for field rematch002_lastidx.
      if reset = '1' then
        f_rematch002_lastidx_r((0)).d := (others => '0');
        f_rematch002_lastidx_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch002_lastidx.
      f_rematch002_lastidx_data <= f_rematch002_lastidx_r((0)).d;

      -- Post-bus logic for field rematch003_firstidx: rematch003_firstidx.

      -- Handle reset for field rematch003_firstidx.
      if reset = '1' then
        f_rematch003_firstidx_r((0)).d := (others => '0');
        f_rematch003_firstidx_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch003_firstidx.
      f_rematch003_firstidx_data <= f_rematch003_firstidx_r((0)).d;

      -- Post-bus logic for field rematch003_lastidx: rematch003_lastidx.

      -- Handle reset for field rematch003_lastidx.
      if reset = '1' then
        f_rematch003_lastidx_r((0)).d := (others => '0');
        f_rematch003_lastidx_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch003_lastidx.
      f_rematch003_lastidx_data <= f_rematch003_lastidx_r((0)).d;

      -- Post-bus logic for field rematch004_firstidx: rematch004_firstidx.

      -- Handle reset for field rematch004_firstidx.
      if reset = '1' then
        f_rematch004_firstidx_r((0)).d := (others => '0');
        f_rematch004_firstidx_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch004_firstidx.
      f_rematch004_firstidx_data <= f_rematch004_firstidx_r((0)).d;

      -- Post-bus logic for field rematch004_lastidx: rematch004_lastidx.

      -- Handle reset for field rematch004_lastidx.
      if reset = '1' then
        f_rematch004_lastidx_r((0)).d := (others => '0');
        f_rematch004_lastidx_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch004_lastidx.
      f_rematch004_lastidx_data <= f_rematch004_lastidx_r((0)).d;

      -- Post-bus logic for field rematch005_firstidx: rematch005_firstidx.

      -- Handle reset for field rematch005_firstidx.
      if reset = '1' then
        f_rematch005_firstidx_r((0)).d := (others => '0');
        f_rematch005_firstidx_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch005_firstidx.
      f_rematch005_firstidx_data <= f_rematch005_firstidx_r((0)).d;

      -- Post-bus logic for field rematch005_lastidx: rematch005_lastidx.

      -- Handle reset for field rematch005_lastidx.
      if reset = '1' then
        f_rematch005_lastidx_r((0)).d := (others => '0');
        f_rematch005_lastidx_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch005_lastidx.
      f_rematch005_lastidx_data <= f_rematch005_lastidx_r((0)).d;

      -- Post-bus logic for field rematch006_firstidx: rematch006_firstidx.

      -- Handle reset for field rematch006_firstidx.
      if reset = '1' then
        f_rematch006_firstidx_r((0)).d := (others => '0');
        f_rematch006_firstidx_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch006_firstidx.
      f_rematch006_firstidx_data <= f_rematch006_firstidx_r((0)).d;

      -- Post-bus logic for field rematch006_lastidx: rematch006_lastidx.

      -- Handle reset for field rematch006_lastidx.
      if reset = '1' then
        f_rematch006_lastidx_r((0)).d := (others => '0');
        f_rematch006_lastidx_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch006_lastidx.
      f_rematch006_lastidx_data <= f_rematch006_lastidx_r((0)).d;

      -- Post-bus logic for field rematch007_firstidx: rematch007_firstidx.

      -- Handle reset for field rematch007_firstidx.
      if reset = '1' then
        f_rematch007_firstidx_r((0)).d := (others => '0');
        f_rematch007_firstidx_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch007_firstidx.
      f_rematch007_firstidx_data <= f_rematch007_firstidx_r((0)).d;

      -- Post-bus logic for field rematch007_lastidx: rematch007_lastidx.

      -- Handle reset for field rematch007_lastidx.
      if reset = '1' then
        f_rematch007_lastidx_r((0)).d := (others => '0');
        f_rematch007_lastidx_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch007_lastidx.
      f_rematch007_lastidx_data <= f_rematch007_lastidx_r((0)).d;

      -- Post-bus logic for field rematch008_firstidx: rematch008_firstidx.

      -- Handle reset for field rematch008_firstidx.
      if reset = '1' then
        f_rematch008_firstidx_r((0)).d := (others => '0');
        f_rematch008_firstidx_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch008_firstidx.
      f_rematch008_firstidx_data <= f_rematch008_firstidx_r((0)).d;

      -- Post-bus logic for field rematch008_lastidx: rematch008_lastidx.

      -- Handle reset for field rematch008_lastidx.
      if reset = '1' then
        f_rematch008_lastidx_r((0)).d := (others => '0');
        f_rematch008_lastidx_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch008_lastidx.
      f_rematch008_lastidx_data <= f_rematch008_lastidx_r((0)).d;

      -- Post-bus logic for field rematch009_firstidx: rematch009_firstidx.

      -- Handle reset for field rematch009_firstidx.
      if reset = '1' then
        f_rematch009_firstidx_r((0)).d := (others => '0');
        f_rematch009_firstidx_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch009_firstidx.
      f_rematch009_firstidx_data <= f_rematch009_firstidx_r((0)).d;

      -- Post-bus logic for field rematch009_lastidx: rematch009_lastidx.

      -- Handle reset for field rematch009_lastidx.
      if reset = '1' then
        f_rematch009_lastidx_r((0)).d := (others => '0');
        f_rematch009_lastidx_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch009_lastidx.
      f_rematch009_lastidx_data <= f_rematch009_lastidx_r((0)).d;

      -- Post-bus logic for field rematch010_firstidx: rematch010_firstidx.

      -- Handle reset for field rematch010_firstidx.
      if reset = '1' then
        f_rematch010_firstidx_r((0)).d := (others => '0');
        f_rematch010_firstidx_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch010_firstidx.
      f_rematch010_firstidx_data <= f_rematch010_firstidx_r((0)).d;

      -- Post-bus logic for field rematch010_lastidx: rematch010_lastidx.

      -- Handle reset for field rematch010_lastidx.
      if reset = '1' then
        f_rematch010_lastidx_r((0)).d := (others => '0');
        f_rematch010_lastidx_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch010_lastidx.
      f_rematch010_lastidx_data <= f_rematch010_lastidx_r((0)).d;

      -- Post-bus logic for field rematch011_firstidx: rematch011_firstidx.

      -- Handle reset for field rematch011_firstidx.
      if reset = '1' then
        f_rematch011_firstidx_r((0)).d := (others => '0');
        f_rematch011_firstidx_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch011_firstidx.
      f_rematch011_firstidx_data <= f_rematch011_firstidx_r((0)).d;

      -- Post-bus logic for field rematch011_lastidx: rematch011_lastidx.

      -- Handle reset for field rematch011_lastidx.
      if reset = '1' then
        f_rematch011_lastidx_r((0)).d := (others => '0');
        f_rematch011_lastidx_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch011_lastidx.
      f_rematch011_lastidx_data <= f_rematch011_lastidx_r((0)).d;

      -- Post-bus logic for field rematch012_firstidx: rematch012_firstidx.

      -- Handle reset for field rematch012_firstidx.
      if reset = '1' then
        f_rematch012_firstidx_r((0)).d := (others => '0');
        f_rematch012_firstidx_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch012_firstidx.
      f_rematch012_firstidx_data <= f_rematch012_firstidx_r((0)).d;

      -- Post-bus logic for field rematch012_lastidx: rematch012_lastidx.

      -- Handle reset for field rematch012_lastidx.
      if reset = '1' then
        f_rematch012_lastidx_r((0)).d := (others => '0');
        f_rematch012_lastidx_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch012_lastidx.
      f_rematch012_lastidx_data <= f_rematch012_lastidx_r((0)).d;

      -- Post-bus logic for field rematch013_firstidx: rematch013_firstidx.

      -- Handle reset for field rematch013_firstidx.
      if reset = '1' then
        f_rematch013_firstidx_r((0)).d := (others => '0');
        f_rematch013_firstidx_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch013_firstidx.
      f_rematch013_firstidx_data <= f_rematch013_firstidx_r((0)).d;

      -- Post-bus logic for field rematch013_lastidx: rematch013_lastidx.

      -- Handle reset for field rematch013_lastidx.
      if reset = '1' then
        f_rematch013_lastidx_r((0)).d := (others => '0');
        f_rematch013_lastidx_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch013_lastidx.
      f_rematch013_lastidx_data <= f_rematch013_lastidx_r((0)).d;

      -- Post-bus logic for field rematch014_firstidx: rematch014_firstidx.

      -- Handle reset for field rematch014_firstidx.
      if reset = '1' then
        f_rematch014_firstidx_r((0)).d := (others => '0');
        f_rematch014_firstidx_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch014_firstidx.
      f_rematch014_firstidx_data <= f_rematch014_firstidx_r((0)).d;

      -- Post-bus logic for field rematch014_lastidx: rematch014_lastidx.

      -- Handle reset for field rematch014_lastidx.
      if reset = '1' then
        f_rematch014_lastidx_r((0)).d := (others => '0');
        f_rematch014_lastidx_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch014_lastidx.
      f_rematch014_lastidx_data <= f_rematch014_lastidx_r((0)).d;

      -- Post-bus logic for field rematch015_firstidx: rematch015_firstidx.

      -- Handle reset for field rematch015_firstidx.
      if reset = '1' then
        f_rematch015_firstidx_r((0)).d := (others => '0');
        f_rematch015_firstidx_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch015_firstidx.
      f_rematch015_firstidx_data <= f_rematch015_firstidx_r((0)).d;

      -- Post-bus logic for field rematch015_lastidx: rematch015_lastidx.

      -- Handle reset for field rematch015_lastidx.
      if reset = '1' then
        f_rematch015_lastidx_r((0)).d := (others => '0');
        f_rematch015_lastidx_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch015_lastidx.
      f_rematch015_lastidx_data <= f_rematch015_lastidx_r((0)).d;

      -- Post-bus logic for field rematch000_taxi_firstidx:
      -- rematch000_taxi_firstidx.

      -- Handle reset for field rematch000_taxi_firstidx.
      if reset = '1' then
        f_rematch000_taxi_firstidx_r((0)).d := (others => '0');
        f_rematch000_taxi_firstidx_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch000_taxi_firstidx.
      f_rematch000_taxi_firstidx_data <= f_rematch000_taxi_firstidx_r((0)).d;

      -- Post-bus logic for field rematch000_taxi_lastidx:
      -- rematch000_taxi_lastidx.

      -- Handle reset for field rematch000_taxi_lastidx.
      if reset = '1' then
        f_rematch000_taxi_lastidx_r((0)).d := (others => '0');
        f_rematch000_taxi_lastidx_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch000_taxi_lastidx.
      f_rematch000_taxi_lastidx_data <= f_rematch000_taxi_lastidx_r((0)).d;

      -- Post-bus logic for field rematch001_taxi_firstidx:
      -- rematch001_taxi_firstidx.

      -- Handle reset for field rematch001_taxi_firstidx.
      if reset = '1' then
        f_rematch001_taxi_firstidx_r((0)).d := (others => '0');
        f_rematch001_taxi_firstidx_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch001_taxi_firstidx.
      f_rematch001_taxi_firstidx_data <= f_rematch001_taxi_firstidx_r((0)).d;

      -- Post-bus logic for field rematch001_taxi_lastidx:
      -- rematch001_taxi_lastidx.

      -- Handle reset for field rematch001_taxi_lastidx.
      if reset = '1' then
        f_rematch001_taxi_lastidx_r((0)).d := (others => '0');
        f_rematch001_taxi_lastidx_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch001_taxi_lastidx.
      f_rematch001_taxi_lastidx_data <= f_rematch001_taxi_lastidx_r((0)).d;

      -- Post-bus logic for field rematch002_taxi_firstidx:
      -- rematch002_taxi_firstidx.

      -- Handle reset for field rematch002_taxi_firstidx.
      if reset = '1' then
        f_rematch002_taxi_firstidx_r((0)).d := (others => '0');
        f_rematch002_taxi_firstidx_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch002_taxi_firstidx.
      f_rematch002_taxi_firstidx_data <= f_rematch002_taxi_firstidx_r((0)).d;

      -- Post-bus logic for field rematch002_taxi_lastidx:
      -- rematch002_taxi_lastidx.

      -- Handle reset for field rematch002_taxi_lastidx.
      if reset = '1' then
        f_rematch002_taxi_lastidx_r((0)).d := (others => '0');
        f_rematch002_taxi_lastidx_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch002_taxi_lastidx.
      f_rematch002_taxi_lastidx_data <= f_rematch002_taxi_lastidx_r((0)).d;

      -- Post-bus logic for field rematch003_taxi_firstidx:
      -- rematch003_taxi_firstidx.

      -- Handle reset for field rematch003_taxi_firstidx.
      if reset = '1' then
        f_rematch003_taxi_firstidx_r((0)).d := (others => '0');
        f_rematch003_taxi_firstidx_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch003_taxi_firstidx.
      f_rematch003_taxi_firstidx_data <= f_rematch003_taxi_firstidx_r((0)).d;

      -- Post-bus logic for field rematch003_taxi_lastidx:
      -- rematch003_taxi_lastidx.

      -- Handle reset for field rematch003_taxi_lastidx.
      if reset = '1' then
        f_rematch003_taxi_lastidx_r((0)).d := (others => '0');
        f_rematch003_taxi_lastidx_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch003_taxi_lastidx.
      f_rematch003_taxi_lastidx_data <= f_rematch003_taxi_lastidx_r((0)).d;

      -- Post-bus logic for field rematch004_taxi_firstidx:
      -- rematch004_taxi_firstidx.

      -- Handle reset for field rematch004_taxi_firstidx.
      if reset = '1' then
        f_rematch004_taxi_firstidx_r((0)).d := (others => '0');
        f_rematch004_taxi_firstidx_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch004_taxi_firstidx.
      f_rematch004_taxi_firstidx_data <= f_rematch004_taxi_firstidx_r((0)).d;

      -- Post-bus logic for field rematch004_taxi_lastidx:
      -- rematch004_taxi_lastidx.

      -- Handle reset for field rematch004_taxi_lastidx.
      if reset = '1' then
        f_rematch004_taxi_lastidx_r((0)).d := (others => '0');
        f_rematch004_taxi_lastidx_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch004_taxi_lastidx.
      f_rematch004_taxi_lastidx_data <= f_rematch004_taxi_lastidx_r((0)).d;

      -- Post-bus logic for field rematch005_taxi_firstidx:
      -- rematch005_taxi_firstidx.

      -- Handle reset for field rematch005_taxi_firstidx.
      if reset = '1' then
        f_rematch005_taxi_firstidx_r((0)).d := (others => '0');
        f_rematch005_taxi_firstidx_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch005_taxi_firstidx.
      f_rematch005_taxi_firstidx_data <= f_rematch005_taxi_firstidx_r((0)).d;

      -- Post-bus logic for field rematch005_taxi_lastidx:
      -- rematch005_taxi_lastidx.

      -- Handle reset for field rematch005_taxi_lastidx.
      if reset = '1' then
        f_rematch005_taxi_lastidx_r((0)).d := (others => '0');
        f_rematch005_taxi_lastidx_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch005_taxi_lastidx.
      f_rematch005_taxi_lastidx_data <= f_rematch005_taxi_lastidx_r((0)).d;

      -- Post-bus logic for field rematch006_taxi_firstidx:
      -- rematch006_taxi_firstidx.

      -- Handle reset for field rematch006_taxi_firstidx.
      if reset = '1' then
        f_rematch006_taxi_firstidx_r((0)).d := (others => '0');
        f_rematch006_taxi_firstidx_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch006_taxi_firstidx.
      f_rematch006_taxi_firstidx_data <= f_rematch006_taxi_firstidx_r((0)).d;

      -- Post-bus logic for field rematch006_taxi_lastidx:
      -- rematch006_taxi_lastidx.

      -- Handle reset for field rematch006_taxi_lastidx.
      if reset = '1' then
        f_rematch006_taxi_lastidx_r((0)).d := (others => '0');
        f_rematch006_taxi_lastidx_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch006_taxi_lastidx.
      f_rematch006_taxi_lastidx_data <= f_rematch006_taxi_lastidx_r((0)).d;

      -- Post-bus logic for field rematch007_taxi_firstidx:
      -- rematch007_taxi_firstidx.

      -- Handle reset for field rematch007_taxi_firstidx.
      if reset = '1' then
        f_rematch007_taxi_firstidx_r((0)).d := (others => '0');
        f_rematch007_taxi_firstidx_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch007_taxi_firstidx.
      f_rematch007_taxi_firstidx_data <= f_rematch007_taxi_firstidx_r((0)).d;

      -- Post-bus logic for field rematch007_taxi_lastidx:
      -- rematch007_taxi_lastidx.

      -- Handle reset for field rematch007_taxi_lastidx.
      if reset = '1' then
        f_rematch007_taxi_lastidx_r((0)).d := (others => '0');
        f_rematch007_taxi_lastidx_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch007_taxi_lastidx.
      f_rematch007_taxi_lastidx_data <= f_rematch007_taxi_lastidx_r((0)).d;

      -- Post-bus logic for field rematch008_taxi_firstidx:
      -- rematch008_taxi_firstidx.

      -- Handle reset for field rematch008_taxi_firstidx.
      if reset = '1' then
        f_rematch008_taxi_firstidx_r((0)).d := (others => '0');
        f_rematch008_taxi_firstidx_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch008_taxi_firstidx.
      f_rematch008_taxi_firstidx_data <= f_rematch008_taxi_firstidx_r((0)).d;

      -- Post-bus logic for field rematch008_taxi_lastidx:
      -- rematch008_taxi_lastidx.

      -- Handle reset for field rematch008_taxi_lastidx.
      if reset = '1' then
        f_rematch008_taxi_lastidx_r((0)).d := (others => '0');
        f_rematch008_taxi_lastidx_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch008_taxi_lastidx.
      f_rematch008_taxi_lastidx_data <= f_rematch008_taxi_lastidx_r((0)).d;

      -- Post-bus logic for field rematch009_taxi_firstidx:
      -- rematch009_taxi_firstidx.

      -- Handle reset for field rematch009_taxi_firstidx.
      if reset = '1' then
        f_rematch009_taxi_firstidx_r((0)).d := (others => '0');
        f_rematch009_taxi_firstidx_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch009_taxi_firstidx.
      f_rematch009_taxi_firstidx_data <= f_rematch009_taxi_firstidx_r((0)).d;

      -- Post-bus logic for field rematch009_taxi_lastidx:
      -- rematch009_taxi_lastidx.

      -- Handle reset for field rematch009_taxi_lastidx.
      if reset = '1' then
        f_rematch009_taxi_lastidx_r((0)).d := (others => '0');
        f_rematch009_taxi_lastidx_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch009_taxi_lastidx.
      f_rematch009_taxi_lastidx_data <= f_rematch009_taxi_lastidx_r((0)).d;

      -- Post-bus logic for field rematch010_taxi_firstidx:
      -- rematch010_taxi_firstidx.

      -- Handle reset for field rematch010_taxi_firstidx.
      if reset = '1' then
        f_rematch010_taxi_firstidx_r((0)).d := (others => '0');
        f_rematch010_taxi_firstidx_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch010_taxi_firstidx.
      f_rematch010_taxi_firstidx_data <= f_rematch010_taxi_firstidx_r((0)).d;

      -- Post-bus logic for field rematch010_taxi_lastidx:
      -- rematch010_taxi_lastidx.

      -- Handle reset for field rematch010_taxi_lastidx.
      if reset = '1' then
        f_rematch010_taxi_lastidx_r((0)).d := (others => '0');
        f_rematch010_taxi_lastidx_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch010_taxi_lastidx.
      f_rematch010_taxi_lastidx_data <= f_rematch010_taxi_lastidx_r((0)).d;

      -- Post-bus logic for field rematch011_taxi_firstidx:
      -- rematch011_taxi_firstidx.

      -- Handle reset for field rematch011_taxi_firstidx.
      if reset = '1' then
        f_rematch011_taxi_firstidx_r((0)).d := (others => '0');
        f_rematch011_taxi_firstidx_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch011_taxi_firstidx.
      f_rematch011_taxi_firstidx_data <= f_rematch011_taxi_firstidx_r((0)).d;

      -- Post-bus logic for field rematch011_taxi_lastidx:
      -- rematch011_taxi_lastidx.

      -- Handle reset for field rematch011_taxi_lastidx.
      if reset = '1' then
        f_rematch011_taxi_lastidx_r((0)).d := (others => '0');
        f_rematch011_taxi_lastidx_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch011_taxi_lastidx.
      f_rematch011_taxi_lastidx_data <= f_rematch011_taxi_lastidx_r((0)).d;

      -- Post-bus logic for field rematch012_taxi_firstidx:
      -- rematch012_taxi_firstidx.

      -- Handle reset for field rematch012_taxi_firstidx.
      if reset = '1' then
        f_rematch012_taxi_firstidx_r((0)).d := (others => '0');
        f_rematch012_taxi_firstidx_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch012_taxi_firstidx.
      f_rematch012_taxi_firstidx_data <= f_rematch012_taxi_firstidx_r((0)).d;

      -- Post-bus logic for field rematch012_taxi_lastidx:
      -- rematch012_taxi_lastidx.

      -- Handle reset for field rematch012_taxi_lastidx.
      if reset = '1' then
        f_rematch012_taxi_lastidx_r((0)).d := (others => '0');
        f_rematch012_taxi_lastidx_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch012_taxi_lastidx.
      f_rematch012_taxi_lastidx_data <= f_rematch012_taxi_lastidx_r((0)).d;

      -- Post-bus logic for field rematch013_taxi_firstidx:
      -- rematch013_taxi_firstidx.

      -- Handle reset for field rematch013_taxi_firstidx.
      if reset = '1' then
        f_rematch013_taxi_firstidx_r((0)).d := (others => '0');
        f_rematch013_taxi_firstidx_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch013_taxi_firstidx.
      f_rematch013_taxi_firstidx_data <= f_rematch013_taxi_firstidx_r((0)).d;

      -- Post-bus logic for field rematch013_taxi_lastidx:
      -- rematch013_taxi_lastidx.

      -- Handle reset for field rematch013_taxi_lastidx.
      if reset = '1' then
        f_rematch013_taxi_lastidx_r((0)).d := (others => '0');
        f_rematch013_taxi_lastidx_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch013_taxi_lastidx.
      f_rematch013_taxi_lastidx_data <= f_rematch013_taxi_lastidx_r((0)).d;

      -- Post-bus logic for field rematch014_taxi_firstidx:
      -- rematch014_taxi_firstidx.

      -- Handle reset for field rematch014_taxi_firstidx.
      if reset = '1' then
        f_rematch014_taxi_firstidx_r((0)).d := (others => '0');
        f_rematch014_taxi_firstidx_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch014_taxi_firstidx.
      f_rematch014_taxi_firstidx_data <= f_rematch014_taxi_firstidx_r((0)).d;

      -- Post-bus logic for field rematch014_taxi_lastidx:
      -- rematch014_taxi_lastidx.

      -- Handle reset for field rematch014_taxi_lastidx.
      if reset = '1' then
        f_rematch014_taxi_lastidx_r((0)).d := (others => '0');
        f_rematch014_taxi_lastidx_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch014_taxi_lastidx.
      f_rematch014_taxi_lastidx_data <= f_rematch014_taxi_lastidx_r((0)).d;

      -- Post-bus logic for field rematch015_taxi_firstidx:
      -- rematch015_taxi_firstidx.

      -- Handle reset for field rematch015_taxi_firstidx.
      if reset = '1' then
        f_rematch015_taxi_firstidx_r((0)).d := (others => '0');
        f_rematch015_taxi_firstidx_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch015_taxi_firstidx.
      f_rematch015_taxi_firstidx_data <= f_rematch015_taxi_firstidx_r((0)).d;

      -- Post-bus logic for field rematch015_taxi_lastidx:
      -- rematch015_taxi_lastidx.

      -- Handle reset for field rematch015_taxi_lastidx.
      if reset = '1' then
        f_rematch015_taxi_lastidx_r((0)).d := (others => '0');
        f_rematch015_taxi_lastidx_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch015_taxi_lastidx.
      f_rematch015_taxi_lastidx_data <= f_rematch015_taxi_lastidx_r((0)).d;

      -- Post-bus logic for field rematch000_in_offsets: rematch000_in_offsets.

      -- Handle reset for field rematch000_in_offsets.
      if reset = '1' then
        f_rematch000_in_offsets_r((0)).d := (others => '0');
        f_rematch000_in_offsets_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch000_in_offsets.
      f_rematch000_in_offsets_data <= f_rematch000_in_offsets_r((0)).d;

      -- Post-bus logic for field rematch000_in_values: rematch000_in_values.

      -- Handle reset for field rematch000_in_values.
      if reset = '1' then
        f_rematch000_in_values_r((0)).d := (others => '0');
        f_rematch000_in_values_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch000_in_values.
      f_rematch000_in_values_data <= f_rematch000_in_values_r((0)).d;

      -- Post-bus logic for field rematch001_in_offsets: rematch001_in_offsets.

      -- Handle reset for field rematch001_in_offsets.
      if reset = '1' then
        f_rematch001_in_offsets_r((0)).d := (others => '0');
        f_rematch001_in_offsets_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch001_in_offsets.
      f_rematch001_in_offsets_data <= f_rematch001_in_offsets_r((0)).d;

      -- Post-bus logic for field rematch001_in_values: rematch001_in_values.

      -- Handle reset for field rematch001_in_values.
      if reset = '1' then
        f_rematch001_in_values_r((0)).d := (others => '0');
        f_rematch001_in_values_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch001_in_values.
      f_rematch001_in_values_data <= f_rematch001_in_values_r((0)).d;

      -- Post-bus logic for field rematch002_in_offsets: rematch002_in_offsets.

      -- Handle reset for field rematch002_in_offsets.
      if reset = '1' then
        f_rematch002_in_offsets_r((0)).d := (others => '0');
        f_rematch002_in_offsets_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch002_in_offsets.
      f_rematch002_in_offsets_data <= f_rematch002_in_offsets_r((0)).d;

      -- Post-bus logic for field rematch002_in_values: rematch002_in_values.

      -- Handle reset for field rematch002_in_values.
      if reset = '1' then
        f_rematch002_in_values_r((0)).d := (others => '0');
        f_rematch002_in_values_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch002_in_values.
      f_rematch002_in_values_data <= f_rematch002_in_values_r((0)).d;

      -- Post-bus logic for field rematch003_in_offsets: rematch003_in_offsets.

      -- Handle reset for field rematch003_in_offsets.
      if reset = '1' then
        f_rematch003_in_offsets_r((0)).d := (others => '0');
        f_rematch003_in_offsets_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch003_in_offsets.
      f_rematch003_in_offsets_data <= f_rematch003_in_offsets_r((0)).d;

      -- Post-bus logic for field rematch003_in_values: rematch003_in_values.

      -- Handle reset for field rematch003_in_values.
      if reset = '1' then
        f_rematch003_in_values_r((0)).d := (others => '0');
        f_rematch003_in_values_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch003_in_values.
      f_rematch003_in_values_data <= f_rematch003_in_values_r((0)).d;

      -- Post-bus logic for field rematch004_in_offsets: rematch004_in_offsets.

      -- Handle reset for field rematch004_in_offsets.
      if reset = '1' then
        f_rematch004_in_offsets_r((0)).d := (others => '0');
        f_rematch004_in_offsets_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch004_in_offsets.
      f_rematch004_in_offsets_data <= f_rematch004_in_offsets_r((0)).d;

      -- Post-bus logic for field rematch004_in_values: rematch004_in_values.

      -- Handle reset for field rematch004_in_values.
      if reset = '1' then
        f_rematch004_in_values_r((0)).d := (others => '0');
        f_rematch004_in_values_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch004_in_values.
      f_rematch004_in_values_data <= f_rematch004_in_values_r((0)).d;

      -- Post-bus logic for field rematch005_in_offsets: rematch005_in_offsets.

      -- Handle reset for field rematch005_in_offsets.
      if reset = '1' then
        f_rematch005_in_offsets_r((0)).d := (others => '0');
        f_rematch005_in_offsets_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch005_in_offsets.
      f_rematch005_in_offsets_data <= f_rematch005_in_offsets_r((0)).d;

      -- Post-bus logic for field rematch005_in_values: rematch005_in_values.

      -- Handle reset for field rematch005_in_values.
      if reset = '1' then
        f_rematch005_in_values_r((0)).d := (others => '0');
        f_rematch005_in_values_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch005_in_values.
      f_rematch005_in_values_data <= f_rematch005_in_values_r((0)).d;

      -- Post-bus logic for field rematch006_in_offsets: rematch006_in_offsets.

      -- Handle reset for field rematch006_in_offsets.
      if reset = '1' then
        f_rematch006_in_offsets_r((0)).d := (others => '0');
        f_rematch006_in_offsets_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch006_in_offsets.
      f_rematch006_in_offsets_data <= f_rematch006_in_offsets_r((0)).d;

      -- Post-bus logic for field rematch006_in_values: rematch006_in_values.

      -- Handle reset for field rematch006_in_values.
      if reset = '1' then
        f_rematch006_in_values_r((0)).d := (others => '0');
        f_rematch006_in_values_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch006_in_values.
      f_rematch006_in_values_data <= f_rematch006_in_values_r((0)).d;

      -- Post-bus logic for field rematch007_in_offsets: rematch007_in_offsets.

      -- Handle reset for field rematch007_in_offsets.
      if reset = '1' then
        f_rematch007_in_offsets_r((0)).d := (others => '0');
        f_rematch007_in_offsets_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch007_in_offsets.
      f_rematch007_in_offsets_data <= f_rematch007_in_offsets_r((0)).d;

      -- Post-bus logic for field rematch007_in_values: rematch007_in_values.

      -- Handle reset for field rematch007_in_values.
      if reset = '1' then
        f_rematch007_in_values_r((0)).d := (others => '0');
        f_rematch007_in_values_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch007_in_values.
      f_rematch007_in_values_data <= f_rematch007_in_values_r((0)).d;

      -- Post-bus logic for field rematch008_in_offsets: rematch008_in_offsets.

      -- Handle reset for field rematch008_in_offsets.
      if reset = '1' then
        f_rematch008_in_offsets_r((0)).d := (others => '0');
        f_rematch008_in_offsets_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch008_in_offsets.
      f_rematch008_in_offsets_data <= f_rematch008_in_offsets_r((0)).d;

      -- Post-bus logic for field rematch008_in_values: rematch008_in_values.

      -- Handle reset for field rematch008_in_values.
      if reset = '1' then
        f_rematch008_in_values_r((0)).d := (others => '0');
        f_rematch008_in_values_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch008_in_values.
      f_rematch008_in_values_data <= f_rematch008_in_values_r((0)).d;

      -- Post-bus logic for field rematch009_in_offsets: rematch009_in_offsets.

      -- Handle reset for field rematch009_in_offsets.
      if reset = '1' then
        f_rematch009_in_offsets_r((0)).d := (others => '0');
        f_rematch009_in_offsets_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch009_in_offsets.
      f_rematch009_in_offsets_data <= f_rematch009_in_offsets_r((0)).d;

      -- Post-bus logic for field rematch009_in_values: rematch009_in_values.

      -- Handle reset for field rematch009_in_values.
      if reset = '1' then
        f_rematch009_in_values_r((0)).d := (others => '0');
        f_rematch009_in_values_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch009_in_values.
      f_rematch009_in_values_data <= f_rematch009_in_values_r((0)).d;

      -- Post-bus logic for field rematch010_in_offsets: rematch010_in_offsets.

      -- Handle reset for field rematch010_in_offsets.
      if reset = '1' then
        f_rematch010_in_offsets_r((0)).d := (others => '0');
        f_rematch010_in_offsets_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch010_in_offsets.
      f_rematch010_in_offsets_data <= f_rematch010_in_offsets_r((0)).d;

      -- Post-bus logic for field rematch010_in_values: rematch010_in_values.

      -- Handle reset for field rematch010_in_values.
      if reset = '1' then
        f_rematch010_in_values_r((0)).d := (others => '0');
        f_rematch010_in_values_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch010_in_values.
      f_rematch010_in_values_data <= f_rematch010_in_values_r((0)).d;

      -- Post-bus logic for field rematch011_in_offsets: rematch011_in_offsets.

      -- Handle reset for field rematch011_in_offsets.
      if reset = '1' then
        f_rematch011_in_offsets_r((0)).d := (others => '0');
        f_rematch011_in_offsets_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch011_in_offsets.
      f_rematch011_in_offsets_data <= f_rematch011_in_offsets_r((0)).d;

      -- Post-bus logic for field rematch011_in_values: rematch011_in_values.

      -- Handle reset for field rematch011_in_values.
      if reset = '1' then
        f_rematch011_in_values_r((0)).d := (others => '0');
        f_rematch011_in_values_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch011_in_values.
      f_rematch011_in_values_data <= f_rematch011_in_values_r((0)).d;

      -- Post-bus logic for field rematch012_in_offsets: rematch012_in_offsets.

      -- Handle reset for field rematch012_in_offsets.
      if reset = '1' then
        f_rematch012_in_offsets_r((0)).d := (others => '0');
        f_rematch012_in_offsets_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch012_in_offsets.
      f_rematch012_in_offsets_data <= f_rematch012_in_offsets_r((0)).d;

      -- Post-bus logic for field rematch012_in_values: rematch012_in_values.

      -- Handle reset for field rematch012_in_values.
      if reset = '1' then
        f_rematch012_in_values_r((0)).d := (others => '0');
        f_rematch012_in_values_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch012_in_values.
      f_rematch012_in_values_data <= f_rematch012_in_values_r((0)).d;

      -- Post-bus logic for field rematch013_in_offsets: rematch013_in_offsets.

      -- Handle reset for field rematch013_in_offsets.
      if reset = '1' then
        f_rematch013_in_offsets_r((0)).d := (others => '0');
        f_rematch013_in_offsets_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch013_in_offsets.
      f_rematch013_in_offsets_data <= f_rematch013_in_offsets_r((0)).d;

      -- Post-bus logic for field rematch013_in_values: rematch013_in_values.

      -- Handle reset for field rematch013_in_values.
      if reset = '1' then
        f_rematch013_in_values_r((0)).d := (others => '0');
        f_rematch013_in_values_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch013_in_values.
      f_rematch013_in_values_data <= f_rematch013_in_values_r((0)).d;

      -- Post-bus logic for field rematch014_in_offsets: rematch014_in_offsets.

      -- Handle reset for field rematch014_in_offsets.
      if reset = '1' then
        f_rematch014_in_offsets_r((0)).d := (others => '0');
        f_rematch014_in_offsets_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch014_in_offsets.
      f_rematch014_in_offsets_data <= f_rematch014_in_offsets_r((0)).d;

      -- Post-bus logic for field rematch014_in_values: rematch014_in_values.

      -- Handle reset for field rematch014_in_values.
      if reset = '1' then
        f_rematch014_in_values_r((0)).d := (others => '0');
        f_rematch014_in_values_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch014_in_values.
      f_rematch014_in_values_data <= f_rematch014_in_values_r((0)).d;

      -- Post-bus logic for field rematch015_in_offsets: rematch015_in_offsets.

      -- Handle reset for field rematch015_in_offsets.
      if reset = '1' then
        f_rematch015_in_offsets_r((0)).d := (others => '0');
        f_rematch015_in_offsets_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch015_in_offsets.
      f_rematch015_in_offsets_data <= f_rematch015_in_offsets_r((0)).d;

      -- Post-bus logic for field rematch015_in_values: rematch015_in_values.

      -- Handle reset for field rematch015_in_values.
      if reset = '1' then
        f_rematch015_in_values_r((0)).d := (others => '0');
        f_rematch015_in_values_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch015_in_values.
      f_rematch015_in_values_data <= f_rematch015_in_values_r((0)).d;

      -- Post-bus logic for field rematch000_taxi_out_values:
      -- rematch000_taxi_out_values.

      -- Handle reset for field rematch000_taxi_out_values.
      if reset = '1' then
        f_rematch000_taxi_out_values_r((0)).d := (others => '0');
        f_rematch000_taxi_out_values_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch000_taxi_out_values.
      f_rematch000_taxi_out_values_data <= f_rematch000_taxi_out_values_r((0)).d;

      -- Post-bus logic for field rematch001_taxi_out_values:
      -- rematch001_taxi_out_values.

      -- Handle reset for field rematch001_taxi_out_values.
      if reset = '1' then
        f_rematch001_taxi_out_values_r((0)).d := (others => '0');
        f_rematch001_taxi_out_values_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch001_taxi_out_values.
      f_rematch001_taxi_out_values_data <= f_rematch001_taxi_out_values_r((0)).d;

      -- Post-bus logic for field rematch002_taxi_out_values:
      -- rematch002_taxi_out_values.

      -- Handle reset for field rematch002_taxi_out_values.
      if reset = '1' then
        f_rematch002_taxi_out_values_r((0)).d := (others => '0');
        f_rematch002_taxi_out_values_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch002_taxi_out_values.
      f_rematch002_taxi_out_values_data <= f_rematch002_taxi_out_values_r((0)).d;

      -- Post-bus logic for field rematch003_taxi_out_values:
      -- rematch003_taxi_out_values.

      -- Handle reset for field rematch003_taxi_out_values.
      if reset = '1' then
        f_rematch003_taxi_out_values_r((0)).d := (others => '0');
        f_rematch003_taxi_out_values_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch003_taxi_out_values.
      f_rematch003_taxi_out_values_data <= f_rematch003_taxi_out_values_r((0)).d;

      -- Post-bus logic for field rematch004_taxi_out_values:
      -- rematch004_taxi_out_values.

      -- Handle reset for field rematch004_taxi_out_values.
      if reset = '1' then
        f_rematch004_taxi_out_values_r((0)).d := (others => '0');
        f_rematch004_taxi_out_values_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch004_taxi_out_values.
      f_rematch004_taxi_out_values_data <= f_rematch004_taxi_out_values_r((0)).d;

      -- Post-bus logic for field rematch005_taxi_out_values:
      -- rematch005_taxi_out_values.

      -- Handle reset for field rematch005_taxi_out_values.
      if reset = '1' then
        f_rematch005_taxi_out_values_r((0)).d := (others => '0');
        f_rematch005_taxi_out_values_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch005_taxi_out_values.
      f_rematch005_taxi_out_values_data <= f_rematch005_taxi_out_values_r((0)).d;

      -- Post-bus logic for field rematch006_taxi_out_values:
      -- rematch006_taxi_out_values.

      -- Handle reset for field rematch006_taxi_out_values.
      if reset = '1' then
        f_rematch006_taxi_out_values_r((0)).d := (others => '0');
        f_rematch006_taxi_out_values_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch006_taxi_out_values.
      f_rematch006_taxi_out_values_data <= f_rematch006_taxi_out_values_r((0)).d;

      -- Post-bus logic for field rematch007_taxi_out_values:
      -- rematch007_taxi_out_values.

      -- Handle reset for field rematch007_taxi_out_values.
      if reset = '1' then
        f_rematch007_taxi_out_values_r((0)).d := (others => '0');
        f_rematch007_taxi_out_values_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch007_taxi_out_values.
      f_rematch007_taxi_out_values_data <= f_rematch007_taxi_out_values_r((0)).d;

      -- Post-bus logic for field rematch008_taxi_out_values:
      -- rematch008_taxi_out_values.

      -- Handle reset for field rematch008_taxi_out_values.
      if reset = '1' then
        f_rematch008_taxi_out_values_r((0)).d := (others => '0');
        f_rematch008_taxi_out_values_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch008_taxi_out_values.
      f_rematch008_taxi_out_values_data <= f_rematch008_taxi_out_values_r((0)).d;

      -- Post-bus logic for field rematch009_taxi_out_values:
      -- rematch009_taxi_out_values.

      -- Handle reset for field rematch009_taxi_out_values.
      if reset = '1' then
        f_rematch009_taxi_out_values_r((0)).d := (others => '0');
        f_rematch009_taxi_out_values_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch009_taxi_out_values.
      f_rematch009_taxi_out_values_data <= f_rematch009_taxi_out_values_r((0)).d;

      -- Post-bus logic for field rematch010_taxi_out_values:
      -- rematch010_taxi_out_values.

      -- Handle reset for field rematch010_taxi_out_values.
      if reset = '1' then
        f_rematch010_taxi_out_values_r((0)).d := (others => '0');
        f_rematch010_taxi_out_values_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch010_taxi_out_values.
      f_rematch010_taxi_out_values_data <= f_rematch010_taxi_out_values_r((0)).d;

      -- Post-bus logic for field rematch011_taxi_out_values:
      -- rematch011_taxi_out_values.

      -- Handle reset for field rematch011_taxi_out_values.
      if reset = '1' then
        f_rematch011_taxi_out_values_r((0)).d := (others => '0');
        f_rematch011_taxi_out_values_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch011_taxi_out_values.
      f_rematch011_taxi_out_values_data <= f_rematch011_taxi_out_values_r((0)).d;

      -- Post-bus logic for field rematch012_taxi_out_values:
      -- rematch012_taxi_out_values.

      -- Handle reset for field rematch012_taxi_out_values.
      if reset = '1' then
        f_rematch012_taxi_out_values_r((0)).d := (others => '0');
        f_rematch012_taxi_out_values_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch012_taxi_out_values.
      f_rematch012_taxi_out_values_data <= f_rematch012_taxi_out_values_r((0)).d;

      -- Post-bus logic for field rematch013_taxi_out_values:
      -- rematch013_taxi_out_values.

      -- Handle reset for field rematch013_taxi_out_values.
      if reset = '1' then
        f_rematch013_taxi_out_values_r((0)).d := (others => '0');
        f_rematch013_taxi_out_values_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch013_taxi_out_values.
      f_rematch013_taxi_out_values_data <= f_rematch013_taxi_out_values_r((0)).d;

      -- Post-bus logic for field rematch014_taxi_out_values:
      -- rematch014_taxi_out_values.

      -- Handle reset for field rematch014_taxi_out_values.
      if reset = '1' then
        f_rematch014_taxi_out_values_r((0)).d := (others => '0');
        f_rematch014_taxi_out_values_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch014_taxi_out_values.
      f_rematch014_taxi_out_values_data <= f_rematch014_taxi_out_values_r((0)).d;

      -- Post-bus logic for field rematch015_taxi_out_values:
      -- rematch015_taxi_out_values.

      -- Handle reset for field rematch015_taxi_out_values.
      if reset = '1' then
        f_rematch015_taxi_out_values_r((0)).d := (others => '0');
        f_rematch015_taxi_out_values_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field rematch015_taxi_out_values.
      f_rematch015_taxi_out_values_data <= f_rematch015_taxi_out_values_r((0)).d;

      -- Post-bus logic for field Profile_enable: Profile_enable.

      -- Handle reset for field Profile_enable.
      if reset = '1' then
        f_Profile_enable_r((0)).d := '0';
        f_Profile_enable_r((0)).v := '0';
      end if;
      -- Assign the read outputs for field Profile_enable.
      f_Profile_enable_data <= f_Profile_enable_r((0)).d;

      -- Post-bus logic for field Profile_clear: Profile_clear.

      -- Handle reset for field Profile_clear.
      if reset = '1' then
        f_Profile_clear_r((0)).d := '0';
        f_Profile_clear_r((0)).v := '1';
        f_Profile_clear_r((0)).inval := '0';
      end if;
      -- Assign the read outputs for field Profile_clear.
      f_Profile_clear_data <= f_Profile_clear_r((0)).d;

      -------------------------------------------------------------------------
      -- Boilerplate bus access logic
      -------------------------------------------------------------------------
      -- Perform the write action dictated by the field logic.
      if w_req and not w_block then

        -- Accept write requests by invalidating the request holding
        -- registers.
        awl.valid := '0';
        wl.valid := '0';

        -- Send the appropriate write response.
        bus_v.b.valid := '1';
        if w_nack then
          bus_v.b.resp := AXI4L_RESP_SLVERR;
        elsif w_ack then
          bus_v.b.resp := AXI4L_RESP_OKAY;
        else
          bus_v.b.resp := AXI4L_RESP_DECERR;
        end if;

      end if;

      -- Perform the read action dictated by the field logic.
      if r_req and not r_block then

        -- Accept read requests by invalidating the request holding
        -- registers.
        arl.valid := '0';

        -- Send the appropriate read response.
        bus_v.r.valid := '1';
        if r_nack then
          bus_v.r.resp := AXI4L_RESP_SLVERR;
        elsif r_ack then
          bus_v.r.resp := AXI4L_RESP_OKAY;
          bus_v.r.data := r_data;
        else
          bus_v.r.resp := AXI4L_RESP_DECERR;
        end if;

      end if;

      -- If we're at the end of a multi-word write, clear the write strobe
      -- holding register to prevent previously written data from leaking into
      -- later partial writes.
      if w_multi = '0' then
        w_hstb := (others => '0');
      end if;

      -- Mark the incoming channels as ready when their respective holding
      -- registers are empty.
      bus_v.aw.ready := not awl.valid;
      bus_v.w.ready := not wl.valid;
      bus_v.ar.ready := not arl.valid;

      -------------------------------------------------------------------------
      -- Handle AXI4-lite bus reset
      -------------------------------------------------------------------------
      -- Reset overrides everything, so it comes last. Note that field
      -- registers are *not* reset here; this would complicate code generation.
      -- Instead, the generated field logic blocks include reset logic for the
      -- field-specific registers.
      if reset = '1' then
        bus_v      := AXI4L32_S2M_RESET;
        awl        := AXI4LA_RESET;
        wl         := AXI4LW32_RESET;
        arl        := AXI4LA_RESET;
        w_hstb     := (others => '0');
        w_hold     := (others => '0');
        w_multi    := '0';
        r_multi    := '0';
        r_hold     := (others => '0');
      end if;

      mmio_awready <= bus_v.aw.ready;
      mmio_wready  <= bus_v.w.ready;
      mmio_bvalid  <= bus_v.b.valid;
      mmio_bresp   <= bus_v.b.resp;
      mmio_arready <= bus_v.ar.ready;
      mmio_rvalid  <= bus_v.r.valid;
      mmio_rdata   <= bus_v.r.data;
      mmio_rresp   <= bus_v.r.resp;
      mmio_uirq    <= bus_v.u.irq;

    end if;
  end process;
end behavioral;
