return {
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    config = function()
      local luasnip = require("luasnip")

      -- Configure LuaSnip
      luasnip.setup({
        history = true,
        update_events = "TextChanged,TextChangedI",
        enable_autosnippets = true,
        delete_check_events = "TextChanged,InsertLeave",
      })

      -- Load custom snippets from my-snippets directory
      require("luasnip.loaders.from_lua").load({
        paths = vim.fn.stdpath("config") .. "/my-snippets",
      })

      -- Optional: load VSCode style snippets (from friendly-snippets)
      require("luasnip.loaders.from_vscode").lazy_load()

      -- Set keybindings for navigating snippets
      vim.keymap.set({ "i", "s" }, "<Tab>", function()
        if luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        else
          vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
        end
      end, { silent = true })

      vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
        if luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<S-Tab>", true, false, true), "n", false)
        end
      end, { silent = true })
    end,
  },
}
