#
# Cookbook:: apache
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

apt_update 'update' do
  action :update
end

package node['apache']['package']

service node['apache']['package'] do
  action [:enable, :start]
end

template '/var/www/html/index.html' do
  source 'index.html.erb'
  action :create
end
