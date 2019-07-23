export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.pyenv/shims:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
export PKG_CONFIG_PATH=/usr/local/opt/imagemagick@6/lib/pkgconfig

if [ -f ~/.bashrc ] ; then
. ~/.bashrc
fi
