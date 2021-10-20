#! /bin/bash
sudo apt-get update
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
nvm install node
sudo apt-get install -y git
cd ~
mkdir quest
git clone https://github.com/rearc/quest.git quest
cd quest
npm install && npm start
