return {
  'ThePrimeagen/harpoon',
  event = 'VimEnter',
  opts = { save_on_toggle = true },
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    pcall(require('telescope').load_extension, 'harpoon')

    -- vim.keymap.set("n", "<leader>sm", ":Telescope harpoon marks<CR>", { desc = "[S]earch Harpoon [M]arks" })
    vim.keymap.set('n', '<leader>hm', ":lua require('harpoon.ui').toggle_quick_menu()<CR>", { desc = '[H]arpoon Toggle [M]enu' })
    vim.keymap.set('n', '<leader>ha', ":lua require('harpoon.mark').add_file()<CR>", { desc = '[H]arpoon [A]dd Mark' })
    vim.keymap.set('n', '<leader>hn', ":lua require('harpoon.ui').nav_next()<CR>", { desc = '[H]arpoon [N]ext Mark' })
    vim.keymap.set('n', '<leader>hp', ":lua require('harpoon.ui').nav_prev()<CR>", { desc = '[H]arpoon [P]revious Mark' })
  end,
}
