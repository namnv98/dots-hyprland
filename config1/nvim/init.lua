vim.opt.number = true     -- Hiển thị số dòng  
vim.opt.relativenumber = true  -- Hiển thị số dòng tương đối  
vim.opt.tabstop = 4       -- Kích thước tab  
vim.opt.shiftwidth = 4
vim.opt.expandtab = true  -- Chuyển tab thành spaces  
vim.opt.mouse = "a"       -- Cho phép dùng chuột

vim.opt.termguicolors = true
-- nền hoàn toàn trong suốt cùng mầu với terminal
vim.api.nvim_set_hl(0, "Normal", {guibg=NONE, ctermbg=NONE})

-- Gán phím tắt Ctrl + n để mở/tắt NvimTree
vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- nạp lazy.nvim đúng cách
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Thêm các plugin vào đây

  -- Plugin cho coc.nvim
  {
    "neoclide/coc.nvim",
    branch = "release",
    config = function()
      -- Cấu hình coc.nvim bằng Lua
      vim.opt.completeopt = {'menuone', 'noinsert', 'noselect'}

      -- Dùng Lua để ánh xạ phím
      vim.api.nvim_set_keymap('i', '<Tab>', "coc#refresh()", { silent = true, expr = true })
      vim.api.nvim_set_keymap('i', '<S-Tab>', "coc#select_prev_item()", { silent = true, expr = true })
    end,
  },

  -- Plugin nvim-tree.lua
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup()
    end,
  },

  -- Plugin coc-java cho Java
  {
    "neoclide/coc-java",
    config = function()
      -- Cấu hình coc-java (nếu cần thiết)
      -- coc-java sẽ tự động nhận cấu hình từ coc.nvim nếu đã cài đặt
    end,
  },

  -- Các plugin khác có thể thêm vào đây
})

