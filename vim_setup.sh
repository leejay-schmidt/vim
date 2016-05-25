#!/bin/bash

# install pathogen
if [ ! -f ~/.vim/autoload/pathogen.vim ]; then
    echo "[vim_setup] Installing pathogen"
    echo "[vim_setup] Making the necessary directories in vim parent directory"
    mkdir -p ~/.vim/autoload ~/.vim/bundle &&\
    echo "[vim_setup] Downloading and copying pathogen"
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
    echo "[vim_setup] Completed installing pathogen"
else
    echo "[vim_setup] Skipping pathogen install -- already installed"
fi

# install clang_complete
if [ ! -f ~/.vim/plugin/clang_complete.vim ]; then
    echo "[vim_setup] Installing clang_complete"
    echo "[vim_setup] Creating temp folder to clone clang_complete into"
    pushd ~/Documents
    mkdir vim_temp
    pushd vim_temp
    echo "[vim_setup] Cloning clang_complete repository"
    git clone https://github.com/Rip-Rip/clang_complete.git
    pushd clang_complete
    echo "[vim_setup] Building the vimball"
    make
    echo "[vim_setup] Unballing the vimball"
    if [ -f clang_complete.vmb ]; then
        vim clang_complete.vmb -c 'so %' -c 'q'
    elif [ -f clang_complete.vmb.vba ]; then
        vim clang_complete.vmb.vba -c 'so %' -c 'q'
    fi
    popd
    echo "[vim_setup] Removing the temp folder"
    rm -rf clang_complete
    popd
    rm -rf vim_temp
    popd
    echo "[vim_setup] Completed installing clang_complete"
else
    echo "[vim_setup] Skipping clang_complete install -- already installed"
fi

# install pymode
if [ ! -d ~/.vim/bundle/python-mode ]; then
    echo "[vim_setup] Installing pymode"
    pushd ~/.vim/bundle
    echo "[vim_setup] Cloning python-mode repository"
    git clone https://github.com/klen/python-mode.git
    popd
    echo "[vim_setup] Completed installing pymode"
else
    echo "[vim_setup] Skipping installing pymode -- already installed"
fi

# install the predawn theme
if [ ! -f ~/.vim/colors/predawn.vim ]; then
    echo "[vim_setup] Installing predawn theme"
    echo "[vim_setup] Building colors directory"
    mkdir -p ~/.vim/colors
    echo "[vim_setup] Downloading predawn theme"
    curl -LSso ~/.vim/colors/predawn.vim https://raw.githubusercontent.com/juanedi/predawn.vim/master/colors/predawn.vim
    echo "[vim_setup] Completed installing predawn theme"
else
    echo "[vim_setup] Skipping installing predawn theme -- already installed"
fi
# copy the rc
echo "[vim_setup] Copying the vimrc"
cp ./.vimrc ~/.vimrc

echo "[vim_setup] Vim setup complete"
