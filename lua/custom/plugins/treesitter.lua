-- ~/.config/nvim/lua/custom/plugins/init.lua

return {
  {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    dependencies = {
      'windwp/nvim-ts-autotag', -- Autotag dependency
    },
    config = function()
      require('nvim-treesitter.configs').setup {
        modules = {}, -- Placeholder to avoid warning
        ignore_install = {}, -- Empty table if you don't want to ignore any parsers
        ensure_installed = { 'c', 'lua', 'vim', 'python', 'html' }, -- Parsers to install
        sync_install = false, -- Install languages asynchronously
        auto_install = true, -- Automatically install missing parsers

        indent = { enable = true },
        highlight = {
          enable = true, -- Enable syntax highlighting
          use_languagetree = true,
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = 'ss', -- Start incremental selection
            node_incremental = 'sn', -- Increment to the next node
            scope_incremental = 'sc', -- Increment to the next scope (e.g., function or class)
            node_decremental = 'ds', -- Decrement selection
          },
        },
      }

      -- Separate setup for nvim-ts-autotag
      require('nvim-ts-autotag').setup {
        filetypes = {
          'html',
          'javascript',
          'typescript',
          'javascriptreact',
          'typescriptreact',
          'svelte',
          'vue',
          'tsx',
          'jsx',
          'rescript',
          'css',
          'lua',
          'xml',
          'php',
          'markdown',
        },
      }
    end,
  },
}
