" NERDTree
" nnoremap <leader>n :NERDTreeFocus<CR>
" nnoremap <C-n> :NERDTree<CR>
" nnoremap <C-t> :NERDTreeToggle<CR>
" nnoremap <C-f> :NERDTreeFind<CR>
" imap <F7> <ESC>:NERDTreeToggle<CR>
nmap <F7> :NERDTreeToggle<CR>
nmap <C-f> :NERDTreeFind<CR>


" 不使用 Ex mode，将Q格式化 不会进入 Ex mode
map Q gq

" 关闭搜索高亮
nnoremap <leader>nh :let @/=""<CR>

" 用空格键来开关折叠
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

" 设置分屏窗口之间切换
nnoremap <C-S-j> <C-W><Up>
nnoremap <C-S-k> <C-W><Down>
nnoremap <C-S-h> <C-W><Left>
nnoremap <C-S-l> <C-W><Right>

" Ctrl + K 插入模式下光标向上移动
imap <c-k> <Up>
" Ctrl + J 插入模式下光标向下移动
imap <c-j> <Down>
" Ctrl + H 插入模式下光标向左移动
imap <c-h> <Left>
" Ctrl + L 插入模式下光标向右移动
imap <c-l> <Right>

" 常规模式下输入 cS 清除行尾空格
nmap cS :%s/\s\+$//g<CR>:noh<CR>

" 常规模式下输入 cM 清除行尾 ^M 符号
nmap cM :%s/\r$//g<CR>:noh<CR>

" 开关粘贴模式(保留粘贴原文格式)
nmap <leader>pa :set paste!<CR>

" 开关行号显示
nmap <leader>nu :set number!<CR>
