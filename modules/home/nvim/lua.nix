{ config, pkgs, ... }:
{
  config.programs.nixvim.extraConfigLua = ''
    -- Load snippets
    require("luasnip.loaders.from_vscode").lazy_load()

    -- Format on save
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*",
      callback = function(args)
        require("conform").format({ bufnr = args.buf })
      end,
    })

    -- LSP servers
    vim.lsp.config("nixd", {})
    vim.lsp.config("ts_ls", {
      filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
      root_dir = vim.fs.root(0, { "package.json", "tsconfig.json", ".git" }),
      settings = {
        typescript = {
          inlayHints = {
            includeInlayParameterNameHints = "all",
            includeInlayFunctionParameterTypeHints = true,
            includeInlayVariableTypeHints = true,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
          },
        },
      },
    })
    vim.lsp.config("tailwindcss", {
      filetypes = { "html", "css", "scss", "javascript", "javascriptreact", "typescript", "typescriptreact" },
      root_dir = vim.fs.root(0, { "tailwind.config.js", "tailwind.config.ts", "postcss.config.js", "postcss.config.ts", ".git" }),
    })

    -- Enable LSP servers on file open
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
      callback = function(args)
        vim.lsp.enable("ts_ls", "tailwindcss")
      end,
    })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "nix" },
      callback = function(args)
        vim.lsp.enable("nixd")
      end,
    })

    -- Configure diagnostics to show virtual text
    vim.diagnostic.config({
      virtual_text = true,
      signs = true,
      underline = true,
      update_in_insert = false,
      severity_sort = true,
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

        if client.server_capabilities.hoverProvider then
          vim.keymap.set("n", "K", function()
            vim.lsp.buf.hover()
          end, { buffer = bufnr, desc = "Show hover info", silent = true })
        end

        if client.server_capabilities.codeActionProvider then
          vim.keymap.set("n", "<leader>ca", function()
            vim.lsp.buf.code_action()
          end, { buffer = bufnr, desc = "Code actions", silent = true })
        end

        if client.server_capabilities.renameProvider then
          vim.keymap.set("n", "<leader>rn", function()
            vim.lsp.buf.rename()
          end, { buffer = bufnr, desc = "Rename", silent = true })
        end
      end,
    })

    -- Load telescope-cc extension
    pcall(function()
      require("telescope").load_extension("conventional_commits")
    end)
  '';
}
