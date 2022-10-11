" 导入插件、键位配置, [RefLink](https://github.com/craftzdog/dotfiles-public)
runtime ./plug.vim
runtime ./maps.vim

if has("unix")
  let s:uname = system("uname -s")
  " Do Mac stuff
  if s:uname == "Darwin\n"
    runtime ./macos.vim
  endif
endif

if (has("win32") || has("win64") || has("win95") || has("win16"))
  runtime ./windows.vim
endif

" 开启语法高亮，设置主题色
syntax on
colorscheme onedark
" colorscheme snazzy

" 显示行号 number/nonumber
set nu

" 总是显示状态行
set laststatus=2

" 设置命令行和状态栏
" 设置在状态行显示的信息规则如下：
"  %F              当前文件名
"  %m              当前文件修改状态
"  %r              当前文件是否只读
"  %Y              当前文件类型
"  %{&fileformat}  当前文件编码
"  %b              当前光标处字符的ASCII码值
"  %B              当前光标处字符的十六进制值
"  %l              当前光标行号
"  %c              当前光标列号
"  %V              当前光标虚拟列号(根据字符所占字节数计算)
"  %p              当前行占总行数的百分比
"  %%              百分号
"  %L              当前文件总行数
set statusline=%F%m%r\ ASCII=\%b,HEX=\%B,%l,%c%V\ %L-%p%%

" 设置窗口的标题，依赖 title 选项
set titlestring=%t\ (%{expand(\"%:p:.:h\")}/)

" 自动缩进 autoinent
set ai

" 插入模式下将 tab 转化成空格
set expandtab

" 设置<>或=缩进命令一次缩进为多少个空格
set shiftwidth=2

" 设置 tab 键对应多少个空格
set tabstop=2

" 应用在块可视模式，光标可以定位在不是真实字符上
set ve=block

" 按 = 自动缩进的选项
set	cinoptions=>s,e0,n0,f0,{0,}0,^0,:0,=s,l0,b0,g0,hs,ps,ts
set cinoptions+=is,+s,c3,C0,0,(0,us,U0,w0,W0,m0,j0,)20,*30

" 高亮搜索关键词
set hlsearch

" 忽略大小写搜索
set ignorecase

" 设定在任何模式下鼠标都可用
set mouse=

" 设置 grep 命令使用的程序
set grepprg=lid\ -Rgrep\ -s

" 识别 grep 命令输出格式
set grepformat=%f:%l:%m
