echo 'Update Ubuntu'
sudo apt update && sudo apt -y dist-upgrade


echo 'Install GnomeTweaks'
sudo apt -y install gnome-tweaks


echo 'Enable MP3/MP4/AVI Playback, Adobe Flash etc.'
sudo apt -y install ubuntu-restricted-extras

echo 'Install curl'
sudo apt -y install curl


echo 'Install Vscode'
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt -y install apt-transport-https
sudo apt -y update
sudo apt -y install code


echo 'Install Chrome'
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
sudo apt -y update 
sudo apt -y install google-chrome-stable


echo 'Install Docker'
sudo apt -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable edge"
sudo apt update
sudo apt -y install -y docker-ce
sudo apt -y install -y docker-compose
sudo systemctl status docker
sudo usermod -aG docker ${USER}


echo 'Install Python3'
sudo apt -y install python3


echo 'Install Node.js'
sudo apt -y install nodejs
sudo apt -y install npm


echo 'Modify .bashrc - ADD github branch tracking'
cat >> ~/.bashrc <<-end_of_bash_config

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\[\033[01;034m\]\u\[\033[01;35m\]@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\n\[\033[01;032m\]$ \[\033[00m\]"
alias config='/usr/bin/git --git-dir=/home/smatyushkov/.cfg/ --work-tree=/home/smatyushkov' 
end_of_bash_config


echo 'Add git aliases and config'
cat >> ~/.gitconfig <<-end_of_gitconfig_config
[user]
    email = smatyushkov@arenamb.ru
    name = Sergey Matyushkov
[core]
    quotepath = off
[alias]
    co = checkout
    ci = commit
    st = status
    br = branch
    hist = log --pretty=format:\"%h %ad | %s%d [%an]\" --graph --date=short
    type = cat-file -t
    dump = cat-file -p
end_of_gitconfig_config


echo 'Install Telegram'
sudo snap install telegram-desktop


echo 'Install Tor'
wget -q -O - https://deb.torproject.org/torproject.org/A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89.asc | sudo apt-key add -
echo "deb https://deb.torproject.org/torproject.org $(lsb_release -cs) main" | sudo tee -a /etc/apt/sources.list
sudo apt update
sudo apt -y install tor deb.torproject.org-keyring torbrowser-launcher





