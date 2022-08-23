local config = {

  -- Set colorscheme
  colorscheme = "catppuccin",

  -- set vim options here (vim.<first_key>.<second_key> =  value)
  options = {
    opt = {
      relativenumber = true -- sets vim.opt.relativenumber
    },
    g = {
      mapleader = " ", -- sets vim.g.mapleader
      python3_host_prog = "/usr/bin/python3",
      matchup_matchparen_deferred = 1,
      catppuccin_flavour = "macchiato"
    }
  },

  -- Disable AstroVim ui features
  ui = {nui_input = true, telescope_select = true},

  -- Configure plugins
  plugins = {

    -- Add plugins, the packer syntax without the "use"
    init = {
      -- { "andweeb/presence.nvim" },
      ["hrsh7th/cmp-buffer"] = {
        config = function()
          astronvim.add_user_cmp_source({
            name = "buffer",
            option = {get_bufnrs = function() return vim.api.nvim_list_bufs() end}
          })
        end
      },
      {
        "catppuccin/nvim",
        as = "catppuccin",
        run = ":CatppuccinCompile",
        config = function()
          local colors = require("catppuccin.palettes").get_palette()
          colors.none = "NONE"
          require("catppuccin").setup {
            dim_inactive = {enabled = true, shade = "dark", percentage = 0.15},
            custom_highlights = {
              Comment = {fg = colors.overlay1},
              LineNr = {fg = colors.overlay1},
              -- CursorLine = {bg = colors.none},
              CursorLineNr = {fg = colors.lavender},
              DiagnosticVirtualTextError = {bg = colors.none},
              DiagnosticVirtualTextWarn = {bg = colors.none},
              DiagnosticVirtualTextInfo = {bg = colors.none},
              DiagnosticVirtualTextHint = {bg = colors.none}
            },
            compile = {enabled = true, path = vim.fn.stdpath "cache" .. "/catppuccin"},
            integrations = {leap = true, which_key = true, ts_rainbow = true, aerial = false}
          }
        end
      },
      {
        "the-argus/twilight.nvim",
        config = function() require("twilight").setup {expand = {"do_block"}} end
      },
      {"Pocco81/true-zen.nvim", config = function() require("true-zen").setup {} end},
      {'anuvyklack/pretty-fold.nvim', config = function() require('pretty-fold').setup() end},
      {"ten3roberts/window-picker.nvim", config = function() require("window-picker").setup({}) end},
      {"vim-test/vim-test"},
      {"andymass/vim-matchup"},
      {"mg979/vim-visual-multi", branch = "master"},
      {"elixir-editors/vim-elixir"},
      {"chemzqm/wxapp.vim"},
      {"rainbowhxch/beacon.nvim"},
      {"linty-org/readline.nvim"},
      {'nacro90/numb.nvim', config = function() require('numb').setup() end},
      {'ggandor/leap.nvim', config = function() require('leap').set_default_keymaps() end},
      {
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function() require("nvim-surround").setup({}) end
      },
      {
        "zbirenbaum/copilot.lua",
        event = {"VimEnter"},
        config = function() vim.defer_fn(function() require("copilot").setup() end, 100) end
      },
      {
        "zbirenbaum/copilot-cmp",
        module = "copilot_cmp",
        config = function() astronvim.add_cmp_source({name = "copilot", priority = 700}) end
      },
      {"chrisbra/NrrwRgn"},
      {"sbdchd/neoformat"},
      {"wellle/targets.vim"},
      {
        "ray-x/lsp_signature.nvim",
        event = "BufRead",
        config = function() require("lsp_signature").setup() end
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
      {"simrat39/rust-tools.nvim"}, -- Text objects
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
    colorizer = {{"*", "!toggleterm", "!packer"}},
    ["null-ls"] = function(config)
      local null_ls = require "null-ls"
      local parsers = {javascript = "babel", scss = "scss", json = "json", html = "html"}
      -- Check supported formatters and linters
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
      config.sources = {
        -- Set a formatter
        null_ls.builtins.formatting.mix,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.lua_format,
        null_ls.builtins.formatting.rustfmt,
        null_ls.builtins.formatting.prettier.with({
          extra_args = function(params) return {"--parser", parsers[params.ft]} end
        }),
        -- Set a linter
        null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.diagnostics.credo
      }
      -- set up null-ls's on_attach function
      -- config.on_attach = function(client)
      --   -- NOTE: You can remove this on attach function to disable format on save
      --   if client.resolved_capabilities.document_formatting then
      --     vim.api.nvim_create_autocmd("BufWritePre", {
      --       desc = "Auto format before save",
      --       pattern = "<buffer>",
      --       callback = vim.lsp.buf.formatting_sync,
      --     })
      --   end
      -- end
      return config -- return final config table
    end,

    -- All other entries override the setup() call for default plugins
    treesitter = {ensure_installed = {"lua"}},
    -- use mason-lspconfig to configure LSP installations
    ["mason-lspconfig"] = {
      ensure_installed = {
        "sumneko_lua",
        "pyright",
        "tsserver",
        "rust_analyzer",
        "elixirls",
        "cssls",
        "html",
        "jsonls"
      }
    },
    -- use mason-tool-installer to configure DAP/Formatters/Linter installation
    ["mason-tool-installer"] = {ensure_installed = {"prettier", "stylua", "black"}},
    packer = {compile_path = vim.fn.stdpath "config" .. "/lua/packer_compiled.lua"}
  },

  -- Add paths for including more VS Code style snippets in luasnip
  luasnip = {vscode_snippet_paths = {}},

  -- Modify which-key registration
  ["which-key"] = {
    -- Add bindings to the normal mode <leader> mappings
    register_mappings = {
      n = {
        ["<leader>"] = {
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
        }
      }
    }
  },
  -- cmp = {source_priority = {nvim_lsp = 1000, luasnip = 750, buffer = 500, path = 250}},

  -- Extend LSP configuration
  lsp = {
    servers = {},

    -- add to the server on_attach function
    on_attach = function(client, bufnr)
      if client.name == "elixirls" or client.name == "rust_analyzer" then
        client.resolved_capabilities.document_formatting = false
      end
    end,

    -- override the lsp installer server-registration function
    server_registration = function(server, opts)
      if server == "rust_analyzer" then
        require("rust-tools").setup({
          server = vim.tbl_deep_extend("force", {standalone = true}, opts)
        })
      else
        require("lspconfig")[server].setup(opts)
      end
    end,

    -- Add overrides for LSP server settings, the keys are the name of the server
    ["server-settings"] = {
      -- pyright = {
      --   cmd = {
      --     vim.fn.stdpath("data") .. "/mason/packages/pyright/node_modules/.bin/pyright-langserver",
      --     "--stdio"
      --   }
      -- },
      -- tsserver = {
      --   cmd = {
      --     vim.fn.stdpath("data") ..
      --       "/mason/packages/typescript-language-server/node_modules/.bin/typescript-language-server",
      --     "--stdio"
      --   }
      -- }
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

  -- This function is run last
  -- good place to configure mappings and vim options
  polish = function()
    local opts = {noremap = true, silent = true}
    local map = vim.api.nvim_set_keymap

    vim.api.nvim_del_keymap("n", "<leader>w")

    -- true-zen.nvim key map
    map("n", "<leader>zn", ":TZNarrow<CR>", {})
    map("v", "<leader>zn", ":'<,'>TZNarrow<CR>", {})
    map("n", "<leader>zf", ":TZFocus<CR>", {})
    map("n", "<leader>zm", ":TZMinimalist<CR>", {})
    map("n", "<leader>za", ":TZAtaraxis<CR>", {})

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

    -- set nrrw config
    vim.g['nrrw_rgn_vert'] = 1
    vim.g['nrrw_rgn_resize_window'] = "relative"

    -- set vim-test config
    vim.g['shtuff_receiver'] = "devrunner"
    vim.g['test#strategy'] = "shtuff"

    -- Set key bindings
    map("n", "<C-s>", ":w!<CR>", opts)

    local readline = require 'readline'
    vim.keymap.set('!', '<M-f>', readline.forward_word)
    vim.keymap.set('!', '<M-b>', readline.backward_word)
    vim.keymap.set('!', '<C-a>', readline.beginning_of_line)
    vim.keymap.set('!', '<C-e>', readline.end_of_line)
    vim.keymap.set('!', '<M-d>', readline.kill_word)
    vim.keymap.set('!', '<C-w>', readline.backward_kill_word)
    vim.keymap.set('!', '<C-k>', readline.kill_line)
    vim.keymap.set('!', '<C-u>', readline.backward_kill_line)
    vim.keymap.set('!', '<C-d>', '<Delete>') -- delete-char
    vim.keymap.set('!', '<C-h>', '<BS>') -- backward-delete-char
    vim.keymap.set('!', '<C-f>', '<Right>') -- forward-char
    vim.keymap.set('!', '<C-b>', '<Left>') -- backward-char
    vim.keymap.set('!', '<C-n>', '<Down>') -- next-line
    vim.keymap.set('!', '<C-p>', '<Up>') -- previous-line

    -- Set autocommands
    vim.api.nvim_create_augroup("packer_conf", {clear = true})
    vim.api.nvim_create_autocmd("BufWritePost", {
      desc = "Sync packer after modifying plugins.lua",
      group = "packer_conf",
      pattern = "plugins.lua",
      command = "source <afile> | PackerSync"
    })

    vim.api.nvim_create_autocmd({"FileType"}, {pattern = "wxml", command = "set ft=html"})

    -- Set commands
    vim.cmd [[
      command! -nargs=* -bang -range -complete=filetype NN
      \ :<line1>,<line2> call nrrwrgn#NrrwRgn('',<q-bang>)
      \ | set filetype=<args>
    ]]
  end
}

return config
