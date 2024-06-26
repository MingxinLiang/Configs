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
- p10k 主题
ln -s ~/Configs/zsh/themes/p10k.zsh ~/.p10k.zsh
- robbyrussell
cp ~/Configs/zsh/themes/robbyrussell.zsh-theme .oh-my-zsh/themes/robbyrussell.zsh-theme

- 安装语法高亮插件参考:

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git 

- 补全插件参考：

git clone https://github.com/zsh-users/zsh-completions.git

- zsh 设为默认
chsh -s /usr/bin/zsh
- 常见问题参考

机器没有联网出现 ```gitstatus failed to initialize```
手动下载放到```~/Configs/zsh/themes/powerlevel10k/gitstatus/usrbin```

## Vim

vim本着按照编辑器需求配置完成一下功能：
1. 基于fzf模糊搜索文件和buffer
2. 基于Ctags做代码常规转跳
3. 基于当前文档和buffer进行自动补全（项目较大时基于ctag的补全容易卡顿）
4. 查看文件树
### 安装插件管理器
1. mkdir -p ~/.vim/autoload/
2. cp Configs/vim/plug.vim ~/.vim/autoload/
3. vim PlugInstall
 
### 配色
1. cp ./vim/colors ~/.vim/

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

情景二：如果您有多个人管理服务器，不想在每个客户端进行设置:

只需在服务器的 /etc/ssh/sshd_config 中添加如下的配置

ClientAliveInterval 60

情景三：如果您只想让当前的 ssh 保持连接，可以使用以下的命令：

ssh -o ServerAliveInterval=60 user@sshserver

- 克隆会话

因为每次需要先登录跳转机，再登录开发机，输入两次密码，过于繁琐，所以上网找了iterm下克隆会话功能。

1. Prefenrences -> Profiles -> General -> Reuse previous session`s directory

2. 配置Mac所在机器的ssh:

    vim ~/.ssh/config
    
    输入下面三行:
    
    host *
    
    ControlMaster auto
    
    ControlPath ~/.ssh/master-%r@%h:%p
    
3. 重新打开终端，第一次，你还是需要输入密码，第二次ssh登录同一台机器，你就不用输入密码了，跟secureCRT一样的clone session的方式一样。 
在~/.ssh/目录下发现master-*的sock文件。它记录了你目前登录到的机器，这样的话，你登录同样的机器就会重用同一个链接了

- iterm2 zmodem [lzrsz协议](https://ohse.de/uwe/software/lrzsz.html)

1. brew install lrzsz  - 安装lrzsz

2. ```cp ~/Configs/iterm2-zmodem/* /usr/local/bin/```

3. chmod +x /usr/local/bin/iterm2-*

4. iTerm2 -> Profiles -> Default ->Advanced -> Triggers -> edit:

```
Regular expression: rz waiting to receive.\*\*B0100
Action: Run Silent Coprocess
Parameters: /usr/local/bin/iterm2-send-zmodem.sh
Instant: checked

Regular expression: \*\*B00000000000000
Action: Run Silent Coprocess
Parameters: /usr/local/bin/iterm2-recv-zmodem.sh
Instant: checked
```

## VScode
1. VsCode下使用vim，光标不能连续移动的问题：
sudo defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
code

## WSL2
### 代理
1. 获取宿主机IP(ipconfig), 测试可以联通
2. 在主机的服务中允许局域网中的连接
3. 配置代理
```
win_ip=`ipconfig.exe | grep IPv4 | head -n 1 | cut -d":" -f 2 | awk '$1=$1'`
win_x_port="8001"
export all_proxy="socks5://${win_ip}:${win_x_port}"
```
