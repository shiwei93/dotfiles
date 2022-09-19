local options = {
  backup = false, -- creates a backup file
  clipboard = 'unnamedplus', -- allows neovim to access the system clipboard
  cmdheight = 1, -- keep status bar position close to bottom
  completeopt = { 'menuone', 'noselect' }, -- mostly just for cmp
  conceallevel = 0, -- so that `` is visible in markdown files
  fileencoding = 'utf-8', -- the encoding written to a file
  hlsearch = true, -- highlight all matches on previous search pattern
  ignorecase = true, -- ignore case in search patterns
  mouse = 'a', -- allow the mouse to be used in neovim
  pumheight = 10, -- pop up menu height
  showmode = false, -- we don't need to see things like -- INSERT -- anymore
  showtabline = 2, -- always show tabs
  smartcase = true, -- smart case
  smartindent = true, -- make indenting smarter again
  autoindent = true,
  splitbelow = true, -- force all horizontal splits to go below current window
  splitright = true, -- force all vertical splits to go to the right of current window
  swapfile = false, -- creates a swapfile
  termguicolors = true, -- set term gui colors (most terminals support this)
  timeoutlen = 200, -- time to wait for a mapped sequence to complete (in milliseconds)
  ttimeoutlen = 10,
  undofile = true, -- enable persistent undo
  updatetime = 100, -- faster completion (4000ms default)
  writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true, -- convert tabs to spaces
  shiftwidth = 4, -- the number of spaces inserted for each indentation
  tabstop = 4, -- insert 2 spaces for a tab
  cursorline = true, -- highlight the current line
  cursorcolumn = false, -- cursor column.
  number = true, -- set numbered lines
  relativenumber = true, -- set relative numbered lines
  numberwidth = 4, -- set number column width to 2 {default 4}
  signcolumn = 'yes', -- always show the sign column, otherwise it would shift the text each time
  wrap = true, -- display lines as one long line
  wrapmargin = 8,
  linebreak = true,
  showbreak = '﬌ ',
  scrolloff = 8, -- keep 8 height offset from above and bottom
  sidescrolloff = 8, -- keep 8 width offset from left and right
  guifont = 'monospace:h17', -- the font used in graphical neovim applications
  foldexpr = 'nvim_treesitter#foldexpr()',
  foldenable = false, -- no fold to be applied when open a file
  foldlevel = 99, -- if not set this, fold will be everywhere
  spell = false, -- add spell support
  spelllang = { 'en_us' }, -- support which languages?
  diffopt = 'vertical,filler,internal,context:4', -- vertical diff split view
  cscopequickfix = 's-,c-,d-,i-,t-,e-', -- cscope output to quickfix window
}

vim.opt.shortmess:append('c')

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd('set whichwrap+=<,>,[,],h,l')
vim.cmd([[set iskeyword+=-]])
