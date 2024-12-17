return {
  -- My Best Friend for the boring tasks
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        panel = { enabled = false },
        suggestion = {
          enabled = true,
          auto_trigger = true,
          keymap = {
            accept = "<D-l>", -- handled by nvim-cmp / blink.cmp
            next = "<D-]>",
            prev = "<D-[>",
          },
        },
        filetypes = {
          yaml = false,
          help = false,
          gitcommit = false,
          gitrebase = false,
          hgcommit = false,
          svn = false,
          sh = false,
          cvs = false,
          ["."] = false,
          [" "] = false,
        },
      })
    end,
  },
  -- Elixir is my favorite language, no really it is
  {
    "elixir-tools/elixir-tools.nvim",
    version = "*",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local elixir = require("elixir")
      local elixirls = require("elixir.elixirls")

      elixir.setup({
        nextls = { enable = true },
        elixirls = {
          enable = false,
          settings = elixirls.settings({
            dialyzerEnabled = false,
            enableTestLenses = false,
          }),
          on_attach = function(client, bufnr)
            vim.keymap.set("n", "<space>fp", ":ElixirFromPipe<cr>", { buffer = true, noremap = true })
            vim.keymap.set("n", "<space>tp", ":ElixirToPipe<cr>", { buffer = true, noremap = true })
            vim.keymap.set("v", "<space>em", ":ElixirExpandMacro<cr>", { buffer = true, noremap = true })
          end,
        },
        projectionist = {
          enable = false,
        },
      })
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  -- Never understood if it works or not
  -- {
  --   "ahmedkhalf/project.nvim",
  --   opts = {
  --     manual_mode = false,
  --     patterns = { "mix.exs", ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },
  --     ignore_lsp = { "biome" },
  --   },
  --   event = "VeryLazy",
  --   config = function(_, opts)
  --     require("project_nvim").setup(opts)
  --     local history = require("project_nvim.utils.history")
  --     history.delete_project = function(project)
  --       for k, v in pairs(history.recent_projects) do
  --         if v == project.value then
  --           history.recent_projects[k] = nil
  --           return
  --         end
  --       end
  --     end
  --     LazyVim.on_load("telescope.nvim", function()
  --       require("telescope").load_extension("projects")
  --     end)
  --   end,
  -- },
}
