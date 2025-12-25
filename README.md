# Ultimate coding setup for termux #

Features: 

- Working language servers for most languages with neovim.
- Clean and distraction free themes.
- Config is easy to extend.
- preconfigured zsh and p10k
- Easy to install

## Quick start ##

1. Clone the repo

```bash 
 git clone https://BayonetArch/tx-dev.git
```

2. run the script.

```bash 
 cd tx-dev && chmod +x setup && ./setup
```

3.Restart 

force stop:
```bash
pkill -f com.termux
```

restart termux and start neovim and wait for all plugins and bins to complete downloading.This will take some time.

## Features ## 

After installation you should have an working setup to start coding on most lanaguages with neovim.

### Zoxide

config uses zoxide so you should just be able to cd anywhere where you have been with `cd foo`.


### tmux
    
config installs tmux with minimal theme.
You can change keybinds in `~/.config/tmux/tmux.conf`.
But default keybinds of my config are as follows:

Alt-k : leader key<br>
Alt-a : launch android apps<br>
Alt-c : new window<br>
Alt-h : previous window<br>
Alt-l : next window
<br>
### neovim ###

config has comprehensive config for neovim.You can see keybinds or change bindings at `$HOME/.config/nvim/lua/config/keybinds.lua`

**Copilot and ai support**

in the `$HOME/.config/nvim/lua/plugins/ai.lua` you can see more info.


for copilot just do `:Copilot auth` and for Code Companion this config uses [groq](https://https://console.groq.com/home) ai.Set groq ai API_KEY with:

```bash
export GROQ_API_KEY=eeeeeeeee
 ```


