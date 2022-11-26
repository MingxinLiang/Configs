# Configs
个人的配置文件
链接到个人配置目录下
ln -s `pwd` ./~

## zshrc


##### 安装 zsh
ubuntu: sudo apt-get install zsh
centos: sudo yum install -y zsh


##### 安装 oh-my-zsh
sh zsh/zsh_install.sh
> 国内镜像：sh -c "$(curl -fsSL https://gitee.com/mirrors/oh-my-zsh/raw/master/tools/install.sh)"


###### 配置
ln -s ~/Configs/zsh/zshrc ~/.zshrc
ln -s ~/Configs/zsh/p10k.zsh ~/.p10k.zsh


安装语法高亮插件参考
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git 


补全插件参考：
git clone https://github.com/zsh-users/zsh-completions.git


## Vim
vim本着按照编辑器需求配置完成一下功能：
1. 基于fzf模糊搜索文件和buffer
2. 基于Ctags做代码常规转跳
3. 基于当前文档和buffer进行自动补全（项目较大时基于ctag的补全容易卡顿）
4. 查看文件树
### 安装插件管理器
 curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
 
### 配色
cd 

cd .vim

mkdir colors

之后建立配色文件，参考：https://github.com/tomasr/molokai


## Mac
基于有效的应用Mac笔记

- 保持连接

情景一：如果您有多台服务器，不想在每台服务器上设置，如下操作：
1. 运行命令：

cd ~/.ssh/

2. 假如运行命令ls，没有config,新建config

vim config

3. 在config在里面输入

ServerAliveInterval=60

4. 保存文件

在链接linux服务器，就不会有断线的问题了。

情景二：如果您有多个人管理服务器，不想在每个客户端进行设置，只需在服务器的 /etc/ssh/sshd_config 中添加如下的配置：

ClientAliveInterval 60

情景三：如果您只想让当前的 ssh 保持连接，可以使用以下的命令：

ssh -o ServerAliveInterval=60 user@sshserver


- 克隆会话

因为每次需要先登录跳转机，再登录开发机，输入两次密码，过于繁琐，所以上网找了iterm下克隆会话功能。

1. Prefenrences -> Profiles -> General -> Reuse previous session`s directory



2. 配置Mac所在机器的ssh
vim ~/.ssh/config
输入下面三行
host *

ControlMaster auto

ControlPath ~/.ssh/master-%r@%h:%p

3. 重新打开终端，第一次，你还是需要输入密码，第二次ssh登录同一台机器，你就不用输入密码了，跟secureCRT一样的clone session的方式一样。 
在~/.ssh/目录下发现master-*的sock文件。它记录了你目前登录到的机器，这样的话，你登录同样的机器就会重用同一个链接了

## VScode
1. VsCode下使用vim，光标不能连续移动的问题：
sudo defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
code

