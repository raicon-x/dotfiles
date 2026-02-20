return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "lua_ls",
      "stylua",
      "shellcheck",
      "shfmt",
      "flake8",
    },
  },
}
