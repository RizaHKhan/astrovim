return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = function()
    local utils = require "astronvim.utils"
    local get_icon = utils.get_icon
    return {
      auto_clean_after_session_restore = true,
      close_if_last_window = true,
      sources = { "filesystem", "git_status" },
      source_selector = {
        winbar = false,
        content_layout = "center",
        sources = {
          { source = "filesystem", display_name = get_icon("FolderClosed", 1, true) .. "File" },
          { source = "buffers", display_name = get_icon("DefaultFile", 1, true) .. "Bufs" },
          { source = "git_status", display_name = get_icon("Git", 1, true) .. "Git" },
          { source = "diagnostics", display_name = get_icon("Diagnostic", 1, true) .. "Diagnostic" },
        },
      },
    }
  end,
}
