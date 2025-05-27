return {
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && npm install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },

  {
    "folke/todo-comments.nvim",
    event = "InsertEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    config = function()
      require "configs.todo-comments"
    end,
  },
  {
    "numToStr/Comment.nvim",
    keys = {
      { "gcc", mode = "n", desc = "Comment toggle current line" },
      { "gc", mode = { "n", "o" }, desc = "Comment toggle linewise" },
      { "gc", mode = "x", desc = "Comment toggle linewise (visual)" },
      { "gbc", mode = "n", desc = "Comment toggle current block" },
      { "gb", mode = { "n", "o" }, desc = "Comment toggle blockwise" },
      { "gb", mode = "x", desc = "Comment toggle blockwise (visual)" },
    },
    config = function(_, opts)
      require("Comment").setup(opts)
    end,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    event = "User FilePost",
    opts = {
      indent = { char = "│", highlight = "IblChar" },
      scope = {
        char = "│",
        highlight = "IblScopeChar",
        show_start = true,
        show_end = false,
      },
    },
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "blankline")

      local hooks = require "ibl.hooks"
      hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
      require("ibl").setup(opts)

      -- seems this's typo from developers, since "visual" highlight group overrides
      -- scope_start highlight
      -- dofile(vim.g.base46_cache .. "blankline")
    end,
  },

  {
    "kevinhwang91/nvim-ufo",
    dependencies = "kevinhwang91/promise-async",

    event = "VeryLazy",

    config = function()
      require("ufo").setup {
        provider_selector = function(bufnr, filetype, buftype)
          return { "treesitter", "indent" }
        end,
      }
    end,
  },

  {
    "rcarriga/nvim-dap-ui",

    event = "VeryLazy",

    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },

    config = function()
      require "configs.dap-ui"
    end,
  },

  -- Probably should change the order of loading with mason(see official github)
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
      ensure_installed = { "codelldb", "debugpy" },
      handlers = {},
    },
  },

  {
    "mfussenegger/nvim-dap",
    event = "VeryLazy",
    config = function(_, _)
      dofile(vim.g.base46_cache .. "dap")
      -- require("core.utils").load_mappings("dap") --from old confing
    end,
  },

  {
    "L3MON4D3/LuaSnip",
    dependencies = "rafamadriz/friendly-snippets",

    event = "InsertEnter",

    opts = { history = true, updateevents = "TextChanged,TextChangedI" },
    config = function(_, opts)
      require("luasnip").config.set_config(opts)
      require "configs.luasnip"
    end,
  },

  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "c",
        "cpp",
        "go",
        "python",
        "rust",
        "html",
        "css",
      },
    },
  },

  -- Already configured in NvChad, this extends options
  -- to ignore preselection from language server(actully needed for gopls)
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, conf)
      conf.preselect = require("cmp").PreselectMode.None
    end,
  },

  -- Already configured in NvChad, show dotfiles and gitignore by default
  {
    "nvim-tree/nvim-tree.lua",
    opts = function(_, conf)
      conf.filters = { dotfiles = false, git_ignored = false }
    end,
  },
}
