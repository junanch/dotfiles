" Use Windows clipboard to copy and to paste
set clipboard^=unnamed,unnamedplus

" 相当于 window 下的复制粘贴, 必须要安装 gnome-vim 才有效
vnoremap <silent> !y "+y
nnoremap <silent> !p "+p