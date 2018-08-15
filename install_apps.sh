# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
brew update

# Install more recent versions of some OS X eools
brew tap caskroom/fonts

binaries=(

# tools
  ack
  bash
  coreutils
  cscope
  ctags
  fasd
  findutils
  fzf
  git
  grep
  heroku/brew/heroku
  htop
  jq
  mas
  netcat
  nmap
  openssl
  postgresql
  reattach-to-user-namespace
  rename
  rlwrap
  sqlite
  the_silver_searcher
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
  suspicious-package
  webpquicklook

# system
  cheatsheet
  duet
  intel-power-gadget
  istat-menus
  iterm2
  java
  karabiner-elements
  launchcontrol
  onyx
  the-unarchiver
  unetbootin
  # airdisplay
  # asepsis
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
  kaleidoscope
  mountain-duck
  ngrok
  paw
  postman
  rubymine
  tower
  tuxera-ntfs
  virtualbox
  visualvm
  wireshark
  sequel-pro
  # codekit
  # xquartz

# media
  spotify
  vlc

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
  endurance
  evernote
  fantastical
  franz
  gifox
  harvest
  hyperdock
  kindle
  omnigraffle
  teamviewer
  torbrowser
  transmission
  wallpaper-wizard
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
  410628904  # wunderlist
  1176895641 # spark
  961632517  # be focused pro
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
