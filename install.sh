#!/bin/bash
echo "Nick.vim install ..."

# 安装 vim 和 git
if which apt-get >/dev/null 2>&1; then
	sudo apt-get install -y vim git
elif which yum >/dev/null 2>&1; then
	sudo yum install -y vim git
elif which brew >/dev/null 2>&1; then
	brew install vim git
fi

# 备份旧配置
[ -d ~/.vim ] && mv -f ~/.vim ~/.vim_old
[ -f ~/.vimrc ] && mv -f ~/.vimrc ~/.vimrc_old

# 克隆配置
cd ~/ && git clone https://github.com/nickdecodes/vim.git
mv -f ~/vim ~/.vim

# 链接 vimrc
ln -sf ~/.vim/vimrc ~/.vimrc

echo "Nick.vim installed successfully"
