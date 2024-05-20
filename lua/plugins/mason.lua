-- Customize Mason plugins

---@type LazySpec
return {
  -- use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup {
        ui = {
          border = "single",
        },
      }
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    -- overrides `require("mason-lspconfig").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        "bashls",
        "clangd",
        "cssls",
        "emmet_ls",
        "html",
        "jsonls",
        "lua_ls",
        "pyright",
        "tsserver",
        "eslint",
        -- add more arguments for adding more language servers
      })
    end,
  },

  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    -- overrides `require("mason-null-ls").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        -- Formatters
        "black",
        "isort",
        "prettierd",
        "shfmt",
        "stylua",

        -- Linters
        "selene",
        "shellcheck",

        -- add more arguments for adding more null-ls sources
      })
    end,
  },
}
