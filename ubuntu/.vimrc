"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer: 
"       Amir Salihefendic
"       http://amix.dk - amix@amix.dk
"
" Version: 
"       5.0 - 29/05/12 15:43:36
"
" Blog_post: 
"       http://amix.dk/blog/post/19691#The-ultimate-Vim-configuration-on-Github
" " Awesome_version:
"       Get this config, nice color schemes and lots of plugins!
"
"       Install the awesome version from:
"
"           https://github.com/amix/vimrc
"
" Syntax_highlighted:
"       http://amix.dk/vim/vimrc.html
"
" Raw_version: 
"       http://amix.dk/vim/vimrc.txt
"
" Sections:
"    -> General
"    -> VIM user interface
"    -> Colors and Fonts
"    -> Files and backups
"    -> Text, tab and indent related
"    -> Visual mode related
"    -> Moving around, tabs and buffers
"    -> Status line
"    -> Editing mappings
"    -> vimgrep searching and cope displaying
"    -> Spell checking
"    -> Misc
"    -> Helper functions
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=700

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
" nmap <leader>w :w!<cr>  "已经在后面定义了ctrl-s作为快速保存


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
endif


" Use Unix as the standard file type
set ffs=unix,dos,mac

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set backup
set wb
set swapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,1000 bd!<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vimgrep searching and cope displaying
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSelection('gv')<CR>

" Open vimgrep and put the cursor in the right position
map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>

" Vimgreps in the current file
map <leader><space> :vimgrep // <C-R>%<C-A><right><right><right><right><right><right><right><right><right>

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>

" Do :help cope if you are unsure what cope is. It's super useful!
"
" When you search with vimgrep, display your results in cope by doing:
"   <leader>cc
"
" To go to the next search result do:
"   <leader>n
"
" To go to the previous search results do:
"   <leader>p
"
map <leader>cc :botright cope<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
map <leader>n :cn<cr>
map <leader>p :cp<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scripbble
map <leader>q :e ~/buffer<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

"=>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>我是华丽的分割线                                           >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>以下所有内容均为lm参考其他作者所设计的基于自身风格的vim配置>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>主要参考Easwy Yang的vim使用进阶                            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => lm's functions 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Modified by lm in 20130721"
"Set mapleades
let mapleader = ","


function! SwitchToBuf(filename)
    "let fullfn = substitute(a:filename, "^\\~/", $HOME . "/", "")
    " find in current tab
    let bufwinnr = bufwinnr(a:filename)
    if bufwinnr != -1
         exec bufwinnr . "wincmd w"
         return
    else
         " find in each tab
         tabfirst
         let tab = 1
         while tab <= tabpagenr("$")
             let bufwinnr = bufwinnr(a:filename)
             if bufwinnr != -1
                  exec "normal " . tab . "gt"
                  exec bufwinnr . "wincmd w"
                  return
             endif
             tabnext
             let tab = tab + 1
         endwhile
         " not exist, new tab
         exec "tabnew " . a:filename
    endif
endfunction

" This function copies selection to system clipboard using xclip. 
" It's very useful for vim which doesn't support clipboard feature.
" We use two method to implement it. The first is using for-loop, the
" second one is using getline directly. The second one is simpler,
" however the first one is more flexible since we can change the range
" of every line we want to copy very fast.
"
" Notice: There are also a very interesting expr to select the region
" in which every line consists of the whole line except the last character
" whose index is $.
" The expr is "^.*.\{1}$".
" Just put here for fun.
"
" function! CopyVimSelToClip() range
"     let hits = []
"     for i in range(a:firstline, a:lastline)
"         let line = getline(i)[0:-1]
"         call add(hits, line)
"     endfor
"      echo system('echo '.shellescape(join(hits, "\r")).'| xclip -i -sel clip') 
" endfunction

function! CopyVimSelToClip() range
     echo system('echo '.shellescape(join(getline(a:firstline, a:lastline), "\r")).'| xclip -i -sel clip') 
endfunction

" Pack it as a command and map C-c for copying.
" Note, originally vim map it to quit command.
com! -range=% -nargs=0 CopyVimSelToClip :<line1>,<line2>call CopyVimSelToClip()
vnoremap <C-c> :call CopyVimSelToClip()<cr>

" Create a new command to copy from clipboard to vim text.
" Ctrl-v is used to map this command.
" From vim help text, we know that vim already consider the problem
" that Ctrl-v is often used to by user to map it as the paste action,
" so they use Ctrl-q to replace Ctrl-v.
com! -nargs=0 CopyClipToVimSel :read !xclip -o -sel clip<cr>
noremap <C-v> :CopyClipToVimSel<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => netrw settings                      """"""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:netrw_winsize = 20
nmap <silent> <leader>fe :Sexplore!<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => cscope settings               """"""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("cscope")
    set csprg=/usr/local/bin/cscope
    set csto=1
    set cst 
	set cscopequickfix=s-,c-,d-,i-,t-,e-
    set nocsverb
    " add any database in current directory 
    if filereadable("cscope.out")
        cs add cscope.out
    endif
    set csverb
endif
nmap <C-@>s :cs find s <c-r>=expand("<cword>")<cr><cr>
nmap <C-@>g :cs find g <c-r>=expand("<cword>")<cr><cr>
nmap <C-@>c :cs find c <c-r>=expand("<cword>")<cr><cr>
nmap <C-@>t :cs find t <c-r>=expand("<cword>")<cr><cr>
nmap <C-@>e :cs find e <c-r>=expand("<cword>")<cr><cr>
nmap <C-@>f :cs find f <c-r>=expand("<cfile>")<cr><cr>
nmap <C-@>i :cs find i ^<c-r>=expand("<cfile>")<cr>$<cr>
nmap <C-@>d :cs find d <c-r>=expand("<cword>")<cr><cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => quickfix settings               """"""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>cn :cn<cr>
nmap <leader>cp :cp<cr>
nmap <leader>cw :cw 10<cr>
" 按下,<space>后即可快速的使用makeprg中的程序进行编译
autocmd FileType c,cpp map <buffer> <leader><space> :w<cr>:make<cr>
autocmd FileType verilog map <buffer> <leader><space> :w<cr>:make \\| grep -Ei "warning\\|error"<cr>

" Set my own marker to mark some text.
" TODO: make it as a function with the pattern as the parameter.
map <leader>lmk :syntax region lmMarker start=/^lm{.*$/ end=/^}lm.*$/<cr>:hi lmMarker ctermfg=30 ctermbg=15<cr>/lm{<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => foldmethod  settings               """""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldcolumn=4
autocmd Filetype c,cpp setl fdm=syntax | setl nofen

"=>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>我是华丽的分割线                                           >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>以下所有内容均为lm使用的外部插件 使用vundle管理 方便移植>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Added in 20140805 by lm                """"""""""""""""""""""""""""""
" => vundle manager                      """"""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" call vundle#begin()

" let Vundle manage Vundle
Plugin 'VundleVim/Vundle.Vim'

" original repos on github
Plugin 'scrooloose/syntastic'
Plugin 'Scrooloose/nerdtree'
Plugin 'clones/vim-genutils'
Plugin 'tmhedberg/matchit'
Plugin 'ctrlpvim/ctrlp.vim'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => YouCompleteMe  settings                   """"""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'Valloric/YouCompleteMe'
" 设置.ycm_extra_conf.py的默认路径
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
nmap <leader>yg :YcmCompleter GoTo<cr><cr>
nmap <leader>yf :YcmCompleter FixIt<cr><cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => powerline  settings                   """"""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'Lokaltog/vim-powerline'
set laststatus=2
set t_Co=256
let g:Powerline_symbols= 'unicode'
set encoding=utf8

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-tmux-navigator  settings                   """""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'christoomey/vim-tmux-navigator'
" Write all buffers before navigating from Vim to tmux pane
let g:tmux_navigator_save_on_switch = 2
" Disable tmux navigator when zooming the Vim pane
let g:tmux_navigator_disable_when_zoomed = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-latex-live-preview  settings               """""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Used to preview the pdf in real-time while editing the tex files.
Plugin 'xuhdev/vim-latex-live-preview'
" let g:livepreview_previewer = 'apvlv'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-fugitive  settings                         """""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim wrapper for git, the wiki is very useful for understanding git ""
Plugin 'tpope/vim-fugitive'
autocmd QuickFixCmdPost *grep* cwindow

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-tex-fold  settings                         """""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" A light-weight alternative to vim-latexsuite's folding.
Plugin 'matze/vim-tex-fold'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VimGdb  settings                   """""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" vim-scripts repos
Plugin 'a.vim'
Plugin 'DrawIt'
Plugin 'Colour-Sampler-Pack'
Plugin 'SuperTab'
Plugin 'verilog_systemverilog.vim'
Plugin 'peaksea'      " color scheme


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => winManager settings               """"""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'winmanager'
let g:winManagerWindowLayout = 'FileExplorer,BufExplorer|TagList'
let g:winManagerWidth = 30
let g:defaultExplorer = 0
nmap <silent><leader>wm :WMToggle<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => taglist settings               """""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'taglist.vim'
let Tlist_Ctags_Cmd = 'ctags'
let Tlist_Show_One_File = 1  "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1 "如果taglist窗口是最后一个窗口,则退出vim
let Tlist_Use_Right_Window = 1 "在右侧窗口显示taglist窗口

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Buf explorer                      """"""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'Bufexplorer.zip'
let g:bufExplorerDefaultHelp = 0       "Do not show default help.
let g:bufExplorerShowRelativePath = 1  "Show relative paths.
let g:bufExplorerSortBy = 'mru'        "Sort by most recently used.
let g:bufExplorerSplitRight = 0        "Split left.
let g:bufExplorerSplitVertSize = 20    "Split width.
" let g:bufExplorerShowTabBuffer = 1
autocmd BufWinEnter \[Buf\ List\] setl nonumber

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => tagbar settings               """"""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin 'Tagbar'
let g:tagbar_ctags_bin = 'ctags'
let g:tagbar_width = 30
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => YankRing settings               """"""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'YankRing.vim'
nnoremap <silent> <F11> :YRShow<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => lookupfile settings               """"""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'lookupfile'
let g:LookupFile_MinPatLength = 2            "最少输入2字符后才开始查找
let g:LookupFile_PreserveLastPattern = 0     "不保存上次查找的字符串
let g:LookupFile_PreservePatternHistory = 1  "保存查找历史
let g:LookupFile_AlwaysAcceptFirst = 1       "回车打开第一个匹配项目
let g:LookupFile_AllowNewFiles = 0           "不允许创建不存在的文件
if filereadable("./filenametags")            "设置tag文件的名字
   let g:LookupFile_TagExpr = '"./filenametags"'
endif
"映射,lk为LookupFile
nmap <silent><leader>lk <Plug>LookupFile<cr> 
"映射,ll为LUBufs
nmap <silent><leader>ll :LUBufs<cr> 
"映射,lw为LUWalk
nmap <silent><leader>lw :LUWalk<cr> 
" colorscheme manager
" Plugin 'tomasr/molokai'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => showmarks settings               """""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'ShowMarks'
" Enable ShowMarks
let showmarks_enable = 1
" Show which marks
let showmarks_include = "abcdefghijklmnopqrtsuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
" Ignore help, quickfix, non-modifiable buffers
let showmarks_ignore_type = "hqm"
" Hilight lower & upper marks
let showmarks_hlline_lower = 1
let showmarks_hlline_upper = 1
let showmarks_hlline_other = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => MarksBrowser settings               """"""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'Marks-Browser'
nmap <silent><leader>mk :MarksBrowser<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Python settings                     """"""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'python-mode/python-mode'

" close python mode Regenerate repo cache
let g:pymode_rope = 0
let g:pymode_rope_lookup_project = 0

" other repos
" Plugin 'https://bitbucket.org/Haroogan/vim-youcompleteme-for-windows.git'

call vundle#end()
filetype plugin indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""Modified by lm in 20130725                             """"""""""""
""""There are two methods to make chinese encoding avaiable""""""""""""
""""The first is directly set fileencodings in _vimrc      """"""""""""
""""The second is use plugin fencview                      """"""""""""
""""Method 2 is very strong,but it has some bugs           """"""""""""
""""So use method 1 default, if is not useful              """"""""""""
""""Then we can uncomment method 2 to make it available    """"""""""""
""""Also we can make it available manually by use commands """"""""""""
"""":FencAutoDetect or :FencView                           """"""""""""
""""And the plugin located in ~/vim/plugin                """"""""""""

""""""""""""""""""""""Method 1""""""""""""""""""""""""""""""""""""""""
""""""""""""set encoding for chinese"""""""""""""""""""""""""""""""""""
" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf-8
set fileencodings=utf-8,gb2312,ucs-bom,ecun-cn,ecu-tw,gb18030,gbk,cp936
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""Method 2"""""""""""""""""""""""""""""""""""""""""
"""enable FencAutoDetect in fencview plugin is automatic"""""""""""""""
" let g:fencview_autodetect=1
" let g:fencview_auto_patterns='*'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""此区域设置仅对gvim有效""""""""""""""""""""""""""""""
" 使用utf-8作为内部解码时，gvim的菜单和底下console输出信息对于中文会出现
" 乱码，下面两种设置可以解决乱码问题。

" 解决菜单乱码
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" 解决console输出乱码
language messages zh_CN.utf-8
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" set line number
set number

" tab文件补齐时自动忽略含有这些后缀的文件
set suffixes=.bak,~,.o,.h,.info,.swp,.aux,.bbl,.blg,.dvi,.lof,.log,.lot,.ps,.toc

" 设置ctrl-d或者ctrl-u每次滚屏时滚动的行数,设置为0时回复默认的半屏
set scroll=3

" uncomment this can cansel the display of the line number
" set nonu

" set the height of previewwindow 
" set pvh=28

" set color style is solarized
colo solarized

" solarized will change the background to light, so we need to set the background color again
set background=dark 

" set color style is evening
" colo evening

" set mark's highlight line color, refer to showmarks
hi ShowMarksHLl ctermfg=black ctermbg=green  guifg=black guibg=green
hi ShowMarksHLu ctermfg=red ctermbg=green  guifg=red guibg=green
hi ShowMarksHLo ctermfg=blue ctermbg=green  guifg=blue guibg=green
hi ShowMarksHLm ctermfg=black ctermbg=red  guifg=black guibg=red

"execute project related configuration in current directory 
if filereadable("workspace.vim")
	source workspace.vim
endif

" set mouse can be used everywhere
if exists("&mouse")
   set mouse=r 
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""modified in 20120801                                          """"""
"""define some maps to make some habits in windows available here""""""

""" map "ctrl-s" to save in insert mode and normol mode          """"""
imap <C-s> <esc>:w!<cr>
nmap  <c-s> :w!<cr>

""" map "ctrl-w" to go to normal mode quickly 
imap <c-w> <esc>
vmap <c-w> <esc>

""" map "ctrl-a" to select all text in visual mode 
""" map <c-a> <esc>ggVG
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Fast reloading of the .vimrc
map <silent> <leader>s :source ~/.vimrc<cr>
" Fast editing of .vimrc
map <silent> <leader>ee :call SwitchToBuf("~/.vimrc")<cr>
" When .vimrc is edited, reload it
autocmd! bufwritepost .vimrc source ~\.vimrc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
