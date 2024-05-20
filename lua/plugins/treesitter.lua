-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    -- add more things to the ensure_installed table protecting against community packs modifying it
    opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
      "lua",
      "vim",
      "bash",
      "c",
      "cpp",
      "css",
      "html",
      "javascript",
      "jsdoc",
      "json",
      "jsonc",
      "luap",
      "markdown",
      "markdown_inline",
      "python",
      "query",
      "toml",
      "typescript",
      "vimdoc",
      -- add more arguments for adding more treesitter parsers
    })
  end,
}
