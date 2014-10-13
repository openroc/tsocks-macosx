tsocks-macosx
=============

tsocks 1.8 with the mac osx patch


Download & Install it


    git clone https://github.com/openroc/tsocks-macosx

    cd tsocks-macosx

    autoconf

    ./configure --libdir=/usr/lib

    make

    sudo cp tsocks /usr/local/bin

    sudo cp libtsocks.dylib.1.8 /usr/lib
    sudo ln -sf /usr/lib/libtsocks.dylib.1.8 /usr/lib/libtsocks.dylib

    sudo cp tsocks.conf.simple.example /etc/tsocks.conf
  

NOTE: **please modify your _/etc/tsocks.conf_ according to your local environment.
