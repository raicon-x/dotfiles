return {
  "nvim-treesitter/nvim-treesitter",
  version = false, -- last release is way too old and doesn't work on Windows
  enabled = false,
  build = ":TSUpdate",
  event = { "LazyFile", "VeryLazy" },
  lazy = vim.fn.argc(-1) == 0, -- load treesitter early when opening a file from the cmdline
  init = function(plugin)
    require("lazy.core.loader").add_to_rtp(plugin)
    require("nvim-treesitter.query_predicates")
  end,
  cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
  keys = {
    { "<c-space>", desc = "Increment Selection" },
    { "<bs>", desc = "Decrement Selection", mode = "x" },
  },
  opts_extend = { "ensure_installed" },
  ---@type TSConfig
  ---@diagnostic disable-next-line: missing-fields
  opts = {
    highlight = { enable = true },
    indent = { enable = true },
    auto_install = true,
    sync_install = false,
    ensure_installed = {
      "bash",
      "asm",
      "c",
      "css",
      "cpp",
      "diff",
      "html",
      "javascript",
      "jsdoc",
      "json",
      "jsonc",
      "latex",
      "lua",
      "luadoc",
      "luap",
      "norg",
      "markdown",
      "markdown_inline",
      "objc",
      "printf",
      "python",
      "query",
      "regex",
      "scss",
      "svelte",
      "swift",
      "tmux",
      "toml",
      "tsx",
      "typescript",
      "typst",
      "vim",
      "vimdoc",
      "vue",
      "xml",
      "yaml",
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<C-space>",
        node_incremental = "<C-space>",
        scope_incremental = false,
        node_decremental = "<bs>",
      },
    },
    textobjects = {
      move = {
        enable = true,
        goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer", ["]a"] = "@parameter.inner" },
        goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer", ["]A"] = "@parameter.inner" },
        goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer", ["[a"] = "@parameter.inner" },
        goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer", ["[A"] = "@parameter.inner" },
      },
    },
  },
  ---@param opts TSConfig
  config = function(_, opts)
    local seen = {}
    for index, item in ipairs(opts) do
      if seen[item] then
        table.remove(opts, index)
      else
        seen[item] = true
      end
    end
    require("nvim-treesitter.configs").setup(opts)
  end,
}
