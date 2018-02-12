threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
threads threads_count, threads_count

port        ENV.fetch("PORT") { 3000 }

environment ENV.fetch("RAILS_ENV") { "development" }

# app_root = File.expand_path("../..", __FILE__)
# bind "unix://#{app_root}/tmp/sockets/puma.sock"
bind "unix:///usr/local/src/study_k8s_rails/tmp/sockets/puma.sock"

stdout_redirect "/usr/local/src/study_k8s_rails/log/puma.stdout.log", "/usr/local/src/study_k8s_rails/log/puma.stderr.log", true
