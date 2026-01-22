{ config, pkgs, ... }:
{
  config.programs.nixvim.keymaps = [
    {
      key = "<leader>m";
      action = ":";
      mode = "";
      options.silent = true;
    }
    {
      key = "<leader>o";
      action = ":ex ~/";
      mode = "";
      options.silent = true;
    }
    {
      key = "<C-c>";
      action = ":noh<CR>";
      mode = "n";
      options.silent = true;
    }
    {
      key = "<S-q>";
      action = ":qa!<CR>";
      mode = "";
      options.silent = true;
    }
    {
      key = "<leader>s";
      action = ":silent write<CR>";
      mode = "n";
      options.silent = true;
    }
    {
      key = "jk";
      action = "<ESC>";
      mode = "i";
    }
    {
      key = "<c-s>";
      action = "<Esc>:w<CR>a";
      mode = "i";
    }
    {
      key = "<S-h>";
      action = "0";
      mode = "v";
    }
    {
      key = "<S-l>";
      action = "$";
      mode = "v";
    }
    {
      key = "<Tab>";
      action = ">gv";
      mode = "v";
    }
    {
      key = "<S-Tab>";
      action = "<gv";
      mode = "v";
    }
    {
      key = "<leader><space>";
      action = "<cmd>Telescope find_files<CR>";
      mode = "n";
      options.silent = true;
    }
    {
      key = "<leader>fg";
      action = "<cmd>Telescope live_grep<CR>";
      mode = "n";
      options.silent = true;
    }
    {
      key = "<leader>fh";
      action = "<cmd>Telescope help_tags<CR>";
      mode = "n";
      options.silent = true;
    }
    {
      key = "<leader>fj";
      action = "<cmd>Telescope buffers<CR>";
      mode = "n";
      options.silent = true;
    }
    {
      key = "<leader>fl";
      action = ":Oil --float<CR>";
      mode = "n";
      options.silent = true;
    }
    {
      key = "<leader>bf";
      action = "<cmd>Telescope buffers<CR>";
      mode = "n";
      options.silent = true;
    }
    {
      key = "<leader>bb";
      action = "<cmd>Telescope buffers<CR>";
      mode = "n";
      options.silent = true;
    }
    {
      key = "<leader>ff";
      action = ":Rg<CR>";
      mode = "n";
      options.silent = true;
    }
    {
      key = "<leader>fr";
      action = ":Farr<CR>";
      mode = "n";
      options.silent = true;
    }
    {
      key = "<leader>rr";
      action.__raw = "function() vim.cmd('source $MYVIMRC') end";
      mode = "n";
      options.silent = true;
    }
    {
      key = "<leader>gg";
      action.__raw = "function() vim.cmd('tab G') end";
      mode = "n";
      options.silent = true;
    }
    {
      key = "<leader>gb";
      action.__raw = "function() vim.cmd('Git blame') end";
      mode = "n";
      options.silent = true;
    }
    {
      key = "<leader>ga";
      action.__raw = "function() vim.cmd('G add .') end";
      mode = "n";
      options.silent = true;
    }
    {
      key = "<leader>gp";
      action.__raw = "function() vim.cmd('G push') end";
      mode = "n";
      options.silent = true;
    }
    {
      key = "<leader>y";
      action.__raw = "function() vim.cmd('!xdg-open %') end";
      mode = "n";
      options.silent = true;
    }
    {
      key = "<leader>x";
      action.__raw = "function() vim.cmd('!xdg-open %:h') end";
      mode = "n";
      options.silent = true;
    }
    {
      key = "<Esc>";
      action = ":if &filetype ==# 'fzf' | execute 'normal! \\<Esc>' | else | execute 'normal! \\<c-\\>\\<c-n>' | endif<CR>";
      mode = "t";
    }
    {
      key = "jk";
      action = ":if &filetype ==# 'fzf' | execute 'normal! \\<Esc>' | else | execute 'normal! \\<c-\\>\\<c-n>' | endif<CR>";
      mode = "t";
    }
  ];

  config.programs.nixvim.keymapsLua = [
    {
      mode = "n";
      key = "<leader>h";
      action.__raw = "function() vim.cmd('wincmd h') end";
    }
    {
      mode = "n";
      key = "<leader>j";
      action.__raw = "function() vim.cmd('wincmd j') end";
    }
    {
      mode = "n";
      key = "<leader>k";
      action.__raw = "function() vim.cmd('wincmd k') end";
    }
    {
      mode = "n";
      key = "<leader>l";
      action.__raw = "function() vim.cmd('wincmd l') end";
    }
    {
      mode = "n";
      key = "<leader>wv";
      action.__raw = "function() vim.cmd('vs') end";
      options.silent = true;
    }
    {
      mode = "n";
      key = "<leader>wh";
      action.__raw = "function() vim.cmd('split') end";
      options.silent = true;
    }
    {
      mode = "n";
      key = "<leader>ws";
      action.__raw = "function() vim.cmd('split') end";
      options.silent = true;
    }
    {
      mode = "n";
      key = "<leader>wd";
      action.__raw = "function() vim.cmd('close') end";
      options.silent = true;
    }
    {
      mode = "n";
      key = "<leader>wc";
      action.__raw = "function() vim.cmd('close') end";
      options.silent = true;
    }
    {
      mode = "n";
      key = "<leader>wq";
      action.__raw = "function() vim.cmd('close') end";
      options.silent = true;
    }
  ];
}
