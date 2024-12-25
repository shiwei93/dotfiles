local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    -- lang
    { import = "lazyvim.plugins.extras.lang.go" },
    { import = "lazyvim.plugins.extras.lang.docker" },
    { import = "lazyvim.plugins.extras.lang.tailwind" },
    { import = "lazyvim.plugins.extras.lang.typescript" },
    { import = "lazyvim.plugins.extras.lang.vue" },
    { import = "lazyvim.plugins.extras.lang.prisma" },
    { import = "lazyvim.plugins.extras.lang.json" },
    { import = "lazyvim.plugins.extras.lang.markdown" },
    -- coding
    -- { import = "lazyvim.plugins.extras.coding.nvim-cmp" },
    { import = "lazyvim.plugins.extras.coding.neogen" },
    { import = "lazyvim.plugins.extras.coding.luasnip" },
    -- ui
    { import = "lazyvim.plugins.extras.ui.indent-blankline" },
    { import = "lazyvim.plugins.extras.ui.treesitter-context" },
    -- linting
    { import = "lazyvim.plugins.extras.linting.eslint" },
    -- editor
    { import = "lazyvim.plugins.extras.editor.navic" },
    { import = "lazyvim.plugins.extras.editor.aerial" },
    { import = "lazyvim.plugins.extras.editor.inc-rename" },
    -- dap
    { import = "lazyvim.plugins.extras.dap.core" },
    -- test
    { import = "lazyvim.plugins.extras.test.core" },
    -- formatting
    { import = "lazyvim.plugins.extras.formatting.prettier" },
    -- utils
    { import = "lazyvim.plugins.extras.util.dot" },

    -- lang
    { import = "plugins.extras.lang.sql" },
    { import = "plugins.extras.lang.cspell" },
    { import = "plugins.extras.lang.emmet" },
    { import = "plugins.extras.lang.astro" },
    -- coding
    { import = "plugins.extras.coding.codeium" },
    -- formatting
    { import = "plugins.extras.format.conform" },

    -- import/override with your plugins
    { import = "plugins" },
  },
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  install = { colorscheme = { "catppuccin" } },
  checker = {
    enabled = false, -- check for plugin updates periodically
    notify = false, -- notify on update
  }, -- automatically check for plugin updates
  change_detection = {
    enabled = false,
  },
  ui = {
    border = "rounded",
  },
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
