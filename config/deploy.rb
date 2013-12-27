#set :application, "set your application name here"
#set :repository,  "set your repository location here"

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

#role :web, "your web-server here"                          # Your HTTP server, Apache/etc
#role :app, "your app-server here"                          # This may be the same as your `Web` server
#role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end



require 'capistrano/ext/multistage'
require "bundler/capistrano" # Execute "bundle install" after deploy, but only when really needed
require "rvm/capistrano" # RVM integration
#require 'capistrano/console'
set :application, "cap_test_app"
set :scm, :git
set :repository, "git://github.com/anusha-nyros/cap_deploy_app.git" 
#git://github.com/definelabs/urbanairship.git

set :scm_passphrase, "12345678"

set :user, "srinivas"# the ssh user which does the deployment on the server

set :stages, ["production","staging"]
set :default_stage, "staging" # running "cap deploy" deploys to staging, "cap production deploy" deploys to production
set :deploy_to, "/var/www/cap_test_app"   # the destination dir
set :repository_cache, "git_cache"
set :deploy_via, :remote_cache
role :app, "10.90.90.68"#,"10.90.90.109"
role :web,"10.90.90.68"
role :db,  "10.90.90.68", :primary => true
set :use_sudo, false
#set :rake,           "rake"
#  set :rails_env,      "production"
#  set :migrate_env,    ""
#  set :migrate_target, :latest
#set :deploy_via, :copy
#set :copy_dir, "/home/santosh/Desktop/tmp"
#set :remote_copy_dir, "/tmp"
ssh_options[:forward_agent] = true
default_run_options[:pty] = true

set :rvm_ruby_string, 'ruby-1.9.2-p320' #Target ruby version
set :rvm_type, :user
#set :rvm_path, "/usr/local/rvm"
set :rvm_install_with_sudo, true
#namespace :deploy do
# # run the db migrations
#    task :run_migrations, :roles => :db do
#        puts "RUNNING DB MIGRATIONS"
#        run "cd #{release_path}; rake db:migrate RAILS_ENV=#{rails_env} --trace"
#    end
#end
#desc "bundle"
#task :bundle, :roles => :servers do
#        run 'bundle'
#end

#before "deploy:cold","deploy:install_bundler"
#namespace :deploy do

#	task :install_bundler, :roles => :app do
#	    run "type -P bundle &>/dev/null || { gem install bundler --no-rdoc --no-ri; }"
#	end #install_bundler
#	
#end # deploy namespace
#set :application, 'my app name'
#set :repo_url, 'git@example.com:me/my_repo.git'

## ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

## set :deploy_to, '/var/www/my_app'
## set :scm, :git

## set :format, :pretty
## set :log_level, :debug
## set :pty, true

## set :linked_files, %w{config/database.yml}
## set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

## set :default_env, { path: "/opt/ruby/bin:$PATH" }
## set :keep_releases, 5

#namespace :deploy do

#  desc 'Restart application'
#  task :restart do
#    on roles(:app), in: :sequence, wait: 5 do
#      # Your restart mechanism here, for example:
#      # execute :touch, release_path.join('tmp/restart.txt')
#    end
#  end

#  after :restart, :clear_cache do
#    on roles(:web), in: :groups, limit: 3, wait: 10 do
#      # Here we can do anything such as:
#      # within release_path do
#      #   execute :rake, 'cache:clear'
#      # end
#    end
#  end

#  after :finishing, 'deploy:cleanup'

#end
