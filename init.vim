call plug#begin()
	Plug 'neovim/nvim-lsp'
	Plug 'neovim/nvim-lspconfig'
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	Plug 'folke/lsp-colors.nvim'
	Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
	Plug 'morhetz/gruvbox'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
	Plug 'https://github.com/joaoofreitas/vim-godebug', {'branch' : 'feat/experimental'}
	Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
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
require'lspconfig'.pyright.setup{ coq.lsp_ensure_capabilities() }
require'lspconfig'.ccls.setup{ coq.lsp_ensure_capabilities() }

EOF
autocmd VimEnter * COQnow

" Treesitter
lua << EOF
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "c", "lua", "rust" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { "javascript" },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = { "c", "rust" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

EOF

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
