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
    filesystem = {
      window = {
        mappings = {
          ["<leader>ip"] = "image_kitty", -- " or another map
        },
      },
      commands = {
        image_kitty = function(state)
          local node = state.tree:get_node()
          if node.type == "file" then
            require("image_preview").PreviewImage(node.path)
          end
        end,
      },
    },
  },
}
