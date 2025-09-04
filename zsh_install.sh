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

echo $CHECK
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
if [ $? != 0 ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting


sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting )/g' ~/.zshrc

echo "-----------------------------------------"
echo "restart the terminal to see the changes :)"
echo "-----------------------------------------"

