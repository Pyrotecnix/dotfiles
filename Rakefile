#!/usr/bin/env rake
require "yaml"
require "./script/homebrew"
require "./script/dotfile"
require "./script/oh-my-zsh"
require "./script/vundle"

packages = YAML.load_file "packages.yml"

package_managers = [
  Dotfile.new,
  OhMyZSH.new,
  Homebrew.new(packages["brews"]),
  Vundle.new
]

desc "Install the dotfiles"
task :install do
  package_managers.each(&:install_all)
end

desc "Update everything"
task :update do
  package_managers.each(&:update)
end

=begin
desc "Uninstall the dotfiles (Currently keeps the brews)"
task :uninstall do
  package_managers.each(&:teardown)
end
=end
