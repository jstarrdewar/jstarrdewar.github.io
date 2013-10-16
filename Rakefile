require "rubygems"
require "tmpdir"

# Change your GitHub reponame
GITHUB_REPONAME = "jstarrdewar/jstarrdewar.github.io"

desc "Publish blog to master"
task :publish do
  Dir.mktmpdir do |tmp|
    cp_r "_site/.", tmp
    Dir.chdir tmp
    system "echo.>.nojekyll"
    system "git init"
    system "git add ."
    message = "Site updated at #{Time.now.utc}"
    system "git commit -m #{message.inspect}"
    system "git remote add origin git@github.com:#{GITHUB_REPONAME}.git"
    system "git push origin master --force"
  end
end