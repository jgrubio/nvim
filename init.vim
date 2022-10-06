" Opciones de plugins necesarias antes de su carga
let g:polyglot_disabled = ['markdown'] " Deshabilitamos markdown en polyglot

" Directorio de plugins
call plug#begin('~/.local/share/nvim/plugged')

Plug 'sheerun/vim-polyglot' " Highlight
Plug 'folke/tokyonight.nvim', { 'branch': 'main' } " Coloschema
Plug 'Yggdroot/indentLine' " Lineas en el tabulado
Plug 'psliwka/vim-smoothie' " Movimiento más soft al moverte por un fichero
Plug 'tpope/vim-commentary' " Comentar lineas de un fichero
Plug 'preservim/nerdtree' " NerdTree
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " Poner bonito NerdTree
Plug 'ryanoasis/vim-devicons' " Poner bonito NerdTree
Plug 'xuyuanp/nerdtree-git-plugin' " Mostrar el estado de los ficheros de git desde NerdTree
Plug 'vim-airline/vim-airline' " Barra inferior y superior al editar un fichero
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " binario fzf (buscador mejorado)
Plug 'junegunn/fzf.vim' " fzf para vim
Plug 'tpope/vim-fugitive' " Lanzar comandos git desde la terminal
Plug 'lewis6991/gitsigns.nvim' " Mostrar cambios hechos en un fichero repositado
Plug 'voldikss/vim-floaterm' " Sacar una terminal desde vim
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Ayuda a la hora de programar con autocompletados
Plug 'hashivim/vim-terraform' " Highlight Terraform
Plug 'easymotion/vim-easymotion' " Locura de buscador
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' } " Markdown preview and highlight
Plug 'lukas-reineke/indent-blankline.nvim' " Identacion con colores

call plug#end()

" Configuracion general, pero que usamos para coc
set encoding=utf-8 " Set internal encoding of vim, not needed on neovim, since coc.nvim using some unicode characters in the file autoload/float.vim
set hidden " TextEdit might fail if hidden is not set.
set cmdheight=1 " Give more space for displaying messages.
set updatetime=300 " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable delays and poor user experience.
set shortmess+=c " Don't pass messages to |ins-completion-menu|.
set number " Habilitamos numeros
set cursorline " habilitar resaltado por fila

" Establecemos nuestra map leader a ","
let mapleader = "," " map leader to comma

" Borrar todos los buffers menos el activo pulsando ctrl+p.
" :w - save current buffer
" %bd - close all the buffers
" e# - open last edited file
" bd# - close the unnamed buffer
nnoremap <C-b> :w <bar> %bd <bar> e# <bar> bd# <CR>

set termguicolors " Activa true colors en la terminal
" Configuración para activar y desactivar los numeros de cada linea.
map <F3> :set nu!<CR>
" Fin de la configuración de los números

" tokyonight-vim
colorscheme tokyonight-night " habilitamos el tema tokyonight

" indentLine
let g:indentLine_fileTypeExclude = ['text', 'sh', 'help', 'terminal'] " No mostrar en ciertos tipos de buffers y archivos
let g:indentLine_bufNameExclude = ['NERD_tree.*', 'term:.*'] " No mostrar en ciertos tipos de buffers y archivos

" nerdtree
let g:NERDTreeChDirMode = 2  " Cambia el directorio actual al nodo padre actual
map <F2> :NERDTreeToggle<CR>
let g:NERDTreeQuitOnOpen = 1 " Cerrar NerdTree al salir del fichero
" let NERDTreeMinimalUI = 1 " disable that old “Press ? for help”.
let NERDTreeDirArrows = 1
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif " Cerrar NerdTree si solo queda NerdTree abierto

" nerdtree-git-plugin
let g:NERDTreeGitStatusUseNerdFonts = 1 " Permitir que nerdtree-git-plugin use las fuentes de NerdFont

" vim-airline
let g:airline#extensions#tabline#enabled = 1  " Mostrar buffers abiertos (como pestañas)
let g:airline#extensions#tabline#fnamemod = ':t'  " Mostrar sólo el nombre del archivo
let g:airline_powerline_fonts = 1 " Cargar fuente Powerline y símbolos (ver nota)
set noshowmode  " No mostrar el modo actual (ya lo muestra la barra de estado)

" fzf.vim
let g:fzf_commands_expect = 'alt-enter' " Ejecutar comandos con alt-enter :Commands
let g:fzf_history_dir = '~/.local/share/fzf-history' " Guardar historial de búsquedas
nnoremap <C-p> :Files<CR>
nnoremap <C-f> :Ag<CR>

" vim-floaterm
let g:floaterm_keymap_toggle = '<F12>'
let g:floaterm_width = 0.9 " altura de la pestaña
let g:floaterm_height = 0.9 " anchura de la pestaña

" vim-terraform
let g:terraform_fmt_on_save=1
let g:terraform_align=1

" coc terraform
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" vim-easymotion
let g:EasyMotion_do_mapping = 0 " Deshabilita valores por defecto
" Buscar un caracter
nmap s <Plug>(easymotion-overwin-f)
let g:EasyMotion_smartcase = 1 " Habilitar case-insensitive en las busquedas

" MarkdownPreview
let g:mkdp_port = '6969' " markdown-preview MarkdownPreview - Options use a custom port to start server or empty for random
let g:mkdp_page_title = '「${name}」' " preview page title ${name} will be replace with the file name
let g:mkdp_filetypes = ['markdown'] " recognized filetypes these filetypes will have MarkdownPreview... commands
let g:mkdp_theme = 'light' " set default theme (dark or light)
map <F4> :MarkdownPreview<CR>

" Gitsigns
map <F5> :Gitsigns preview_hunk<CR>

" Luaconfig
lua << EOF
require("indent_blankline").setup {
    space_char_blankline = " ",
    how_end_of_line = false,
    show_end_of_line = true,
}

require('gitsigns').setup {
  signs = {
    add          = {hl = 'GitSignsAdd'   , text = '│', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
    change       = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
  },
  signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
  numhl      = true, -- Toggle with `:Gitsigns toggle_numhl`
  linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    interval = 1000,
    follow_files = true
  },
  attach_to_untracked = true,
  current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
  },
  current_line_blame_formatter = '  //  <author>, <author_time:%Y-%m-%d> - <summary>',
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000, -- Disable if file is longer than this (in lines)
  preview_config = {
    -- Options passed to nvim_open_win
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
  yadm = {
    enable = false
  },
}
EOF
