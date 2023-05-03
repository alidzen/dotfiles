return {
  {
    "neo-tree.nvim",
    -- opts will be merged with the parent spec
    opts = {
      filesystem = {
        filtered_items = {
          visible = true, -- This is what you want: If you set this to `true`, all "hide" just mean "dimmed out"
          hide_dotfiles = false,
          hide_gitignored = true,
          -- always_show = { -- remains visible even if other settings would normally hide it
          --   "node_modules",
          -- },
        },
      },
    },
  },
}
