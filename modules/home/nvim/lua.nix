{ config, pkgs, ... }:
{
  config.programs.nixvim.extraConfigLua = ''
    -- Format on save
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*",
      callback = function(args)
        require("conform").format({ bufnr = args.buf })
      end,
    })

    -- LSP keymaps
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local bufnr = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)

        if client.server_capabilities.definitionProvider then
          vim.keymap.set("n", "gd", function()
            vim.lsp.buf.definition()
          end, { buffer = bufnr, desc = "Go to definition", silent = true })
        end

        if client.server_capabilities.referencesProvider then
          vim.keymap.set("n", "gr", function()
            vim.lsp.buf.references()
          end, { buffer = bufnr, desc = "Go to references", silent = true })
        end
      end,
    })

    -- Load telescope-cc extension
    pcall(function()
      require("telescope").load_extension("conventional_commits")
    end)
  '';
}
