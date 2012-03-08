namespace :jekyll do

  desc "start the jekyll server in auto mode"
  task :server, :num_posts do |t, args|
    num_posts = args[:num_posts]
    cmd = "jekyll --server --pygments"
    cmd += " --limit_posts #{num_posts}" if num_posts
    cmd += " --auto" if ENV['auto']
    puts "running #{cmd}"
    exec(cmd)
  end

end