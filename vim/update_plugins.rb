#!/usr/bin/env ruby

require 'fileutils'
require 'open-uri'

git_bundles = [
  ###
  # Tools
  ###
  # Ack
  "git://github.com/mileszs/ack.vim.git",
  # Command-T
  "git://github.com/wincent/Command-T.git",
  # Nerdtree
  "git://github.com/scrooloose/nerdtree.git",
  # Nerdcommenter
  "git://github.com/ddollar/nerdcommenter.git",
  # Snipmate
  "git://github.com/garbas/vim-snipmate.git",
  # Snipmate dependencies
  "git://github.com/MarcWeber/vim-addon-mw-utils.git",
  "git://github.com/tomtom/tlib_vim.git",
  # My Snipmate Snippets - Read/Write access
  "git@github.com:poorlilrichboy/snipmate-snippets.git",
  # Surround
  "git://github.com/tpope/vim-surround.git",
  # Unimpaired
  "git://github.com/tpope/vim-unimpaired.git",
  # Repeat
  "git://github.com/tpope/vim-repeat.git",
  # Align
  "git://github.com/tsaleh/vim-align.git",
  # Vim Indent Object
  "git://github.com/michaeljsmith/vim-indent-object.git",
  # FIXME delete the below two plugins if ruby-vim provides block support
  # Vim Text Object
  #"git://github.com/kana/vim-textobj-user.git",
  # Vim Text Object - Ruby Block
  #"git://github.com/nelstrom/vim-textobj-rubyblock.git",
  # Tagbar
  "git://github.com/majutsushi/tagbar.git",
  # Supertab
  "git://github.com/ervandew/supertab.git",
  # ZoomWin
  "git://github.com/vim-scripts/ZoomWin.git",
  # QFixToggle
  "git://github.com/Valloric/QFixToggle.git",
  # BufOnly
  "git://github.com/vim-scripts/BufOnly.vim.git",
  # Fugitive
  "git://github.com/tpope/vim-fugitive.git",
  # Gist
  "git://github.com/mattn/gist-vim.git",
  # FIXME decide if the below plugins are here to stay
  # CSS Colors?
  "git://github.com/ap/vim-css-color.git",
  # Rename?
  "git://github.com/vim-scripts/Rename2.git",
  # Endwise?
  "git://github.com/tpope/vim-endwise.git",
  # Narrow Region?
  "git://github.com/chrisbra/NrrwRgn.git",
  # Matchit?
  "git://github.com/edsono/vim-matchit.git",
  ###
  # Themes
  ###
  "git://github.com/vim-scripts/Color-Sampler-Pack.git",
  "git://github.com/wgibbs/vim-irblack.git",
  "git://github.com/tpope/vim-vividchalk.git",
  "git://github.com/altercation/vim-colors-solarized.git",
  "git://github.com/ChrisKempson/Tomorrow-Theme.git",
  ###
  # Languages & Syntax
  ###
  # Syntastic
  "git://github.com/scrooloose/syntastic.git",
  # Ruby
  "git://github.com/vim-ruby/vim-ruby.git",
  # Rails
  "git://github.com/tpope/vim-rails.git",
  # Rspec
  "git://github.com/skwp/vim-rspec.git",
  # Cucumber
  "git://github.com/tpope/vim-cucumber.git",
  # Shoulda
  "git://github.com/tsaleh/vim-shoulda.git",
  # JQuery
  "git://github.com/garbas/vim-jquery.git",
  # JavaScript
  "git://github.com/pangloss/vim-javascript.git",
  # CoffeeScript
  "git://github.com/kchmck/vim-coffee-script.git",
  # SCSS
  "git://github.com/cakebaker/scss-syntax.vim.git",
  # Haml
  "git://github.com/tpope/vim-haml.git",
  # Textile
  "git://github.com/timcharper/textile.vim.git",
  # Markdown
  "git://github.com/tpope/vim-markdown.git",
  # Git
  "git://github.com/tpope/vim-git.git",
  # Puppet
  "git://github.com/ajf/puppet-vim.git",
]

vim_org_scripts = [
  #["jquery",        "12107", "syntax"],
]

bundles_dir = File.join(File.dirname(__FILE__), "bundle")

FileUtils.cd(bundles_dir)

puts "Trashing everything in bundles (lookout!)"
Dir["*"].each {|d| FileUtils.rm_rf d }

git_bundles.each do |url|
  dir = url.split('/').last.sub(/\.git$/, '')
  puts "  Unpacking #{url} into #{dir}"
  `git clone #{url} #{dir}`
  FileUtils.rm_rf(File.join(dir, ".git")) unless url=="git@github.com:poorlilrichboy/snipmate-snippets.git"
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

