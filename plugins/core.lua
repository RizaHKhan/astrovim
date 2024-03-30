local get_icon = require("astronvim.utils").get_icon

return {
  "christoomey/vim-tmux-navigator",
  cmd = {
    "TmuxNavigateLeft",
    "TmuxNavigateDown",
    "TmuxNavigateUp",
    "TmuxNavigateRight",
    "TmuxNavigatePrevious",
  },
  keys = {
    { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
    { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
    { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
    { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
    { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
  },
  { "goolord/alpha-nvim", enabled = false },
  { "max397574/better-escape.nvim", enabled = false },
  { "lukas-reineke/indent-blankline.nvim", enabled = false },

  { "mfussenegger/nvim-dap", dependencies = {
    { "theHamsta/nvim-dap-virtual-text", config = true },
  } },
  { "akinsho/toggleterm.nvim", opts = {
    terminal_mappings = false,
    open_mapping = [[<C-\>]],
  } },
  { "rcarriga/nvim-notify", opts = {
    timeout = 0,
  } },
  {
    "mrjones2014/smart-splits.nvim",
    build = "./kitty/install-kittens.bash",
    opts = function(_, opts) opts.at_edge = require("smart-splits.types").AtEdgeBehavior.stop end,
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signcolumn = false,
      numhl = true,
      current_line_blame_opts = { ignore_whitespace = true },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = { "miversen33/netman.nvim" },
  },
  {
    "mattn/emmet-vim",
    lazy = false,
  },
  {
    "othree/html5.vim",
  },
  {
    "rest-nvim/rest.nvim",
    ft = "http",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  { "tpope/vim-surround", lazy = false },
  { "godlygeek/tabular", lazy = false },
  { "tmhedberg/matchit" },
  { "nvim-test", lazy = false },
  {
    "vhyrro/luarocks.nvim",
    priority = 1000,
    config = true,
    lazy = false,
    opts = {
      rocks = { "lua-curl", "nvim-nio", "mimetypes", "xml2lua" }, -- Specify LuaRocks packages to install
    },
  },
  {
    "rest-nvim/rest.nvim",
    ft = "http",
    dependencies = { "luarocks.nvim" },
    config = function()
      require("rest-nvim").setup {
        client = "curl",
        env_file = ".env",
        env_pattern = "\\.env$",
        env_edit_command = "tabedit",
        encode_url = true,
        skip_ssl_verification = false,
        custom_dynamic_variables = {},
        logs = {
          level = "info",
          save = true,
        },
        result = {
          split = {
            horizontal = false,
            in_place = false,
            stay_in_current_window_after_split = true,
          },
          behavior = {
            decode_url = true,
            show_info = {
              url = true,
              headers = true,
              http_info = true,
              curl_command = true,
            },
            statistics = {
              enable = true,
              ---@see https://curl.se/libcurl/c/curl_easy_getinfo.html
              stats = {
                { "total_time", title = "Time taken:" },
                { "size_download_t", title = "Download size:" },
              },
            },
            formatters = {
              json = "jq",
              html = function(body)
                if vim.fn.executable "tidy" == 0 then return body, { found = false, name = "tidy" } end
                local fmt_body = vim.fn
                  .system({
                    "tidy",
                    "-i",
                    "-q",
                    "--tidy-mark",
                    "no",
                    "--show-body-only",
                    "auto",
                    "--show-errors",
                    "0",
                    "--show-warnings",
                    "0",
                    "-",
                  }, body)
                  :gsub("\n$", "")

                return fmt_body, { found = true, name = "tidy" }
              end,
            },
          },
        },
        highlight = {
          enable = true,
          timeout = 750,
        },
        keybinds = {
          {
            "<localleader>rr",
            "<cmd>Rest run<cr>",
            "Run request under the cursor",
          },
          {
            "<localleader>rl",
            "<cmd>Rest run last<cr>",
            "Re-run latest request",
          },
        },
      }
    end,
  },
}
