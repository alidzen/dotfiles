-- doc: https://github.com/rest-nvim/rest.nvim

return {
  {
    "vhyrro/luarocks.nvim",
    priority = 1000,
    config = true,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- add tsx and treesitter
      vim.list_extend(opts.ensure_installed, { "lua", "xml", "http", "json", "graphql" })
    end,
  },
  {
    "rest-nvim/rest.nvim",
    ft = "http",
    dependencies = { "luarocks.nvim" },
    keys = {
      { "<leader>rr", "<cmd>Rest run<cr>", desc = "Run request under the cursor" },
    },
    config = function()
      require("rest-nvim").setup()
    end,
  },
}
