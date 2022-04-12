local config = {

  -- Set colorscheme
  colorscheme = "gruvbox-material",

  -- Default theme configuration
  default_theme = {
    diagnostics_style = "none",
    -- Modify the color table
    colors = {
      fg = "#abb2bf",
    },
    -- Modify the highlight groups
    highlights = function(highlights)
      local C = require "default_theme.colors"

      highlights.Normal = { fg = C.fg, bg = C.bg }
      return highlights
    end,
  },

  -- Disable default plugins
  enabled = {
    bufferline = true,
    neo_tree = true,
    lualine = true,
    gitsigns = true,
    colorizer = true,
    toggle_term = true,
    comment = true,
    symbols_outline = true,
    indent_blankline = true,
    dashboard = true,
    which_key = true,
    neoscroll = true,
    ts_rainbow = true,
    ts_autotag = true,
  },

  -- Disable AstroVim ui features
  ui = {
    nui_input = true,
    telescope_select = true,
  },

  -- Configure plugins
  plugins = {
    -- Add plugins, the packer syntax without the "use"
    init = {
      -- { "andweeb/presence.nvim" },
      -- {"yamatsum/nvim-cursorline"},
      {
        "ray-x/lsp_signature.nvim",
        event = "BufRead",
        config = function()
          require("lsp_signature").setup()
        end,
      },
      { "sainnhe/gruvbox-material" },
      -- DAP:
        { "mfussenegger/nvim-dap" },
        {
          "rcarriga/nvim-dap-ui",
          requires = { "nvim-dap", "rust-tools.nvim" },
          config = function()
            local dapui = require "dapui"
            dapui.setup {}

            local dap = require "dap"
            dap.listeners.after.event_initialized["dapui_config"] = function()
              dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
              dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
              dapui.close()
            end
          end,
        },
        {
          "Pocco81/DAPInstall.nvim",
          config = function()
            require("dap-install").setup {}
          end,
        },
        {
          "mfussenegger/nvim-dap-python",
        },
        -- Rust support
        {
          "simrat39/rust-tools.nvim",
          requires = { "nvim-lspconfig", "nvim-lsp-installer", "nvim-dap", "Comment.nvim", "plenary.nvim" },
          -- Is configured via the server_registration_override installed below!
        },
        {
          "Saecki/crates.nvim",
          after = "nvim-cmp",
          config = function()
            require("crates").setup()

            local cmp = require "cmp"
            local config = cmp.get_config()
            table.insert(config.sources, { name = "crates" })
            cmp.setup(config)
          end,
        },
        -- Text objects
        { "bkad/CamelCaseMotion" },
        {
          "nvim-treesitter/nvim-treesitter-textobjects",
          after = "nvim-treesitter",
          config = function()
            require("nvim-treesitter.configs").setup {
              textobjects = {
                select = {
                  enable = true,

                  -- Automatically jump forward to textobj, similar to targets.vim
                  lookahead = true,

                  keymaps = {
                    -- You can use the capture groups defined in textobjects.scm
                    ["af"] = "@function.outer",
                    ["if"] = "@function.inner",
                    ["ac"] = "@class.outer",
                    ["ic"] = "@class.inner",
                    ["ab"] = "@block.outer",
                    ["ib"] = "@block.inner",
                    ["a-"] = "@parameter.outer",
                    ["i-"] = "@parameter.inner",

                    -- Or you can define your own textobjects like this
                    -- ["iF"] = {
                    --    python = "(function_definition) @function",
                    --    cpp = "(function_definition) @function",
                    --    c = "(function_definition) @function",
                    --    java = "(method_declaration) @function",
                    -- },
                  },
                },
              },
            }
          end,
        },
    },
    -- All other entries override the setup() call for default plugins
    treesitter = {
      ensure_installed = { "lua" },
    },
    lualine = {
      options = {
        theme = 'gruvbox-material'
      }
    },
    packer = {
      compile_path = vim.fn.stdpath "config" .. "/lua/packer_compiled.lua",
    },
  },

  -- Add paths for including more VS Code style snippets in luasnip
  luasnip = {
    vscode_snippet_paths = {},
  },

  -- Modify which-key registration
  ["which-key"] = {
    -- Add bindings to the normal mode <leader> mappings
    register_n_leader = {
      -- ["N"] = { "<cmd>tabnew<cr>", "New Buffer" },
    },
  },

  -- Extend LSP configuration
  lsp = {
    -- add to the server on_attach function
    -- on_attach = function(client, bufnr)
    -- end,

    -- override the lsp installer server-registration function
    -- server_registration = function(server, opts)
    --   server:setup(opts)
    -- end
    server_registration = function(server, server_opts)
      -- Special code for rust.tools.nvim!
      if server.name == "rust_analyzer" then
        local extension_path = vim.fn.stdpath "data" .. "/dapinstall/codelldb/extension"
        local codelldb_path = extension_path .. "/adapter/codelldb"
        local liblldb_path = extension_path .. "/lldb/lib/liblldb.so"

        require("rust-tools").setup {
          server = server_opts,
          dap = {
              adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
            },
          }
        else
          server:setup(server_opts)
        end
    end,

    -- Add overrides for LSP server settings, the keys are the name of the server
    ["server-settings"] = {
      -- example for addings schemas to yamlls
      -- yamlls = {
      --   settings = {
      --     yaml = {
      --       schemas = {
      --         ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
      --         ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
      --         ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
      --       },
      --     },
      --   },
      -- },
    },
  },

  -- Diagnostics configuration (for vim.diagnostics.config({}))
  diagnostics = {
    virtual_text = true,
    underline = true,
  },

  -- null-ls configuration
  ["null-ls"] = function()
    -- Formatting and linting
    -- https://github.com/jose-elias-alvarez/null-ls.nvim
    local status_ok, null_ls = pcall(require, "null-ls")
    if not status_ok then
      return
    end

    -- Check supported formatters
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    local formatting = null_ls.builtins.formatting

    -- Check supported linters
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    local diagnostics = null_ls.builtins.diagnostics

    null_ls.setup {
      debug = false,
      sources = {
        -- Set a formatter
        formatting.rufo,
        -- Set a linter
        diagnostics.rubocop,
      },
      -- NOTE: You can remove this on attach function to disable format on save
      on_attach = function(client)
        if client.resolved_capabilities.document_formatting then
          vim.cmd "autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()"
        end
      end,
    }
  end,

  -- This function is run last
  -- good place to configure mappings and vim options
  polish = function()
    local opts = { noremap = true, silent = true }
    local map = vim.api.nvim_set_keymap
    local set = vim.opt
    -- Set options
    set.relativenumber = true

    -- Set key bindings
    map("n", "<C-s>", ":w!<CR>", opts)

    -- Set autocommands
    vim.cmd [[
      augroup packer_conf
        autocmd!
        autocmd bufwritepost plugins.lua source <afile> | PackerSync
      augroup end
    ]]
  end,
}

return config
