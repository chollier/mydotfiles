1. Set zsh : ```chsh -s $(which zsh)```
2. install oh my zsh : https://github.com/robbyrussell/oh-my-zsh
2. Clone : `git clone git://github.com/chollier/mydotfiles`
3. Install homebrew : http://brew.sh/
4. Install rcm :
  ```brew tap thoughtbot/formulae
    brew install rcm
    ```
5. Install the dotfiles :
  `env RCRC=$HOME/mydotfiles/rcrc rcup`
6. run `brew bundle`


End :
 - Transfer ~/.aws
 - Transfer relevant ~/.ssh
 - Transfer .docker/config
 - Transfer zsh history

