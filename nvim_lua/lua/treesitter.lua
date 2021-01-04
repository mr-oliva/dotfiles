require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  rainbow = {
    enable = true,
    disable = {'bash'} -- please disable bash until I figure #1 out
  },
  incremental_selection = {
    enable = true,
    disable = {},
    keymaps = {},
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
    keymaps = {}
  },
  ensure_installed = 'all'
}
