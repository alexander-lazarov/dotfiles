# New machine setup

- Open terminal.app, install brew
- Set touchbar scroll direction to not natural
- Remap Esc to CapsLock
- Set up ssh keys:
  `mkdir ~/.ssh && cp id_rsa id_rsa.pub ~/.ssh && chmod 06000 ~/.ssh/id_rsa*`
- clone dotfiles
  `mkdir ~/work && cd ~/work && git clone git@github.com:alexander-lazarov/dotfiles.git`
- install brew packages:
  `/opt/homebrew/bin/brew bundle`
- install dotfiles
```bash
cd ~/work/dotfiles/stow
/opt/homebrew/bin/stow . --target=$HOME --no-folding
```
- import gpp kys
```bash
mkdir ~/.gnupg
echo "pinentry-program $(brew --prefix)/bin/pinentry-mac" > ~/.gnupg/gpg-agent.conf
chmod -R 0700 ~/.gnupg
gpg --import /Volumes/Secrets/gpg-export.asc
```

