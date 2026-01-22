{ config, pkgs, ... }:
{
   config.programs.nixvim.extraConfigVim = ''
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

    " Commands
    command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, <bang>0)
    command Reload :source $MYVIMRC

    " Detect Indentation
    augroup DetectIndent
       autocmd!
       autocmd BufReadPost *  DetectIndent
    augroup END

    " Restore cursor on exit
    augroup RestoreCursorShapeOnExit
        autocmd!
        autocmd VimLeave * set guicursor=a:ver20-blinkwait400-blinkoff400-blinkon400
    augroup END

    " Tmux color fixes
    if exists('$TMUX')
        let &t_8f = "<Esc>[38;2;%lu;%lu;%lum"
        let &t_8b = "<Esc>[48;2;%lu;%lu;%lum"
    endif

    " Rg command for FZF
    command! -bang -nargs=* Rg
      \ call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1,
      \   fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)

    " Detect Indentation
    augroup DetectIndent
       autocmd!
       autocmd BufReadPost *  DetectIndent
    augroup END

    " Restore cursor on exit
    augroup RestoreCursorShapeOnExit
        autocmd!
        autocmd VimLeave * set guicursor=a:ver20-blinkwait400-blinkoff400-blinkon400
    augroup END

    " Tmux color fixes
    if exists('$TMUX')
        let &t_8f = "<Esc>[38;2;%lu;%lu;%lum"
        let &t_8b = "<Esc>[48;2;%lu;%lu;%lum"
    endif
  '';
}
