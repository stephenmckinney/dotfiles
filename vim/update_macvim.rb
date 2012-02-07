#!/usr/bin/env ruby

require "fileutils"
require "slop"

# Script to build MacVim from source, including RVM Ruby
#
#
# References on building from source:
#   https://github.com/b4winckler/macvim/wiki/Building
#   https://github.com/mxcl/homebrew/blob/master/Library/Formula/macvim.rb
#   http://brilliantcorners.org/2011/02/building-vim-on-osx-snow-leopard/
#
# MacVim Tags:
#   https://github.com/b4winckler/macvim/tags

begin
  opts = Slop.parse do
    banner "Usage - ruby update_macvim.rb [arguments]"
    on '-t' , '--tag'  , 'specify MacVim commit tag to install (e.g. snapshot-64)' , :argument => true , :required => true
    on '-a' , '--arch' , 'specify Mac arch (e.g. i386 x86_64 ppc ...). default: x86_64'             , :argument => true , :default => "x86_64"
    on '-r' , '--ruby' , 'specify the RVM Ruby version (e.g. ruby-1.9.3-p0). default: ruby-1.9.2-p180'     , :argument => true , :default => "ruby-1.9.2-p180"
    on '-h' , '--help' , 'Print this help screen' do
      puts help
      exit
    end
  end
rescue Slop::MissingOptionError => e
  puts "Error: #{e}. See 'update_macvim.rb --help'."
  exit
end

# clone repo
begin
  FileUtils.rm_rf("/Users/smckinney/code/src/macvim")
rescue
  # noop
end
FileUtils.cd("/Users/smckinney/code/src")
system "git clone git://github.com/b4winckler/macvim.git"
FileUtils.cd("/Users/smckinney/code/src/macvim")
system "git checkout -b #{opts[:tag]}_branch #{opts[:tag]}"

# compile icons
FileUtils.cd("src/MacVim/icons") do
  system "make getenvy"
  system "make all"
end

# compile src
system "./configure --with-macarchs=#{opts[:arch]} --with-features=huge --enable-rubyinterp --with-ruby-command=/Users/smckinney/.rvm/rubies/#{opts[:ruby]}/bin/ruby --enable-pythoninterp  --enable-perlinterp --enable-cscope --with-tlib=ncurses --enable-multibyte"
system "make"

# install
FileUtils.rm_rf("/Applications/MacVim.app")
FileUtils.mv("/Users/smckinney/code/src/macvim/src/MacVim/build/Release/MacVim.app", "/Applications/MacVim.app")

# remove src and build
FileUtils.rm_rf("/Users/smckinney/code/src/macvim")

