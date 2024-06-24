return {
  -- lazy.nvim
  {
    "chrisgrieser/nvim-various-textobjs",
    lazy = false,
    opts = { useDefaultKeymaps = true },
  },
  { "yioneko/nvim-vtsls" },
  {
    "brenoprata10/nvim-highlight-colors",
  },
  {
    "mrcjkb/rustaceanvim",
    version = "^4", -- Recommended
    lazy = false, -- This plugin is already lazy
  },
  { "williamboman/mason-lspconfig.nvim" },
  {
    {
      "kristijanhusak/vim-dadbod-ui",
      dependencies = {
        { "tpope/vim-dotenv", lazy = true },
        { "tpope/vim-dadbod", lazy = true },
        { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
      },
      cmd = {
        "DBUI",
        "DBUIToggle",
        "DBUIAddConnection",
        "DBUIFindBuffer",
      },
      init = function()
        vim.g.db_ui_use_nerd_fonts = 1
        vim.g.db_ui_winwidth = 30
        vim.g.db_ui_show_help = 0
        vim.g.db_ui_use_nvim_notify = 1
        vim.g.db_ui_win_position = "left"

        require("which-key").register {
          ["<leader>D"] = {
            name = "󰆼 Db Tools",
            u = { "<cmd>DBUIToggle<cr>", " DB UI Toggle" },
            f = { "<cmd>DBUIFindBuffer<cr>", " DB UI Find buffer" },
            r = { "<cmd>DBUIRenameBuffer<cr>", " DB UI Rename buffer" },
            l = { "<cmd>DBUILastQueryInfo<cr>", " DB UI Last query infos" },
          },
        }
      end,
    },
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = false,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  {
    "VidocqH/lsp-lens.nvim",
    lazy = false,
  },
  {
    "folke/trouble.nvim",
    cmd = { "Trouble" },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  {
    "numToStr/Comment.nvim",
    enabled = false,
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "rmagatti/auto-session",
    cmd = { "SessionRestore", "SessionSave" },
    config = function()
      require("auto-session").setup {
        log_level = "error",
        auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
      }
    end,
  },
  {
    "folke/ts-comments.nvim",
    opts = {},
    event = "VeryLazy",
    -- enabled = true,
    enabled = vim.fn.has "nvim-0.10.0" == 1,
  },
  {
    "m4xshen/hardtime.nvim",
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    lazy = false,
    opts = {},
  },
  {
    "tris203/precognition.nvim",
  },
  {
    "nvim-java/nvim-java",
    dependencies = {
      "nvim-java/lua-async-await",
      "nvim-java/nvim-java-refactor",
      "nvim-java/nvim-java-core",
      "nvim-java/nvim-java-test",
      "nvim-java/nvim-java-dap",
      "MunifTanjim/nui.nvim",
      "neovim/nvim-lspconfig",
      "mfussenegger/nvim-dap",
      {
        "williamboman/mason.nvim",
        opts = {
          registries = {
            "github:nvim-java/mason-registry",
            "github:mason-org/mason-registry",
          },
        },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },
  -- {
  --   "pmizio/typescript-tools.nvim",
  --   config = function()
  --     require("typescript-tools").setup {
  --       settings = {
  --         tsserver_file_preferences = {
  --           includeInlayParameterNameHints = "all",
  --           includeCompletionsForModuleExports = true,
  --           quotePreference = "auto",
  --         },
  --       },
  --     }
  --   end,
  --   dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  --   opts = {},
  --   lazy = false,
  -- },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },
  {
    "SuperBo/fugit2.nvim",
    opts = {
      width = 100,
      min_width = 50,
      content_width = 60,
      max_width = "80%",
      height = "85%",
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
      "nvim-lua/plenary.nvim",
      {
        "chrisgrieser/nvim-tinygit", -- optional: for Github PR view
        dependencies = { "stevearc/dressing.nvim" },
      },
    },
    cmd = { "Fugit2", "Fugit2Graph" },
    keys = {
      { "<leader>F", mode = "n", "<cmd>Fugit2<cr>" },
    },
  },
  {
    "luckasRanarison/tailwind-tools.nvim",
    cmd = "TailwindConcealEnable",
    lazy = false,
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {}, -- your configuration
  },
}
