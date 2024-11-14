-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local neoscroll = require("neoscroll")
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("n", "x", '"_x')
-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")
-- -- Delete a word backwards
keymap.set("n", "dw", 'vb"_d')
-- -- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")
-- -- Disable continuations
-- keymap.set("n", "<Leader>", "o<Esc>^Da", opts)
-- keymap.set("n", "<Leader>O", "O<Esc>^Da", opts)
--
-- -- Jumplist
keymap.set("n", "<C-m>", "<C-i>", opts)
--
-- -- New tab
keymap.set("n", "te", ":tabedit")
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)
-- -- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)
-- -- Move window
-- keymap.set("n", "sh", "<C-w>h")
-- keymap.set("n", "sk", "<C-w>k")
-- keymap.set("n", "sj", "<C-w>j")
-- keymap.set("n", "sl", "<C-w>l")
--
-- -- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

local scrollKeymap = {
  -- Use the "sine" easing function
  ["<C-u>"] = function()
    neoscroll.ctrl_u({ duration = 250 })
  end,
  ["<C-d>"] = function()
    neoscroll.ctrl_d({ duration = 250 })
  end,
  -- Use the "circular" easing function
  ["<C-b>"] = function()
    neoscroll.ctrl_b({ duration = 450 })
  end,
  ["<C-f>"] = function()
    neoscroll.ctrl_f({ duration = 450 })
  end,
  -- When no value is passed the `easing` option supplied in `setup()` is used
  ["<C-y>"] = function()
    neoscroll.scroll(-0.1, { move_cursor = false, duration = 100 })
  end,
  ["<C-e>"] = function()
    neoscroll.scroll(0.1, { move_cursor = false, duration = 100 })
  end,
}
local modes = { "n", "v", "x" }
for key, func in pairs(scrollKeymap) do
  keymap.set(modes, key, func)
end
