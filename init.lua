-- =====================================================================
-- ==================== READ THIS BEFORE CONTINUING ====================
-- =====================================================================
-- ========                                    .-----.          ========
-- ========         .----------------------.   | === |          ========
-- ========         |.-""""""""""""""""""-.|   |-----|          ========
-- ========         ||                    ||   | === |          ========
-- ========         ||   KICKSTART.NVIM   ||   |-----|          ========
-- ========         ||                    ||   | === |          ========
-- ========         ||                    ||   |-----|          ========
-- ========         ||:Tutor              ||   |:::::|          ========

-- ========         `"")----------------(""`   ___________      ========
-- ========        /::::::::::|  |::::::::::\  \ no mouse \     ========
-- ========       /:::========|  |==hjkl==:::\  \ required \    ========
-- ========      '""""""""""""'  '""""""""""""'  '""""""""""'   ========
-- ========                                                     ========
-- =====================================================================
-- =====================================================================

require 'core.options'
require 'core.keymaps'
require 'core.snippets'

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require('lazy').setup({
  -- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
  'NMAC427/guess-indent.nvim', -- Detect tabstop and shiftwidth automatically
  require 'plugins.gitsigns',
  require 'plugins.whichkey',
  require 'plugins.telescope',
  require 'plugins.lsp',
  require 'plugins.autocompletion',
  require 'plugins.colortheme',
  -- -- Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },
  require 'plugins.mini',
  require 'plugins.treesitter',
  require 'plugins.none-ls',
  require 'kickstart.plugins.debug',
  -- require 'kickstart.plugins.indent_line',
  -- require 'kickstart.plugins.lint',
  -- require 'kickstart.plugins.autopairs',
  require 'kickstart.plugins.neo-tree',

  -- require 'kickstart.plugins.gitsigns', -- adds gitsigns recommend keymaps
  -- Replaced with none-ls
  -- -- { -- Autoformat
  -- --   'stevearc/conform.nvim',
  -- --   event = { 'BufWritePre' },
  -- --   cmd = { 'ConformInfo' },
  -- --   keys = {
  -- --     {
  -- --       '<leader>f',
  -- --       function()
  -- --         require('conform').format { async = true, lsp_format = 'fallback' }
  -- --       end,
  -- --       mode = '',
  -- --       desc = '[F]ormat buffer',
  -- --     },
  -- --   },
  -- --   opts = {
  -- --     notify_on_error = false,
  -- --     format_on_save = function(bufnr)
  -- --       -- Disable "format_on_save lsp_fallback" for languages that don't
  -- --       -- have a well standardized coding style. You can add additional
  -- --       -- languages here or re-enable it for the disabled ones.
  -- --       local disable_filetypes = { c = true, cpp = true }
  -- --       if disable_filetypes[vim.bo[bufnr].filetype] then
  -- --         return nil
  -- --       else
  -- --         return {
  -- --           timeout_ms = 500,
  -- --           lsp_format = 'fallback',
  -- --         }
  -- --       end
  -- --     end,
  -- --     formatters_by_ft = {
  -- --       lua = { 'stylua' },
  -- --       -- Conform can also run multiple formatters sequentially
  -- --       -- python = { "isort", "black" },
  -- --       --
  -- --       -- You can use 'stop_after_first' to run the first available formatter from the list
  -- --       -- javascript = { "prettierd", "prettier", stop_after_first = true },
  -- --     },
  -- --   },
  -- -- },

  -- For additional information with loading, sourcing and examples see `:help lazy.nvim-🔌-plugin-spec`
  -- Or use telescope!
  -- In normal mode type `<space>sh` then write `lazy.nvim-plugin`
  -- you can continue same window with `<space>sr` which resumes last telescpe search
}, {

  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      ask = '📌',
      lazy = '💤 ',
    },
  },
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
