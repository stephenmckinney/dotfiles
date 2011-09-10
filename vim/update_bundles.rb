#!/usr/bin/env ruby

git_bundles = [ 
  # Does stuff
  "git://github.com/mileszs/ack.vim.git",
  "git://github.com/wincent/Command-T.git",
  "git://github.com/scrooloose/nerdtree.git",
  "git://github.com/ddollar/nerdcommenter.git",
  "git://github.com/msanders/snipmate.vim.git",
  "git://github.com/vim-scripts/taglist.vim.git",
  "git://github.com/tpope/vim-surround.git",
  "git://github.com/tsaleh/vim-align.git",
  "git://github.com/tsaleh/vim-supertab.git",
  "git://github.com/robgleeson/hammer.vim.git",
  # Themes
  "git://github.com/vim-scripts/Color-Sampler-Pack.git",
  "git://github.com/wgibbs/vim-irblack.git",
  "git://github.com/tpope/vim-vividchalk.git",
  "git://github.com/altercation/vim-colors-solarized.git",
  "git://github.com/ChrisKempson/Tomorrow-Theme.git",
  # Languages & Syntax
  "git://github.com/scrooloose/syntastic.git",
  "git://github.com/tpope/vim-rails.git",
  "git://github.com/taq/vim-rspec.git",
  "git://github.com/tpope/vim-cucumber.git",
  "git://github.com/tsaleh/vim-shoulda.git",
  "git://github.com/garbas/vim-jquery.git",
  "git://github.com/pangloss/vim-javascript.git",
  "git://github.com/kchmck/vim-coffee-script.git",
  "git://github.com/tpope/vim-haml.git",
  "git://github.com/timcharper/textile.vim.git",
  "git://github.com/tpope/vim-markdown.git",
  "git://github.com/tpope/vim-git.git",
  "git://github.com/mattn/gist-vim.git",
  "git://github.com/ajf/puppet-vim.git",
]


vim_org_scripts = [
  #["jquery",        "12107", "syntax"],
]

require 'fileutils'
require 'open-uri'

bundles_dir = File.join(File.dirname(__FILE__), "bundle")

FileUtils.cd(bundles_dir)

puts "Trashing everything in bundles (lookout!)"
Dir["*"].each {|d| FileUtils.rm_rf d }

git_bundles.each do |url|
  dir = url.split('/').last.sub(/\.git$/, '')
  puts "  Unpacking #{url} into #{dir}"
  `git clone #{url} #{dir}`
  FileUtils.rm_rf(File.join(dir, ".git"))
end

vim_org_scripts.each do |name, script_id, script_type|
  puts "  Downloading #{name}"
  local_file = File.join(name, script_type, "#{name}.vim")
  FileUtils.mkdir_p(File.dirname(local_file))
  File.open(local_file, "w") do |file|
    file << open("http://www.vim.org/scripts/download_script.php?src_id=#{script_id}").read
  end
end

puts "Compiling Command-T"
FileUtils.cd("Command-T")
`rake make`

puts "Pathogenizing Tomorrow-Theme"
FileUtils.cd("../Tomorrow-Theme")
Dir["*"].reject{|d| d=="Vim" || d=="README.md"}.each{|d| FileUtils.rm_rf d}
FileUtils.mv("Vim", "colors")

