#!/usr/bin/env rake
require "yaml"
require "rubygems"
require "exogenesis"

Output.fancy

packages = YAML.load_file "packages.yml"

package_managers = [
  Dotfile.new,
  Homebrew.new(packages["brews"]),
  Vundle.new,
  Rvm.new(packages["rubies"]),
  Python.new(packages["pips"])
]

desc "Setup the dotfiles"
task :setup do
  package_managers.each(&:setup)
end

desc "Install the dotfiles"
task :install do
  package_managers.each(&:install)
end

desc "Start a cleanup process"
task :cleanup do
  package_managers.each(&:cleanup)
end

desc "Update everything"
task :update do
  package_managers.each(&:update)
end

desc "Uninstall the dotfiles"
task :uninstall do
  package_managers.each(&:teardown)
end
