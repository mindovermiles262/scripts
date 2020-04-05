cookbook_path '/path/to/cookbooks'
node_path '/chef-repo/nodes/yourdevice.json'
json_attribs '/etc/chef/run-list.json'

require 'chef/handler/json_file'
report_handlers << Chef::Handler::JsonFile.new(:path => '/var/chef/reports')
exception_handlers << Chef::Handler::JsonFile.new(:path => '/var/chef/reports')
