# Tests
task test: ['test:terraform']

desc 'Test infrastructure config'
namespace :test do
  desc "Validate terraform"
  task :terraform do
    puts "Validate terraform"
    system "cd terraform && terraform validate"
  end
end

# Provision
desc 'terrafrom apply'
task :tfa do
  system "cd terraform && terraform apply"
end

desc 'terraform destroy'
task :tfd do
  system "cd terraform && terraform destroy"
end

desc 'install all charts'
task :install_charts do
  charts = %w(nginx-ingress mysql prometheus grafana )
  charts.each do |chart|
    system "helm upgrade --install #{chart} ./charts/#{chart}"
  end
end
