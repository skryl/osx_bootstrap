# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
brew update

# Install more recent versions of some OS X tools
brew tap homebrew/dupes
brew tap caskroom/fonts

binaries=(
# tools
  coreutils
  findutils
  bash
  grep
  ack
  cscope
  ctags
  emacs
  #encfsmacosxfuse
  fasd
  git
  heroku-toolbelt
  htop
  imagemagick
  iperf
  memcached
  mercurial
  mobile-shell
  mysql
  netcat
  nmap
  openssl
  postgresql
  pow
  reattach-to-user-namespace
  redis
  rename
  rlwrap
  skytools
  sqlite
  #subversion
  the_silver_searcher
  tmux
  tofrodos
  trash
  tree
  weechat
  wget

# languages
  erlang
  ghc
  go
  leiningen
  node
  objective-caml
  python
  rbenv
  ruby
  ruby-build
  sbt
  scala
  swi-prolog
)

apps=(
# Adobe Acrobat XI Pro
# CiscoVPN
# TomTom MySports Connect

# quicklook
  qlcolorcode
  qlprettypatch
  qlstephen
  qlmarkdown
  quicklook-json
  qlprettypatch
  quicklook-csv
  betterzipql
  webp-quicklook
  suspicious-package

# system
  asepsis
  flash
  seil
  karabiner
  iterm2
  java

# web
  firefox
  google-chrome
  lastpass-universal

#editors
  sublime-text3
  macvim
  mou

#dev
  vagrant
  vagrant-manager
  virtualbox

#media
  spotify
  vlc

#tools
  #send-to-kindle
  #navicat-premium
  airmail
  alfred
  android-file-transfer
  appcleaner
  appfresh
  bartender
  bettertouchtool
  boom
  bowtie
  caffeine
  cheatsheet
  chromecast
  cleanmymac
  daisydisk
  dash
  djview
  evernote
  flux
  forklift
  geektool
  google-hangouts
  handbrake
  harvest
  hazel
  hex-fiend
  hiss
  hyperdock
  ichm
  istat-menus
  kaleidoscope
  key-codes
  launchcontrol
  lighttable
  macpaw-gemini
  nvalt
  omnigraffle
  onyx
  sequel-pro
  silverlight
  skitch
  skype
  slack
  sourcetree
  steam
  teamviewer
  the-unarchiver
  torbrowser
  transmission
  trim-enabler
  unetbootin
  unity
  visualvm
  wallpaper-wizard
  wireshark
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
brew cleanup

echo "Installing Apps..."
brew cask install --appdir="/Applications" ${apps[@]}

echo "Installing Fonts..."
brew cask install ${fonts[@]}
