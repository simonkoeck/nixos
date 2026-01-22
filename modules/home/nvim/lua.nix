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

    -- TypeScript LSP setup
    local lspconfig = require("lspconfig")

    lspconfig.tsserver.setup({
      filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
      root_dir = function(fname)
        return vim.fn.find_git_ancestor(fname, { ".git", ".." })
      end,
      settings = {
        typescript = {
          inlayHints = {
            includeInlayParameterNameHints = true,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayVariableTypeHints = true,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
          },
        },
      },
      init_options = {
        preferences = {
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
        },
      },
    })

    -- ESLint LSP
    lspconfig.eslint.setup({
      root_dir = function(fname)
        return vim.fn.find_git_ancestor(fname, { ".git", ".." })
      end,
      settings = {
        validate = "on",
        run = "onType",
        codeActionOnSave = {
          enable = true,
          mode = "all",
        },
      },
      on_attach = function(client, bufnr)
        vim.api.nvim_create_autocmd("BufWritePre", {
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format({ bufnr = bufnr })
          end,
        })
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
  '';
}
