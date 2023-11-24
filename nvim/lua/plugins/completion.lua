return {
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
    config = function(_, opts)
      if opts then
        require("luasnip").config.setup(opts)
      end
      require("luasnip.loaders.from_vscode").load({ paths = "./snippets" })
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-cmdline",
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<CR>"] = cmp.config.disable,
        ["<Tab>"] = cmp.mapping.confirm({ select = true }),
      })
      cmp.setup.cmdline({ "/", "?" }, {
        mapping = {
          ["<Up>"] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), { "i", "c" }),
          ["<Down>"] = cmp.mapping(
            cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
            { "i", "c" }
          ),
          ["<C-e>"] = cmp.mapping(cmp.mapping.abort(), { "i", "c" }),
          ["<CR>"] = cmp.mapping(cmp.config.disable, { "i", "c" }),
          ["<Tab>"] = cmp.mapping(cmp.mapping.confirm({ select = true }), { "i", "c" }),
        },
        sources = {
          { name = "buffer" },
        },
      })

      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(":", {
        mapping = {
          ["<Up>"] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), { "i", "c" }),
          ["<Down>"] = cmp.mapping(
            cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
            { "i", "c" }
          ),
          ["<C-e>"] = cmp.mapping(cmp.mapping.abort(), { "i", "c" }),
          ["<CR>"] = cmp.mapping(cmp.config.disable, { "i", "c" }),
          ["<Tab>"] = cmp.mapping(cmp.mapping.confirm({ select = true }), { "i", "c" }),
        },
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          { name = "cmdline" },
        }),
      })
    end,
  },
}
