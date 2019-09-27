task :login do
  sh "docker login"
end

task :amd64 do
  sh "docker build -t unvt/inazo:amd64 ."
end

task :armhf do
  sh "docker build -t unvt/inazo:armhf ."
end

task :manifest do
  sh "docker manifest push --purge unvt/inazo:latest"
  sh "docker manifest create --amend unvt/inazo:latest \
    unvt/inazo:armhf unvt/inazo:amd64"
  sh "docker manifest push unvt/inazo:latest"
end

