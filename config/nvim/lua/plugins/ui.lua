return {
  -- buffer line

  -- statusline

  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = {
      plugins = {
        gitsigns = true,
        tmux = true,
        kitty = { enabled = false, font = "+2" },
      },
    },
    keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
  },
  -- theme
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "night",
    },
  },
  -- lazy.nvim
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        -- your dashboard configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        preset = {

          header = [[
██╗    ██╗██╗  ██╗██╗██╗     ███████╗    ██████╗  ██████╗      ██████╗ ██████╗ ██████╗ ███████╗
██║    ██║██║  ██║██║██║     ██╔════╝    ██╔══██╗██╔═══██╗    ██╔════╝██╔═══██╗██╔══██╗██╔════╝
██║ █╗ ██║███████║██║██║     █████╗      ██║  ██║██║   ██║    ██║     ██║   ██║██║  ██║█████╗  
██║███╗██║██╔══██║██║██║     ██╔══╝      ██║  ██║██║   ██║    ██║     ██║   ██║██║  ██║██╔══╝  
╚███╔███╔╝██║  ██║██║███████╗███████╗    ██████╔╝╚██████╔╝    ╚██████╗╚██████╔╝██████╔╝███████╗
 ╚══╝╚══╝ ╚═╝  ╚═╝╚═╝╚══════╝╚══════╝    ╚═════╝  ╚═════╝      ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝
         ]],
        },
        sections = {
          { section = "header" },
          { section = "keys", gap = 1, padding = 1 },
          { section = "startup" },
        },
      },
    },
  },
}
