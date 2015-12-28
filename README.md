wright-admin-essentials
=======================

Simple [wright](https://github.com/sometimesfood/wright) port of
[chef-admin-essentials](https://github.com/sometimesfood/chef-admin-essentials). Work
in progress.

Documentation
-------------
Not too much.

```bash
# install wright
sudo apt-key --keyring /etc/apt/trusted.gpg.d/sometimesfood-wright.gpg \
adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys DE36B117
sudo tee /etc/apt/sources.list.d/sometimesfood-wright-trusty.list <<EOF
deb     http://ppa.launchpad.net/sometimesfood/wright/ubuntu trusty main
deb-src http://ppa.launchpad.net/sometimesfood/wright/ubuntu trusty main
EOF
sudo apt-get update && sudo apt-get -y install wright

# install admin-essentials
sudo apt-get -y install git
git clone https://github.com/sometimesfood/wright-admin-essentials
cd wright-admin-essentials
sudo ./admin-essentials.rb
```
