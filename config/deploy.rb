Fezzik.init(:tasks => "config/tasks")

set :app, "immunity_dummy"
set :deploy_to, "/opt/#{app}"
set :release_path, "#{deploy_to}/releases/#{Time.now.strftime("%Y%m%d%H%M")}"
set :local_path, Dir.pwd
set :user, "root"

Fezzik.destination :staging do
  set :domain, "lawrence.xing@localhost"
end

Fezzik.destination :prod do
  set :domain, "lawrence.xing@sas-dev2.sv2"
end