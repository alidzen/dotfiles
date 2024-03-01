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

  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function(_, opts)
      local logo = [[
██╗    ██╗██╗  ██╗██╗██╗     ███████╗    ██████╗  ██████╗      ██████╗ ██████╗ ██████╗ ███████╗
██║    ██║██║  ██║██║██║     ██╔════╝    ██╔══██╗██╔═══██╗    ██╔════╝██╔═══██╗██╔══██╗██╔════╝
██║ █╗ ██║███████║██║██║     █████╗      ██║  ██║██║   ██║    ██║     ██║   ██║██║  ██║█████╗  
██║███╗██║██╔══██║██║██║     ██╔══╝      ██║  ██║██║   ██║    ██║     ██║   ██║██║  ██║██╔══╝  
╚███╔███╔╝██║  ██║██║███████╗███████╗    ██████╔╝╚██████╔╝    ╚██████╗╚██████╔╝██████╔╝███████╗
 ╚══╝╚══╝ ╚═╝  ╚═╝╚═╝╚══════╝╚══════╝    ╚═════╝  ╚═════╝      ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝
      ]]

      logo = string.rep("\n", 8) .. logo .. "\n\n"
      opts.config.header = vim.split(logo, "\n")

      opts.theme = "doom"
    end,
  },
}
