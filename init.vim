" Directorio de plugins
call plug#begin('~/.local/share/nvim/plugged')

Plug 'sheerun/vim-polyglot' " Highlight
Plug 'ghifarit53/tokyonight-vim' " Coloschema
Plug 'Yggdroot/indentLine' " Lineas en el tabulado
Plug 'psliwka/vim-smoothie' " Movimiento más soft al moverte por un fichero
Plug 'mbbill/undotree' " Mostrar el histórico de cambios hecho en un fichero
Plug 'tpope/vim-commentary' " Comentar lineas de un fichero
Plug 'preservim/nerdtree' " NerdTree
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " Poner bonito NerdTree
Plug 'ryanoasis/vim-devicons' " Poner bonito NerdTree
Plug 'xuyuanp/nerdtree-git-plugin' " Mostrar el estado de los ficheros de git desde NerdTree
Plug 'vim-airline/vim-airline' " Barra inferior y superior al editar un fichero
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " binario fzf (buscador mejorado)
Plug 'junegunn/fzf.vim' " fzf para bim
Plug 'tpope/vim-fugitive' " Lanzar comandos git desde la terminal
Plug 'airblade/vim-gitgutter' " Mostrar cambios hecho en un fichero repositado
Plug 'voldikss/vim-floaterm' " Sacar una terminal desde vim
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Ayuda a la hora de programar con autocompletados
Plug 'hashivim/vim-terraform' " Highlight Terraform
Plug 'easymotion/vim-easymotion' " Locura de buscador


call plug#end()

" Configuracion general, pero que usamos para coc
set encoding=utf-8 " Set internal encoding of vim, not needed on neovim, since coc.nvim using some unicode characters in the file autoload/float.vim
set hidden " TextEdit might fail if hidden is not set.
set cmdheight=2 " Give more space for displaying messages.
set updatetime=300 " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable delays and poor user experience.
set shortmess+=c " Don't pass messages to |ins-completion-menu|.

" Establecemos nuestra map leader a ","
let mapleader = "," " map leader to comma

" Borrar todos los buffers menos el activo pulsando ctrl+p.
" :w - save current buffer
" %bd - close all the buffers
" e# - open last edited file
" bd# - close the unnamed buffer
nnoremap <C-b> :w <bar> %bd <bar> e# <bar> bd# <CR>

set termguicolors " Activa true colors en la terminal
" Configuración para activar y desactivar los numeros relativos.
" También mostrará los numeros relativos en la pestaña de vim que tenga el foco, en las demás será absoluto
map <F3> :set nu! rnu!<CR>
set number
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END
" Fin de la configuración de los números

" tokyonight-vim
let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1 " permitimos que ponga cosas en itálica
let g:airline_theme = "tokyonight" " habilitamos tokyonight en el pluging airline
colorscheme tokyonight " habilitamos el tema tokyonight

" indentLine
let g:indentLine_fileTypeExclude = ['text', 'sh', 'help', 'terminal'] " No mostrar en ciertos tipos de buffers y archivos
let g:indentLine_bufNameExclude = ['NERD_tree.*', 'term:.*'] " No mostrar en ciertos tipos de buffers y archivos

" undotree
nnoremap <F5> :UndotreeToggle<CR>
let g:undotree_WindowLayout = 4 " Stilo 4 de los que hay predeterminados
let g:undotree_SetFocusWhenToggle = 1 " Coger el foco cuando abrimos UndoTree

" nerdtree
let g:NERDTreeChDirMode = 2  " Cambia el directorio actual al nodo padre actual
map <F2> :NERDTreeToggle<CR>
let g:NERDTreeQuitOnOpen = 1 " Cerrar NerdTree al salir del fichero
"let NERDTreeMinimalUI = 1 " disable that old “Press ? for help”.
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

" vim-gitgutter
set updatetime=250 " Actualizar barra cada 250 mili segundos

" vim-floaterm
let g:floaterm_keymap_toggle = '<F12>'
let g:floaterm_width = 0.9 " altura de la pestaña
let g:floaterm_height = 0.9 " anchura de la pestaña

" vim-terraform
let g:terraform_fmt_on_save=1
let g:terraform_align=1

" coc terraform
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()


" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" vim-easymotion
let g:EasyMotion_do_mapping = 0 " Deshabilita valores por defecto
" Buscar un caracter
nmap s <Plug>(easymotion-overwin-f)
let g:EasyMotion_smartcase = 1 " Habilitar case-insensitive en las busquedas
