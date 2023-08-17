return {
  opt = {
    conceallevel = 2, -- enable conceal
    list = true, -- show whitespace characters
    listchars = { tab = "│→", extends = "⟩", precedes = "⟨", trail = "·", nbsp = "␣" },
    showbreak = "↪ ",
    showtabline = (vim.t.bufs and #vim.t.bufs > 1) and 2 or 1,
    spellfile = vim.fn.expand "~/.config/nvim/lua/user/spell/en.utf-8.add",
    swapfile = false,
    thesaurus = vim.fn.expand "~/.config/nvim/lua/user/spell/mthesaur.txt",
    wrap = false, -- soft wrap lines
  },
  g = {
    resession_enabled = true,
    user_emmet_leader_key = ",",
    user_emmet_mode = "n",
    mapleader = ",",
  },
  vim.opt.iskeyword:append { "-" },
  vim.api.nvim_set_keymap("x", "p", "pgvy", { noremap = true }),
}
