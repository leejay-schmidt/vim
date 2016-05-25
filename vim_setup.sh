#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)
uline=$(tput smul)

# install pathogen
if [ ! -f ~/.vim/autoload/pathogen.vim ]; then
    echo "${bold}[vim_setup]${normal} Installing pathogen"
    echo "${bold}[vim_setup]${normal} Making the necessary directories in vim parent directory"
    mkdir -p ~/.vim/autoload ~/.vim/bundle &&\
    echo "${bold}[vim_setup]${normal} Downloading and copying pathogen"
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
    echo "${bold}[vim_setup]${normal} Completed installing pathogen"
else
    echo "${bold}[vim_setup]${normal} Skipping pathogen install -- already installed"
fi

# install nerdtree
if [ ! -d ~/.vim/bundle/nerdtree ]; then
    echo "${bold}[vim_setup]${normal} Installing NERDTree"
    pushd ~/.vim/bundle
    echo "${bold}[vim_setup]${normal} Cloning NERDTree repository"
    git clone https://github.com/scrooloose/nerdtree.git
    popd
    echo "${bold}[vim_setup]${normal} Completed installing NERDTree"
else
    echo "${bold}[vim_setup]${normal} Skipping NERDTree install -- already installed"
fi

# install clang_complete
if [ ! -f ~/.vim/plugin/clang_complete.vim ]; then
    echo "${bold}[vim_setup]${normal} Installing clang_complete"
    echo "${bold}[vim_setup]${normal} Creating temp folder to clone clang_complete into"
    pushd ~/Documents
    mkdir vim_temp
    pushd vim_temp
    echo "${bold}[vim_setup]${normal} Cloning clang_complete repository"
    git clone https://github.com/Rip-Rip/clang_complete.git
    pushd clang_complete
    echo "${bold}[vim_setup]${normal} Building the vimball"
    make
    echo "${bold}[vim_setup]${normal} Unballing the vimball"
    if [ -f clang_complete.vmb ]; then
        vim clang_complete.vmb -c 'so %' -c 'q'
    elif [ -f clang_complete.vmb.vba ]; then
        vim clang_complete.vmb.vba -c 'so %' -c 'q'
    fi
    popd
    echo "${bold}[vim_setup]${normal} Removing the temp folder"
    rm -rf clang_complete
    popd
    rm -rf vim_temp
    popd
    echo "${bold}[vim_setup]${normal} Completed installing clang_complete"
else
    echo "${bold}[vim_setup]${normal} Skipping clang_complete install -- already installed"
fi

# install pymode
if [ ! -d ~/.vim/bundle/python-mode ]; then
    echo "${bold}[vim_setup]${normal} Installing pymode"
    pushd ~/.vim/bundle
    echo "${bold}[vim_setup]${normal} Cloning python-mode repository"
    git clone https://github.com/klen/python-mode.git
    popd
    echo "${bold}[vim_setup]${normal} Completed installing pymode"
else
    echo "${bold}[vim_setup]${normal} Skipping installing pymode -- already installed"
fi

# install the predawn theme
if [ ! -f ~/.vim/colors/predawn.vim ]; then
    echo "${bold}[vim_setup]${normal} Installing predawn theme"
    echo "${bold}[vim_setup]${normal} Building colors directory"
    mkdir -p ~/.vim/colors
    echo "${bold}[vim_setup]${normal} Downloading predawn theme"
    curl -LSso ~/.vim/colors/predawn.vim https://raw.githubusercontent.com/juanedi/predawn.vim/master/colors/predawn.vim
    echo "${bold}[vim_setup]${normal} Completed installing predawn theme"
else
    echo "${bold}[vim_setup]${normal} Skipping installing predawn theme -- already installed"
fi
# copy the rc
echo "${bold}[vim_setup]${normal} Copying the vimrc"
cp ./.vimrc ~/.vimrc

echo "${bold}[vim_setup]${normal} Vim setup complete"
