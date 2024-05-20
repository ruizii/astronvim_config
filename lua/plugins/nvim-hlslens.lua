return {
  "kevinhwang91/nvim-hlslens",
  lazy = true,
  opts = {},
  dependencies = { "AstroNvim/astrocore", opts = { on_keys = { auto_hlsearch = false } } },
  config = function()
    require("scrollbar.handlers.search").setup {
      override_lens = function() end,
    }
  end,
}
