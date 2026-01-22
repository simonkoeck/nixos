{ config, pkgs, ... }:
{
  config.programs.nixvim.extraConfigLua = ''
    -- Custom functions
    function CheckBackspace()
      local col = vim.fn.col(".") - 1
      return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") == nil
    end

    function CheckBackspace()
      local col = vim.fn.col(".") - 1
      return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") == nil
    end

    -- Format on save
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*",
      callback = function(args)
        require("conform").format({ bufnr = args.buf })
      end,
    })
  '';
}
