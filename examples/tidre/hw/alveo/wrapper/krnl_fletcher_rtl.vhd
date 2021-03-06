
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_misc.all;

library work;
use work.Axi_pkg.all;
use work.UtilInt_pkg.all;
use work.UtilConv_pkg.all;
use work.UtilMisc_pkg.all;

entity krnl_fletcher_rtl is
  generic (
    C_S_AXI_CONTROL_DATA_WIDTH  : natural := 32;
    C_S_AXI_CONTROL_ADDR_WIDTH  : natural := 32;
    C_M_AXI_ID_WIDTH            : natural := 1;
    C_M_AXI_ADDR_WIDTH          : natural := 64;
    C_M_AXI_DATA_WIDTH          : natural := 64
  );
  port (
    ap_clk                      : in  std_logic;
    ap_rst_n                    : in  std_logic;

    ap_clk_2                    : in  std_logic;
    ap_rst_n_2                  : in  std_logic;

    m_axi_AWVALID               : out std_logic;
    m_axi_AWREADY               : in  std_logic;
    m_axi_AWADDR                : out std_logic_vector(C_M_AXI_ADDR_WIDTH-1 downto 0);
    m_axi_AWID                  : out std_logic_vector(C_M_AXI_ID_WIDTH-1 downto 0);
    m_axi_AWLEN                 : out std_logic_vector(7 downto 0);
    m_axi_AWSIZE                : out std_logic_vector(2 downto 0);
    m_axi_AWBURST               : out std_logic_vector(1 downto 0);
    m_axi_AWLOCK                : out std_logic_vector(1 downto 0);
    m_axi_AWCACHE               : out std_logic_vector(3 downto 0);
    m_axi_AWPROT                : out std_logic_vector(2 downto 0);
    m_axi_AWQOS                 : out std_logic_vector(3 downto 0);
    m_axi_AWREGION              : out std_logic_vector(3 downto 0);
    m_axi_WVALID                : out std_logic;
    m_axi_WREADY                : in  std_logic;
    m_axi_WDATA                 : out std_logic_vector(C_M_AXI_DATA_WIDTH-1 downto 0);
    m_axi_WSTRB                 : out std_logic_vector(C_M_AXI_DATA_WIDTH/8-1 downto 0);
    m_axi_WLAST                 : out std_logic;
    m_axi_ARVALID               : out std_logic;
    m_axi_ARREADY               : in  std_logic;
    m_axi_ARADDR                : out std_logic_vector(C_M_AXI_ADDR_WIDTH-1 downto 0);
    m_axi_ARID                  : out std_logic_vector(C_M_AXI_ID_WIDTH-1 downto 0);
    m_axi_ARLEN                 : out std_logic_vector(7 downto 0);
    m_axi_ARSIZE                : out std_logic_vector(2 downto 0);
    m_axi_ARBURST               : out std_logic_vector(1 downto 0);
    m_axi_ARLOCK                : out std_logic_vector(1 downto 0);
    m_axi_ARCACHE               : out std_logic_vector(3 downto 0);
    m_axi_ARPROT                : out std_logic_vector(2 downto 0);
    m_axi_ARQOS                 : out std_logic_vector(3 downto 0);
    m_axi_ARREGION              : out std_logic_vector(3 downto 0);
    m_axi_RVALID                : in  std_logic;
    m_axi_RREADY                : out std_logic;
    m_axi_RDATA                 : in  std_logic_vector(C_M_AXI_DATA_WIDTH-1 downto 0);
    m_axi_RLAST                 : in  std_logic;
    m_axi_RID                   : in  std_logic_vector(C_M_AXI_ID_WIDTH-1 downto 0);
    m_axi_RRESP                 : in  std_logic_vector(1 downto 0);
    m_axi_BVALID                : in  std_logic;
    m_axi_BREADY                : out std_logic;
    m_axi_BRESP                 : in  std_logic_vector(1 downto 0);
    m_axi_BID                   : in  std_logic_vector(C_M_AXI_ID_WIDTH-1 downto 0);

    s_axi_control_AWVALID       : in  std_logic;
    s_axi_control_AWREADY       : out std_logic;
    s_axi_control_AWADDR        : in  std_logic_vector(C_S_AXI_CONTROL_ADDR_WIDTH-1 downto 0);
    s_axi_control_WVALID        : in  std_logic;
    s_axi_control_WREADY        : out std_logic;
    s_axi_control_WDATA         : in  std_logic_vector(C_S_AXI_CONTROL_DATA_WIDTH-1 downto 0);
    s_axi_control_WSTRB         : in  std_logic_vector(C_S_AXI_CONTROL_DATA_WIDTH/8-1 downto 0);
    s_axi_control_ARVALID       : in  std_logic;
    s_axi_control_ARREADY       : out std_logic;
    s_axi_control_ARADDR        : in  std_logic_vector(C_S_AXI_CONTROL_ADDR_WIDTH-1 downto 0);
    s_axi_control_RVALID        : out std_logic;
    s_axi_control_RREADY        : in  std_logic;
    s_axi_control_RDATA         : out std_logic_vector(C_S_AXI_CONTROL_DATA_WIDTH-1 downto 0);
    s_axi_control_RRESP         : out std_logic_vector(1 downto 0);
    s_axi_control_BVALID        : out std_logic;
    s_axi_control_BREADY        : in  std_logic;
    s_axi_control_BRESP         : out std_logic_vector(1 downto 0)
  );
end krnl_fletcher_rtl;

architecture Behavorial of krnl_fletcher_rtl is
  signal ap_rst                 : std_logic;
  signal ap_rst_2               : std_logic;
  signal s_axi_control_AWADDR32 : std_logic_vector(31 downto 0);
  signal s_axi_control_ARADDR32 : std_logic_vector(31 downto 0);
begin

  rst_reg: process (ap_clk) is
  begin
    if rising_edge(ap_clk) then
      ap_rst <= not ap_rst_n;
    end if;
  end process;

  rst_reg2: process (ap_clk_2) is
    begin
      if rising_edge(ap_clk_2) then
        ap_rst_2 <= not ap_rst_n_2;
      end if;
    end process;

  s_axi_control_AWADDR32 <= std_logic_vector(resize(unsigned(s_axi_control_AWADDR), 32));
  s_axi_control_ARADDR32 <= std_logic_vector(resize(unsigned(s_axi_control_ARADDR), 32));

  inst: entity work.AxiTop
    generic map (
      BUS_ADDR_WIDTH      => C_M_AXI_ADDR_WIDTH,
      BUS_DATA_WIDTH      => C_M_AXI_DATA_WIDTH
    )
    port map (
      -- Bus clock domain.
      bcd_clk             => ap_clk,
      bcd_reset           => ap_rst,
      -- Kernel clock domain.
      kcd_clk             => ap_clk,
      kcd_reset           => ap_rst,

      ---------------------------------------------------------------------------
      -- AXI4 master as Host Memory Interface
      ---------------------------------------------------------------------------
      -- Read address channel
      m_axi_araddr                => m_axi_ARADDR,
      m_axi_arlen                 => m_axi_ARLEN,
      m_axi_arvalid               => m_axi_ARVALID,
      m_axi_arready               => m_axi_ARREADY,
      m_axi_arsize                => m_axi_ARSIZE,

      -- Read data channel
      m_axi_rdata                 => m_axi_RDATA,
      m_axi_rresp                 => m_axi_RRESP,
      m_axi_rlast                 => m_axi_RLAST,
      m_axi_rvalid                => m_axi_RVALID,
      m_axi_rready                => m_axi_RREADY,

      -- Write address channel
      m_axi_awvalid               => m_axi_AWVALID,
      m_axi_awready               => m_axi_AWREADY,
      m_axi_awaddr                => m_axi_AWADDR,
      m_axi_awlen                 => m_axi_AWLEN,
      m_axi_awsize                => m_axi_AWSIZE,


      -- Write data channel
      m_axi_wvalid                => m_axi_WVALID,
      m_axi_wready                => m_axi_WREADY,
      m_axi_wdata                 => m_axi_WDATA,
      m_axi_wlast                 => m_axi_WLAST,
      m_axi_wstrb                 => m_axi_WSTRB,

      -- Write response channel
      m_axi_bvalid                => m_axi_BVALID,
      m_axi_bready                => m_axi_BREADY,
      m_axi_bresp                 => m_axi_BRESP,
      ---------------------------------------------------------------------------
      -- AXI4-lite Slave as MMIO interface
      ---------------------------------------------------------------------------
      -- Write address channel
      s_axi_awvalid               => s_axi_control_AWVALID,
      s_axi_awready               => s_axi_control_AWREADY,
      s_axi_awaddr                => s_axi_control_AWADDR32,

      -- Write data channel
      s_axi_wvalid                => s_axi_control_WVALID,
      s_axi_wready                => s_axi_control_WREADY,
      s_axi_wdata                 => s_axi_control_WDATA,
      s_axi_wstrb                 => s_axi_control_WSTRB,

      -- Write response channel
      s_axi_bvalid                => s_axi_control_BVALID,
      s_axi_bready                => s_axi_control_BREADY,
      s_axi_bresp                 => s_axi_control_BRESP,

      -- Read address channel
      s_axi_arvalid               => s_axi_control_ARVALID,
      s_axi_arready               => s_axi_control_ARREADY,
      s_axi_araddr                => s_axi_control_ARADDR32,

      -- Read data channel
      s_axi_rvalid                => s_axi_control_RVALID,
      s_axi_rready                => s_axi_control_RREADY,
      s_axi_rdata                 => s_axi_control_RDATA,
      s_axi_rresp                 => s_axi_control_RRESP
    );

  m_axi_AWID      <= (others => '0');
  m_axi_AWBURST   <= "01";
  m_axi_AWLOCK    <= "00";
  m_axi_AWCACHE   <= "0000";
  m_axi_AWPROT    <= "000";
  m_axi_AWQOS     <= "0000";
  m_axi_AWREGION  <= "0000";
  m_axi_ARID      <= (others => '0');
  m_axi_ARBURST   <= "01";
  m_axi_ARLOCK    <= "00";
  m_axi_ARCACHE   <= "0000";
  m_axi_ARPROT    <= "000";
  m_axi_ARQOS     <= "0000";
  m_axi_ARREGION  <= "0000";

end architecture;
