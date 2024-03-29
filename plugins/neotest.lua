return {
  "nvim-neotest/neotest",
  lazy = false,
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "marilari88/neotest-vitest",
    "nvim-neotest/neotest-jest",
    "olimorris/neotest-phpunit",
    "V13Axel/neotest-pest",
    "nvim-neotest/neotest-go",
  },
  config = function()
    require("neotest").setup {
      adapters = {
        require "neotest-vitest",
        require "neotest-jest" {
          jestCommand = "npm test --",
          jestConfigFile = "jest.config.ts",
          env = { CI = true },
          cwd = function(path) return vim.fn.getcwd() end,
        },
        require "neotest-phpunit",
        require "neotest-pest",
        require "neotest-go",
      },
    }
  end,
}
