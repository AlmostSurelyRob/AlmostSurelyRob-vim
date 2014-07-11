call pathogen#infect()
"This causes the local vimrc files to be used
set exrc
"Turn on line numbering
set relativenumber number

" Highlight search terms
"set hlsearch

syntax on
let g:notes_directory='~/documents/notes/'
let g:notes_suffix='.note'

let g:ipy_force_preview=1


"REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

map gT :bprev<CR>
map gt :bnext<CR>

"let g:Tex_UseMakefile=0
"let g:tex_flavor='latex'
"let g:Tex_DefaultTargetFormat='pdf'
"let g:Tex_MultipleCompileFormats='pdf'
"let g:Tex_CompileRule_pdf='pdflatex -interaction=nonstopmode $*;xpdf -remote 127.0.0.1 -reload -raise $*'

"this is just a matter of taste but LaTeX looks good with some indentation:
"
"Whitespace config
set expandtab
autocmd FileType tex,cmake setlocal sts=2 sw=2 ts=2
autocmd FileType cpp,openfoam,python setlocal sts=4 sw=4 ts=4 cino=>4,N-s,+4,(0,U1,W4,m1,l1,g1,h1,i4 cinkeys=0{,0},0(,0),:,!^F,o,O,e

set nospell nowrap

"Colors
"let g:solarized_termcolors=256
"let g:solarized_termtrans=0
set background=dark
"colorscheme solarized
set t_Co=256
"colorscheme zenburn
"colorscheme seoul256
"let g:rehash256 = 1
"let g:molokai_original = 1
"colorscheme molokai
colorscheme xoria256


"TIP: if you write your labels as label{fig:something, then you may press
"Ctrl+n and you will automatically scroll.
set iskeyword+=

augroup MUTT
  au BufRead ~/.mutt/temp/mutt* set spell " <-- vim 7 required
  au BufRead ~/.mutt/temp/mutt* nmap  <F1>  gqap
  au BufRead ~/.mutt/temp/mutt* nmap  <F2>  gqqj
  au BufRead ~/.mutt/temp/mutt* nmap  <F3>  kgqj
  au BufRead ~/.mutt/temp/mutt* nmap  <F4>  :call SwapSpelling()<CR>
  au BufRead ~/.mutt/temp/mutt* map!  <F1>  <ESC>gqapi
  au BufRead ~/.mutt/temp/mutt* map!  <F2>  <ESC>gqqji
  au BufRead ~/.mutt/temp/mutt* map!  <F3>  <ESC>kgqji
  au BufRead ~/.mutt/temp/mutt* set formatprg=par\ -q
augroup END

" NERTree Setup
map <F2> :NERDTreeToggle<CR>
map <F3> :set wrap!<CR>

map <C-F12> :!ctags -R --exclude=lnInclude --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

"let g:BASH_Ctrl_j = 'off'
"nnoremap <Leader>h <C-w>h
"nnoremap <Leader>j <C-w>j
"nnoremap <Leader>k <C-w>k
"nnoremap <Leader>l <C-w>l

nnoremap <F9> :!make<CR>

"CtrlP Config
map <C-t> :CtrlPBuffer<CR>
"map <leader>f :CtrlP<CR>
"let g:ctrlp_map = '<leader>f'
set wildignore+=
      \*/.git/*,*/.hg/*,*/.svn/*,
      \*/*.wav,*/*.mp4,*/*.mp3,*/*.MP3,*/*.wma,*/*.ogg,
      \*/*.avi,*/*.flv,
      \*/*.iso,
      \*/*.pyc,
      \*/*.tar.gz,*/*.tgz,*/*.tar.bz,
      \*/*.doc,*/*.docx,*/*.xls,*/*.xlsx,*/*.ods,*/*.odt,*/*.ppt,*/*.pptx,
      \*/*.pdf
let g:ctrlp_max_files = 5000
let g:ctrlp_max_depth = 5
let g:ctrlp_show_hidden = 1
let g:ctrlp_clear_cache_on_exit = 0


let g:ycm_filetype_whitelist = { 'cpp' : 1 }
let g:ycm_filetype_blacklist = {
	\ 'vim' : 1,
	\ 'text' : 1
	\}

let g:ycm_confirm_extra_conf = 0
"IPython hacks
"
"Command for connecting to running kernel 
command LoadIPython source ~/.vim/bundle/vim-ipython/ftplugin/python/ipy.vim | IPython

"Some GIT config
autocmd Filetype gitcommit setlocal spell textwidth=72

"Powerline config
set nocompatible 
set laststatus=2 
set encoding=utf-8
let g:Powerline_symbols = 'fancy'
autocmd BufNewFile * :PowerlineReloadColorscheme

nmap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:$,trail:␣

"auto-pairs config
let g:AutoPairsShortcutToggle = '<F5>'

"Little function that swaps the spelllang between pl and en_gb
function SwapSpelling ( )
        if &spelllang == 'pl'
                set spelllang=en_gb
        else
                set spelllang=pl
        endif
endfunction

