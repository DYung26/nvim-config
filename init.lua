-- ~/.config/nvim/init.lua
print("init.lua loaded")

-- Bootstrap packer.nvim if not installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({
      'git', 'clone', '--depth', '1',
      'https://github.com/wbthomason/packer.nvim', install_path
    })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- Plugin setup
require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'  -- Package manager
  use {
    'nvim-tree/nvim-tree.lua',
    requires = 'nvim-tree/nvim-web-devicons'
  }
  use {
    "williamboman/mason.nvim",           -- LSP installer
    run = ":MasonUpdate"
  }
  use "williamboman/mason-lspconfig.nvim"  -- Mason integration with lspconfig
  use "neovim/nvim-lspconfig"              -- LSP configurations
  use 'ojroques/nvim-osc52'

  if packer_bootstrap then
    require('packer').sync()
  end
end)

-- vim.o.mouse = "" -- disbale mouse

-- _
-- NvimTree config (optional: basic settings)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
require('nvim-tree').setup()

-- Initialize Mason and Mason-LSPConfig
require("mason").setup()
-- Using the Mason hook to automate auto-wiring LSPs with a default setup
--[[
  require("mason-lspconfig").setup_handlers {
  -- Default setup for all installed servers
  function(server_name)
    require("lspconfig")[server_name].setup({})
  end,
}
]]
-- To later override default customizations of LSPs
--[[
require("mason-lspconfig").setup_handlers {
  function(server_name)
    require("lspconfig")[server_name].setup({})
  end,
  ["lua_ls"] = function()
    require("lspconfig").lua_ls.setup({
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
        },
      },
    })
  end,
}
]]
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "pyright" }, -- auto-install
  automatic_installation = true,
})
-- Setup LSP servers with lspconfig
local lspconfig = require("lspconfig")
lspconfig.lua_ls.setup({}) -- Lua
lspconfig.pyright.setup({}) -- Python
lspconfig.ts_ls.setup({}) -- JavaScript/TypeScript
lspconfig.golangci_lint_ls.setup({}) -- golang
lspconfig.jqls.setup({}) -- jq

local osc52 = require('osc52').setup {
  max_length = 0,        -- No limit
  silent = false,
  trim = false,
}

-- Auto copy to system clipboard on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    if vim.v.event.operator == 'y' and vim.v.event.regname == '' then
      require('osc52').copy_register('')
    end
  end,
})

-- vim.o.clipboard = "unnamedplus"
vim.g.clipboard = {
    name = 'win32yank-wsl-fix',
    copy = {
        ['+'] = 'win32yank.exe -i --crlf',
        ['*'] = 'win32yank.exe -i --crlf',
    },
    paste = {
        ['+'] = 'win32yank.exe -o --lf',
        ['*'] = 'win32yank.exe -o --lf',
    },
    cache_enabled = 0,
}

--[[vim.api.nvim_create_user_command("ResizeToLongestLine", function()
  local max_length = 0
  for _, line in ipairs(vim.api.nvim_buf_get_lines(0, 0, -1, false)) do
    local len = vim.fn.strdisplaywidth(line)
    if len > max_length then
      max_length = len
    end
  end
  vim.api.nvim_win_set_width(0, max_length + 2) -- +2 for padding
end, {})

vim.api.nvim_create_user_command("ResizeAllToLongestLine", function()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    local max_length = 0

    for _, line in ipairs(vim.api.nvim_buf_get_lines(buf, 0, -1, false)) do
      local len = vim.fn.strdisplaywidth(line)
      if len > max_length then
        max_length = len
      end
    end

    vim.api.nvim_win_set_width(win, max_length + 2)  -- Add padding
  end
end, {})

vim.api.nvim_create_autocmd({ "BufReadPost", "BufWinEnter" }, {
  pattern = "*",
  callback = function()
    vim.cmd("ResizeToLongestLine")
  end,
})
]]

-- vim.keymap.set(mode, key_combination, command, options)
vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true }) -- toggle file tree with <C-n> -- <leader>n
vim.keymap.set('n', '<C-f>', ':NvimTreeFocus<CR>', { noremap = true, silent = true }) -- toggle file tree with <C-f>
vim.g.mapleader = "\\" -- Set leader
vim.g.maplocalleader = "\\"
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find Files" }) -- <leader>ff to open Telescope find_files
vim.keymap.set("n", "<leader>wl", function()
  if vim.wo.winfixwidth then
    vim.wo.winfixwidth = false
    vim.wo.winfixheight = false
    vim.cmd('echo "🔓 Split Unlocked"')
  else
    vim.wo.winfixwidth = true
    vim.wo.winfixheight = true
    vim.cmd('echo "🔒 Split Locked"')
  end
end, { desc = "Toggle split lock" })

