#!/usr/bin/env ruby

require 'fileutils'

# References:
#   https://github.com/b4winckler/macvim/wiki/Building
#   https://github.com/mxcl/homebrew/blob/master/Library/Formula/macvim.rb
#   http://brilliantcorners.org/2011/02/building-vim-on-osx-snow-leopard/

FileUtils.cd('/Users/smckinney/Documents/Dev/src/macvim/src')

# thoroughly clean the source tree
system 'make clean'
system 'make distclean'
# update
system 'git pull'
# compile
system './configure --with-features=huge --enable-rubyinterp --enable-pythoninterp  --enable-perlinterp --enable-cscope --with-ruby-command=/Users/smckinney/.rvm/rubies/ruby-1.9.2-p180/bin/ruby'
system 'make'
# go to .app and install
puts "Drag and drop app into Applications"
system 'open /Users/smckinney/Documents/Dev/src/macvim/src/MacVim/build/Release'
