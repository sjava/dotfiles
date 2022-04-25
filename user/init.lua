local config = {

  -- Set colorscheme
  colorscheme = "catppuccin",

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
    ts_autotag = true
  },

  -- Disable AstroVim ui features
  ui = {nui_input = true, telescope_select = true},

  -- Configure plugins
  plugins = {
    -- Add plugins, the packer syntax without the "use"
    init = {
      -- { "andweeb/presence.nvim" },
      {"catppuccin/nvim", as = "catppuccin", config = function() require("catppuccin").setup {} end},
      {"ten3roberts/window-picker.nvim", config = function() require("window-picker").setup({}) end},
      {"hoschi/yode-nvim", config = function() require('yode-nvim').setup({}) end},
      {"machakann/vim-sandwich"},
      {"vim-test/vim-test"},
      {"andymass/vim-matchup"},
      {"elixir-editors/vim-elixir"},
      {"chemzqm/wxapp.vim"},
      {"rainbowhxch/beacon.nvim"},
      {"beauwilliams/focus.nvim", config = function() require("focus").setup() end},
      {"github/copilot.vim"},
      {
        "tzachar/cmp-tabnine",
        run = "./install.sh",
        requires = "hrsh7th/nvim-cmp",
        config = function() require("core.utils").add_cmp_source("cmp_tabnine", 1000) end
      },
      {"chrisbra/NrrwRgn"},
      {"ggandor/lightspeed.nvim", config = function() require('lightspeed').setup {} end},
      {"sbdchd/neoformat"},
      {"wellle/targets.vim"},
      {
        "ray-x/lsp_signature.nvim",
        event = "BufRead",
        config = function() require("lsp_signature").setup() end
      },

      -- DAP:
      {"mfussenegger/nvim-dap"},
      {
        "rcarriga/nvim-dap-ui",
        requires = {"nvim-dap", "rust-tools.nvim"},
        config = function()
          local dapui = require "dapui"
          dapui.setup {}

          local dap = require "dap"
          dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
          dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
          dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end
        end
      },
      {
        "Pocco81/dap-buddy.nvim",
        module = 'dap-buddy',
        config = function() require("dab-buddy").setup() end
      },
      {"mfussenegger/nvim-dap-python"},

      -- Rust support
      {
        "simrat39/rust-tools.nvim",
        requires = {
          "nvim-lspconfig",
          "nvim-lsp-installer",
          "nvim-dap",
          "Comment.nvim",
          "plenary.nvim"
        }
      },
      {
        "Saecki/crates.nvim",
        after = "nvim-cmp",
        config = function()
          require("crates").setup()

          local cmp = require "cmp"
          local config = cmp.get_config()
          table.insert(config.sources, {name = "crates"})
          cmp.setup(config)
        end
      },

      -- Text objects
      {"bkad/CamelCaseMotion"},
      {
        "RRethy/nvim-treesitter-textsubjects",
        after = "nvim-treesitter",
        config = function()
          require('nvim-treesitter.configs').setup {
            textsubjects = {
              enable = true,
              prev_selection = ',',
              keymaps = {
                ['.'] = 'textsubjects-smart',
                [';'] = 'textsubjects-container-outer',
                ['i;'] = 'textsubjects-container-inner'
              }
            }
          }
        end
      }
    },

    -- All other entries override the setup() call for default plugins
    treesitter = {ensure_installed = {"lua"}},
    lualine = {options = {theme = "catppuccin"}},
    packer = {compile_path = vim.fn.stdpath "config" .. "/lua/packer_compiled.lua"}
  },

  -- Add paths for including more VS Code style snippets in luasnip
  luasnip = {vscode_snippet_paths = {}},

  -- Modify which-key registration
  ["which-key"] = {
    -- Add bindings to the normal mode <leader> mappings
    register_n_leader = {
      ["w"] = {
        name = "windows",
        s = {"<C-w>s", "horizontal split window"},
        v = {"<C-w>v", "vertical split window"},
        h = {"<C-w>h", "left window"},
        j = {"<C-w>j", "below window"},
        l = {"<C-w>l", "right window"},
        k = {"<C-w>k", "up window"},
        w = {"<cmd>WindowPick<cr>", "window pick"}
      },
      ["j"] = {
        name = "test",
        n = {"<cmd>TestNearest<cr>", "test near"},
        f = {"<cmd>TestFile<cr>", "test file"},
        a = {"<cmd>TestSuite<cr>", "test all"},
        l = {"<cmd>TestLast<cr>", "test last"},
        v = {"<cmd>TestVisit<cr>", "test visit"}
      }
      -- ["N"] = { "<cmd>tabnew<cr>", "New Buffer" },
    }
  },

  -- Extend LSP configuration
  lsp = {
    -- add to the server on_attach function
    on_attach = function(client, _)
      if client.name == "elixirls" then
        client.resolved_capabilities.document_formatting = false
      end
    end,

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
            adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path)
          }
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
    }
  },

  -- Diagnostics configuration (for vim.diagnostics.config({}))
  diagnostics = {virtual_text = true, underline = true},

  -- null-ls configuration
  ["null-ls"] = function()
    -- Formatting and linting
    -- https://github.com/jose-elias-alvarez/null-ls.nvim
    local status_ok, null_ls = pcall(require, "null-ls")
    if not status_ok then return end

    -- Check supported formatters
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    local formatting = null_ls.builtins.formatting

    -- Check supported linters
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    local diagnostics = null_ls.builtins.diagnostics

    local parsers = {javascript = "babel", scss = "scss", json = "json", html = "html"}
    null_ls.setup {
      debug = false,
      sources = {
        -- Set a formatter
        -- formatting.prettier,
        formatting.mix,
        formatting.lua_format,
        formatting.prettier.with({
          extra_args = function(params) return {"--parser", parsers[params.ft]} end
        }),

        -- Set a linter
        diagnostics.eslint_d,
        diagnostics.credo
      }
      -- NOTE: You can remove this on attach function to disable format on save
      -- on_attach = function(client)
      --   if client.resolved_capabilities.document_formatting then
      --     vim.cmd "autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()"
      --   end
      -- end
    }
  end,

  -- This function is run last
  -- good place to configure mappings and vim options
  polish = function()
    local opts = {noremap = true, silent = true}
    local map = vim.api.nvim_set_keymap
    local set = vim.opt
    -- Set options
    set.relativenumber = true

    -- vim-test config
    vim.g['shtuff_receiver'] = "devrunner"
    vim.g['test#strategy'] = "shtuff"
    vim.g['python3_host_prog'] = "/usr/bin/python3"

    -- neoformat config
    vim.g['neoformat_javascript_prettier'] = {
      exe = "prettier",
      stdin = 1,
      args = {"--stdin-filepath", '"%:p"', "--parser", "babel"}
    }
    vim.g['neoformat_json_prettier'] = {
      exe = "prettier",
      stdin = 1,
      args = {"--stdin-filepath", '"%:p"', "--parser", "json"}
    }
    vim.g['neoformat_html_prettier'] = {
      exe = "prettier",
      stdin = 1,
      args = {"--stdin-filepath", '"%:p"', "--parser", "html"}
    }
    vim.g['neoformat_wxml_prettier'] = {
      exe = "prettier",
      stdin = 1,
      args = {"--stdin-filepath", '"%:p"', "--parser", "html"}
    }
    vim.g['neoformat_enabled_wxml'] = {'prettier'}

    -- NrrwRgn
    vim.g['nrrw_rgn_vert'] = 1
    vim.g['nrrw_rgn_resize_window'] = "relative"

    -- Set key bindings
    map("n", "<C-s>", ":w!<CR>", opts)
    map("i", "<C-l>", "<Esc>A", opts)
    map("i", "<C-s>", "<Esc>I", opts)
    map("v", "<leader>ac", ":YodeCreateSeditorFloating<CR>", opts)
    map("n", "<leader>ar", ":YodeCreateSeditorReplace<CR>", opts)
    map("n", "<leader>ad", ":YodeBufferDelete<cr>", opts)
    map("n", "<c-l>", ":FocusSplitNicely<CR>", opts)

    -- Set autocommands
    vim.cmd [[
      augroup packer_conf
        autocmd!
        autocmd bufwritepost plugins.lua source <afile> | PackerSync
      augroup end
    ]]
    vim.api.nvim_create_autocmd("CursorHold", {
      -- buffer = bufnr,
      callback = function()
        local opts1 = {
          focusable = false,
          close_events = {"BufLeave", "CursorMoved", "InsertEnter", "FocusLost"},
          border = 'rounded',
          source = 'always',
          prefix = ' ',
          scope = 'cursor'
        }
        vim.diagnostic.open_float(nil, opts1)
      end
    })
    -- Set commands
    vim.cmd [[
      command! -nargs=* -bang -range -complete=filetype NN
      \ :<line1>,<line2> call nrrwrgn#NrrwRgn('',<q-bang>)
      \ | set filetype=<args>
    ]]
  end
}

return config
