# vim

轻量 Vim 配置，零插件依赖，适用于服务器和日常编辑。

### 安装

```bash
wget -qO- https://raw.github.com/nickdecodes/vim/master/install.sh | sh -x
```

### 卸载

```bash
sh ~/.vim/uninstall.sh
```

### 功能

- 自定义暗色配色方案
- 新建文件自动插入头部模板（C/C++/Python/Go/Java/Shell）
- 一键编译运行（`<Space>cr`）
- GDB 调试（`<Space>rg`）
- 快捷键查看（`<Space>ss`）

### 快捷键

| 按键 | 功能 |
|------|------|
| `<Space>cr` | 编译运行 |
| `<Space>rg` | GDB 调试 |
| `<Space>ft` | 文件浏览 (netrw) |
| `<Space>rt` | 生成 ctags |
| `<Space>rb` | 去除尾部空白 |
| `<Space>rm` | 去除 ^M 字符 |
| `<Space>rw` + 方向键 | 调整窗口大小 |
| `<Space>cw` | 关闭窗口 |
| `<Space>qw` | 保存退出窗口 |
| `<Space>hm` | 水平分屏编辑 vimrc |
| `<Space>vm` | 垂直分屏编辑 vimrc |
| `<Space>sm` | 重新加载 vimrc |
| `<Esc><Esc>` | 保存文件 |
| `<Ctrl-c>` | 可视模式复制到剪贴板 |
| `<Ctrl-p>` | 粘贴剪贴板内容 |

### 目录结构

```
~/.vim/
├── colors/default.vim   # 自定义配色
├── vimrc                # 配置文件
├── install.sh           # 安装脚本
├── uninstall.sh         # 卸载脚本
├── LICENSE
└── README.md
```
