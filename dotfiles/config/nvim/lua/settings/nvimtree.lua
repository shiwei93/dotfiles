-- setup with all defaults
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
-- nested options are documented by accessing them with `.` (eg: `:help nvim-tree.view.mappings.list`).
require('nvim-tree').setup({ -- BEGIN_DEFAULT_OPTS
  auto_reload_on_write = true,
  create_in_closed_folder = false,
  disable_netrw = false,
  hijack_cursor = false,
  hijack_netrw = true,
  hijack_unnamed_buffer_when_opening = false,
  ignore_buffer_on_setup = false,
  open_on_setup = false,
  open_on_setup_file = false,
  open_on_tab = false,
  sort_by = 'name',
  update_cwd = false,
  reload_on_bufenter = false,
  respect_buf_cwd = true, -- 找了半天这个选项, 和session_manager 配合可以切换项目，nvim_tree 也会跟着切换
  view = {
    adaptive_size = false,
    width = 36,
    hide_root_folder = true,
    side = 'left',
    preserve_window_proportions = false,
    number = false,
    relativenumber = false,
    signcolumn = 'yes',
    mappings = {
      custom_only = false,
      list = {
        -- customize
        { key = 's', action = 'vsplit' },
        { key = 'o', action = 'edit_no_picker' },
        { key = '?', action = 'toggle_help' },
        { key = 'zc', action = 'collapse_all' },
        { key = 'd', action = 'remove' },
        { key = 'D', action = 'trash' },
        -- default key bindings
        -- { key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" },
        { key = '<C-e>', action = 'edit_in_place' },
        -- { key = {"O"},                          action = "edit_no_picker" },
        { key = '<C-v>', action = 'vsplit' },
        { key = '<C-x>', action = 'split' },
        { key = '<C-t>', action = 'tabnew' },
        { key = '<', action = 'prev_sibling' },
        { key = '>', action = 'next_sibling' },
        { key = 'P', action = 'parent_node' },
        { key = '<BS>', action = 'close_node' },
        { key = '<Tab>', action = 'preview' },
        { key = 'K', action = 'first_sibling' },
        { key = 'J', action = 'last_sibling' },
        { key = 'I', action = 'toggle_git_ignored' },
        { key = 'H', action = 'toggle_dotfiles' },
        { key = 'R', action = 'refresh' },
        { key = 'a', action = 'create' },
        -- { key = "d", action = "remove" },
        -- { key = "D", action = "trash" },
        { key = 'r', action = 'rename' },
        { key = '<C-r>', action = 'full_rename' },
        { key = 'x', action = 'cut' },
        { key = 'c', action = 'copy' },
        { key = 'p', action = 'paste' },
        { key = 'y', action = 'copy_name' },
        { key = 'Y', action = 'copy_path' },
        { key = 'gy', action = 'copy_absolute_path' },
        { key = '[c', action = 'prev_git_item' },
        { key = ']c', action = 'next_git_item' },
        { key = '-', action = 'dir_up' },
        -- { key = "s",                            action = "system_open" },
        { key = 'q', action = 'close' },
        -- { key = "g?", action = "toggle_help" },
        -- { key = "W", action = "collapse_all" },
        { key = 'S', action = 'search_node' },
        { key = '<C-k>', action = 'toggle_file_info' },
        { key = '.', action = 'run_file_command' },
      },
    },
  },
  renderer = {
    add_trailing = false,
    group_empty = false,
    highlight_git = false,
    highlight_opened_files = 'none',
    root_folder_modifier = ':~',
    indent_markers = {
      enable = true,
      icons = {
        corner = '└ ',
        edge = '│ ',
        item = '│ ',
        none = '  ',
      },
    },
    icons = {
      webdev_colors = true,
      git_placement = 'before',
      padding = ' ',
      symlink_arrow = ' ➛ ',
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },
      glyphs = {
        default = '',
        symlink = '',
        folder = {
          arrow_closed = '',
          arrow_open = '',
          default = '',
          open = '',
          empty = '',
          empty_open = '',
          symlink = '',
          symlink_open = '',
        },
        git = {
          unstaged = '✗',
          staged = '✓',
          unmerged = '',
          renamed = '➜',
          untracked = '★',
          deleted = '',
          ignored = '◌',
        },
      },
    },
    special_files = { 'Cargo.toml', 'Makefile', 'README.md', 'readme.md' },
  },
  hijack_directories = {
    enable = true,
    auto_open = true,
  },
  update_focused_file = {
    enable = false,
    update_cwd = false,
    ignore_list = {},
  },
  ignore_ft_on_setup = {},
  system_open = {
    cmd = '',
    args = {},
  },
  diagnostics = {
    enable = false,
    show_on_dirs = false,
    icons = {
      hint = '',
      info = '',
      warning = '',
      error = '',
    },
  },
  filters = {
    dotfiles = false,
    custom = {
      '.DS_Store',
    },
    exclude = {},
  },
  filesystem_watchers = {
    enable = true,
    debounce_delay = 100,
  },
  git = {
    enable = true,
    ignore = true,
  },
  actions = {
    use_system_clipboard = true,
    change_dir = {
      enable = true,
      global = false,
      restrict_above_cwd = false,
    },
    expand_all = {
      max_folder_discovery = 300,
    },
    open_file = {
      quit_on_open = false,
      resize_window = true,
      window_picker = {
        enable = true,
        chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890',
        exclude = {
          filetype = { 'notify', 'packer', 'qf', 'diff', 'fugitive', 'fugitiveblame' },
          buftype = { 'nofile', 'terminal', 'help' },
        },
      },
    },
    remove_file = {
      close_window = true,
    },
  },
  trash = {
    cmd = 'trash',
    require_confirm = true,
  },
  log = {
    enable = false,
    truncate = false,
    types = {
      all = false,
      config = false,
      copy_paste = false,
      diagnostics = false,
      git = false,
      profile = false,
      watcher = false,
    },
  },
}) -- END_DEFAULT_OPTS)

local utils = require('nvim-tree.utils')

local function notify_level(level)
  return function(msg)
    vim.schedule(function()
      vim.api.nvim_echo({ { msg, 'WarningMsg' } }, false, {})
    end)
  end
end

utils.notify.warn = notify_level(vim.log.levels.WARN)
utils.notify.error = notify_level(vim.log.levels.ERROR)
utils.notify.info = notify_level(vim.log.levels.INFO)
utils.notify.debug = notify_level(vim.log.levels.DEBUG)
