{ config, pkgs, ... }:
{
  config.programs.nixvim.extraConfigVim = ''
    " Set leader key
    let mapleader = " "

    " Colorscheme
    colorscheme gruvbox-material

    " Emmet settings
    let g:user_emmet_expandabbr_key='<C-q>'
    let g:user_emmet_settings = {
        \    'html' : {
        \        'indentation' : '  '
        \    },
        \   'javascript' : {
        \        'extends' : 'jsx',
        \   },
        \   'typescript' : {
        \        'extends' : 'tsx',
        \   },
        \}

    " System copy settings
    let g:system_copy_silent = 1
    let g:system_copy#copy_command='wl-copy'
    let g:system_copy#paste_command='wl-paste'

    " FAR settings
    let g:far#enable_undo=1
    let g:far#source  = 'rg'
    let g:far#mode_open = { "regex": 0, "case_sensitive": 1, "word": 0, "substitute": 0 }

    " FZF settings
    let g:fzf_vim = {}

    " Augment settings
    let g:augment_workspace_folders = ["~/dev/otark"]

    " Filetype detection
    autocmd BufNewFile,BufRead *.ejs set filetype=html
  '';
}
