return {
  {
    "folke/snacks.nvim",
    opts = {
      explorer = {
        enabled = false,
      },
      picker = {
        sources = {
          explorer = {
            focus = "input",
            jump = { close = true },
          },
        },
      },
    },
  },
}
