" 让j和k导航到视觉行而不是逻辑行
" nmap j gj
" nmap k gk
" 我喜欢使用H和L来移动到行的开头和结尾
nmap H ^
nmap L $
" 复制到系统剪贴板
set clipboard=unnamed


" 使用Ctrl+O和Ctrl+I返回和前进
"（确保删除默认的Obsidian快捷键以使其工作）
exmap back obcommand app:go-back
nmap <C-o> :back
exmap forward obcommand app:go-forward
nmap <C-i> :forward

" 只键入 ：obcommand，你将在开发人员控制台 （Ctrl+Shift+I） 中获得应用当前定义的命令列表。简单的语法 ：obcommand [commandName] 将执行命名命令。
" obcommand editor:insert-link


exmap exfind obcommand vimium:show-markers
nmap f :exfind<CR>a


" ---------------
exmap ex_app_delete_file obcommand app:delete-file
nmap x :ex_app_delete_file<CR>

exmap ex_app_go_back obcommand app:go-back
exmap ex_app_go_forward obcommand app:go-forward
nmap [ :ex_app_go_back<CR>
nmap ] :ex_app_go_forward<CR>

exmap ex_f_af obcommand file-explorer:reveal-active-file
exmap ex_f_op obcommand file-explorer:open
" exmap ex_w_glt obcommand workspace:goto-last-tab
exmap ex_w_nt obcommand workspace:next-tab
exmap ex_w_pt obcommand workspace:previous-tab
exmap ex_w_sh obcommand workspace:split-horizontal
exmap ex_w_sv obcommand workspace:split-vertical


nmap <S-O> :ex_f_af<CR>
nmap <S-o> :ex_f_op<CR>
" nmap [ :ex_w_glt<CR>
nmap <S-[> :ex_w_nt<CR>
nmap <S-]> :ex_w_pt<CR>
nmap | :ex_w_sh<CR>
nmap \ :ex_w_sv<CR>

" Emulate Folding https://vimhelp.org/fold.txt.html#fold-commands
exmap togglefold obcommand editor:toggle-fold
nmap zo :togglefold<CR>
nmap zc :togglefold<CR>
nmap za :togglefold<CR>

exmap unfoldall obcommand editor:unfold-all
nmap zR :unfoldall<CR>

exmap foldall obcommand editor:fold-all
nmap zM :foldall<CR>

exmap tabnext obcommand workspace:next-tab
nmap gt :tabnext<CR>

exmap tabprev obcommand workspace:previous-tab
nmap gT :tabprev<CR>



exmap surround_wiki surround [[ ]]
exmap surround_double_quotes surround " "
exmap surround_single_quotes surround ' '
exmap surround_backticks surround ` `
exmap surround_brackets surround ( )
exmap surround_square_brackets surround [ ]
exmap surround_curly_brackets surround { }

" NOTE: must use 'map' and not 'nmap'
map [[ :surround_wiki<CR>
nunmap s
vunmap s
map s" :surround_double_quotes<CR>
map s' :surround_single_quotes<CR>
map s` :surround_backticks<CR>
map sb :surround_brackets<CR>
map s( :surround_brackets<CR>
map s) :surround_brackets<CR>
map s[ :surround_square_brackets<CR>
map s] :surround_square_brackets<CR>
map s{ :surround_curly_brackets<CR>
map s} :surround_curly_brackets<CR>


