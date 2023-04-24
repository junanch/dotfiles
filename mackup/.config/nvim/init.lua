-- 基础配置
require("basic")
-- 快捷键映射
require("keybindings")
-- Packer 插件管理
require("plugins")
-- 主题设置
require("colorscheme")

------------------------------------------------------------------
-- 插件配置
------------------------------------------------------------------
-- 左边侧边栏
require("plugin-config.nvim-tree")
-- 顶部标签栏
require("plugin-config.bufferline")
-- 底部状态栏
require("plugin-config.lualine")
-- 搜索窗口
require("plugin-config.telescope")
-- 启动页
require("plugin-config.dashboard")
-- 启动页模糊查找
require("plugin-config.project")
-- 代码高亮
require("plugin-config.nvim-treesitter")
-- 代码缩进线
require("plugin-config.indent-blankline")
------------------------------------------------------------------

------------------------------------------------------------------
---- 内置LSP（Language Server Protocol）
------------------------------------------------------------------
require("lsp.setup")
-- 代码自动补全、提示
require("lsp.cmp")
-- UI 增强
require("lsp.ui")
------------------------------------------------------------------
