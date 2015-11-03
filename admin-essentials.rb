#!/usr/bin/env wright

def read_file(filename)
  basedir = File.expand_path('../files/', __FILE__)
  File.read(File.join(basedir, filename))
end

def install_base_packages
  package 'tmux'
  package 'mg'
  package 'nvi', options: '--no-install-recommends'
  package 'less'
  # package 'bc'
end

def install_grml_etc_core
  file '/etc/apt/trusted.gpg.d/grml-archive.gpg',
       mode: '444',
       content: read_file('grml-archive.gpg')
  file '/etc/apt/preferences.d/grml-pin',
       mode: '444',
       content: <<EOF
Package: *
Pin: release a=grml-stable
Pin-Priority: 200
EOF

  file '/etc/apt/sources.list.d/grml.list',
       mode: '444',
       on_update: -> { system 'apt-get', 'update' },
       content: <<EOF
deb     http://deb.grml.org/ grml-stable main #Grml
deb-src http://deb.grml.org/ grml-stable main #Grml
EOF
  package 'grml-etc-core', options: '--no-install-recommends'
end

def setup_git
  package 'git'
  file '/etc/gitconfig',
       mode: '444',
       content: read_file('gitconfig')
end

def setup_etckeeper
  file '/etc/etckeeper/etckeeper.conf',
       mode: '444',
       content: <<EOF
VCS=git
HIGHLEVEL_PACKAGE_MANAGER=apt
LOWLEVEL_PACKAGE_MANAGER=dpkg
EOF
  package 'git'
  package 'etckeeper'
end

def setup_zsh
  user 'root', shell: '/bin/zsh'
  sudo_user = ENV['SUDO_USER']
  user sudo_user, shell: '/bin/zsh' if sudo_user
end

setup_git
setup_etckeeper
setup_zsh
install_base_packages
install_grml_etc_core
