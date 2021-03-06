# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install vim Plugin manager
if test ! -e "$HOME/.vim"; then
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# Install zsh Plugin manager
if test ! -e "$HOME/.antigen"; then
  curl -fLo ~/.antigen/antigen.zsh --create-dirs \
      git.io/antigen
fi

# Install tmux plugin manager
if test ! -e "$HOME/.tmux"; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi


# Update homebrew recipes
brew update

# Install more recent versions of some OS X eools
brew tap caskroom/fonts

binaries=(

# tools
  ack
  bash
  bat
  coreutils
  cscope
  ctags
  fasd
  fd
  findutils
  fzf
  git
  grep
  heroku/brew/heroku
  htop
  jq
  mas
  ncdu
  netcat
  nmap
  openssl
  postgresql
  prettyping
  reattach-to-user-namespace
  rename
  rlwrap
  sqlite
  the_silver_searcher
  tldr
  tmux
  tofrodos
  trash
  tree
  wget
  zsh
  # emacs
  # mysql
  # subversion


# languages
  ruby
  rbenv
  ruby-build
  node
  nodenv
#  go
#  scala

# build essentials
  coreutils
  automake
  autoconf
  openssl
  libyaml
  readline
  libxslt
  libtool
  unixodbc
)

apps=(

# quicklook
  qlcolorcode
  qlimagesize
  qlmarkdown
  qlprettypatch
  qlstephen
  qlvideo
  quicklook-csv
  quicklook-json
  webpquicklook

# system
  cheatsheet
  duet
  endurance
  intel-power-gadget
  istat-menus
  iterm2
  java
  karabiner-elements
  launchcontrol
  superduper
  the-unarchiver
  # airdisplay
  # asepsis
  # onyx
  # slate

# web
  firefox
  google-chrome

# editors
  macvim
  visual-studio-code
  sublime-text

# dev
  alcatraz
  charles
  dash
  docker
  hex-fiend
  intellij-idea-ce
  mountain-duck
  ngrok
  paw
  postico
  postman
  rubymine
  tower
  tuxera-ntfs
  visualvm
  wireshark
  sequel-pro
  # codekit
  # xquartz
  # virtualbox

# media
  spotify
  vlc
  airflow

# productivity
  1password
  adobe-acrobat-pro
  alfred
  appcleaner
  bartender
  bettertouchtool
  cleanmymac
  daisydisk
  dropbox
  evernote
  franz
  gifox
  harvest
  hyperdock
  kindle
  omnigraffle
  teamviewer
  torbrowser
  transmission
  # boom
  # djview
  # easyfind
  # handbrake
  # hazel
  # ichm
  # send-to-kindle
  # slack
  # steam
)

fonts=(
  font-anonymice-powerline
  font-inconsolata-for-powerline
  font-noto-mono-for-powerline
  font-consolas-for-powerline
  font-inconsolata-g-for-powerline
  font-roboto-mono-for-powerline
  font-dejavu-sans-mono-for-powerline
  font-liberation-mono-for-powerline
  font-source-code-pro-for-powerline
  font-droid-sans-mono-for-powerline
  font-menlo-for-powerline
  font-ubuntu-mono-derivative-powerline
  font-fira-mono-for-powerline
  font-meslo-for-powerline
  font-inconsolata-dz-for-powerline
  font-monofur-for-powerline
)

appstore=(
  937984704  # amphetamine
  961632517  # be focused pro
  587512244  # kaleidoscope
  1176895641 # spark
  410628904  # wunderlist
  975937182  # fantastical
)

echo "Installing Brews..."
brew install ${binaries[@]}
brew cleanup --force
rm -rf /Library/Caches/Homebrew/*

echo "Installing Apps..."
brew cask install ${apps[@]}

echo "Installing Fonts..."
brew cask install ${fonts[@]}

echo "Installing AppStore Apps:"
mas install ${appstore[@]}

echo "Goodbye!"
