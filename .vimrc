call plug#begin('~/.vim/plugged')
" utils
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'editorconfig/editorconfig-vim'
Plug 'vim-airline/vim-airline'
Plug 'psliwka/vim-smoothie'
Plug 'kana/vim-operator-user'
Plug 'haya14busa/vim-operator-flashy'
Plug 'dense-analysis/ale'
Plug 'ntpeters/vim-better-whitespace'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'kien/ctrlp.vim'
Plug 'wikitopian/hardmode'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'ervandew/supertab'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-dispatch'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" ctags
Plug 'soramugi/auto-ctags.vim'
Plug 'majutsushi/tagbar'

" git stuff
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" colour schemes
Plug 'flrnd/candid.vim'

" language/framework specific
Plug 'idris-hackers/idris-vim'
Plug 'posva/vim-vue'
Plug 'digitaltoad/vim-pug'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-endwise'
Plug 'thoughtbot/vim-rspec'
Plug 'amadeus/vim-mjml'
call plug#end()

set wildignore=*.swp,*.bak,*.pyc,*.class,*.jar,*.gif,*.png,*.jpg
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.idea/*,*/.DS_Store,*/.vscode/*
set wildignore+=*/tmp/*,*/log/*
set showcmd
set number

map gn :bn<cr>
map gp :bp<cr>

let g:HardMode_level = 'wannabe'
let g:HardMode_hardmodeMsg = 'Dont use this!'
autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

let g:ctrlp_map = '<c-p>'

:imap jj <Esc>

map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>y :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

let g:rspec_command = "!spring rspec --drb {spec}"
" let g:rspec_command = "!bundle exec rspec --drb {spec}"

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
set autoread

let g:mix_format_on_save = 1

let g:ale_fix_on_save = 1
let g:airline#extensions#ale#enabled = 1

" auto-ctags stuff
" let g:auto_ctags = 1
" let g:auto_ctags_directory_list = ['.git', '.svn']
" let g:auto_ctags_tags_name = 'tags'
" let g:auto_ctags_tags_args = ['--tag-relative=yes', '--recurse=yes', '--sort=yes']
" let g:auto_ctags_filetype_mode = 1



