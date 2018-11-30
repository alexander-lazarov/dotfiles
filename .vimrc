execute pathogen#infect()
syntax on
filetype plugin indent on
set wildignore=*.swp,*.bak,*.pyc,*.class,*.jar,*.gif,*.png,*.jpg
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.idea/*,*/.DS_Store,*/.vscode/*
set wildignore+=*/tmp/*,*/log/*
set showcmd
set number
set mouse+=a

let g:HardMode_level = 'wannabe'
let g:HardMode_hardmodeMsg = 'Dont use this!'
autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

let g:ctrlp_map = '<c-p>'

:imap jj <Esc>

:nnoremap <Leader>t :w<CR> :!mzscheme %:t<CR>
:nnoremap <Leader>l :set list!<CR>

let g:vimrubocop_keymap = 0
nmap <Leader>r :RuboCop<CR>

