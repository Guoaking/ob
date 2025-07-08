---

tags:
  - cb
创建时间: 2024-11-10 21:51:54
三观: Happy
title: "[[macos]]"
---


## 基本
```bash
defaults write -g NSAutomaticWindowAnimationsEnabled -bool false

Defaults write com.apple.Dock autohide-delay -float 0 && killall Dock

## homebrew 
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
/bin/bash -c "$(curl -fsSL https://gitee.com/ineo6/homebrew-install/raw/master/install.sh)"


## 字体

brew install --cask wezterm@nightly
brew install wget zsh git fzf rg eza zoxide mos  yazi raycast ssh   
brew install --no-quarantine --cask nikitabobko/tap/aerospace
brew install bat ncdu procs duckdb curl
  
brew install nvim
git clone https://github.com/LazyVim/starter ~/.config/nvim
```



### zsh
```bash

# 设置环境变量
echo 'export ZDOTDIR="$HOME/.config/zsh"' >> ~/.zshenv

# 重新加载配置
exec zsh

# 检查路径
echo $ZDOTDIR
echo $ZSH

export ZDOTDIR="$HOME"
export ZSH="$HOME/.oh-my-zsh"




### oh my zsh 
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

### 下载p10k 
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.config/oh-my-zsh/custom}/themes/powerlevel10k


# 安装 zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# 安装 zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# 设置自动建议颜色 
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#808080" 

# 启用即时建议 
ZSH_AUTOSUGGEST_STRATEGY=(history completion)


# 移动整个目录
mv ~/.oh-my-zsh ~/.config/oh-my-zsh

  

# 更新 zshrc 中的路径
sed -i '' 's|$HOME/.oh-my-zsh|$HOME/.config/oh-my-zsh|g' ~/.config/zsh/.zshrc


# 移动主题目录
mv ~/.oh-my-zsh/custom/themes/powerlevel10k ~/.config/oh-my-zsh/themes/

  

# 更新 zshrc 中的主题路径
sed -i '' 's|~/.oh-my-zsh/custom/themes|~/.config/oh-my-zsh/themes|g' ~/.config/zsh/.zshrc
```



### lazyvim 

```
nvim 


理论上 下载完nvim即可?






```



### yazi

```bash

插件
https://github.com/wylie102/duckdb.yazi

```




### DNS

```plain_text
networksetup -setdnsservers Wi-Fi 8.8.8.8 114.114.114.114 180.76.76.76

清空dns缓存
dscacheutil -flushcache


```

可以一次设置多个DNS， 常用的DNS：

- 114DNS： 114.114.114.114 114.114.115.115
- 阿里DNS： 223.5.5.5 223.6.6.6
- 百度DNS： 180.76.76.76
- Google DNS： 8.8.8.8 8.8.4.4
```


dscacheutil -flushcache






```

禁用窗口打开动画
```
defaults write -g NSAutomaticWindowAnimationsEnabled -bool false
```


一个命令行时间
https://github.com/chubin/wttr.in

```shell
curl "wttr.in/~BeiJing+HaiDian?format=4" -H 'Accept-Language:zh-CN'
```

BeiJing+HaiDian: ☀️   🌡️+2°C 🌬️↓4km/h








### areospace



```mermaid
graph TD

subgraph main
飞书
Google
Arc
WPS
end 

subgraph dev
Trae
Code
WezTerm
end 


subgraph else
QQ音乐
飞连
end 


subgraph me
Obsidian
end 


访达
uTools
Step


```


```
aerospace  list-windows --all
aerospace  list-windows --monitor focused


aerospace  list-apps


erospace  list-exec-env-vars

aerospace  list-monitors


aerospace  list-workspaces --all
aerospace  list-workspaces --monitor focused

```

```
aerospace  reload-config
aerospace  fullscreen   
```





### 移动到显示器

### 移动 
```
aerospace move --window-id 120 down

```


选择 Workspace 
移动workspace

选择window 
移动window到指定space 
调整window在space的位置

调整window大小

选择 mointor? 

### fzf
[reference](https://junegunn.github.io/fzf/reference/)


 `--walker-root=DIR [...]`

用于启动内置目录遍历器的目录名称列表。默认值为当前工作目录。

 `--walker-skip=DIRS` 
在目录审核期间要跳过的目录名称的逗号分隔列表。默认值为 `.git，node_modules`。



 `--walker=`
    `file` — 在搜索结果中包含文件
    `dir` — 在搜索结果中包含目录
    `hidden` — 包括和关注隐藏目录
    `follow` — Follow 符号链接


C+T  file  dir
FZF_CTRL_T_COMMAND

```sh
# Preview file content using bat (https://github.com/sharkdp/bat)
export FZF_CTRL_T_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"
```


C+R   history 


```sh
export FZF_CTRL_R_OPTS="
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"
`````





A+C   **cd 到所选目录**
FZF_ALT_C_COMMAND

- zsh: `FZF_ALT_C_COMMAND= source <(fzf --zsh)`  


```sh
# Print tree structure in the preview window
export FZF_ALT_C_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'tree -C {}'"
```


```
# 您主目录下的文件
vim ~/**<TAB>



# 当前目录下的文件
# 您可以使用 TAB 键选择多个项目
vim **<TAB>

# 父目录下的文件
vim ../**<TAB>

# 父目录下匹配 `fzf` 的文件
vim ../fzf**<TAB>



# 当前目录下的目录（单选）
cd **<TAB>

# ~/github 目录下匹配 `fzf` 的目录
cd ~/github/fzf**<TAB>
```



fd 
[fd](https://github.com/cha0ran/fd-zh)



rg


git  branch 


```sh
# ripgrep->fzf->vim [QUERY]
rfv() (
  RELOAD='reload:rg --column --color=always --smart-case {q} || :'
  OPENER='if [[ $FZF_SELECT_COUNT -eq 0 ]]; then
            vim {1} +{2}     # No selection. Open the current line in Vim.
          else
            vim +cw -q {+f}  # Build quickfix list for the selected items.
          fi'
  fzf --disabled --ansi --multi \
      --bind "start:$RELOAD" --bind "change:$RELOAD" \
      --bind "enter:become:$OPENER" \
      --bind "ctrl-o:execute:$OPENER" \
      --bind 'alt-a:select-all,alt-d:deselect-all,ctrl-/:toggle-preview' \
      --delimiter : \
      --preview 'bat --style=full --color=always --highlight-line {2} {1}' \
      --preview-window '~4,+{2}+4/3,<80(up)' \
      --query "$*"
)
```




https://github.com/junegunn/fzf-git.sh

```sh
git branch | fzf --preview 'git show --color=always {-1}' \
                 --bind 'enter:become(git checkout {-1})' \
                 --height 40% --layout reverse
```

### fd

```
fd --type f
```

### rg


### zoxide




## karabiner


#### Left_shift 切换输入法为英文输入法
```json
{
    "description": "[Left_shift] 切换输入法为英文输入法",
    "manipulators": [
        {
            "conditions": [
                {
                    "input_sources": [
                        {
                            "language": "en"
                        }
                    ],
                    "type": "input_source_unless"
                }
            ],
            "from": {
                "key_code": "left_shift",
                "modifiers": {
                    "optional": [
                        "any"
                    ]
                }
            },
            "to": [
                {
                    "key_code": "right_shift"
                }
            ],
            "to_if_alone": [
                {
                    "key_code": "0",
                    "modifiers": [
                        "left_command",
                        "left_shift",
                        "left_control"
                    ]
                }
            ],
            "type": "basic"
        }
    ]
}
```