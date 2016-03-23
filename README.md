
# get started

```
mkdir ~/.config
cd ~/.config
git clone https://github.com/stillhart/terminal_configs.git
cd ~/.config/terminal_configs
touch ~/.zshrc_local
cd ~
ln -s ~/.config/terminal_configs/.tmux.conf .tmux.conf
ln -s ~/.config/terminal_configs/.zshrc .zshrc
```

## fish

```
mkdir ~/.config
mkdir ~/.config/fish
touch ~/.config/fish/config_local.fish
touch ~/.config/fish/aliases_local.fish

cd ~/.config/fish
ln -s ../terminal_configs/fish/config.fish  config.fish
ln -s ../terminal_configs/fish/aliases.fish aliases.fish

mkdir ~/.config/fish/functions
cd ~/.config/fish/functions
ln -s ../../terminal_configs/fish/functions/be.fish       be.fish
ln -s ../../terminal_configs/fish/functions/beirb.fish    beirb.fish
ln -s ../../terminal_configs/fish/functions/berc.fish     berc.fish
ln -s ../../terminal_configs/fish/functions/fish_prompt.fish fish_prompt.fish
ln -s ../../terminal_configs/fish/functions/fish_right_prompt.fish fish_right_prompt.fish
ln -s ../../terminal_configs/fish/functions/foricons.fish foricons.fish 
ln -s ../../terminal_configs/fish/functions/foriman.fish foriman.fish
ln -s ../../terminal_configs/fish/functions/ga.fish ga.fish 
ln -s ../../terminal_configs/fish/functions/gc.fish gc.fish 
ln -s ../../terminal_configs/fish/functions/guardian.fish guardian.fish 
ln -s ../../terminal_configs/fish/functions/mux0.fish mux0.fish
ln -s ../../terminal_configs/fish/functions/mux.fish mux.fish
ln -s ../../terminal_configs/fish/functions/tmux0.fish tmux0.fish 
ln -s ../../terminal_configs/fish/functions/tmux1.fish tmux1.fish
ln -s ../../terminal_configs/fish/functions/vi.fish vi.fish
```
