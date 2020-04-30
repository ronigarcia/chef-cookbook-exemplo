if platform?('centos')
  default['apache']['package'] = 'httpd'
elsif platform?('ubuntu')
  default['apache']['package'] = 'apache2'
end
