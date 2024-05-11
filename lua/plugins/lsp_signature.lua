return {
  "ray-x/lsp_signature.nvim",
  require("lsp_signature").setup {
    doc_lines = 0,
    wrap = true,
    floating_window_above_cur_line = true,
    handler_opts = {
      border = "single",
    },

    floating_window_off_x = 50,
    close_timeout = 4000,
  },
}
