-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt

opt.formatoptions:remove({ "c", "r", "o" })

-- https://github.com/LazyVim/LazyVim/discussions/2150
vim.g.root_spec = {
  "cwd",
}

vim.g.lazyvim_statuscolumn = {
  folds_open = true, -- show fold sign when fold is open
  folds_githl = false, -- highlight fold sign with git sign color
}

-- fix 'no information available' on hover if no result and empty markdowns
vim.lsp.handlers["textDocument/hover"] = function(_, result, ctx, config)
  config = config
    or {
      border = {
        { "╭", "Comment" },
        { "─", "Comment" },
        { "╮", "Comment" },
        { "│", "Comment" },
        { "╯", "Comment" },
        { "─", "Comment" },
        { "╰", "Comment" },
        { "│", "Comment" },
      },
    }

  config.focus_id = ctx.method

  if not (result and result.contents) then
    return
  end

  local markdown_lines = vim.split(result.contents.value, "\n", { trimempty = false })

  if vim.tbl_isempty(markdown_lines) then
    return
  end

  return vim.lsp.util.open_floating_preview(markdown_lines, "markdown", config)
end
