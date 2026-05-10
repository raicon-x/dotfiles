return {
  "mfussenegger/nvim-lint",
  optional = true,
  opts = {
    linters = {
      ["markdownlint-cli2"] = {
        args = {
          "--config",
          vim.fn.stdpath("config") .. "/lua/plugins/cfg/markdownlint-cli2.yaml",
          "--",
        },
      },
    },
  },
}
