require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  incremental_selection = {
    enable = true,
    disable = {},
    keymaps = {},
  },
  rainbow = {
    enable = true,
    disable = {'bash'}
  },
  refactor = {
    highlight_defintions = {
      enable = true
    },
    smart_rename = {
      enable = false,
    },
    navigation = {
      enable = false,
    }
  },
  textobjects = { -- syntax-aware textobjects
    enable = true,
    disable = {},
    keymaps = {},
  },
  ensure_installed = 'all'
}
