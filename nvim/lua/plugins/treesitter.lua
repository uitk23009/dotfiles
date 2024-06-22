return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local config = require("nvim-treesitter.configs")
      config.setup({
        ensure_installed = { "gitignore", "php", "lua", "javascript", "vim", "vimdoc", "query"},
      })
    end
  }
}