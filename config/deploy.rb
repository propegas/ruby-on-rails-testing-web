default_run_options[:pty] = true
	set :repository,  "git://github.com/propegas/ruby-on-rails-testing-web.git"
	set :scm, "git"
	set :branch, "master"
	set :deploy_via, :remote_cache

set :application, "mytest2"
set :deploy_to, "/usr/local/www/apache22/data/#{application}"

role :app, "213.85.145.134"
role :web, "213.85.145.134"
role :db,  "213.85.145.134", :primary => true

set :rake, "/usr/local/ruby-enterprise/bin/rake"

set :user, "pegas"
set :admin_runner, "pegas"

namespace :deploy do
  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end
  desc "Start Application -- not needed for Passenger"
  task :start, :roles => :app do
    # nothing -- need to override default cap start task when using Passenger
  end
end