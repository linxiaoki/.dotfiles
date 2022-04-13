# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# 获取windows的ip
export WIN_IP=`cat /etc/resolv.conf | grep nameserver | awk '{print $2}'`
# 删除 ~/.proxychains.conf 中 [ProxyList] 所在行到文件末尾的全部内容
sed -i '/\[ProxyList\]/,$d' ~/.proxychains.conf
# 往文件末尾添加socks5设置，这个 10808 是我的 qv②ray 的 socks5 端口号，改成你自己的
echo '[ProxyList]\nsocks5 '${WIN_IP}' 10808' >> ~/.proxychains.conf
# 设置别名；使用 ~/.proxychains.conf 作为proxychains的配置文件；让proxychains quiet（不输出一大串东西）
alias pc='proxychains4 -q -f ~/.proxychains.conf'
# 用来手动开关代理，建议走 http 协议，因为 wget 不支持 socks5
my_proxy=http://${WIN_IP}:10808
alias p-on='export all_proxy='${my_proxy}' http_proxy='${my_proxy}' https_proxy='${my_proxy}''
alias p-off='unset all_proxy http_proxy https_proxy'

export LC_CTYPE=zh_CN.UTF-8
export LANG="zh_CN.UTF-8"
export LC_ALL="zh_CN.UTF-8"
export DISPLAY=$WIN_IP:23765.0

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

alias ls="exa"
alias git_log="git log --pretty=oneline --abbrev-commit --graph"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export MYVIMRC="$HOME/.vimrc"  # 设置vimrc环境

# 初始化 antigen
source /usr/share/zsh/share/antigen.zsh
# Load the oh-my-zsh's library
# oh-my-zsh 会启用历史命令、按键绑定等功能
antigen use oh-my-zsh
# 启用一些 bundle
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
# Load the theme
antigen theme romkatv/powerlevel10k
# Tell antigen that you're done
antigen apply


