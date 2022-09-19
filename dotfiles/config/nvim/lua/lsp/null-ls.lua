local null_ls_status_ok, null_ls = pcall(require, 'null-ls')
if not null_ls_status_ok then
  vim.notify('Load null-ls failed')
  return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

-- local completion = null_ls.builtins.completion

local codeactions = null_ls.builtins.code_actions

null_ls.setup({
  debug = false,
  sources = {
    -- formatting
    -- eslint_d 和 prettier 的顺序不能反
    formatting.eslint_d,
    formatting.prettierd,
    formatting.stylua,
    formatting.rustfmt,

    -- diagnostics
    diagnostics.eslint_d,

    -- code actions
    codeactions.eslint_d,
    codeactions.gitsigns,
  },
})
