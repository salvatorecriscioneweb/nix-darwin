return {
  -- Make blink usable
  {
    "saghen/blink.cmp",
    event = "InsertEnter",
    opts = {
      keymap = {
        preset = "super-tab",
      },
      completion = {
        ghost_text = {
          enabled = false,
        },
      },
    },
  },
}
