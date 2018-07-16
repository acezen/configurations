# ruby gem
PATH=$PATH:~/.gem/ruby/2.1.0/bin:$HOME/.local/bin
export PATH

# Fbterm 环境设置
if [ "$(tty)" = "/dev/tty2" ]; then
	# Set the locale for fbterm
	export LANG=en_US.UTF-8
	export LC_CTYPE=zh_CN.UTF-8
	export LANGUAGE=zh_CN:en_US
	export GTK_MODULES=$GTK_MODULES:topmenu-gtk-module

    export DISPLAY=:0
    fcitx-fbterm-helper -l
fi

alias driverInstall='sudo dkms autoinstall -k $(uname -r)' 


