#!/bin/bash
wget -q http://mirrors.kernel.org/ubuntu/pool/universe/g/goocanvas/libgoocanvas-common_1.0.0-1_all.deb
wget -q http://mirrors.kernel.org/ubuntu/pool/universe/g/goocanvas/libgoocanvas3_1.0.0-1_amd64.deb
wget -q http://mirrors.kernel.org/ubuntu/pool/universe/libg/libgoo-canvas-perl/libgoo-canvas-perl_0.06-2ubuntu3_amd64.deb
sudo dpkg -i libgoocanvas-common_1.0.0-1_all.deb 
sudo apt-get -f install 
sudo dpkg -i libgoocanvas3_1.0.0-1_amd64.deb
sudo apt-get -f install
sudo dpkg -i libgoo-canvas-perl_0.06-2ubuntu3_amd64.deb
sudo apt-get -f install


