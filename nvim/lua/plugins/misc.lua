-- TODO: rainbow-delimiters
return {
  {
    "j-hui/fidget.nvim",
    opts = {
      progress = {
        ignore_empty_message = false,
      },
    },
  },
  {
    "echasnovski/mini.indentscope",
    opts = {
      draw = {
        animation = require("mini.indentscope").gen_animation.none(),
      },
    },
  },
  {
    "gbprod/cutlass.nvim",
    opts = {
      cut_key = "m",
    },
  },
  {
    "SmiteshP/nvim-navic",
    lazy = true,
    init = function()
      vim.g.navic_silence = true
      require("lazyvim.util").lsp.on_attach(function(client, buffer)
        if client.supports_method("textDocument/documentSymbol") then
          require("nvim-navic").attach(client, buffer)
        end
      end)
    end,
    opts = function()
      return {
        separator = " > ",
        highlight = true,
        depth_limit = 5,
        icons = require("lazyvim.config").icons.kinds,
        lazy_update_context = true,
      }
    end,
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
      local rainbow = require("rainbow-delimiters")
      local colors = require("gruvbox").palette

      vim.api.nvim_set_hl(0, "RainbowDelimiterRed", { fg = colors.bright_red })
      vim.api.nvim_set_hl(0, "RainbowDelimiterYellow", { fg = colors.bright_yellow })
      vim.api.nvim_set_hl(0, "RainbowDelimiterBlue", { fg = colors.neutral_blue })
      vim.api.nvim_set_hl(0, "RainbowDelimiterOrange", { fg = colors.bright_orange })
      vim.api.nvim_set_hl(0, "RainbowDelimiterGreen", { fg = colors.neutral_green })
      vim.api.nvim_set_hl(0, "RainbowDelimiterViolet", { fg = colors.neutral_purple })
      vim.api.nvim_set_hl(0, "RainbowDelimiterCyan", { fg = colors.bright_aqua })

      vim.g.rainbow_delimiters = {
        strategy = {
          [""] = rainbow.strategy["global"],
          html = rainbow.strategy["local"],
        },
        query = {
          [""] = "rainbow-delimiters",
        },
        highlight = {
          "RainbowDelimiterOrange",
          "RainbowDelimiterYellow",
          "RainbowDelimiterRed",
          "RainbowDelimiterBlue",
          "RainbowDelimiterViolet",
          "RainbowDelimiterCyan",
        },
      }
    end,
  },
  {
    "NvChad/nvim-colorizer.lua",
    opts = {},
  },
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      show_modified = true,
    },
  },
}
