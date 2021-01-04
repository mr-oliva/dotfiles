local util = {}
-- https://neovim.io/doc/user/lua.html#lua-vim-variables
-- https://github.com/willelz/nvim-lua-guide-ja/blob/master/README.ja.md
local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

util.opt = function (scope, key, value)
    scopes[scope][key] = value
    if scope ~= 'o' then scopes['o'][key] = value end
end

util.map = function (mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

return util
