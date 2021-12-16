call plug#begin()
	Plug 'neovim/nvim-lsp'
	Plug 'neovim/nvim-lspconfig'
	Plug 'folke/lsp-colors.nvim'
	Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
	Plug 'morhetz/gruvbox'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
	Plug 'rust-lang/rust.vim'
call plug#end()

" Gruvbox Theme Config
let g:gruvbox_contrast_dark = 'hard'
if exists('+termguicolors')
    let &t_8f = "\<ESC[38;2;%lu;%lu;%lum"
    let &t_8b = "\<ESC[38;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection='0'
colorscheme gruvbox
set background=dark
let g:airline_theme='gruvbox'

" LSP
lua << EOF
local coq = require'coq'
require'lspconfig'.gopls.setup{ coq.lsp_ensure_capabilities() }
EOF
autocmd VimEnter * COQnow

" Airline Config
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" Simple Config Commands
syntax on
set cursorline
set hidden
set number
set inccommand=split
set mouse=a
set clipboard+=unnamedplus
set shiftwidth=4
set cursorline

" Markdown Configs
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = ''
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
   \ 'mkit': {},
   \ 'katex': {},
   \ 'uml': {},
   \ 'maid': {},
   \ 'disable_sync_scroll': 0,
   \ 'sync_scroll_type': 'middle',
   \ 'hide_yaml_meta': 1,
   \ 'sequence_diagrams': {},
   \ 'flowchart_diagrams': {}
   \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'
