installation/initilaization stuff:

updates: ``sudo apt update && sudo apt upgrade -y``

dependancies: ``sudo apt install build-essential git libssl-dev``

open dylan (may require different depending on os, works for wsl and should work for mac as well): ``wget https://github.com/dylan-lang/opendylan/releases/download/v2023.1.0/opendylan-2023.1-x86_64-linux.tar.bz2``

extract + download: ``tar -xf opendylan-2023.1-x86_64-linux.tar.bz2``
move: `` sudo mv opendylan-2023.1 /opt/opendylan``
add to path: ``echo 'export PATH="/opt/opendylan/bin:$PATH"' >> ~/.bashrc``
reload: ``source ~/.bashrc``

check: installation, version ``dylan-compiler -version``

running it:
build: ``dylan-compiler -build project.dylan`` but its geeking and not building so idfk what

