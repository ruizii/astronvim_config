-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      -- customize the dashboard header
      opts.section.header.val = {
        [[                                    ██████                                    ]],
        [[                                ████▒▒▒▒▒▒████                                ]],
        [[                              ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                              ]],
        [[                            ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                            ]],
        [[                          ██▒▒▒▒▒▒▒▒    ▒▒▒▒▒▒▒▒                              ]],
        [[                          ██▒▒▒▒▒▒  ▒▒▓▓▒▒▒▒▒▒  ▓▓▓▓                          ]],
        [[                          ██▒▒▒▒▒▒  ▒▒▓▓▒▒▒▒▒▒  ▒▒▓▓                          ]],
        [[                        ██▒▒▒▒▒▒▒▒▒▒    ▒▒▒▒▒▒▒▒    ██                        ]],
        [[                        ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                        ]],
        [[                        ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                        ]],
        [[                        ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                        ]],
        [[                        ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                        ]],
        [[                        ██▒▒██▒▒▒▒▒▒██▒▒▒▒▒▒▒▒██▒▒▒▒██                        ]],
        [[                        ████  ██▒▒██  ██▒▒▒▒██  ██▒▒██                        ]],
        [[                        ██      ██      ████      ████                        ]],
      }

      return opts
    end,
  },

  {
    "CRAG666/code_runner.nvim",
    cmd = "RunCode",
    config = function()
      require("code_runner").setup {
        mode = "toggleterm",
        startinsert = true,

        term = {
          size = 15,
        },

        filetype = {
          python = "python -u",
          javascript = "node",
          cpp = "cd $dir && make && $dir/$fileNameWithoutExt",
          c = "cd $dir && make && $dir/$fileNameWithoutExt",
          go = "go run",
          sh = "bash",
          asm = "nasm -f elf64 $fileName && ld $fileNameWithoutExt.o -o $fileNameWithoutExt && ./$fileNameWithoutExt",
          lua = "lua",
        },
      }
    end,
  },

  {
    "iruzo/matrix-nvim",
    config = function() vim.g.matrix_disable_background = true end,
  },

  {
    "kawre/leetcode.nvim",
    lazy = "leetcode.nvim" ~= vim.fn.argv()[1],
    build = ":TSUpdate html",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim", -- required by telescope
      "MunifTanjim/nui.nvim",

      -- optional
      "nvim-treesitter/nvim-treesitter",
      "rcarriga/nvim-notify",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      ---@type lc.lang
      lang = "cpp",
      arg = "leetcode.nvim",
    },
  },

  {
    "navarasu/onedark.nvim",
    config = function()
      require("onedark").setup {
        style = "darker",
        transparent = true,
      }
    end,
  },

  -- You can disable default plugins as follows:
  { "max397574/better-escape.nvim", enabled = false },
  { "norcalli/nvim-colorizer.lua", enabled = false },
  { "mrjones2014/smart-splits.nvim", enabled = false },
  { "williamboman/mason-nvim-dap.nvim", enabled = false },
  { "mfussenegger/nvim-dap", enabled = false },
  { "rcarriga/nvim-dap-ui", enabled = false },
  { "rcarriga/cmp-dap", enabled = false },

  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("ibl").setup {
        scope = {
          show_start = false,
          show_end = false,
        },
      }
    end,
  },

  {
    "xiyaowong/transparent.nvim",
    lazy = false,
    config = function()
      local transparent = require "transparent"
      transparent.setup {
        extra_groups = {
          "NvimTreeNormal",
          "NormalFloat",
          "TabLineFill",
          "Comment",
          "NormalNC",
          "TabLine",
          "TabLineSel",
          "FloatBorder",
        },
      }
      transparent.clear_prefix "BufferLine"
      transparent.clear_prefix "NeoTree"
      transparent.clear_prefix "lualine"
    end,
    dependencies = {
      {
        "AstroNvim/astrocore",
        opts = {
          mappings = {
            n = {
              ["<Leader>uT"] = { "<Cmd>TransparentToggle<CR>", desc = "Toggle transparency" },
            },
          },
        },
      },
    },
  },

  {
    "brenoprata10/nvim-highlight-colors",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("nvim-highlight-colors").setup {
        ---Render style
        ---@usage 'background'|'foreground'|'virtual'
        render = "virtual",
        enable_tailwind = true,
      }
    end,
  },

  {
    "HiPhish/rainbow-delimiters.nvim",
    dependencies = "nvim-treesitter/nvim-treesitter",
    event = "User AstroFile",
    main = "rainbow-delimiters.setup",
  },

  {
    "vuki656/package-info.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {},
    event = "BufRead package.json",
  },
}
