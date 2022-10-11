local config = {

  -- Configure AstroNvim updates
  updater = {
    remote = "origin", -- remote to use
    channel = "nightly", -- "stable" or "nightly"
    version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "main", -- branch name (NIGHTLY ONLY)
    commit = nil, -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false, -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_reload = false, -- automatically reload and sync packer after a successful update
    auto_quit = false -- automatically quit the current session after a successful update
    -- remotes = { -- easily add new remotes to track
    --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
    --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
    --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    -- },
  },

  -- Set colorscheme to use
  colorscheme = "catppuccin",

  -- Add highlight groups in any theme
  highlights = {
    -- init = { -- this table overrides highlights in all themes
    --   Normal = { bg = "#000000" },
    -- }
    -- duskfox = { -- a table of overrides/changes to the duskfox theme
    --   Normal = { bg = "#000000" },
    -- },
  },

  -- set vim options here (vim.<first_key>.<second_key> =  value)
  options = {
    opt = {
      -- set to true or false etc.
      relativenumber = true, -- sets vim.opt.relativenumber
      number = true, -- sets vim.opt.number
      spell = false, -- sets vim.opt.spell
      signcolumn = "auto", -- sets vim.opt.signcolumn to auto
      wrap = false -- sets vim.opt.wrap
    },
    g = {
      mapleader = " ", -- sets vim.g.mapleader
      python3_host_prog = "/usr/bin/python3",
      matchup_matchparen_deferred = 1,
      cmp_enabled = true,
      autopairs_enabled = true, -- enable autopairs at start
      diagnostics_enabled = true, -- enable diagnostics at start
      status_diagnostics_enabled = true, -- enable diagnostics in statusline
      catppuccin_flavour = "mocha"
    }
  },
  -- If you need more control, you can use the function()...end notation
  -- options = function(local_vim)
  --   local_vim.opt.relativenumber = true
  --   local_vim.g.mapleader = " "
  --   local_vim.opt.whichwrap = vim.opt.whichwrap - { 'b', 's' } -- removing option from list
  --   local_vim.opt.shortmess = vim.opt.shortmess + { I = true } -- add to option list
  --
  --   return local_vim
  -- end,

  -- Set dashboard header
  header = {
    " █████  ███████ ████████ ██████   ██████",
    "██   ██ ██         ██    ██   ██ ██    ██",
    "███████ ███████    ██    ██████  ██    ██",
    "██   ██      ██    ██    ██   ██ ██    ██",
    "██   ██ ███████    ██    ██   ██  ██████",
    " ",
    "    ███    ██ ██    ██ ██ ███    ███",
    "    ████   ██ ██    ██ ██ ████  ████",
    "    ██ ██  ██ ██    ██ ██ ██ ████ ██",
    "    ██  ██ ██  ██  ██  ██ ██  ██  ██",
    "    ██   ████   ████   ██ ██      ██"
  },

  -- Default theme configuration
  default_theme = {
    -- Modify the color palette for the default theme
    colors = {fg = "#abb2bf", bg = "#1e222a"},
    highlights = function(hl) -- or a function that returns a new table of colors to set
      local C = require("default_theme.colors")

      hl.Normal = {fg = C.fg, bg = C.bg}

      -- New approach instead of diagnostic_style
      hl.DiagnosticError.italic = true
      hl.DiagnosticHint.italic = true
      hl.DiagnosticInfo.italic = true
      hl.DiagnosticWarn.italic = true

      return hl
    end,
    -- enable or disable highlighting for extra plugins
    plugins = {
      aerial = true,
      beacon = false,
      bufferline = true,
      dashboard = true,
      highlighturl = true,
      hop = false,
      indent_blankline = true,
      lightspeed = false,
      ["neo-tree"] = true,
      notify = true,
      ["nvim-tree"] = false,
      ["nvim-web-devicons"] = true,
      rainbow = true,
      symbols_outline = false,
      telescope = true,
      vimwiki = false,
      ["which-key"] = true
    }
  },

  -- Disable AstroVim ui features
  -- ui = {nui_input = true, telescope_select = true},

  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {virtual_text = true, underline = true},

  -- Extend LSP configuration
  lsp = {
    -- enable servers that you already have installed without mason
    servers = {
      -- "pyright"
    },

    -- skip lsp setup because rust-tools will do it itself
    skip_setup = {"rust_analyzer", "tsserver"},

    formatting = {
      format_on_save = false, -- enable or disable auto formatting on save
      disabled = { -- disable formatting capabilities for the listed clients
        "elixirls",
        "rust_analyzer"
        -- "sumneko_lua",
      }
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- easily add or disable built in mappings added during LSP attaching
    mappings = {
      n = {
        -- ["<leader>lf"] = false -- disable formatting keymap
      }
    },

    -- add to the global LSP on_attach function
    -- on_attach = function(client, bufnr)
    -- end,

    -- override the mason server-registration function
    -- server_registration = function(server, opts)
    -- end,

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

  -- Mapping data with "desc" stored directly by vim.keymap.set().
  -- Please use this mappings table to set keyboard mapping since this is the
  -- lower level configuration and more robust one. (which-key will
  -- automatically pick-up stored data by this setting.)
  mappings = {
    n = {
      ["<leader>ws"] = {"<C-w>s", desc = "horizontal split window"},
      ["<leader>wv"] = {"<C-w>v", desc = "vertical split window"},
      ["<leader>wh"] = {"<C-w>h", desc = "left window"},
      ["<leader>wj"] = {"<C-w>j", desc = "below window"},
      ["<leader>wl"] = {"<C-w>l", desc = "right window"},
      ["<leader>wk"] = {"<C-w>k", desc = "up window"},
      ["<leader>ww"] = {"<cmd>WindowPick<cr>", desc = "window pick"},

      ["<leader>jn"] = {"<cmd>TestNearest<cr>", desc = "test near"},
      ["<leader>jf"] = {"<cmd>TestFile<cr>", desc = "test file"},
      ["<leader>ja"] = {"<cmd>TestSuite<cr>", desc = "test all"},
      ["<leader>jl"] = {"<cmd>TestLast<cr>", desc = "test last"},
      ["<leader>jv"] = {"<cmd>TestVisit<cr>", desc = "test visit"},

      ["<leader>fW"] = {
        function()
          require("telescope.builtin").live_grep({
            additional_args = function(args) return vim.list_extend(args, {"--hidden"}) end
          })
        end,
        desc = "Search words in all files"
      },

      ["<C-s>"] = {":w!<cr>", desc = "Save File"}
    },
    t = {
      -- setting a mapping to false will disable it
      -- ["<esc>"] = false,
    }
  },

  -- Configure plugins
  plugins = {

    -- Add plugins, the packer syntax without the "use"
    init = {
      ["hrsh7th/cmp-buffer"] = {
        config = function()
          astronvim.add_user_cmp_source({
            name = "buffer",
            option = {get_bufnrs = function() return vim.api.nvim_list_bufs() end}
          })
        end
      },
      {
        "jose-elias-alvarez/typescript.nvim",
        after = "mason-lspconfig.nvim",
        config = function()
          require("typescript").setup({server = astronvim.lsp.server_settings("tsserver")})
        end
      },
      {
        "catppuccin/nvim",
        as = "catppuccin",
        run = ":CatppuccinCompile",
        config = function()
          local colors = require("catppuccin.palettes").get_palette()
          colors.none = "NONE"
          require("catppuccin").setup({
            dim_inactive = {enabled = true, shade = "dark", percentage = 0.25},
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
            compile = {enabled = true, path = vim.fn.stdpath("cache") .. "/catppuccin"},
            integrations = {
              mini = true,
              leap = true,
              which_key = true,
              ts_rainbow = true,
              aerial = false
            }
          })
        end
      },
      {"h-hg/fcitx.nvim"},
      {"sjava/yode-nvim", config = function() require("yode-nvim").setup({}) end},
      {
        "echasnovski/mini.nvim",
        config = function()
          require("mini.cursorword").setup()
          require("mini.misc").setup()
        end
      },
      {
        "the-argus/twilight.nvim",
        config = function() require("twilight").setup({expand = {"do_block"}}) end
      },
      {
        "anuvyklack/windows.nvim",
        requires = {"anuvyklack/middleclass", "anuvyklack/animation.nvim"},
        config = function()
          require("windows").setup({autowidth = {enable = true, winwidth = 1.3}})
        end
      },
      {"anuvyklack/pretty-fold.nvim", config = function() require("pretty-fold").setup() end},
      {"ten3roberts/window-picker.nvim", config = function() require("window-picker").setup({}) end},
      {"vim-test/vim-test"},
      {"andymass/vim-matchup"},
      {"mg979/vim-visual-multi", branch = "master"},
      {"elixir-editors/vim-elixir"},
      {"chemzqm/wxapp.vim"},
      {"linty-org/readline.nvim"},
      {"nacro90/numb.nvim", config = function() require("numb").setup() end},
      {"ggandor/leap.nvim", config = function() require("leap").set_default_keymaps() end},
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
        after = {"copilot.lua"},
        config = function()
          require("copilot_cmp").setup({method = "getCompletionsCycling", clear_after_cursor = true})
          astronvim.add_cmp_source({name = "copilot", priority = 1500, group_index = 2})

          local has_words_before = function()
            if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
            local line, col = unpack(vim.api.nvim_win_get_cursor(0))
            return col ~= 0 and
                     vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") ==
                     nil
          end
          local cmp = require("cmp")
          cmp.setup({
            mapping = {
              ["<Tab>"] = vim.schedule_wrap(function(fallback)
                if cmp.visible() and has_words_before() then
                  cmp.select_next_item({behavior = cmp.SelectBehavior.Select})
                else
                  fallback()
                end
              end)
            }
          })
        end
      },
      {"sbdchd/neoformat"},
      {"wellle/targets.vim"},
      {
        "ray-x/lsp_signature.nvim",
        -- event = "BufRead",
        config = function() require("lsp_signature").setup() end
      },
      {
        "Saecki/crates.nvim",
        after = "nvim-cmp",
        config = function()
          require("crates").setup()

          local cmp = require("cmp")
          local config = cmp.get_config()
          table.insert(config.sources, {name = "crates"})
          cmp.setup(config)
        end
      },
      {
        "simrat39/rust-tools.nvim",
        after = "mason-lspconfig.nvim", -- make sure to load after mason-lspconfig
        config = function()
          require("rust-tools").setup({
            server = astronvim.lsp.server_settings("rust_analyzer") -- get the server settings and built in capabilities/on_attach
          })
        end
      },
      {"bkad/CamelCaseMotion"},
      {
        "RRethy/nvim-treesitter-textsubjects",
        after = "nvim-treesitter",
        config = function()
          require("nvim-treesitter.configs").setup({
            textsubjects = {
              enable = true,
              prev_selection = ",",
              keymaps = {
                ["."] = "textsubjects-smart",
                [";"] = "textsubjects-container-outer",
                ["i;"] = "textsubjects-container-inner"
              }
            }
          })
        end
      }
    },
    colorizer = {{"*", "!toggleterm", "!packer"}},
    ["null-ls"] = function(config)
      local null_ls = require("null-ls")
      local parsers = {javascript = "babel", scss = "scss", json = "json", html = "html"}
      -- Check supported formatters and linters
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
      config.sources = {
        -- Set a formatter
        null_ls.builtins.formatting.mix.with({args = {"format", "-"}}),
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.lua_format,
        null_ls.builtins.formatting.rustfmt,
        null_ls.builtins.formatting.prettier.with({
          extra_args = function(params)
            local parser = parsers[params.ft]
            if parser then return {"--parser", parsers[params.ft]} end
          end
        }), -- Set a linter
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
      config.debug=true
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
        "volar",
        "tailwindcss",
        "cssls",
        "html",
        "jsonls"
      }
    },
    -- use mason-tool-installer to configure DAP/Formatters/Linter installation
    ["mason-tool-installer"] = {ensure_installed = {"prettier", "stylua", "black"}},
    lspkind = {symbol_map = {Copilot = ""}}
  },

  -- LuaSnip Options
  luasnip = {
    -- Add paths for including more VS Code style snippets in luasnip
    vscode_snippet_paths = {},
    -- Extend filetypes
    filetype_extend = {
      -- javascript = { "javascriptreact" },
    }
  },

  -- CMP Source Priorities
  -- modify here the priorities of default cmp sources
  -- higher value == higher priority
  -- The value can also be set to a boolean for disabling default sources:
  -- false == disabled
  -- true == 1000
  cmp = {source_priority = {nvim_lsp = 1000, luasnip = 750, buffer = 500, path = 250}},

  -- Modify which-key registration (Use this with mappings table in the above.)
  ["which-key"] = {
    register = {n = {["<leader>"] = {["w"] = {name = "Windows"}, ["j"] = {name = "test"}}}}
  },

  -- This function is run last
  -- good place to configure mappings and vim options
  polish = function()
    local opts = {noremap = true, silent = true}
    local map = vim.api.nvim_set_keymap

    vim.api.nvim_del_keymap("n", "<leader>w")

    -- neoformat config
    vim.g["neoformat_javascript_prettier"] = {
      exe = "prettier",
      stdin = 1,
      args = {"--stdin-filepath", '"%:p"', "--parser", "babel"}
    }
    vim.g["neoformat_json_prettier"] = {
      exe = "prettier",
      stdin = 1,
      args = {"--stdin-filepath", '"%:p"', "--parser", "json"}
    }
    vim.g["neoformat_html_prettier"] = {
      exe = "prettier",
      stdin = 1,
      args = {"--stdin-filepath", '"%:p"', "--parser", "html"}
    }
    vim.g["neoformat_wxml_prettier"] = {
      exe = "prettier",
      stdin = 1,
      args = {"--stdin-filepath", '"%:p"', "--parser", "html"}
    }
    vim.g["neoformat_enabled_wxml"] = {"prettier"}
    vim.g["neoformat_enabled_html"] = {"prettier"}

    -- set nrrw config
    vim.g["nrrw_rgn_vert"] = 1
    vim.g["nrrw_rgn_resize_window"] = "relative"

    -- set vim-test config
    vim.g["shtuff_receiver"] = "devrunner"
    vim.g["test#strategy"] = "shtuff"

    local readline = require("readline")
    vim.keymap.set("!", "<M-f>", readline.forward_word)
    vim.keymap.set("!", "<M-b>", readline.backward_word)
    vim.keymap.set("!", "<C-a>", readline.beginning_of_line)
    vim.keymap.set("!", "<C-e>", readline.end_of_line)
    vim.keymap.set("!", "<M-d>", readline.kill_word)
    vim.keymap.set("!", "<C-w>", readline.backward_kill_word)
    vim.keymap.set("!", "<C-k>", readline.kill_line)
    vim.keymap.set("!", "<C-u>", readline.backward_kill_line)
    vim.keymap.set("!", "<C-d>", "<Delete>") -- delete-char
    vim.keymap.set("!", "<C-h>", "<BS>") -- backward-delete-char
    vim.keymap.set("!", "<C-f>", "<Right>") -- forward-char
    vim.keymap.set("!", "<C-b>", "<Left>") -- backward-char
    vim.keymap.set("!", "<C-n>", "<Down>") -- next-line
    vim.keymap.set("!", "<C-p>", "<Up>") -- previous-line

    -- Set autocommands
    vim.api.nvim_create_augroup("packer_conf", {clear = true})
    vim.api.nvim_create_autocmd("BufWritePost", {
      desc = "Sync packer after modifying plugins.lua",
      group = "packer_conf",
      pattern = "plugins.lua",
      command = "source <afile> | PackerSync"
    })

    vim.api.nvim_create_autocmd("TermOpen", {
      pattern = "*",
      command = "lua vim.b.minicursorword_disable = true"
    })

    vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"},
                                {pattern = {"*.mpx"}, command = "set ft=vue"})

    vim.api.nvim_create_autocmd({"FileType"}, {pattern = "wxml", command = "set ft=html"})

    vim.cmd([[
      command! -nargs=* -bang -range -complete=filetype NN
      \ call luaeval("require('yode-nvim').createSeditorReplace(_A[1], _A[2])", [<line1>, <line2>])
      \ | set filetype=<args>
    ]])
  end
}

return config
