set nocompatible               " be iMproved, required
filetype off                  " required
set backspace=indent,eol,start " 退格键失效解决
set completeopt-=preview
" set mouse=a   

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'fatih/vim-go'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'	
Plugin 'sjl/gundo.vim' 
Plugin 'Lokaltog/powerline'  "  , {'rtp': 'powerline/bindings/vim/'}
Plugin 'SirVer/ultisnips'
Plugin 'mhinz/vim-startify'
Plugin 'vim-scripts/TaskList.vim',{ 'on': 'TaskList' }
Plugin 'fannheyward/rainbow_parentheses.vim'
Plugin 'bling/vim-airline'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'tenfyzhong/CompleteParameter.vim'

" Plugin 'nsf/gocode', {'rtp': 'vim/'}
" Plugin 'mdempsky/gocode', {'rtp': 'vim/'}


Bundle 'majutsushi/tagbar'
Bundle 'scrooloose/nerdcommenter'

" " All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" colorscheme  molokai        " 主题
colorscheme PaperColor
" colorscheme  solarized      " 主题
" let g:solarized_termcolors=256
set t_Co=256
set background=dark
" let g:molokai_original = 1
let g:rehash256 = 1
set pastetoggle=<F10>       " 自动缩进切换
set relativenumber
set ts=4
set expandtab
set cursorline              " Highlight current line
set ignorecase              " 设置默认进行大小写不敏感查找
set smartcase               " 如果有一个大写字母，则切换到大小写敏感查找
set nu                      " 行号
set laststatus=2
set autoindent              " 自动缩进
set tabstop=4               " 设置软制表符宽度为4
set softtabstop=4
set shiftwidth=4            " 设置缩进的空格书为4
set hlsearch                " Highlight search results
set incsearch               " 搜索光标定位到第一个

syntax enable                " 打开语法高亮
syntax on                    " 开启文件类型侦测
filetype indent on           " 针对不同的文件类型采用不同的缩进格式
filetype plugin on           " 针对不同的文件类型加载对应的插件
filetype plugin indent on    " 启用自动补全

set foldenable              " 开始折叠
set foldmethod=indent       " 设置语法折叠
set foldcolumn=0            " 设置折叠区域的宽度
setlocal foldlevel=1        " 设置折叠层数为
set foldlevelstart=99       " 打开文件是默认不折叠代码

set omnifunc=syntaxcomplete#Complete

" set foldclose=all          " 设置为自动关闭折叠                
" nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
"起始页显示的列表长度
let g:startify_files_number = 8
""自动加载session
let g:startify_session_autoload = 1

" 显示中文帮助
if version >= 603
set helplang=cn
set encoding=utf-8
endif


"" 更换autocomplpop颜色
highlight Pmenu ctermbg=darkred
highlight PmenuSel ctermbg=red ctermfg=yellow

filetype plugin indent on
"" 设置语法高亮
filetype plugin on
syntax on

"" 设置编码
set encoding=utf-8
" set fenc=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb2312,gb18030,big5,euc-jp,euc-kr,latin1
"" set termencoding 可以用来设置显示的编码

" 按F9即可打开tagbar界面
nmap <silent> <F9> :TagbarToggle<CR>                                                                                                        
" let g:tagbar_left=1
let g:tagbar_right=1
let g:tagbar_width=25
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',                                                                                                          
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',                                                                                                           
        \ 'c:constants',                                                                                                           
        \ 'v:variables',                                                                                                           
        \ 't:types',
        \ 'n:interfaces',                                                                                                          
        \ 'w:fields',
        \ 'e:embedded',                                                                                                            
        \ 'm:methods',
        \ 'r:constructor',                                                                                                         
        \ 'f:functions'                                                                                                            
    \ ],
    \ 'sro' : '.', 
    \ 'kind2scope' : {
        \ 't' : 'ctype',                                                                                                           
        \ 'n' : 'ntype'                                                                                                            
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',                                                                                                           
        \ 'ntype' : 'n'                                                                                                            
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'                                                                                                
    \ }  

let $PATH .= ":/Users/xwk/gopath"
let $GOROOT= "/usr/local/go"
let $GOOS='darwin'
let $GOARCH='amd64'
" autocmd BufRead,BufNewFile *.go let $GOPATH = expand("%:p:h")

let g:tagbar_autofocus = 1                  " 启动 时自动focus
let g:NERDSpaceDelims=1                     " 注释的时候自动加个空格, 强迫症必配

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
"离开插入模式后自动关闭预览窗口
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"回车即选中当前项
" inoremap <expr> <CR>    pumvisible()?"\<C-y>":"<CR>"

" YCM settings
let g:ycm_key_list_select_completion = ['', '']
let g:ycm_key_list_previous_completion = ['']
let g:ycm_key_invoke_completion = '<C-n>'

let g:ycm_collect_identifiers_from_tags_files=1 " 开启 YCM 基于标签引擎
let g:ycm_min_num_of_chars_for_completion=2 " 从第2个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0  " 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1    " 语法关键字补全
" let g:ycm_autoclose_preview_window_after_completion = 1
" let g:ycm_add_preview_to_completeopt = 1
let g:ycm_key_list_stop_completion = ['<CR>']   " 回车关闭选项

imap <F7> <C-x><C-o>

let g:go_gocode_unimported_packages = 1 
let g:go_highlight_function_calls = 1
let g:go_highlight_fields = 1

" 自动补全配置
set completeopt=longest,menu
" "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
" autocmd InsertLeave * if == 0|pclose|endif
" "离开插入模式后自动关闭预览窗口
" inoremap <expr> <CR>       ? "\<C-y>" : "\<CR>"   "回车即选中当前项
" "上下左右键的行为 会显示其他信息
" inoremap <expr> <Down>     ? "\<C-n>" : "\<Down>"
" inoremap <expr> <Up>       ? "\<C-p>" : "\<Up>"
" inoremap <expr> <PageDown> ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
" inoremap <expr> <PageUp>   ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"


" Startify
" 自定义Header和Footer, 如果你熟悉vimscript，也可以编程实现 XD
function! s:filter_header(lines) abort
    let longest_line   = max(map(copy(a:lines), 'strwidth(v:val)'))
    let centered_lines = map(copy(a:lines),
        \ 'repeat(" ", (&columns / 3) - (longest_line / 3)) . v:val')
    return centered_lines
endfunction
" let s:myline = [
             " \ '                                           __------~~-,		',
             " \ '                                         ,`            \    ',	
             " \ '                                        /               \	',	
             " \ '                                       /                :	',	
             " \ '                                      |                  :	',	
             " \ '                                      |                  |	',	
             " \ '                                      |                  |	',	
             " \ '                                       |   _--           |	',	
             " \ '+----------------+-------------+       _| =-.     .-.   ||	',	
             " \ '|  PHP is The Best Language!   |      o|/o/       _.   |	',		
             " \ '|  Enjoying Coding Coding~~~   |      /  ~          \ |		',	
             " \ '+----------------+-------------+    (____@)  ___~    |		',	
             " \ '                                \       |_===~~~.`    |		',	
             " \ '                                 \   _______.--~     |		',	
             " \ '                                     \________       |		',	
             " \ '                                              \      |		',	
             " \ '                                            __/-___-- -__	',		
             " \ '                                           /            _ \	',		
             " \ ]
let s:myline =[
            \ '                       _oo0oo_                           ',
            \ '                      o8888888o                          ',
            \ '                      88` . `88                          ',
            \ '                      (| -_- |)                          ',
            \ '                      0\  =  /0                          ',
            \ '                    ___/`---`\___                        ',
            \ '                  .` \\|     |// `.                      ',
            \ '                 / \\|||  :  |||// \                     ',
            \ '                / _||||| -:- |||||- \                    ',    
            \ '               |   | \\\  -  /// |   |                   ',
            \ '               | \_|  ``\---/`` |_/ |                   ',    
            \ '               \  .-\__ ``-`` ___/-. /                   ',
            \ '             ___`. .`  /--.--\  `. .`___                 ',        
            \ '          .`` `<  `.___\_<|>_/___.` >` ``                ',
            \ '         | | :  `- \`.;`\ _ /`;.`/ - ` : | |             ',    
            \ '         \  \ `_.   \_ __\ /__ _/   .-` /  /             ',
            \ '     =====`-.____`.___ \_____/___.-`___.-`=====          ',    
            \ '                       `=---=`                           ',
            \ '                                                         ',        
            \ '                                                         ',        
            \ '     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~         ',                
            \ '                                                         ',        
            \ '               佛祖保佑         永无BUG                  ',            
            \ '                                                         ',    
            \ '                                                         ',            
            \]                                                                               
" let s:myfooter = [
            " \ '+------------------------------+',
            " \ '|  1.01 ^ 365 =  37.78         |',
            " \ '+----------------+-------------+',
            " \]
let g:startify_custom_header = s:filter_header( s:myline )
" let g:startify_custom_footer = s:filter_header( s:myfooter)
let g:startify_lists = [
          \ { 'type': 'files',     'header': [   'MRU file']            },
          \]      

"设置error和warning的提示符，如果没有设置，ycm会以syntastic的g:syntastic_warning_symbol
"和 g:syntastic_error_symbol 这两个为准
let g:ycm_error_symbol='>>'
let g:ycm_warning_symbol='>*'

nnoremap <leader>gd :YcmCompleter GoTo<CR>
let g:ycm_complete_in_comments = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_server_log_level = 'error'

" UltiSnips setting
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" TaskList
let g:tlTokenList = ['TODO' , 'WTF', 'FIX']


" nerdtree设置
map <F2> :NERDTreeToggle<CR>
let NERDTreeSortOrder=['\/$', 'Makefile', '\.c$', '\.cc$', '\.cpp$', '\.h$', '*', '\~$']
let NERDTreeMinimalUI=2
let NERDTreeShowLineNumbers=1                   " 显示行号
let NERDTreeAutoCenter=1
let NERDTreeShowHidden=1                        " 是否显示隐藏文件
let NERDTreeWinSize=31                          " 设置宽度
let g:nerdtree_tabs_open_on_console_startup=1   " 在终端启动vim时，共享NERDTree
let NERDTreeIgnore=['\.pyc','\~$','\.idea']              " 忽略一下文件的显示
let NERDTreeQuitOnOpen=0                        " Close NERDtree when files was opened
" let NERDTreeShowBookmarks=1                     " 当打开 NERDTree 窗口时，自动显示 Bookmarks
" let NERDTreeWinPos="right"                      " 将 NERDTree 的窗口设置在 vim 窗口的右侧（默认为左侧）  

" 在 vim 启动的时候默认开启 NERDTree（autocmd 可以缩写为 au）
autocmd VimEnter *
                \   if !argc()
                \ |   Startify
                \ |   NERDTree
                \ |   wincmd w
                \ | endif
                " \ | else
                " \ |   NERDTree
                " \ |   wincmd w

" rainbow_parentheses
au VimEnter * RainbowParenthesesToggle
" au Syntax * RainbowParenthesesLoadSquare   " []
" au Syntax * RainbowParenthesesLoadBraces   " {}
" au Syntax * RainbowParenthesesLoadChevrons " <>

" set mapleader
let mapleader = ","
" vim-go custom mappings
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>e <Plug>(go-rename)

" 强制去掉上下左右
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>
" imap <Left> <Nop>
" imap <Right> <Nop>
" imap <Up> <Nop>
" imap <Down> <Nop>
" map <Left> <Nop>
" map <Right> <Nop>
" map <Up> <Nop>
" map <Down> <Nop>
" imap <c-h> <Left>
" imap <c-l> <Right>
" imap <c-k> <Up>
" imap <c-j> <Down>

"文件保存与退出  
nmap<silent> fw     :w<CR>  
nmap<silent> fq     :q<CR>  
nmap fwq            :wq<CR>  
nmap gm             :GoImports<CR>
nmap <F6>           :Startify<CR>
nmap <silent><leader><space>  za<CR>                " 用空格键来开关折叠

" resize current buffer by +/- 1 
nnoremap <C-left> :vertical resize -1<cr>
nnoremap <C-down> :resize +1<cr>
nnoremap <C-up> :resize -1<cr>
nnoremap <C-right> :vertical resize +1<cr>


imap <F1> <Esc>"
nmap <F1> <Esc>"


inoremap <silent><expr> ( complete_parameter#pre_complete("()")
smap <c-j> <Plug>(complete_parameter#goto_next_parameter)
imap <c-j> <Plug>(complete_parameter#goto_next_parameter)
smap <c-k> <Plug>(complete_parameter#goto_previous_parameter)
imap <c-k> <Plug>(complete_parameter#goto_previous_parameter)

"设置跳转的快捷键，可以跳转到definition和declaration
" nnoremap <leader>gc :YcmCompleter GoToDeclaration<CR>
" nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
" nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>

" 查看/跳转历史记录	
nnoremap <leader>h          :GundoToggle<CR>

nnoremap <leader><leader>b        :BufExplorer<CR>
nnoremap <leader><leader>bh       :BufExplorerHorizontalSplit<CR>
nnoremap <leader><leader>bv       :BufExplorerVerticalSplit<CR>

vmap <leader>y :w !pbcopy<CR><CR>   
nmap <leader>p :r !pbpaste<CR><CR> 

map <leader>w  :wincmd w<CR>    " 窗口切换
 
if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
                \| exe "normal g'\"" | endif
endif


autocmd BufNewFile *.[ch],*.hpp,*.cpp,*.py,*.sh,*.php,*.go exec ":call SetComment()"
function! SetComment()
    call setline(1,"/*===============================================================")
    call append(line("."),   "*   Copyright (C) ".strftime("%Y")." All rights reserved.")
    call append(line(".")+1, "*   ")
    call append(line(".")+2, "*   FileName：".expand("%:t"))
    call append(line(".")+3, "*   Author：GuoPu")
    call append(line(".")+4, "*   Date： ".strftime("%Y-%m-%d"))
    call append(line(".")+5, "*   Description：")
    call append(line(".")+6, "*")
    call append(line(".")+7, "================================================================*/")
endfunction

