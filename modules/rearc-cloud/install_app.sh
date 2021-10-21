#! /bin/bash
sudo yum update -y
touch ~/.bash_profile
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#. ~/.nvm/nvm.sh
nvm install node
sudo yum install -y git
cd ~
mkdir quest
git clone https://github.com/rearc/quest.git quest
cd quest
npm install && npm start
