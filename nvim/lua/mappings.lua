require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })

vim.keymap.set('n', '<leader>cd', function()
  local buf_path = vim.fn.expand('%:p:h')
  if buf_path ~= '' then
    vim.cmd('cd ' .. buf_path)
    print('Changed directory to: ' .. buf_path)
  else
    print('Buffer has no file path!')
  end
end, { desc = "Change CWD to buffer directory" })


-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
