scriptencoding utf-8
set nocompatible " Purge compatible with Vi

if filereadable($HOME . '/.vimrc.local')
  source $HOME/.vimrc.local
endif

call plug#begin('~/.vim/plugged')

" General {{{
Plug 'thinca/vim-ref'
Plug 'thinca/vim-quickrun'
Plug 'scrooloose/syntastic'
Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'mattn/webapi-vim'
Plug 'chrisbra/SudoEdit.vim'
Plug 'kana/vim-fakeclip'
Plug 'h1mesuke/vim-alignta'
Plug 'dannyob/quickfixstatus'
Plug 'jceb/vim-hier'
Plug 'vim-scripts/AutoComplPop'
Plug 'ctrlpvim/ctrlp.vim'
"}}}

" Input Support {{{
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'tomtom/tcomment_vim'
Plug 'kana/vim-textobj-user'
Plug 'h1mesuke/textobj-wiw'
Plug 'tpope/vim-abolish'
Plug 'vim-scripts/matchit.zip'
Plug 'moznion/usui-paren.vim'
Plug 'rhysd/clever-f.vim'
"}}}

" Perl {{{
" Plug 'vim-perl/vim-perl', { 'for': ['perl', 'perl6'] }
Plug 'hotchpotch/perldoc-vim', { 'for': 'perl' }
Plug 'c9s/perlomni.vim', { 'for': 'perl' }
Plug 'moznion/vim-cpanfile', { 'for': 'cpanfile' }
Plug 'moznion/syntastic-cpanfile', { 'for': 'cpanfile' }
Plug 'motemen/xslate-vim', { 'for': 'xslate' }
Plug 'moznion/vim-plack', { 'for': 'plack' }
"}}}

" Ruby {{{
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'rhysd/neco-ruby-keyword-args', { 'for': 'ruby' }
Plug 'vim-scripts/ruby-matchit', { 'for': 'ruby' }
Plug 'rhysd/vim-textobj-ruby', { 'for': 'ruby' }
"}}}

" JavaScript {{{
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' }
Plug 'moznion/jskotobuki-vim', { 'for': 'javascript' }
" }}}

" CoffeeScript {{{
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
" }}}

" TypeScript {{{
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
Plug 'clausreinke/typescript-tools', { 'for': 'typescript' }
" }}}

" HTML/CSS {{{
Plug 'mattn/emmet-vim', { 'for': ['html', 'css'] }
Plug 'hail2u/vim-css3-syntax', { 'for': ['html', 'css'] }
Plug 'lilydjwg/colorizer', { 'for': ['html', 'css'] }
"}}}

" Arduino {{{
Plug 'tclem/vim-arduino', { 'for': 'arduino' }
Plug 'sudar/vim-arduino-syntax', { 'for': 'arduino' }
" }}}

" Go {{{
Plug 'fatih/vim-go', { 'for': 'go' }
" }}}

" LTSV {{{
Plug 'moznion/vim-ltsv', { 'for': 'ltsv' }
" }}}

call plug#end()

"----------------------------------------------------------------------------
" Initialize
"----------------------------------------------------------------------------
" Reload .vimrc
nnoremap <silent> <C-s><C-r> :<C-U>source $MYVIMRC \| if has('gui_running') \| source $MYGVIMRC \| endif <CR>

" Open .vimrc on new buffer
nnoremap <silent> <C-s><C-e> :e $MYVIMRC<CR>

" Open snippet definition file {{{
if !exists("g:neosnippet#snippets_directory")
    let g:neosnippet#snippets_directory=""
endif
let g:neosnippet#snippets_directory = $HOME . '/.vim/snippets/'

func! OpenSnippetFile()
  let s:snippetLocate = g:neosnippet#snippets_directory . &filetype . '.snippets'
  execute ':e' . s:snippetLocate
endf
nnoremap <silent> <C-s><C-s> :call OpenSnippetFile()<CR>
"}}}

" Neosnippet
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

augroup detectfiletype
  au!
  au BufNewFile,BufRead *.t setf perl
  au BufNewFile,BufRead *.psgi setf perl
  au BufNewFile,BufRead *.pm setf perl
  au BufNewFile,BufRead *.tt setf tt2html
augroup END

augroup MyAutoCmd
  au!
  au MyAutoCmd BufNewFile,BufRead * set fileformat=unix
  au MyAutoCmd BufNewFile,BufRead * set encoding=utf-8
  au MyAutoCmd BufNewFile,BufRead * set fileencoding=utf-8
augroup END

set fileencodings=utf-8,shift-jis,euc-jp,cp932

filetype plugin indent on
syntax on

let g:mapleader = ','

"----------------------------------------------------------------------------
"For vim-quickrun
"----------------------------------------------------------------------------
let g:quickrun_config = {
\ '*': {
\   'hook/simple_anim/enable' : 1,
\   'hook/simple_anim/wait' : 1,
\   'hook/time/enable': 1,
\   'outputter/buffer/split': ':botright 8sp',
\ }
\}
map <silent>\r :QuickRun<CR>
augroup QuickrunAutoCmd
    au!
    au FileType quickrun nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
    au FileType quickrun inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
augroup END

"----------------------------------------------------------------------------
" For ctrlp
"----------------------------------------------------------------------------
let g:ctrlp_map = '<c-w>'
noremap <silent><Leader>uf :CtrlP<CR>
noremap <silent><Leader>ub :CtrlPBuffer<CR>
noremap <silent><Leader>um :CtrlPMixed<CR>

"----------------------------------------------------------------------------
" For tcomment_vim
"----------------------------------------------------------------------------
let g:tcommentMapLeader1 = '<C-C>'

"----------------------------------------------------------------------------
"For Syntastic
"----------------------------------------------------------------------------
let g:syntastic_mode_map = {
\ 'mode': 'active',
\ 'active_filetypes': ['javascript'],
\ 'passive_filetypes': [],
\}
let g:syntastic_javascript_checker = 'jslint'

"----------------------------------------------------------------------------
" vim-surround
"----------------------------------------------------------------------------
func! SurroundAutoDetect(command)
  let l:command = (a:command == 'ci') ? 'di' : a:command
  let l:command = (a:command == 'ts') ? 'cs' : l:command
  let l:currentChar = getline('.')[col('.')-1]
  let l:autoSurroundCommand = l:command . l:currentChar

  if a:command == 'ci'
    silent execute 'normal!' . l:autoSurroundCommand
    startinsert
  elseif a:command == 'ts' " toggle some surround characters
    let l:replaceTarget = ''
    if l:currentChar == '{' || '}'
      let l:replaceTarget = '('
    elseif l:currentChar == '(' || ')'
      let l:replaceTarget = '{'
    elseif l:currentChar == "'"
      let l:replaceTarget = '"'
    elseif l:currentChar == '"'
      let l:replaceTarget = "'"
    end
    if l:replaceTarget != ''
      call feedkeys(l:autoSurroundCommand . l:replaceTarget)
    endif
  else
    call feedkeys(l:autoSurroundCommand)
  endif
endf

nnoremap <silent>dii :call SurroundAutoDetect('di')<CR>
nnoremap <silent>yii :call SurroundAutoDetect('yi')<CR>
nnoremap <silent>cii :call SurroundAutoDetect('ci')<CR>
nnoremap <silent>css :call SurroundAutoDetect('cs')<CR>
nnoremap <silent>dss :call SurroundAutoDetect('ds')<CR>
nnoremap <silent>tss :call SurroundAutoDetect('ts')<CR>

"----------------------------------------------------------------------------
" Searching
"----------------------------------------------------------------------------
set ignorecase  "Ignoring capital and lower case when searching
set smartcase   "If searching condition includes both of capital and lower, distinguish them
set incsearch   "Doing incremental search
set wrapscan    "Enable wrap search
set hlsearch    "Highlighting results of searching

" Hiding highlight of searching when typed Esc-Esc {{{
nnoremap <Esc><Esc> :<C-u>set nohlsearch<Return>
nnoremap / :<C-u>set hlsearch<Return>/
nnoremap ? :<C-u>set hlsearch<Return>?
nnoremap * :<C-u>set hlsearch<Return>*
nnoremap # :<C-u>set hlsearch<Return>#
"}}}

"----------------------------------------------------------------------------
" Editing
"----------------------------------------------------------------------------
set tabstop=4
set shiftwidth=4
set backspace=indent,eol,start   "Enable to delete indent and newline by backspace
set showmatch                    "Showing correspond parenthesis
set clipboard=unnamed,autoselect "Use OS clip board

" Indent {{{
set autoindent
set smartindent
set cindent
set smarttab
set expandtab
"}}}

" For Japanese {{{
set formatoptions+=mM                             "wrap text for Japanese
au MyAutoCmd BufNewFile,BufRead * set iminsert=0  "Reset the Japanese input method
"}}}

" Checking spelling {{{
set spell
au MyAutoCmd BufNewFile,BufRead *.snippets set nospell
nnoremap <C-S><C-N> :call ToggleSettingSpelling()<CR>

func! ToggleSettingSpelling()
  set spell!
  set spell?
endf
"}}}

" Removing white spaces on end of line when saved file {{{
let g:does_remove_trailing_white_space = 1
au MyAutoCmd BufWritePre * call s:removeTrailingWhiteSpace()
func! s:removeTrailingWhiteSpace()
  if &ft != 'markdown' && g:does_remove_trailing_white_space == 1
    :%s/\s\+$//ge
  endif
endf

command! -nargs=0 ToggleRemoveTrailingWhiteSpace
  \ call s:toggleRemovingTrailingWhiteSpaceStatus()
func! s:toggleRemovingTrailingWhiteSpaceStatus()
  let g:does_remove_trailing_white_space =
    \ !g:does_remove_trailing_white_space
endfunc
" }}}

" Fall in by the ruly-character
vnoremap <silent><C-X><C-X> : <C-u>'<,'>Alignta =<CR>
vnoremap <silent><C-X><C-S> : <C-u>'<,'>Alignta =><CR>

"----------------------------------------------------------------------------
" When open the file
"----------------------------------------------------------------------------
" Remember cursor position when closed just before {{{
if has("autocmd")
  au MyAutoCmd BufReadPost *
        \ if line("'\"") > 0 && line ("'\"") <= line("$") |
        \   exe "normal! g'\"" |
        \ endif
endif
"}}}

" Apply Skeleton {{{
augroup SkeletonAu
  au!
  au BufNewFile *.pl 0r ~/.vim/skeletons/skeleton.pl
  au BufNewFile *.t 0r ~/.vim/skeletons/skeleton.t
  au BufNewFile *.rb 0r ~/.vim/skeletons/skeleton.rb
  au BufNewFile *.py 0r ~/.vim/skeletons/skeleton.py
  au BufNewFile Makefile.PL 0r ~/.vim/skeletons/skeleton.Makefile.PL
  au BufNewFile perlcritic.t 0r ~/.vim/skeletons/perlcritic.t
  au BufNewFile vars.t 0r ~/.vim/skeletons/vars.t
  au BufNewFile local_functions.t 0r ~/.vim/skeletons/local_functions.t
  au BufNewFile used_modules.t 0r ~/.vim/skeletons/used_modules.t
augroup END
"}}}

"----------------------------------------------------------------------------
" Others
"----------------------------------------------------------------------------
set wildmenu    "Use powerful command line auto-completion
set nobackup    "Inhibit making backup
set nowritebackup
set noswapfile  "Inhibit creating swap file
set autoread    "Reload automatically
set vb t_vb=    "Disable beep
set viminfo='50,<1000,s100,\"50
set whichwrap=b,s,h,l,<,>,[,]   "Don't stop cursole on head and end of line

" Escape INSERT mode, turn off the IME automatically {{{
set noimdisable
set iminsert=0 imsearch=0
set noimcmdline
inoremap :set iminsert=0
"}}}

" Kill the force killing {{{
nnoremap <C-Z> <NOP>
nnoremap ZZ <NOP>
nnoremap ZQ <NOP>
"}}}

" Buffer {{{
nnoremap <silent><C-w>q     :bd<CR>
nnoremap <silent><C-w><C-q> :bd<CR>
nnoremap <silent><C-n>  :bn<CR>
nnoremap <silent><C-p>  :bp<CR>
"}}}

"----------------------------------------------------------------------------
"Displaying
"----------------------------------------------------------------------------
set number
set ruler
set wrap
set showcmd
set cursorline
set laststatus=2
set cmdheight=2

" Setting of color scheme {{{
if !has('win32unix')
  set t_Co=256
  set background=dark
  colorscheme solarized
endif
"}}}

" Highlighting noisy white spaces {{{
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
highlight TrailingSpaces ctermbg=red guibg=#FF0000
highlight Tabs ctermbg=black guibg=#000000
augroup HighlightingNoisySpaces
  au!
  au BufNewFile,BufRead * call matchadd('ZenkakuSpace', '　')
  au BufNewFile,BufRead * call matchadd('TrailingSpaces', ' \{-1,}$')
  au BufNewFile,BufRead * call matchadd('Tabs', '\t')
augroup END
"}}}

" Make line only the current window
augroup cch
  au! cch
  au WinLeave * set nocursorline
  au WinEnter,BufRead * set cursorline
augroup END

"----------------------------------------------------------------------------
" Shell script
"----------------------------------------------------------------------------
augroup ShellScriptAutoCmd
  au!
  au FileType sh set shiftwidth=2 tabstop=2
augroup END

"----------------------------------------------------------------------------
" Vim script
"----------------------------------------------------------------------------
augroup VimScriptAutoCmd
  au!
  au FileType vim set shiftwidth=2 tabstop=2
augroup END

"----------------------------------------------------------------------------
" Perl
"----------------------------------------------------------------------------
augroup PerlAutoCmd
  au!
  au FileType perl set shiftwidth=4 tabstop=4
  au BufNewFile,BufRead *.tx set filetype=xslate
  au BufNewFile,BufRead *.tx set syntax=xslate
  au BufNewFile,BufRead *.tt set filetype=xslate.tt
  au BufNewFile,BufRead *.tt set syntax=xslate.tt
  au FileType xslate set shiftwidth=2 tabstop=2
augroup END

augroup eplAutoCmd
  au!
  au BufNewFile,BufRead *.html.ep set shiftwidth=2
  au BufNewFile,BufRead *.html.ep let mojo_highlight_data = 1
augroup END

" Template for *.pm {{{
func! s:pm_template()
  let path = substitute(expand('%'), '.*lib/', '', 'g')
  let path = substitute(path, '[\\/]', '::', 'g')
  let path = substitute(path, '\.pm$', '', 'g')
  call append(0, 'package ' . path . ';')
  call append(1, 'use strict;')
  call append(2, 'use warnings;')
  call append(3, 'use utf8;')
  call append(4, '')
  call append(5, '')
  call append(6, '')
  call append(7, '1;')
  call cursor(6, 0)
endf
au PerlAutoCmd BufNewFile *.pm call s:pm_template()
"}}}

" Detect misprints about package name {{{
func! s:get_package_name()
  let mx = '^\s*package\s\+\([^ ;]\+\)'
  for line in getline(1, 5)
    if line =~ mx
      return substitute(matchstr(line, mx), mx, '\1', '')
    endif
  endfor
  return ""
endf
func! s:check_package_name()
  let path = substitute(expand('%:p'), '\\', '/', 'g')
  let name = substitute(s:get_package_name(), '::', '/', 'g') . '.pm'
  if path[-len(name):] != name
    echohl WarningMsg
    echomsg "Maybe written package name is wrong."
    echomsg "Please correct it."
    echohl None
  endif
endf
au PerlAutoCmd BufWritePost *.pm call s:check_package_name()
"}}}

" Perltidy {{{
map <silent> <Leader>pt <Esc> :%! perltidy -se<CR>
map <silent> <Leader>ptv <Esc> :'<,'>! perltidy -se<CR>
"}}}

"----------------------------------------------------------------------------
" JavaScript
"----------------------------------------------------------------------------
augroup JavaScriptAutoCmd
  au!
  au FileType javascript set shiftwidth=4 tabstop=4
augroup END

"----------------------------------------------------------------------------
" HTML/CSS
"----------------------------------------------------------------------------
augroup HtmlCssAutoCmd
  au!
  au FileType html,css ColorHighlight
  au FileType xml,html,css set shiftwidth=2 tabstop=2
  au FileTYpe html,css nnoremap <C-c><C-t> :<C-u>ColorToggle<CR>
augroup END

"----------------------------------------------------------------------------
" Ruby
"----------------------------------------------------------------------------
augroup RubyAutoCmd
  au!
  au FileType ruby set shiftwidth=2 tabstop=2
  au FileType ruby set omnifunc=RSenseCompleteFunction
augroup END

augroup ERubyAutoCmd
  au FileType eruby set shiftwidth=2 tabstop=2
augroup END

" RSpec
nnoremap <silent>,rs :RunSpec<CR>
nnoremap <silent>,rl :RunSpecLine<CR>

" Template for rspec file {{{
func! s:rspec_template()
  call append(3, "require File.expand_path(File.dirname(__FILE__) + '/spec_helper')")
  call append(4, '')
  call append(5, 'describe <description> do')
  call append(6, '')
  call append(7, 'end')
endf
au RubyAutoCmd BufNewFile *_spec.rb call s:rspec_template()

"----------------------------------------------------------------------------
" Java
"----------------------------------------------------------------------------
augroup FtlAutoCmd
  au!
  au BufNewFile,BufRead *.ftl set filetype=ftl
  au BufNewFile,BufRead *.ftl set syntax=html
  au FileType ftl set shiftwidth=2 tabstop=2
  au FileTYpe ftl nnoremap <silent> <C-c><C-v> :call s:toggleSyntaxBetweenFtlAndHtml()<CR>
augroup END

func! s:toggleSyntaxBetweenFtlAndHtml()
  if &syntax ==# 'html'
    set syntax=ftl
  else
    set syntax=html
  endif
endf

"----------------------------------------------------------------------------
" Arduino
"----------------------------------------------------------------------------
augroup ArduinoAutoCmd
  au!
  au BufNewFile,BufRead *.ino set filetype=arduino
augroup END

"----------------------------------------------------------------------------
" Markdown
"----------------------------------------------------------------------------
augroup MarkdownAutoCmd
  au!
  au BufNewFile,BufRead *.md set filetype=markdown
augroup END

"----------------------------------------------------------------------------
" Haskell
"----------------------------------------------------------------------------
augroup HaskellAutoCmd
  au!
  au FileType haskell set shiftwidth=2 tabstop=2
augroup END

"----------------------------------------------------------------------------
" Golang
"----------------------------------------------------------------------------
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"

"----------------------------------------------------------------------------
" CoffeeScript
"----------------------------------------------------------------------------
augroup CoffeeScriptAutoCmd
  au!
  au BufNewFile,BufRead *.coffee set filetype=coffee
  au FileType coffee setlocal sw=2 sts=2 ts=2 et
augroup END

"----------------------------------------------------------------------------
" Common Lisp
"----------------------------------------------------------------------------
augroup CommonLispAutoCmd
  au!
  au FileType lisp UsuiParenActivate
  au FileType lisp setlocal sw=2 sts=2 ts=2 et
augroup END

