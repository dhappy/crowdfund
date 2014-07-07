desc 'Load data from GitHub'

namespace :github do
  desc 'load project from GitHub'
  task load: :environment do
    Project.load_from_github owner: 'TheFuturistParty', github_name: 'debate'
  end
end
