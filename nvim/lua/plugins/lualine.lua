local Util = require("lazyvim.util")

local function get_venv(variable)
  local venv = os.getenv(variable)
  if venv ~= nil and string.find(venv, "\\") then
    venv = string.format("%s", venv:match(".+\\([^\\]+)"))
  end
  return venv
end

return {
  "lualine.nvim",
  opts = function(_, opts)
    local icons = require("lazyvim.config").icons

    opts.options.refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
    opts.sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch" },
      lualine_c = {
        {
          "diagnostics",
          symbols = {
            error = icons.diagnostics.Error,
            warn = icons.diagnostics.Warn,
            info = icons.diagnostics.Info,
            hint = icons.diagnostics.Hint,
          },
        },
      },
      lualine_x = {
        {
          function()
            return "  " .. require("dap").status()
          end,
          cond = function()
            return package.loaded["dap"] and require("dap").status() ~= ""
          end,
          color = Util.ui.fg("Debug"),
        },
        {
          "diff",
          symbols = {
            added = icons.git.added,
            modified = icons.git.modified,
            removed = icons.git.removed,
          },
          source = function()
            local gitsigns = vim.b.gitsigns_status_dict
            if gitsigns then
              return {
                added = gitsigns.added,
                modified = gitsigns.changed,
                removed = gitsigns.removed,
              }
            end
          end,
        },
        { "searchcount" },
        { "selectioncount" },
      },
      lualine_y = {
        { "progress", separator = " ", padding = { left = 1, right = 0 } },
        { "location", padding = { left = 0, right = 1 } },
        {
          function()
            local venv = get_venv("CONDA_DEFAULT_ENV") or get_venv("VIRTUAL_ENV") or "NO ENV"
            return " " .. venv
          end,
          cond = function()
            return vim.bo.filetype == "python"
          end,
        },
      },
      lualine_z = {
        function()
          return "  " .. os.date("%I:%M %p")
        end,
      },
    }
    opts.tabline = {
      lualine_a = { { "buffers", max_length = vim.o.columns * 9 / 10 } },
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {
        {
          function()
            return " " .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
          end,
          color = { bg = "#fe8019" },
        },
      },
    }
  end,
}
