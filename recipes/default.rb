package 'apache2' do
	action :install
end

file '/var/www/html/index.html' do
	action :create
	content 'hello Pipeline world'
end

service 'apache2' do
	action [:enable, :start]
end

