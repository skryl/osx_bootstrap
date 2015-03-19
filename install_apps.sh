# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
brew update

# Install Caskroom
brew install caskroom/cask/brew-cask

# Install more recent versions of some OS X eools
brew tap homebrew/dupes
brew tap caskroom/fonts
brew tap homebrew/versions
brew tap caskroom/versions

binaries=(
# tools
  ack
  aria2
  bash
  coreutils
  cscope
  ctags
  emacs
  fasd
  findutils
  git
  grep
  heroku-toolbelt
  htop
  mercurial
  mysql
  netcat
  nmap
  openssl
  postgresql
  pow
  reattach-to-user-namespace
  rename
  rlwrap
  sqlite
  subversion
  the_silver_searcher
  tmux
  tofrodos
  trash
  tree
  weechat
  wget
  zsh

# languages
  node
  python
  rbenv
  ruby
  ruby-build
#  erlang
#  ghc
#  go
#  leiningen
#  objective-caml
#  sbt
#  scala
#  swi-prolog
)

apps=(

# quicklook
  qlcolorcode
  qlprettypatch
  qlstephen
  qlmarkdown
  quicklook-json
  quicklook-csv
  betterzipql
  suspicious-package

# system
  airdisplay
  asepsis
  cheatsheet
  flash
  istat-menus
  iterm2
  java
  java6
  karabiner
  launchcontrol
  onyx
  seil
  silverlight
  slate
  the-unarchiver
  unetbootin

# web
  firefox
  google-chrome

# editors
  macvim
  macdown
  sublime-text3

# dev
  charles
  codekit
  github
  hex-fiend
  intellij-idea
  lighttable
  pycharm
  reggy
  rubymine
  sequel-pro
  sourcetree
  vagrant
  vagrant-manager
  virtualbox
  visualvm
  webstorm
  wireshark
  xquartz

# media
  spotify
  spotify-notifications
  vlc

# other
  alfred
  android-file-transfer
  appcleaner
  bartender
  bettertouchtool
  caffeine
  chromecast
  djview
  easyfind
  evernote
  flux
  google-hangouts
  handbrake
  harvest
  hazel
  hiss
  hyperdock
  ichm
  kindle
  music-manager
  paw
  send-to-kindle
  skitch
  skype
  slack
  steam
  teamviewer
  torbrowser
  transmission
  walpaper-wizard

#  boom
#  bowtie
#  dropbox
#  geektool
#  growl-fork
#  key-codes
#  unity
)

fonts=(
  font-anonymous-pro-for-powerline
  font-dejavu-sans-mono-for-powerline
  font-droid-sans-mono-for-powerline
  font-inconsolata-dz-for-powerline
  font-inconsolata-for-powerline
  font-inconsolata-g-for-powerline
  font-liberation-mono-for-powerline
  font-meslo-lg-for-powerline
  font-sauce-code-powerline
  font-ubuntu-mono-powerline
)

echo "Installing Brews..."
brew install ${binaries[@]}
brew cleanup --force
rm -rf /Library/Caches/Homebrew/*

echo "Installing Apps..."
brew cask install --appdir="/Applications" ${apps[@]}

echo "Installing Fonts..."
brew cask install ${fonts[@]}

echo "Linking Alfred..."
brew cask alfred link

appstore=(
  airmail
  aperture
  byword
  daisydisk
  dash
  diskdoctor
  forklift
  gemini
  gif-brewery
  hyperdock
  kaleidoscope
  wunderlist
)

echo "Install These From AppStore:"
echo ${appstore[@]}

manual=(
  adobe-acrobat-pro
  disktools-pro
  navicat-premium
  omnigraffle
  tuxera-ntfs
  alcatraz-xcode
)

echo "Install These Manually:"
echo ${manual[@]}

echo "Goodbye!"
