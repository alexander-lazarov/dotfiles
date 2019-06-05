execute pathogen#infect()
syntax on
filetype plugin indent on
set wildignore=*.swp,*.bak,*.pyc,*.class,*.jar,*.gif,*.png,*.jpg
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.idea/*,*/.DS_Store,*/.vscode/*
set wildignore+=*/tmp/*,*/log/*
set showcmd
set number

let g:HardMode_level = 'wannabe'
let g:HardMode_hardmodeMsg = 'Dont use this!'
autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

let g:ctrlp_map = '<c-p>'

:imap jj <Esc>

map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

let g:rspec_command = "!bundle exec rspec --drb {spec}"

let g:vimrubocop_keymap = 0
nmap <Leader>r :RuboCop<CR>

hi MatchParen cterm=underline ctermbg=none ctermfg=none

" git gutter stuff
set updatetime=100
hi GitGutterAdd ctermbg=235 ctermfg=2
hi GitGutterChange ctermbg=235 ctermfg=3
hi GitGutterDelete ctermbg=235 ctermfg=1
hi GitGutterChangeDelete ctermbg=235 ctermfg=5

map y <Plug>(operator-flashy)
nmap Y <Plug>(operator-flashy)$

cnoreabbrev Ack Ack!
nnoremap <Leader>s :Ack!<Space>

" force old regex engine - the new one is slow!
set re=1

" git gutter - always show the sign column
if exists('&signcolumn')  " Vim 7.4.2201
  set signcolumn=yes
else
  let g:gitgutter_sign_column_always = 1
endif

set clipboard+=unnamedplus
