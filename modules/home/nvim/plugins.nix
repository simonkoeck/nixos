{ config, pkgs, ... }:
{
  config.programs.nixvim = {
    plugins = {
      telescope = {
        enable = true;
        extensions.fzf-native.enable = true;
        settings.defaults = {
          file_ignore_patterns = [ "node_modules/" ".git/" "dist/" ".next/" ".nx/" ];
          mappings.i = {
            "<Esc>" = "close";
          };
        };
        settings.pickers.find_files = {
          find_command = [
            "rg"
            "--no-ignore"
            "--hidden"
            "--files"
            "-g"
            "!**/node_modules/*"
            "-g"
            "!**/.git/*"
          ];
        };
      };

      oil = {
        enable = true;
        settings = {
          default_file_explorer = true;
          columns = [ "size" "icon" ];
          delete_to_trash = true;
          skip_confirm_for_simple_edits = true;
          prompt_save_on_select_new_entry = false;
          lsp_file_methods = {
            enabled = true;
            timeout_ms = 1000;
            autosave_changes = true;
          };
          watch_for_changes = true;
          keymaps = {
            t = "actions.parent";
          };
          view_options = {
            show_hidden = true;
          };
        };
      };

      supermaven = {
        enable = true;
        settings = {
          keymaps = {
            accept_suggestion = "<C-j>";
            clear_suggestion = "<C-]>";
            accept_word = "<C-]>";
          };
          log_level = "off";
        };
      };

      gitsigns = {
        enable = true;
      };

      nvim-autopairs.enable = true;

      ts-autotag = {
        enable = true;
        settings.opts = {
          enable_close = true;
          enable_rename = true;
          enable_close_on_slash = true;
        };
      };

      mini = {
        enable = true;
        modules = {
          move = { };
        };
      };

      neoscroll = {
        enable = true;
        settings = {
          mappings = [
            "<C-u>"
            "<C-d>"
            "<C-b>"
            "<C-f>"
            "<C-y>"
            "<C-e>"
            "zt"
            "zz"
            "zb"
          ];
          hide_cursor = true;
          stop_eof = true;
          respect_scrolloff = false;
          cursor_scrolls_alone = true;
          duration_multiplier = 0.35;
          easing = "linear";
          performance_mode = false;
          ignored_events = [ "WinScrolled" "CursorMoved" ];
        };
      };

      conform-nvim = {
        enable = true;
        settings = {
          formatters_by_ft = {
            lua = [ "stylua" ];
            python = [ "ruff_fix" "ruff_format" "ruff_organize_imports" ];
            rust = [ "rustfmt" ];
            javascript = [ "biome" ];
            typescript = [ "biome" ];
            javascriptreact = [ "biome" ];
            typescriptreact = [ "biome" ];
          };
        };
      };

      lualine = {
        enable = true;
      };

      barbar = {
        enable = true;
      };

      commentary.enable = true;
      fugitive.enable = true;
      vim-surround.enable = true;
      vim-multiple-cursors.enable = true;

      treesitter = {
        enable = true;
        settings = {
          highlight.enable = true;
          indent.enable = true;
        };
      };

      web-devicons.enable = true;
      indent-blankline.enable = true;
      auto-session.enable = true;

      nvim-cmp = {
        enable = true;
        autoEnableSources = true;
        settings.sources = [
          { name = "nvim_lsp"; }
          { name = "path"; }
          { name = "buffer"; }
        ];
      };

      none-ls.enable = false;

      lint = {
        enable = true;
        lintersByFt = {
          javascript = [ "eslint" ];
          typescript = [ "eslint" ];
        };
      };

      treesitter-refactor = {
        enable = true;
        highlight_definitions.enable = true;
      };

      nvim-lightbulb.enable = true;

      coc-nvim.enable = false;

      fzf = {
        enable = true;
      };

      emmet.enable = true;

      system-copy.enable = true;

      markview.enable = true;

      vim-suda.enable = true;
    };

    extraPlugins = with pkgs.vimPlugins; [
      vim-javascript
      far-vim
      vim-prisma
      gruvbox-material
      nvim-lspconfig
      vim-wakatime
    ];
  };
}
