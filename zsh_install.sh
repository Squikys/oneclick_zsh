#!/bin/bash
arr=( apt dnf pacman )

for i in ${arr[@]}; do
  if [ $i == pacman ]; then
    sudo pacman -S zsh 
  else 
    sudo $i install zsh
  fi
  CHECK=$?
  if [ $CHECK == 0 ]; then
    echo "-----------------------------"

    echo "installed zsh successfully !!"
    echo "-----------------------------"
   
    break
  fi
done

echo "would you like to make zsh default ? (y/n)"
read -p "input : " make_zsh_default
if [ $make_zsh_default == 'y' ]; then
  chsh -s $(which zsh)
fi

echo $CHECK
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
if [ $? != 0 ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git $ZSH_CUSTOM/plugins/zsh-autocomplete


sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting fast-syntax-highlighting zsh-autocomplete)/g' ~/.zshrc



echo "restart the terminal to see the changes :)"

