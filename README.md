# Configs
个人的配置文件
## Vim
vim本着按照编辑器需求配置完成一下功能：
1. 基于fzf模糊搜索文件和buffer
2. 基于Ctags做代码常规转跳
3. 基于当前文档和buffer进行自动补全（项目较大时基于ctag的补全容易卡顿）
4. 查看文件树

## zshrc
改变了主题，提示窗口显示 『用户名@主机明：当前路径』，方面服务器上使用

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

1. Prefenrences -> default -> General -> Reuse previous session`s directory
./ssh/config
ControlMaster auto
ControlPath ~/.ssh/master-%r@%h:%p

2. 配置Mac所在机器的ssh
vim ~/.ssh/config
输入下面三行
host *
ControlMaster auto
ControlPath ~/.ssh/master-%r@%h:%p

3. 重新打开终端，第一次，你还是需要输入密码，第二次ssh登录同一台机器，你就不用输入密码了，跟secureCRT一样的clone session的方式一样。 
在~/.ssh/目录下发现master-*的sock文件。它记录了你目前登录到的机器，这样的话，你登录同样的机器就会重用同一个链接了
