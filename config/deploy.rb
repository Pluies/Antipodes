# RVM bootstrap
ENV['rvm_path']||="/usr/local/rvm"
$:.unshift(File.expand_path("/usr/local/rvm/lib"))
require 'rvm/capistrano'
set :rvm_ruby_string, '1.9.2'
set :rvm_type, :system

set :application, "antipodes"
set :repository,  "git://github.com/Pluies/Antipodes.git"

require 'bundler/capistrano'
set :bundle_gemfile,      "Gemfile"
set :bundle_dir,          fetch(:shared_path)+"/bundle"
set :bundle_flags,       "--deployment" # --quiet"
set :bundle_without,      [:development, :test]

set :scm, :git

set :deploy_to, "/antipodes/"

set :user,"root"
set :scm_username, "root"
set :use_sudo, false

server "vps10371.ovh.net", :web, :app, :db, :primary => true

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
