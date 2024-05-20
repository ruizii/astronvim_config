return {
  "petertriho/nvim-scrollbar",
  event = "User AstroFile",

  opts = function(_, opts)
    require("astrocore").extend_tbl(opts, {
      handlers = {
        gitsigns = require("astrocore").is_available "gitsigns.nvim",
        search = require("astrocore").is_available "nvim-hlslens",
        ale = require("astrocore").is_available "ale",
      },
    })
  end,

  config = function()
    require("scrollbar").setup {
      handle = {
        color = "#60606f",
      },
      marks = {
        Cursor = {
          text = "-",
        },
        Search = {
          color = "#FFEA00",
        },
      },
      handlers = {
        cursor = true,
        diagnostic = true,
        gitsigns = true, -- Requires gitsigns
        handle = true,
        search = false, -- Requires hlslens
        ale = false, -- Requires ALE
      },
    }
  end,
}
