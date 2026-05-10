return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      sourcekit = {
        cmd = { "xcrun", "sourcekit-lsp" },
        filetypes = { "swift", "objective-c", "objective-cpp" },
        root_dir = function(fname)
          return require("lspconfig.util").root_pattern("Package.swift", ".git")(fname) or vim.fn.getcwd()
        end,
      },
    },
  },
}
